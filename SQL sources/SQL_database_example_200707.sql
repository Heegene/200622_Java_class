-- ��Ű�� ����(�������̽��� ����� ����)

  --------------------------------------------------------------------------------------                                
  ------- �ൿ���� :    <<<  �� ���Ҹ��� PGM  >>>                       
  -------               1. ������� �԰� ������ �����Ѵ�.(MMSUM30  �⸻��� �Ϳ� �������� �̿� )
  -------               2. ���ں� �ŷ�ó ��ǰ�� �Ǹ���Ȳ(SMCP10)������ ���� PGM                          
  -------               3. ���ں� ��ǰ�� �Ǹ���Ȳ(SMProd10)������ ���� PGM                               
  -------                  ������ ��쿡 ����, ��з���ȸ������ڵ带 Update[2017.08.16]
  --------------------------------------------------------------------------------------           

CREATE or REPLACE PACKAGE KK_COLLECTION_PKG AS
  g_in_sawonid VARCHAR2(4) := 'S003'; -- ���� �Է»�� ����
  g_prod_cnt NUMBER(9) := 0;
  
  -- ��Ű�� �ȿ� �� ���ν��� ������
  
  -- main method ����� ����
  PROCEDURE KK_COLLECTION_MAIN (p_sum_yymm IN VARCHAR2
                                , p_regi_emp_no IN VARCHAR2
                                );
                                
  PROCEDURE KK_COLLECTION_PRC1 (p_sum_yymm IN VARCHAR2 );
  
  
END KK_COLLECTION_PKG;

-------------------------------------------------------------------------
-- ��Ű�� body ���� 
CREATE OR REPLACE PACKAGE BODY KK_COLLECTION_PKG AS
  PROCEDURE KK_COLLECTION_MAIN ( p_sum_yymm in VARCHAR2,
                                 p_regi_emp_no in VARCHAR2)

IS


BEGIN
  DELETE MMSUM30 
  WHERE sum_yymm = p_sum_yymm; -- ���� �⸻�� �� ���� ���� �ʱ�ȭ���ѳ��� ����
  
  -- ���ں� �ŷ�ó ��ǰ�� �Ǹ���Ȳ(smcp10)���� �ش�� ����
  DELETE smcp10
  WHERE SUBSTR(yymmdd,1,6) = p_sum_yymm;
  
  --���ں� ��ǰ�� �Ǹ���Ȳ(SMProd10) ���� �ش�� ����
  DBMS.OUTPUT.ENABLE;
  dbms_output.put_line('KK_COLLECTION_PRC1 Before p_sum_yymm => ' || p_sum_yymm);
  KK_COLLECTION_PRC1(p_sum_yymm);
  
  COMMIT;
  
  
END KK_COLLECTION_MAIN;
  
---------------------------------------------------------------------------------  
-- ��� �����԰���� ����(KK_COLLECTION_PRC1)

PROCEDURE KK_COLLECTION_PRC1 (p_sum_yymm in VARCHAR2)

IS

BEGIN
  DBMS.OUTPUT.ENABLE;
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




  
