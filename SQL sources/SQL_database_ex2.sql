DROP TABLE SMProd10;
DROP TABLE SMCP10  ;
DROP TABLE SMSALE   ;
DROP TABLE MMSUM30  ;
DROP TABLE Customer ;
DROP TABLE Product  ;
DROP TABLE Sawon    ;
/*************************************************************************
*         Master Table   �ŷ�ó(Customer) ���̺� ���� (Package ����)
*************************************************************************/
CREATE TABLE Customer
        (CustomID               VARCHAR2(4) 
         CONSTRAINT PK_CustomID PRIMARY KEY,        -- �ŷ�ó ��ȣ
         CustomNM               VARCHAR2(20),       -- �ŷ�ó �̸�
         CustomOwner            VARCHAR2(20),       -- �ŷ�ó ��ǥ �̸�
         CustomBirthday         VARCHAR2(8),        -- �ŷ�ó ��ǥ ����
         CustomGender           VARCHAR2(1),        -- �ŷ�ó ��ǥ ����
         CustomAddr             VARCHAR2(50),       -- �ŷ�ó �ּ�
         CustomTel              VARCHAR2(20),       -- �ŷ�ó ��ȭ   
         MatchSawon             VARCHAR2(4),        -- �ŷ�ó �����   
         RegiDate               Date                -- ������� 
         );
/*************************************************************************
*             Master Table   �ŷ�ó(Customer) ���̺� ������ �Է�
*************************************************************************/
INSERT INTO Customer   VALUES
        (1001, '��ȭ���', '�迵ȭ', '19760108', '1',
        '���� ���ʵ�', '010-1111-2222', 'S001',SYSDATE);

INSERT INTO Customer   VALUES
        (1002, '������', '�ȿ���', '19961208', '2',
        '���� ������', '010-3333-5555', 'S002',SYSDATE);

INSERT INTO Customer   VALUES
        (1003, '����Į', '���ؼ�', '19981108', '1',
        '���� ������', '010-1234-5555', 'S003',SYSDATE);

INSERT INTO Customer   VALUES
        (1004, '������', '�����', '19970708', '1',
        '���� ������', '010-3333-5678', 'S001',SYSDATE);

/*************************************************************************
*         Master Table   ��ǰ(Product) ���̺� ���� (Package ����)
*************************************************************************/
CREATE TABLE Product
        (ITEM_CODE         VARCHAR2(4)
           CONSTRAINT PK_ITEM_CODE PRIMARY KEY,          -- ��ǰ ��ȣ
         ITEMNAME            VARCHAR2(20),               -- ��ǰ �̸�
         Danga                   NUMBER(8),              -- �ܰ� 
         Special                 VARCHAR2(100),          -- ��ǰ Ư¡
         RegiDate               Date                     -- ������� 
         );

INSERT INTO Product   VALUES
        ('A001', '����ũ', 15000, '���� ��ǰ', SYSDATE);

INSERT INTO Product   VALUES
        ('A002', '����Ŀ', 6000, '��� ��ǰ', SYSDATE);

INSERT INTO Product   VALUES
        ('B001', '�౸��',  25600, '����� ��ǰ', SYSDATE);

INSERT INTO Product   VALUES
        ('B002', '�౸��', 15800, '��ź��  ��ǰ', SYSDATE);


/*************************************************************************
*         Master Table   ���(Sawon) ���̺� ���� (Package ����)
*************************************************************************/
CREATE TABLE Sawon
        (SawonID             VARCHAR2(4)
        CONSTRAINT PK_SawonID  PRIMARY KEY,            -- ��� code
         SawonNM            VARCHAR2(20),              -- ��� �̸�
         SawonBirthday     VARCHAR2(8),                -- ��� ����
         SawonGender       VARCHAR2(1),                -- ��� ����
         SawonAddr          VARCHAR2(50),              -- ��� �ּ�
         SawonTel            VARCHAR2(20),             -- ��� ��ȭ   
         RegiDate               Date                   -- ������� 
         );

INSERT INTO Sawon   VALUES
        ('S001', '�迵��', '19760108', '1',
        '���� ���ʵ�', '010-1113-2222', SYSDATE);

