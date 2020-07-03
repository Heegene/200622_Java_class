CREATE USER scott3 IDENTIFIED BY tiger;
GRANT DBA TO scott3;

-- Database 관리

CREATE OR REPLACE Directory mdBackUp2 AS 'C:\Java Programming\orabackup';
-- 백업 디렉토리 선언 (백업 디렉토리 이름 mdBackUp2)

GRANT READ, WRITE ON DIRECTORY mdBackUP2 TO scott3;
-- 백업 디렉토리의 읽기 쓰기권한 스캇3에게 부여