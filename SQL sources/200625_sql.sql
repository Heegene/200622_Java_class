SELECT deptno, dname
FROM dept;
CREATE TABLE ex_type
(c CHAR(10), v VARCHAR2(10));

INSERT INTO ex_type
VALUES ('sql', 'sql');

SELECT * FROM EX_TYPE
WHERE C = 'sql';


SELECT * FROM EX_TYPE
WHERE V = 'sql';


SELECT * FROM EX_TYPE
WHERE C = V;


SELECT ROWNUM, ROWID, dname, loc FROM DEPT;


SELECT STUDNO, NAME, DEPTNO ,GRADE   FROM student
WHERE GRADE = 1;


SELECT STUDNO, NAME, GRADE, DEPTNO, WEIGHT FROM STUDENT
WHERE WEIGHT <= 70;

SELECT STUDNO, NAME, WEIGHT, DEPTNO, GRADE FROM STUDENT
WHERE WEIGHT <= 70 AND GRADE = 1;


SELECT STUDNO, NAME, WEIGHT  FROM STUDENT
WHERE WEIGHT BETWEEN 50 and 70;


SELECT name, birthdate from STUDENT
WHERE Birthdate between '81/01/01' and '83/12/31';


SELECT NAME, STUDNO, GRADE, DEPTNO FROM STUDENT 
WHERE DEPTNO IN (102,201) ORDER BY NAME;


SELECT NAME, STUDNO, GRADE, DEPTNO FROM STUDENT 
WHERE DEPTNO = 102 OR DEPTNO = 201 ORDER BY NAME; 


SELECT name FROM STUDENT
WHERE name LIKE '김%';


SELECT name FROM STUDENT
WHERE name LIKE '김%영';

SELECT name FROM STUDENT
WHERE name LIKE '김_영';


SELECT empno, ename, sal, comm, sal + comm
-- null 이 있는 곳은 sal+comm 이 다 null로 리턴됨 
FROM emp;

-- null 이 있는 곳은 sal+comm 이 다 null로 리턴됨 
-- null은 연산에서 제외됨 
SELECT AVG(comm), SUM(sal)
FROM emp;

-- NVL, NVL2 예시

SELECT NVL(null, 'B') FROM dual;
-- dual은 가상의 임시 테이블

-- null 이면 comm 을 500으로 값 강제할당된 컬럼이 생김 
SELECT empno, ename, sal, comm, NVL(comm, 500)
FROM emp;

-- 교수 테이블에서 이름, 직급, 보직수당 출력 
SELECT NAME, POSITION, COMM FROM PROFESSOR
WHERE COMM IS NOT NULL;

-- 교수 테이블에서 보직수당 없는 교수 출력
SELECT NAME, POSITION, COMM FROM PROFESSOR
WHERE COMM IS NULL;

SELECT NAME, POSITION, COMM, SAL+COMM AS SAL_COM FROM PROFESSOR;

-- 102번 학과 학생 중 1학년 or 4학년 선택
SELECT name, grade, deptno FROM STUDENT
WHERE deptno = 102 AND grade IN(1,4);


-- UNION 기능을 사용하기 위한 테이블 생성
CREATE TABLE stud_heavy
AS SELECT * FROM student
WHERE weight >= 70 AND grade = 1;

-- 유니언 대상이 되는 테이블 생성 2
CREATE TABLE stud_101
AS SELECT * FROM student
WHERE DEPTNO = 101 AND grade = 1;


-- 집합연산 실행
SELECT studno, name 
FROM stud_heavy
MINUS
SELECT studno, name 
-- studno, name, grade 이렇게 세개 적으면 컬럼수 안맞다고 에러뜸 
FROM stud_101;


