create or replace PACKAGE BODY KK_COLLECTION_PKG AS 
   PROCEDURE   KK_COLLECTION_MAIN(  p_sum_yymm     in	VARCHAR2  ,  
                                    p_regi_emp_no  in	VARCHAR2) 
   IS
   BEGIN
      DBMS_OUTPUT.ENABLE;
      DELETE   MMSUM30
      WHERE    SUM_YYMM    =  p_sum_yymm;
       -- ���ں� �ŷ�ó ��ǰ�� �Ǹ���Ȳ(SMCP10)���� �ش�� ���� 
      DELETE   SMCP10
      WHERE    SUBSTR(YYMMDD,1,6)    =  p_sum_yymm;
      
      -- ���ں� ��ǰ�� �Ǹ���Ȳ(SMProd10)���� �ش�� ���� 
      DELETE   SMProd10
      WHERE    SUBSTR(YYMMDD,1,6)    =  p_sum_yymm;
  
       -- ���ں� �ǸŽ��� ������Ȳ(SMSALE_ERR)���� �ش�� ���� 
      DELETE   SMSALE_ERR
      WHERE    YYMM        =  p_sum_yymm;
    
      dbms_output.put_line(' KK_COLLECTION_PRC1 Before p_sum_yymm =>' ||p_sum_yymm);
      --   1. ������� �԰� ������ �����Ѵ�.
      KK_COLLECTION_PRC1(  p_sum_yymm );
      -- 2. ���ں� �ŷ�ó ��ǰ�� �Ǹ���Ȳ(SMCP10)������ ���� PGM    
      KK_COLLECTION_PRC2(   p_sum_yymm => p_sum_yymm);
      -- 3. ���ں� ��ǰ�� �Ǹ���Ȳ(SMProd10)������ ���� PGM   
      KK_COLLECTION_PRC3(    p_sum_yymm => p_sum_yymm );       
      --- 9. ��ü���Ҹ����� MMSUMM30�� SMSALE�� ���� STCK_QTY ���� �� ���� ó���۾�
      KK_COLLECTION_END(     p_sum_yymm => p_sum_yymm );                       
  
  
      COMMIT;
   END   KK_COLLECTION_MAIN;  
    /***************************************************************************
   Procedure Name : KK_COLLECTION_PRC1
   Description    : ������� �԰� ������ �����Ѵ�.
   ***************************************************************************/
   PROCEDURE   KK_COLLECTION_PRC1(  p_sum_yymm     in	VARCHAR2    )   
   IS
   BEGIN

   dbms_output.put_line(' KK_COLLECTION_PRC1 p_sum_yymm => ' ||p_sum_yymm );
      ---     1) ��� ���� �԰� ������ �����Ѵ�.
     INSERT INTO MMSUM30
          (    SUM_YYMM       
           ,   ITEM_CODE       
           ,   ITEM_GUBN       
           ,   STCK_QTY
           ,   SawonID
           ,   RegiDate
           )
     ( SELECT   p_sum_yymm
                    ,  ITEM_CODE
                    ,  '0'        -- ����
                    ,  STCK_QTY
                     ,  SawonID
                    ,  SYSDATE
      FROM     MMSUM30   
      WHERE    SUM_YYMM  = TO_CHAR(ADD_MONTHS (TO_DATE(p_sum_yymm,'YYYYMM'),-1),'YYYYMM')
      AND      ITEM_GUBN = '1'    -- �⸻
      );

   END  KK_COLLECTION_PRC1;
   
     /**************************************************************************************
   Project        : KK ����������Ȳ
   Module         : ���Ұ���
   Procedure Name : KK_COLLECTION_PRC2 
   Description    : ���ں� �ŷ�ó ��ǰ�� �Ǹ���Ȳ(SMCP10)������ �����Ѵ�.
                   - �Ϻ� �ǸŽ��� ��Ȳ(SMSALE)�� �о� ���ں� �ŷ�ó ��ǰ�� �Ǹ���Ȳ(SMCP10)������ ����
                   - �Ϻ� �ǸŽ��� ��Ȳ , ��ǰ(Product) ���̺� JOIN
                   - ����� global ������ g_in_sawonid ���� �Է�
   Program History
   --------------------------------------------------------------------------
   Date       In Charge        Version   Description
   --------------------------------------------------------------------------
   2020.07.07 ���±�            1.0      �����ۼ�
  *************************************************************************************/
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

 /**************************************************************************************************
   Project        : KK ����������Ȳ
   Module         : ���Ұ���
   Procedure Name : KK_COLLECTION_PRC3 
   Description    :  ���ں� ��ǰ�� �Ǹ���Ȳ(SMProd10)������ �����Ѵ�.
                   - �Ϻ� �ǸŽ��� ��Ȳ(SMSALE)�� �о� ���ں�  ��ǰ�� �Ǹ���Ȳ(SMProd10)������ ����
                   - Group�Լ�, QTY->SUM , Danga->AVG 
   Program History
   --------------------------------------------------------------------------
   Date       In Charge        Version   Description
   --------------------------------------------------------------------------
   2020.07.07 ���±�            1.0      �����ۼ�
  ************************************************************************************************/
   PROCEDURE   KK_COLLECTION_PRC3(  p_sum_yymm     in	VARCHAR2 )   
   IS
   --- GROUP BY ������ ==> YMMDD, ITEM_CODE�� ���� �հ� �� ���Ͽ� 
   CURSOR  CSR_SMSALE  IS
                  SELECT      S.YYMMDD          YYMMDD
                           ,  S.ITEM_CODE       ITEM_CODE
                           ,  SUM(S.STCK_QTY)   STCK_QTY  
                           ,  AVG(P.Danga)      Danga 
                  FROM        SMSALE   S ,      Product P  -- �Ϻ� �ǸŽ�����Ȳ ,��ǰ(Product)���̺�
                  WHERE       S.ITEM_CODE          = P.ITEM_CODE 
                  AND         SUBSTR(S.YYMMDD,1,6) =  p_sum_yymm
                  GROUP BY  S.YYMMDD, S.ITEM_CODE       
                ;         
   BEGIN
      DBMS_OUTPUT.ENABLE;
      FOR 	rec_smsale_item  IN CSR_SMSALE LOOP
         ------------------------------------------------------------------
         --     Initialize
         ------------------------------------------------------------------
    	    INSERT INTO SMProd10      
	          (    YYMMDD       
	           ,   ITEM_CODE       
	           ,   STCK_QTY
	           ,   Danga
	           ,   SawonID
	           ,   RegiDate
	           )
	         VALUES(      rec_smsale_item.YYMMDD 
                      , rec_smsale_item.ITEM_CODE   
                      , rec_smsale_item.STCK_QTY   
                      , rec_smsale_item.Danga                  
                      , g_in_sawonid                               
                      ,  SYSDATE
	      );
       
      END LOOP;
        EXCEPTION
        WHEN OTHERS THEN
              DBMS_OUTPUT.PUT_LINE(SQLERRM||'���� �߻� ');
   END  KK_COLLECTION_PRC3;


