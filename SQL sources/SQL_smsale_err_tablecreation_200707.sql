CREATE TABLE smsale_err
        ( yymm        VARCHAR2(6), -- 판매 년월
          item_code   VARCHAR2(4), -- 제품번호
          mmsum30_qty NUMBER(8), -- 기초재고수량
          smsale_qty  NUMBER(8), -- 판매수량
          sawonid     VARCHAR2(4), -- 판매사원코드
          regdate     DATE-- 등록일자 
          );
          
ALTER TABLE smsale_err
    ADD CONSTRAINT PK_SMSALE_ERR PRIMARY KEY(yymm, item_code); 