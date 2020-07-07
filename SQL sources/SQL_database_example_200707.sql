-- 패키지 생성(인터페이스랑 비슷한 역할)

  --------------------------------------------------------------------------------------                                
  ------- 행동강령 :    <<<  월 수불마감 PGM  >>>                       
  -------               1. 당월기초 입고 수량을 생성한다.(MMSUM30  기말재고를 익월 기초재고로 이월 )
  -------               2. 일자별 거래처 제품별 판매현황(SMCP10)정보를 생성 PGM                          
  -------               3. 일자별 제품별 판매현황(SMProd10)정보를 생성 PGM                               
  -------                  각각의 경우에 대해, 대분류별회계계정코드를 Update[2017.08.16]
  --------------------------------------------------------------------------------------           

CREATE or REPLACE PACKAGE KK_COLLECTION_PKG AS
  g_in_sawonid VARCHAR2(4) := 'S003'; -- 임의 입력사원 지정
  g_prod_cnt NUMBER(9) := 0;
  
  -- 패키지 안에 들어갈 프로시저 생성자
  
  -- main method 비슷한 역할
  PROCEDURE KK_COLLECTION_MAIN (p_sum_yymm IN VARCHAR2
                                , p_regi_emp_no IN VARCHAR2
                                );
                                
  PROCEDURE KK_COLLECTION_PRC1 (p_sum_yymm IN VARCHAR2 );
  
  
END KK_COLLECTION_PKG;

-------------------------------------------------------------------------
-- 패키지 body 내용 
CREATE OR REPLACE PACKAGE BODY KK_COLLECTION_PKG AS
  PROCEDURE KK_COLLECTION_MAIN ( p_sum_yymm in VARCHAR2,
                                 p_regi_emp_no in VARCHAR2)

IS


BEGIN
  DELETE MMSUM30 
  WHERE sum_yymm = p_sum_yymm; -- 기초 기말에 그 달의 정보 초기화시켜놓고 시작
  
  -- 일자별 거래처 제품별 판매현황(smcp10)정보 해당월 삭제
  DELETE smcp10
  WHERE SUBSTR(yymmdd,1,6) = p_sum_yymm;
  
  --일자별 제품별 판매현황(SMProd10) 정보 해당월 삭제
  DBMS.OUTPUT.ENABLE;
  dbms_output.put_line('KK_COLLECTION_PRC1 Before p_sum_yymm => ' || p_sum_yymm);
  KK_COLLECTION_PRC1(p_sum_yymm);
  
  COMMIT;
  
  
END KK_COLLECTION_MAIN;
  
---------------------------------------------------------------------------------  
-- 당월 기초입고수량 생성(KK_COLLECTION_PRC1)

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




  
