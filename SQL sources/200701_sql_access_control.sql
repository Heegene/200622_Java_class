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
START WITH deptno = 10 -- dept 10번부터 시작하되
CONNECT BY PRIOR deptno = college;
-- 자식을 내걸고 부모를 나중에
-- college에 들어있는 값이 deptno에 들어있다면 그게 부모


-- 계층적 질의문 사용하여 부서 테이블에서 학과, 학부 , 단과대학 검색하여
-- 학과, 학번, 단대 순으로bottom up 형태로 출력
-- 시작데이터 102번

SELECT deptno, dname, college
FROM department
START WITH deptno = 102
CONNECT BY PRIOR college = deptno;
-- bottom up이니까 거꾸로 기재하면 됨 


-- 계층적 질의문 사용하여 부서 테이블에서 부서 이름 검색하여
-- 단대, 학부 , 학과순 top-down 형식으로 출력
-- 단 시작 데이터는 '공과대학'이고 각 레벨별로 우측으로 2칸 이동 출력

SELECT LEVEL, LPAD(' ', (Level-1)*2) || dname AS 조직도
FROM department
START WITH dname = '공과대학'
CONNECT BY PRIOR deptno = college;

-- LEVEL이라고 의사 열이 있음 루트 노드, 루트 노드의 자식 노드, 그 자식 이렇게
-- depth가 있음


CREATE TABLE DEP (
     DEP_CD NUMBER NOT NULL, -- 부서코드
     PARENT_CD NUMBER, -- 상위부서 코드
     DEPT_NAME VARCHAR2(100) NOT NULL, -- 부서이름
     PRIMARY KEY (DEP_CD)
);

INSERT INTO DEP VALUES ( 101, NULL, '총괄개발부');
INSERT INTO DEP VALUES ( 102, 101, '모바일개발센터');
INSERT INTO DEP VALUES ( 103, 101, '웹개발센터');
INSERT INTO DEP VALUES ( 104, 101, '시스템개발센터');

INSERT INTO DEP VALUES ( 105, 102, '쇼핑몰(모바일)');
INSERT INTO DEP VALUES ( 106, 103, '외주SI');
INSERT INTO DEP VALUES ( 107, 103, '쇼핑몰');
INSERT INTO DEP VALUES ( 108, 105, '전산지원팀');
INSERT INTO DEP VALUES ( 109, 106, '구축1팀');
INSERT INTO DEP VALUES ( 100, 106, '구축2팀');
INSERT INTO DEP VALUES ( 111, 104, 'ERP시스템');

SELECT LPAD(' ', (level-1*2)) || dept_name AS 조직도,
dep_cd, parent_cd, level
FROM dep
START WITH parent_cd IS NULL
CONNECT BY PRIOR dep_cd = parent_cd;




-- 계층적 질의문을 사용하여 부서 테이블에서 dname을
-- 단대, 학부, 학과순으로 top-down 형식으로 출력
-- 단 정보미디어학부 제외 출력

SELECT deptno, college, dname, loc
FROM department
WHERE dname != '정보미디어학부'
START WITH college is null
CONNECT BY PRIOR deptno = college;

-- 정보미디어학부 전체를 다 날리고싶을때(하위 포함)

SELECT deptno, college, dname, loc
FROM department
START WITH college is null
CONNECT BY PRIOR deptno = college
AND dname != '정보미디어학부';
