CREATE USER scott3 IDENTIFIED BY tiger;
GRANT DBA TO scott3;

-- Database ����

CREATE OR REPLACE Directory mdBackUp2 AS 'C:\Java Programming\orabackup';
-- ��� ���丮 ���� (��� ���丮 �̸� mdBackUp2)

GRANT READ, WRITE ON DIRECTORY mdBackUP2 TO scott3;
-- ��� ���丮�� �б� ������� ��ı3���� �ο