/**************************************************************************************************
   Project        : KK ����������Ȳ
   Module         : ���Ұ���
   Procedure Name : KK_COLLECTION_END 
   Description    : ��ü ���Ҹ����� MMSUMM30�� SMSALE�� ���� STCK_QTY 
                        ���� �� ���� ó���۾�   
    1.  ���� â�� ������� �Ǹŷ����� ũ�ٸ� �⸻��� �Է�       
    2.  ���� â�� ������� �Ǹŷ����� �۴ٸ� SMSALE_ERR �Է�      
   Program History
   --------------------------------------------------------------------------
   Date       In Charge        Version   Description
   --------------------------------------------------------------------------
   2020.07.07 ���±�            1.0      �����ۼ�
  ************************************************************************************************/
   PROCEDURE   KK_COLLECTION_END(  p_sum_yymm     in	VARCHAR2)   
   IS
    --- MMSUMM30�� SMSALE�� ���Ͽ�    YYMMDD, ITEM_CODE�� ���� �հ� ����  
   CURSOR   CSR_Store_Remain  IS
            SELECT   SUBSTR(S.YYMMDD,1,6)           YYMM
                     , S.ITEM_CODE                  ITEM_CODE
                     , SUM(S.STCK_QTY)              S_STCK_QTY  
                     , AVG(M.STCK_QTY)              M_STCK_QTY 
            FROM     ( SELECT * FROM SMSALE
                        WHERE  SUBSTR(YYMMDD,1,6) = p_sum_yymm
                      )   S ,   -- �Ϻ� �ǸŽ�����Ȳ
                      ( SELECT * FROM MMSUM30
                        WHERE    SUM_YYMM  = p_sum_yymm
                        AND      ITEM_GUBN = '0'    -- ���� ��� ����   
                        )  M      -- â�� ���(MMSUM30)���̺�
            WHERE     S.ITEM_CODE  = M.ITEM_CODE 
            GROUP BY  SUBSTR(S.YYMMDD,1,6) , S.ITEM_CODE
    ;     
    
   BEGIN
      DBMS_OUTPUT.ENABLE;
      FOR 	rec_Store_Remain  IN CSR_Store_Remain  LOOP
        ------------------------------------------------------------------
        --    ���� â�� ������� �Ǹŷ����� ũ�ٸ� �⸻��� �Է� 
        ------------------------------------------------------------------
        IF  rec_Store_Remain.M_STCK_QTY >  rec_Store_Remain.S_STCK_QTY  THEN  
           INSERT INTO MMSUM30       
                (    SUM_YYMM        
                 ,   ITEM_CODE       
                 ,   ITEM_GUBN
                 ,   STCK_QTY
                 ,   SawonID
                 ,   RegiDate
                 )
           VALUES(  rec_Store_Remain.YYMM 
                    , rec_Store_Remain.ITEM_CODE   
                    , '1'                              -- �⸻���    
                    , rec_Store_Remain.M_STCK_QTY - rec_Store_Remain.S_STCK_QTY   
                    , g_in_sawonid                               
                    ,  SYSDATE
           );
        ELSE   -- rec_Store_Remain.M_STCK_QTY <  rec_Store_Remain.S_STCK_QTY 
             INSERT INTO SMSALE_ERR       
                  (    YYMM        
                   ,   ITEM_CODE       
                   ,   MMSUM30_QTY
                   ,   SMSALE_QTY
                   ,   SawonID
                   ,   RegiDate
                   )
             VALUES(  rec_Store_Remain.YYMM 
                    , rec_Store_Remain.ITEM_CODE   
                    , rec_Store_Remain.M_STCK_QTY   -- �������    
                    , rec_Store_Remain.S_STCK_QTY   -- �Ǹż���
                    , g_in_sawonid                               
                    , SYSDATE
             );

             g_prod_cnt  :=   rec_Store_Remain.M_STCK_QTY - rec_Store_Remain.S_STCK_QTY;
             dbms_output.put_line(rec_Store_Remain.YYMM||' ����� ' || rec_Store_Remain.ITEM_CODE  ||
               ' ������ ��=>' || g_prod_cnt  );
             dbms_output.put_line('������ ��=>'||  g_prod_cnt);
	      END IF;
       
     END LOOP;
     EXCEPTION
        WHEN OTHERS THEN
              DBMS_OUTPUT.PUT_LINE(SQLERRM||'���� �߻� ');     
   END  KK_COLLECTION_END;

  /*******************************************************************************
   KK_COLLECTION_PKG   END
  ********************************************************************************/
   
 END KK_COLLECTION_PKG;