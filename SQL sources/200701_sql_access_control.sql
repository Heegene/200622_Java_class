-- DBA 권한으로 접속하여 계정 생성하기 
CREATE USER tiger IDENTIFIED BY tiger;

-- 이렇게만 만들고 접속하려고 하면 권한이 없어서 access denied 됨 

GRANT connect, resource TO tiger;
-- 접속(세션연결), 기본테이블만 핸들링 할 수 있는 권한 부여 

-- tiger 계정에 student table의 select 권한 부여
GRANT SELECT ON student TO tiger;


-- tiger 계정에 update 권한을 주되 특정 컬럼에 대해서만 권한 줌
GRANT UPDATE(height, weight) ON student TO tiger;

-- 권한 회수
REVOKE SELECT ON student FROM tiger;
-- student 테이블 권한을 tiger로부터 회수
REVOKE UPDATE ON student FROM tiger;
-- update 권한도 회수

CREATE ROLE hr_clerk;

-- 암호가 있는 롤 
CREATE ROLE hr_mgr
            IDENTIFIED BY manager;
            

-- 상세 권한을 하나씩 줄 수도 있음
GRANT create session to hr_mgr;

-- Scott의 student 모든 컬럼에 대한 select, delete, insert 권한 hr clerk에 부여
GRANT SELECT, DELETE, INSERT ON student TO hr_clerk;

-- hr_clerk이 가진 권한을 hr_mgr에 부여
GRANT hr_clerk TO hr_mgr;

-- hr_clerk이 가진 권한을 tiger에 부여
GRANT hr_clerk TO tiger;

GRANT create session TO hr_clerk;
GRANT SELECT, DELETE, INSERT ON dept TO hr_clerk;


CREATE TABLE project (
    project_id number(5) CONSTRAINT pro_id_pk PRIMARY KEY,
    project_name varchar2(100),
    studno number(5),
    profno number(5)
    );

-- 동의어(SYNONYM) 예제
INSERT INTO project VALUES (12345, 'portfolio', 10101, 9901);
SELECT * FROM project;

GRANT SELECT ON project to tiger;

CREATE SYNONYM my_project FOR project;


select * from dba_sys_privs where grantee='tiger' ;




GRANT unlimited tablespace to tiger;



set role hr_clerk;


GRANT SELECT ON professor to hr_clerk;
GRANT hr_clerk to tiger;

REVOKE SELECT ON professor FROM hr_clerk;


-- 계층적 질의문 사용하여 부서 테이블에서 학과, 학부, 
-- 단대, 학부학과순으로 top down 계층구조로 출력
-- 단 시작 데이터는 10번 부서

SELECT deptno, dname, college
FROM department
START WITH deptno = 10
CONNECT BY PRIOR deptno = college;