INSERT INTO Sawon   VALUES
        ('S002', '����', '19860108', '1',
        '���� ȫ��', '010-1458-3456', SYSDATE);

INSERT INTO Sawon   VALUES
        ('S003', '�տ���', '19890708', '2',
        '���� �̴�', '010-1133-6677', SYSDATE);

/*************************************************************************
*       â�� ��� Table  MMSUM30   ���̺� ���� (Transaction)
*************************************************************************/
CREATE TABLE MMSUM30   
        ( SUM_YYMM       VARCHAR2(6) ,       --  ���     
         ITEM_CODE       VARCHAR2(4)
         CONSTRAINT      FK_ITEM_CODE3  REFERENCES Product , -- ��ǰ�ڵ� 
         ITEM_GUBN       VARCHAR2(1),        -- 0:���� , 1:���Ҹ���(�⸻) 
         STCK_QTY        NUMBER(8),          -- ����
         SawonID         VARCHAR2(4)
         CONSTRAINT  FK_SawonID1 REFERENCES Sawon,     -- ��� code
         RegiDate            Date                      -- ������� 
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
*       �Ϻ� �ǸŽ��� ��Ȳ Table  SMSALE   ���̺� ���� (Transaction)
*************************************************************************/
CREATE TABLE SMSALE   
        ( YYMMDD           VARCHAR2(8) ,      --  �Ǹ� �����     
         CustomID          VARCHAR2(4)
         CONSTRAINT FK_CustomID1 REFERENCES Customer,     -- �ŷ�ó ��ȣ
         ITEM_CODE         VARCHAR2(4)
         CONSTRAINT FK_ITEM_CODE1 REFERENCES Product,     -- ��ǰ ��ȣ ,          
         STCK_QTY           NUMBER(8),                 -- ����
        SawonID             VARCHAR2(4)
        CONSTRAINT FK_SawonID2 REFERENCES Sawon,     -- �Ǹ� ��� code
         RegiDate           Date                      -- ������� 
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
*       ���ں� �ŷ�ó ��ǰ�� �Ǹ���Ȳ Table  SMCP10   ���̺� ���� (Transaction)
*************************************************************************/
CREATE TABLE SMCP10   
        ( YYMMDD          VARCHAR2(8) ,      --  �Ǹ���Ȳ �����     
         CustomID           VARCHAR2(4)
         CONSTRAINT FK_CustomID2 REFERENCES Customer,    -- �ŷ�ó ��ȣ
         ITEM_CODE        VARCHAR2(4)
         CONSTRAINT FK_ITEM_CODE5 REFERENCES Product,       -- ��ǰ ��ȣ       
         STCK_QTY         NUMBER(8),           -- ����
         Danga               NUMBER(8),           -- �ܰ� 
        SawonID             VARCHAR2(4)
        CONSTRAINT FK_SawonID3 REFERENCES Sawon ,        -- ��� code
         RegiDate            Date                      -- ������� 
         );
ALTER TABLE SMCP10   
ADD Constraint PK_SMCP10 PRIMARY KEY(YYMMDD,CustomID,ITEM_CODE);                       

/*************************************************************************
*      ���ں�  ��ǰ�� �Ǹ���Ȳ Table  SMProd10   ���̺� ���� (Transaction)
*************************************************************************/
CREATE TABLE SMProd10   
        ( YYMMDD          VARCHAR2(8) ,      --  �Ǹ���Ȳ �����     
         ITEM_CODE        VARCHAR2(4)
         CONSTRAINT FK_ITEM_CODE2 REFERENCES Product,       -- ��ǰ ��ȣ       
         STCK_QTY         NUMBER(8),           -- ����
         Danga               NUMBER(8),           -- �ܰ� 
        SawonID             VARCHAR2(4)
        CONSTRAINT FK_SawonID4 REFERENCES Sawon ,        -- ��� code
         RegiDate            Date                      -- ������� 
         );

ALTER TABLE SMProd10   
ADD Constraint PK_SMProd10  PRIMARY KEY(YYMMDD,ITEM_CODE);                       

 

COMMIT;

