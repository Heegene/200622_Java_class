DROP TABLE SMProd10;
DROP TABLE SMCP10  ;
DROP TABLE SMSALE   ;
DROP TABLE MMSUM30  ;
DROP TABLE Customer ;
DROP TABLE Product  ;
DROP TABLE Sawon    ;
/*************************************************************************
*         Master Table   거래처(Customer) 테이블 생성 (Package 예제)
*************************************************************************/
CREATE TABLE Customer
        (CustomID               VARCHAR2(4) 
         CONSTRAINT PK_CustomID PRIMARY KEY,        -- 거래처 번호
         CustomNM               VARCHAR2(20),       -- 거래처 이름
         CustomOwner            VARCHAR2(20),       -- 거래처 대표 이름
         CustomBirthday         VARCHAR2(8),        -- 거래처 대표 생일
         CustomGender           VARCHAR2(1),        -- 거래처 대표 성별
         CustomAddr             VARCHAR2(50),       -- 거래처 주소
         CustomTel              VARCHAR2(20),       -- 거래처 전화   
         MatchSawon             VARCHAR2(4),        -- 거래처 담당사원   
         RegiDate               Date                -- 등록일자 
         );
/*************************************************************************
*             Master Table   거래처(Customer) 테이블 데이터 입력
*************************************************************************/
INSERT INTO Customer   VALUES
        (1001, '영화상사', '김영화', '19760108', '1',
        '서울 서초동', '010-1111-2222', 'S001',SYSDATE);

INSERT INTO Customer   VALUES
        (1002, '뮤즈컴', '안예은', '19961208', '2',
        '서울 강남구', '010-3333-5555', 'S002',SYSDATE);

INSERT INTO Customer   VALUES
        (1003, '뮤지칼', '김준수', '19981108', '1',
        '서울 강남구', '010-1234-5555', 'S003',SYSDATE);

INSERT INTO Customer   VALUES
        (1004, '뮤즈컴', '손흥민', '19970708', '1',
        '서울 강남구', '010-3333-5678', 'S001',SYSDATE);

/*************************************************************************
*         Master Table   제품(Product) 테이블 생성 (Package 예제)
*************************************************************************/
CREATE TABLE Product
        (ITEM_CODE         VARCHAR2(4)
           CONSTRAINT PK_ITEM_CODE PRIMARY KEY,          -- 제품 번호
         ITEMNAME            VARCHAR2(20),               -- 제품 이름
         Danga                   NUMBER(8),              -- 단가 
         Special                 VARCHAR2(100),          -- 제품 특징
         RegiDate               Date                     -- 등록일자 
         );

INSERT INTO Product   VALUES
        ('A001', '마이크', 15000, '고성능 제품', SYSDATE);

INSERT INTO Product   VALUES
        ('A002', '스피커', 6000, '우수 제품', SYSDATE);

INSERT INTO Product   VALUES
        ('B001', '축구복',  25600, '방수용 제품', SYSDATE);

INSERT INTO Product   VALUES
        ('B002', '축구공', 15800, '고탄력  제품', SYSDATE);


/*************************************************************************
*         Master Table   사원(Sawon) 테이블 생성 (Package 예제)
*************************************************************************/
CREATE TABLE Sawon
        (SawonID             VARCHAR2(4)
        CONSTRAINT PK_SawonID  PRIMARY KEY,            -- 사원 code
         SawonNM            VARCHAR2(20),              -- 사원 이름
         SawonBirthday     VARCHAR2(8),                -- 사원 생일
         SawonGender       VARCHAR2(1),                -- 사원 성별
         SawonAddr          VARCHAR2(50),              -- 사원 주소
         SawonTel            VARCHAR2(20),             -- 사원 전화   
         RegiDate               Date                   -- 등록일자 
         );

INSERT INTO Sawon   VALUES
        ('S001', '김영업', '19760108', '1',
        '서울 서초동', '010-1113-2222', SYSDATE);

INSERT INTO Sawon   VALUES
        ('S002', '현빈', '19860108', '1',
        '서울 홍대', '010-1458-3456', SYSDATE);

INSERT INTO Sawon   VALUES
        ('S003', '손예진', '19890708', '2',
        '서울 이대', '010-1133-6677', SYSDATE);

/*************************************************************************
*       창고 재고 Table  MMSUM30   테이블 생성 (Transaction)
*************************************************************************/
CREATE TABLE MMSUM30   
        ( SUM_YYMM       VARCHAR2(6) ,       --  년월     
         ITEM_CODE       VARCHAR2(4)
         CONSTRAINT      FK_ITEM_CODE3  REFERENCES Product , -- 제품코드 
         ITEM_GUBN       VARCHAR2(1),        -- 0:기초 , 1:수불마감(기말) 
         STCK_QTY        NUMBER(8),          -- 수량
         SawonID         VARCHAR2(4)
         CONSTRAINT  FK_SawonID1 REFERENCES Sawon,     -- 사원 code
         RegiDate            Date                      -- 등록일자 
         );
