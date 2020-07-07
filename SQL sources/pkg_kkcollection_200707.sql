-- ���

create or replace PACKAGE KK_COLLECTION_PKG AS
  g_in_sawonid VARCHAR2(4) := 'S003'; -- ���� �Է»�� ����
  g_prod_cnt NUMBER(9) := 0;
  
  -- ��Ű�� �ȿ� �� ���ν��� ������
  
  -- main method ����� ����
  PROCEDURE KK_COLLECTION_MAIN (p_sum_yymm IN VARCHAR2
                                , p_regi_emp_no IN VARCHAR2
                                );
                                
  PROCEDURE KK_COLLECTION_PRC1 (p_sum_yymm IN VARCHAR2 );
  PROCEDURE KK_COLLECTION_PRC2 (p_sum_yymm IN VARCHAR2 );
  PROCEDURE KK_COLLECTION_PRC3 (p_sum_yymm IN VARCHAR2 );
  -- ���Ҹ����� mmsum30�� smsale�� ���� stck_qty ���� �� ����ó�� 
  PROCEDURE KK_COLLECTION_END (p_sum_yymm IN VARCHAR2 );
  
END KK_COLLECTION_PKG;

-- �ٵ� 
create or replace PACKAGE BODY KK_COLLECTION_PKG AS


PROCEDURE KK_COLLECTION_MAIN ( p_sum_yymm in VARCHAR2,
                                 p_regi_emp_no in VARCHAR2)

IS


BEGIN
  DBMS_OUTPUT.ENABLE;
  DELETE MMSUM30 
  WHERE sum_yymm = p_sum_yymm; -- ���� �⸻�� �� ���� ���� �ʱ�ȭ���ѳ��� ����
  
  -- ���ں� �ŷ�ó ��ǰ�� �Ǹ���Ȳ(smcp10)���� �ش�� ����
  DELETE smcp10
  WHERE SUBSTR(yymmdd,1,6) = p_sum_yymm;
  
  -- ���ں� ��ǰ�� �Ǹ���Ȳ(SMProd10) ���� �ش�� ����
  DELETE smprod10
  WHERE SUBSTR(yymmdd,1,6) = p_sum_yymm;
  
  -- �ǸŽ��� ������Ȳ ���� �ش�� ����(smsale)
  -- â����� �̻��� ������ �Ǹ��� ���
  DELETE smsale_err
  WHERE yymm = p_sum_yymm;

  dbms_output.put_line('KK_COLLECTION_PRC1 Before p_sum_yymm => ' || p_sum_yymm);
  -- ���ο��� ������ �Լ�(���ν���) ȣ�� 
  KK_COLLECTION_PRC1(p_sum_yymm);
  
  KK_COLLECTION_PRC2(p_sum_yymm => p_sum_yymm);
  
  KK_COLLECTION_PRC3(p_sum_yymm => p_sum_yymm);
  
  KK_COLLECTION_END(p_sum_yymm => p_sum_yymm );
 
  commit;
  
END KK_COLLECTION_MAIN;
  
---------------------------------------------------------------------------------  
-- ��� �����԰���� ����(KK_COLLECTION_PRC1)

PROCEDURE KK_COLLECTION_PRC1 (p_sum_yymm in VARCHAR2)

IS

BEGIN
  DBMS_OUTPUT.ENABLE;
  dbms_output.put_line(' KK_COLLECTION_PRC1 p_sum_yymm => ' || p_sum_yymm);
    INSERT INTO mmsum30
    
      ( sum_yymm
      , item_code
      , item_gubn
      , stck_qty
      , sawonid
      , regidate
      )
      
      -- multi line���� insert�ϱ� ���� subquery �̿�(select ������ insert�� ���� ��)
      -- ������ �⸻������ ����� �������� �̿���Ŵ
    ( SELECT  p_sum_yymm --2���� �������� �־��� 
            , item_code -- �������ڵ� �״�� �����
            , '0' -- ����
            , stck_qty -- �⸻ ���� �������ڵ�
            , sawonid
            , sysdate
      FROM    mmsum30
      WHERE   sum_yymm = TO_CHAR(ADD_MONTHS (TO_DATE(p_sum_yymm, 'YYYYMM'), -1), 'YYYYMM')
      -- 1���� �����͸� �����ͼ� 
      AND     item_gubn = '1'  -- �⸻
      );


END KK_COLLECTION_PRC1;

------------------------------------------------------------------------------
 PROCEDURE   KK_COLLECTION_PRC2(  p_sum_yymm     in	VARCHAR2)   
   IS  
   --- �Ϻ� �ǸŽ��� ��Ȳ(SMSALE)�� ���� 
   CURSOR  CSR_SMSALE  IS
            SELECT     S.YYMMDD     YYMMDD
                      ,S.CustomID    CustomID 
                      ,S.ITEM_CODE  ITEM_CODE   
                      ,S.STCK_QTY   STCK_QTY 
                      , P.Danga     Danga 
            FROM      SMSALE   S ,  Product P   --- �Ϻ� �ǸŽ��� ��Ȳ , ��ǰ(Product) ���̺�
            WHERE     S.ITEM_CODE  = P.ITEM_CODE 
            AND       SUBSTR(S.YYMMDD,1,6)  = p_sum_yymm 
            ;         
   BEGIN
   DBMS_OUTPUT.ENABLE;
      FOR 	rec_smsale IN CSR_SMSALE LOOP
         ------------------------------------------------------------------
         --     Initialize
         ------------------------------------------------------------------
          --  g_goods_trans_qty	:=	0;		---  
    	    INSERT INTO SMCP10   
	          (          YYMMDD       
                   ,   CustomID       
                   ,   ITEM_CODE       
                   ,   STCK_QTY
                   ,   Danga
                   ,   SawonID
                   ,   RegiDate
	           )
	        VALUES(     rec_smsale.YYMMDD 
                    , rec_smsale.CustomID            
                    , rec_smsale.ITEM_CODE   
                    , rec_smsale.STCK_QTY   
                    , rec_smsale.Danga                  
                    , g_in_sawonid                               
                    ,  SYSDATE
	      );
       
      END LOOP;
      EXCEPTION
        WHEN OTHERS THEN
              DBMS_OUTPUT.PUT_LINE(SQLERRM||'���� �߻� ');
   END  KK_COLLECTION_PRC2;
