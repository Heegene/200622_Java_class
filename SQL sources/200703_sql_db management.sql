CREATE USER scott3 IDENTIFIED BY tiger;
GRANT DBA TO scott3;

-- Database 관리

CREATE OR REPLACE Directory mdBackUp2 AS 'C:\Java Programming\orabackup';
-- 백업 디렉토리 선언 (백업 디렉토리 이름 mdBackUp2)

GRANT READ, WRITE ON DIRECTORY mdBackUP2 TO scott3;
-- 백업 디렉토리의 읽기 쓰기권한 스캇3에게 부여


-- 테이블스페이스 생성 
CREATE TABLESPACE user1 datafile 'C:\Java Programming\tablespace\user1.ora' size 100m;
CREATE TABLESPACE user2 datafile 'C:\Java Programming\tablespace\user2.ora' size 100m;
CREATE TABLESPACE user3 datafile 'C:\Java Programming\tablespace\user3.ora' size 100m;



-- 유저생성과 동시에 테이블스페이스 할당 가능 
CREATE USER scott2 IDENTIFIED BY tiger
DEFAULT TABLESPACE user1;

GRANT DBA TO scott2;