ALTER TABLE MMSUM30   
 ADD Constraint PK_MMSUM30 PRIMARY KEY(SUM_YYMM,ITEM_CODE,ITEM_GUBN);  
                    
INSERT INTO MMSUM30   VALUES
        ('201701', 'A001', '1', 10000,    'S001', SYSDATE);
INSERT INTO MMSUM30   VALUES
        ('201701', 'A002', '1', 10000,    'S001', SYSDATE);
INSERT INTO MMSUM30   VALUES
        ('201701', 'B001', '1', 10000,    'S001', SYSDATE);
INSERT INTO MMSUM30   VALUES
        ('201701', 'B002', '1', 10000,    'S001', SYSDATE);
/*************************************************************************
*       일별 판매실적 현황 Table  SMSALE   테이블 생성 (Transaction)
*************************************************************************/
CREATE TABLE SMSALE   
        ( YYMMDD           VARCHAR2(8) ,      --  판매 년월일     
         CustomID          VARCHAR2(4)
         CONSTRAINT FK_CustomID1 REFERENCES Customer,     -- 거래처 번호
         ITEM_CODE         VARCHAR2(4)
         CONSTRAINT FK_ITEM_CODE1 REFERENCES Product,     -- 제품 번호 ,          
         STCK_QTY           NUMBER(8),                 -- 수량
        SawonID             VARCHAR2(4)
        CONSTRAINT FK_SawonID2 REFERENCES Sawon,     -- 판매 사원 code
         RegiDate           Date                      -- 등록일자 
         );
ALTER TABLE SMSALE   
 ADD Constraint PK_SMSALE PRIMARY KEY(YYMMDD,CustomID,ITEM_CODE);                       

INSERT INTO SMSALE   VALUES
        ('20170212', '1001',  'A001', 500,    'S001', SYSDATE);
INSERT INTO SMSALE   VALUES
        ('20170212', '1002',  'A002', 300,    'S002', SYSDATE);
INSERT INTO SMSALE   VALUES
        ('20170212', '1003', 'B001', 200,    'S003', SYSDATE);
INSERT INTO SMSALE   VALUES
        ('20170212', '1003', 'B002', 150,    'S003', SYSDATE);
INSERT INTO SMSALE   VALUES
        ('20170212', '1004',  'B002', 700,    'S001', SYSDATE);


/*************************************************************************
*       일자별 거래처 제품별 판매현황 Table  SMCP10   테이블 생성 (Transaction)
*************************************************************************/
CREATE TABLE SMCP10   
        ( YYMMDD          VARCHAR2(8) ,      --  판매현황 년월일     
         CustomID           VARCHAR2(4)
         CONSTRAINT FK_CustomID2 REFERENCES Customer,    -- 거래처 번호
         ITEM_CODE        VARCHAR2(4)
         CONSTRAINT FK_ITEM_CODE5 REFERENCES Product,       -- 제품 번호       
         STCK_QTY         NUMBER(8),           -- 수량
         Danga               NUMBER(8),           -- 단가 
        SawonID             VARCHAR2(4)
        CONSTRAINT FK_SawonID3 REFERENCES Sawon ,        -- 사원 code
         RegiDate            Date                      -- 등록일자 
         );
ALTER TABLE SMCP10   
ADD Constraint PK_SMCP10 PRIMARY KEY(YYMMDD,CustomID,ITEM_CODE);                       

/*************************************************************************
*      일자별  제품별 판매현황 Table  SMProd10   테이블 생성 (Transaction)
*************************************************************************/
CREATE TABLE SMProd10   
        ( YYMMDD          VARCHAR2(8) ,      --  판매현황 년월일     
         ITEM_CODE        VARCHAR2(4)
         CONSTRAINT FK_ITEM_CODE2 REFERENCES Product,       -- 제품 번호       
         STCK_QTY         NUMBER(8),           -- 수량
         Danga               NUMBER(8),           -- 단가 
        SawonID             VARCHAR2(4)
        CONSTRAINT FK_SawonID4 REFERENCES Sawon ,        -- 사원 code
         RegiDate            Date                      -- 등록일자 
         );

ALTER TABLE SMProd10   
ADD Constraint PK_SMProd10  PRIMARY KEY(YYMMDD,ITEM_CODE);                       

 

COMMIT;