----------------------------------------------------------3�� ���ν���prc3----

-- ���ں� ��ǰ�� �Ǹ���Ȳ�� ����
-- smprod10 ���� ����
-- smsale �о ���ں� ��ǰ�� �Ǹ���Ȳ
-- smsale�� ������ customid�� �Ȱ����� ���� �ΰ��� ������ ���̰Ե�
-- �����Ǿ summary�� ������Ե� �ܰ��� ��մܰ��� ������
-- group �Լ� ��� group by customid 
-- group �Լ�, qty-> sum , �ܰ�->avg  



PROCEDURE   KK_COLLECTION_PRC3(  p_sum_yymm     in	VARCHAR2)   
IS  
   --- �Ϻ� �ǸŽ��� ��Ȳ(SMSALE)�� ���� 
   CURSOR  prc3input   IS
   
            SELECT     
                       s.YYMMDD YYMMDD,
                       s.item_code item_code,
                       SUM(s.stck_qty) stck_qty,
                       AVG(p.danga) danga   
            FROM      SMSALE S, Product p   --- �Ϻ� �ǸŽ��� ��Ȳ , ��ǰ(Product) ���̺�
            WHERE     s.item_code = p.item_code
            AND SUBSTR(S.YYMMDD,1,6)  = p_sum_yymm 
            GROUP BY s.yymmdd, s.item_code
            ;         
   BEGIN
   DBMS_OUTPUT.ENABLE;
      FOR 	rec_smsale IN prc3input LOOP
         ------------------------------------------------------------------
         --     Initialize
         ------------------------------------------------------------------
          --  g_goods_trans_qty	:=	0;		---  
    	    INSERT INTO smprod10   
	          (          YYMMDD       
                   ,   item_code       
                   ,   stck_qty       
                   ,   danga
                   ,   sawonid
                   ,   regidate
              
	           )
	        VALUES(     rec_smsale.YYMMDD 
                    , rec_smsale.item_code            
                    , rec_smsale.stck_qty
                    , rec_smsale.danga                 
                    , g_in_sawonid                               
                    ,  SYSDATE
	      );
       
      END LOOP;
      EXCEPTION
        WHEN OTHERS THEN
              DBMS_OUTPUT.PUT_LINE(SQLERRM||'���� �߻� ');
              
END KK_COLLECTION_PRC3;

--------------------------------------------------------------prc4
--- �����۾�
-- â�� ������� �Ǹŷ����� ũ�� �⸻��� �Է�
-- â�� ��� �Ǹŷ����� ������ smsale_err�Է�

PROCEDURE   KK_COLLECTION_END(  p_sum_yymm  in	VARCHAR2)   

IS

CURSOR closing IS
        SELECT SUBSTR(s.YYMMDD,1,6)   YYMM,
               s.item_code            item_code,
               SUM(s.stck_qty)        s_stck_qty,
               AVG(material.stck_qty) material_stck_qty -- �׷��Լ� �����ؾ��ؼ� �׳�avg����
        FROM (SELECT * FROM smsale
              WHERE SUBSTR(YYMMDD,1,6) = p_sum_yymm) s,
             (SELECT * FROM mmsum30
              WHERE SUM_YYMM = p_sum_yymm
              AND ITEM_GUBN = '0') material -- �������(������� ������)
        WHERE s.ITEM_CODE = material.item_code
        GROUP BY SUBSTR(s.YYMMDD,1,6), s.item_code;
        
     

BEGIN
    DBMS_OUTPUT.ENABLE;
    FOR monthlyclosing IN closing LOOP
        IF monthlyclosing.material_stck_qty < monthlyclosing.s_stck_qty
            THEN 
            INSERT INTO smsale_err
               (YYMM,
                item_code,
                mmsum30_qty,
                smsale_qty,
                sawonid,
                regdate )
            VALUES
               (monthlyclosing.YYMM,
                monthlyclosing.item_code,
                monthlyclosing.material_stck_qty,
                monthlyclosing.s_stck_qty,
                g_in_sawonid,
                sysdate);
      ELSE 
          g_prod_cnt := monthlyclosing.material_stck_qty - monthlyclosing.s_stck_qty;
          INSERT INTO mmsum30
              (sum_yymm,
               item_code,
               item_gubn,
               stck_qty,
               sawonid,
               regidate)
          VALUES 
              (monthlyclosing.YYMM,
               monthlyclosing.item_code,
               '1',
               monthlyclosing.material_stck_qty - monthlyclosing.s_stck_qty,
               g_in_sawonid, 
               sysdate);
               
    END IF;
    
END LOOP;


EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE(SQLERRM || '������ �߻��߽��ϴ�.');
      
END KK_COLLECTION_END;
             
  
END KK_COLLECTION_PKG;
