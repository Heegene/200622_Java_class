-- 헤더

create or replace PACKAGE KK_COLLECTION_PKG AS
  g_in_sawonid VARCHAR2(4) := 'S003'; -- 임의 입력사원 지정
  g_prod_cnt NUMBER(9) := 0;
  
  -- 패키지 안에 들어갈 프로시저 생성자
  
  -- main method 비슷한 역할
  PROCEDURE KK_COLLECTION_MAIN (p_sum_yymm IN VARCHAR2
                                , p_regi_emp_no IN VARCHAR2
                                );
                                
  PROCEDURE KK_COLLECTION_PRC1 (p_sum_yymm IN VARCHAR2 );
  PROCEDURE KK_COLLECTION_PRC2 (p_sum_yymm IN VARCHAR2 );
  PROCEDURE KK_COLLECTION_PRC3 (p_sum_yymm IN VARCHAR2 );
  -- 수불마감후 mmsum30을 smsale에 따라 stck_qty 차감 및 마감처리 
  PROCEDURE KK_COLLECTION_END (p_sum_yymm IN VARCHAR2 );
  
END KK_COLLECTION_PKG;

-- 바디 
create or replace PACKAGE BODY KK_COLLECTION_PKG AS


PROCEDURE KK_COLLECTION_MAIN ( p_sum_yymm in VARCHAR2,
                                 p_regi_emp_no in VARCHAR2)

IS


BEGIN
  DBMS_OUTPUT.ENABLE;
  DELETE MMSUM30 
  WHERE sum_yymm = p_sum_yymm; -- 기초 기말에 그 달의 정보 초기화시켜놓고 시작
  
  -- 일자별 거래처 제품별 판매현황(smcp10)정보 해당월 삭제
  DELETE smcp10
  WHERE SUBSTR(yymmdd,1,6) = p_sum_yymm;
  
  -- 일자별 제품별 판매현황(SMProd10) 정보 해당월 삭제
  DELETE smprod10
  WHERE SUBSTR(yymmdd,1,6) = p_sum_yymm;
  
  -- 판매실적 오류현황 정보 해당월 삭제(smsale)
  -- 창고재고 이상의 수량을 판매한 경우
  DELETE smsale_err
  WHERE yymm = p_sum_yymm;

  dbms_output.put_line('KK_COLLECTION_PRC1 Before p_sum_yymm => ' || p_sum_yymm);
  -- 메인에서 실행할 함수(프로시저) 호출 
  KK_COLLECTION_PRC1(p_sum_yymm);
  
  KK_COLLECTION_PRC2(p_sum_yymm => p_sum_yymm);
  
  KK_COLLECTION_PRC3(p_sum_yymm => p_sum_yymm);
  
  KK_COLLECTION_END(p_sum_yymm => p_sum_yymm );
 
  commit;
  
END KK_COLLECTION_MAIN;
  
---------------------------------------------------------------------------------  
-- 당월 기초입고수량 생성(KK_COLLECTION_PRC1)

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
      
      -- multi line으로 insert하기 위해 subquery 이용(select 내용이 insert를 통해 들어감)
      -- 전월의 기말개조를 당월의 기초재고로 이월시킴
    ( SELECT  p_sum_yymm --2월의 기초재고로 넣어줌 
            , item_code -- 아이템코드 그대로 끌어옴
            , '0' -- 기초
            , stck_qty -- 기말 기준 아이템코드
            , sawonid
            , sysdate
      FROM    mmsum30
      WHERE   sum_yymm = TO_CHAR(ADD_MONTHS (TO_DATE(p_sum_yymm, 'YYYYMM'), -1), 'YYYYMM')
      -- 1월의 데이터를 가져와서 
      AND     item_gubn = '1'  -- 기말
      );


END KK_COLLECTION_PRC1;

------------------------------------------------------------------------------
 PROCEDURE   KK_COLLECTION_PRC2(  p_sum_yymm     in	VARCHAR2)   
   IS  
   --- 일별 판매실적 현황(SMSALE)을 읽음 
   CURSOR  CSR_SMSALE  IS
            SELECT     S.YYMMDD     YYMMDD
                      ,S.CustomID    CustomID 
                      ,S.ITEM_CODE  ITEM_CODE   
                      ,S.STCK_QTY   STCK_QTY 
                      , P.Danga     Danga 
            FROM      SMSALE   S ,  Product P   --- 일별 판매실적 현황 , 제품(Product) 테이블
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
              DBMS_OUTPUT.PUT_LINE(SQLERRM||'에러 발생 ');
   END  KK_COLLECTION_PRC2;
----------------------------------------------------------3번 프로시저prc3----

-- 일자별 제품별 판매현황을 생성
-- smprod10 정보 생성
-- smsale 읽어서 일자별 제품별 판매현황
-- smsale을 가보면 customid가 똑같은게 있음 두개가 묶여서 보이게됨
-- 누적되어서 summary를 갖고오게됨 단가는 평균단가를 가져옴
-- group 함수 사용 group by customid 
-- group 함수, qty-> sum , 단가->avg  



PROCEDURE   KK_COLLECTION_PRC3(  p_sum_yymm     in	VARCHAR2)   
IS  
   --- 일별 판매실적 현황(SMSALE)을 읽음 
   CURSOR  prc3input   IS
   
            SELECT     
                       s.YYMMDD YYMMDD,
                       s.item_code item_code,
                       SUM(s.stck_qty) stck_qty,
                       AVG(p.danga) danga   
            FROM      SMSALE S, Product p   --- 일별 판매실적 현황 , 제품(Product) 테이블
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
              DBMS_OUTPUT.PUT_LINE(SQLERRM||'에러 발생 ');
              
END KK_COLLECTION_PRC3;

--------------------------------------------------------------prc4
--- 마감작업
-- 창고 기초재고가 판매량보다 크면 기말재고 입력
-- 창고 재고가 판매량보다 작으면 smsale_err입력

PROCEDURE   KK_COLLECTION_END(  p_sum_yymm  in	VARCHAR2)   

IS

CURSOR closing IS
        SELECT SUBSTR(s.YYMMDD,1,6)   YYMM,
               s.item_code            item_code,
               SUM(s.stck_qty)        s_stck_qty,
               AVG(material.stck_qty) material_stck_qty -- 그룹함수 적용해야해서 그냥avg적용
        FROM (SELECT * FROM smsale
              WHERE SUBSTR(YYMMDD,1,6) = p_sum_yymm) s,
             (SELECT * FROM mmsum30
              WHERE SUM_YYMM = p_sum_yymm
              AND ITEM_GUBN = '0') material -- 기초재고(월초재고 가져옴)
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
      DBMS_OUTPUT.PUT_LINE(SQLERRM || '에러가 발생했습니다.');
      
END KK_COLLECTION_END;
             
  
END KK_COLLECTION_PKG;
