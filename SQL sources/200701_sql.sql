-- USER_CONSTRAINTS 데이터 사전에서 무결성 제약조건 조회
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE 
FROM USER_CONSTRAINTS
WHERE table_name IN ('SUBJECT', 'SUGANG');
-- C = check 혹은 Not null, P = Primary key, U = Unique, R = Foreign key 
-- WHERE table_name IN ('subject', 'SUGANG'); 이렇게하면 값 조회 안됨
-- 데이터 딕셔너리에는 대문자화되어 들어가있어서 대문자로만 쳐야함 

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE
FROM USER_CONSTRAINTS
WHERE TABLE_NAME ='STUDENT';

-- Student 테이블에 idnum을ㅇ uk_stud_idnum이라는 키이름으로 unique key 생성 
ALTER TABLE student
ADD CONSTRAINT uk_stud_idnum UNIQUE(idnum);

-- key를 넣을 때에는 add constraint이고,
-- NOT null을 넣어줄 때에는 modify를 사용 
ALTER TABLE student
MODIFY (name CONSTRAINT nn_stud_name NOT NULL);


-- 제약조건의 삭제
ALTER TABLE subject
DROP CONSTRAINT SUBJECT_TERM_CHECK; 

-- UNIQUE INDEX 생성
CREATE UNIQUE INDEX idx_dept_name ON department(dname);
-- index 앞에는 보통 idx라는 이름을 붙임
-- 말하지 않으면 ASC가 기본값으로 설정됨 


-- 학생 테이블의 birthdate 컬럼을 비고유 인덱스로 생성
-- 인덱스명 idx_stud_birthdate
CREATE INDEX idx_stud_birthdate ON student(birthdate);


-- 학생 테이블의 deptno, grade 컬럼 결합 인덱스로 생성
-- 결합 인덱스명은 idx_stud_dno_grade 로 정의
CREATE INDEX idx_stud_dno_grade ON student(deptno, grade);


-- 함수기반 인덱스 생성(function based index)
CREATE INDEX uppercase_idx ON emp (UPPER(ename));
-- 대문자로 된 ename이 인덱스로 생성됨 

SELECT * FROM emp WHERE UPPER(ename) = 'KING';


-- 학과 테이블ㅇ서 학과 이름이 정보미디어학부인 학과번호 검색 결과 실행경로
-- dname 컬럼에 고유 인덱스 생성되어 있음

SELECT deptno, dname
FROM department
WHERE dname = '정보미디어학부';


-- INDEX 삭제
DROP INDEX IDX_DEPT_NAME;


-- INDEX 재구성(인덱스 리빌드)
ALTER INDEX pk_studno REBUILD;



-- 뷰 생성
CREATE VIEW view_professor AS
SELECT profno, name, userid, position, hiredate, deptno
FROM professor;

-- CREATE OR REPLACE VIEW
CREATE OR REPLACE VIEW view_professor AS
SELECT profno, name, userid, position, hiredate, deptno
FROM professor;


-- 뷰 생성 예제
CREATE VIEW view_student AS
SELECT studno, name, deptno
FROM student;

-- 복합 뷰 생성
CREATE OR REPLACE VIEW v_stud_dept102 AS
SELECT s.studno, s.name, s.grade, d.dname
FROM student s, department d
WHERE s.studno = d.deptno
AND s.deptno = 102;


-- 교수테이블에서 학과별 평균급여(avg_sal)과 총계(sum_sal)로 정의되는 뷰 생성
-- v_prof_avg_sal

CREATE OR REPLACE VIEW v_prof_avg_sal AS
SELECT deptno, AVG(sal) AS avg_sal, SUM(sal) AS sum_sal
FROM professor
GROUP BY deptno;


-- view 삭제
DROP VIEW v_stud_dept102;

-- VIEW 입력이 되지 않는 사례
CREATE OR REPLACE VIEW dept_view
AS
SELECT dname, loc
FROM dept;

-- 이렇게 만들고 dept 테이블에 null X인 필드를 null로 해서 입력하면 에러발생
-- 원래 테이블에서 not null 설정되어있는거에 insert를 null 포함해서 커밋 불가


-- VIEW 입력이 되지 않는 사례 2
CREATE OR REPLACE VIEW dept_view2
AS
SELECT deptno, dname, loc
FROM dept
WHERE deptno = 10
WITH CHECK OPTION;
-- 이렇게 만든 테이블에 deptno 를 70번으로 해서 인서트하려고 하면
-- WHERE 조건에 violation이 됨 (WHERE 절의 조건을 check하므로 10이 아니면 입력불가)




