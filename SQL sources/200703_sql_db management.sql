CREATE USER scott3 IDENTIFIED BY tiger;
GRANT DBA TO scott3;

-- Database ����

CREATE OR REPLACE Directory mdBackUp2 AS 'C:\Java Programming\orabackup';
-- ��� ���丮 ���� (��� ���丮 �̸� mdBackUp2)

GRANT READ, WRITE ON DIRECTORY mdBackUP2 TO scott3;
-- ��� ���丮�� �б� ������� ��ı3���� �ο�


-- ���̺����̽� ���� 
CREATE TABLESPACE user1 datafile 'C:\Java Programming\tablespace\user1.ora' size 100m;
CREATE TABLESPACE user2 datafile 'C:\Java Programming\tablespace\user2.ora' size 100m;
CREATE TABLESPACE user3 datafile 'C:\Java Programming\tablespace\user3.ora' size 100m;



-- ���������� ���ÿ� ���̺����̽� �Ҵ� ���� 
CREATE USER scott2 IDENTIFIED BY tiger
DEFAULT TABLESPACE user1;

GRANT DBA TO scott2;
