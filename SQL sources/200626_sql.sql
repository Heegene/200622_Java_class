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
INTERSECT
SELECT studno, name 
-- studno, name, grade 이렇게 세개 적으면 컬럼수 안맞다고 에러뜸 
FROM stud_101;

-- ORDER BY 'NAME'
SELECT name, grade, tel
FROM student
ORDER BY name; -- 이름 가나다순으로 출력됨

-- 이름, 학년, 전화번호 출력(학년 내림차순) 
SELECT name, grade, tel
FROM student
ORDER BY grade DESC;


-- deptno는 오름차순(디폴트), sal은 내림차순으로 다중컬럼 소팅 
SELECT ename, sal, deptno
FROM emp
ORDER BY deptno, sal DESC;


-- 부서 10, 30인 모든 사원의 이름과 부서번호
SELECT ename, deptno
FROM emp
WHERE deptno IN (10,30)
ORDER BY ename;


-- 82년도에 입사한 직원의 이름과 입사일자 
SELECT ename, hiredate
from emp
WHERE hiredate LIKE '82%';
-- 옛날버전이라 안되면
-- WHERE to_char(hiredate, 'yymmdd') LIKE '82%'; 

-- 날짜형식으로도 가능
SELECT ename, hiredate
FROM emp
WHERE hiredate BETWEEN '82/01/01' and '82/12/31';


-- 보너스를 받는 사람들 대상 급여, 보너스 내림차순 
SELECT ename, sal, comm
FROM emp
WHERE comm IS NOT NULL
ORDER BY sal DESC, comm DESC;


-- 보너스가 급여의 20% 이상이고 부서번호가 30인 경우
SELECT ename, sal, comm
FROM emp
WHERE comm >= (sal*0.2) and deptno = 30;


-- INITCAP 함수 예제
SELECT name, userid, INITCAP(userid)
FROM STUDENT
WHERE name = '김영균';

-- lower, upper 함수 예제
SELECT name, userid, LOWER(userid) AS 소문자, UPPER(userid) AS 대문자
FROM student;


-- LENGTH, LENGTHB 함수 예제
SELECT dname, LENGTH(dname), LENGTHB(dname)
FROM department;


-- CONCAT 함수 예제
-- 2개의 argument만 받을 수 있음 
SELECT CONCAT(CONCAT(name, '의 직책은 '), position) AS 직책설명
FROM professor;

-- SUBSTR 함수 예제
SELECT name, idnum, SUBSTR(idnum, 1, 6) birthDate,
                    SUBSTR(idnum, 3, 2) birthMonth,
                    SUBSTR(idnum, 7, 1) gender
FROM student
WHERE grade = 1;


-- INSTR 함수 예제
SELECT INSTR('CORPORATE FLOOR', 'OR') FROM dual;  -- 2 반환됨 (c'OR' 위치)
-- 테이블 없이 그냥 pseudo table 인 dual 사용

-- INSTR 함수 예제 2(위치 지정해서 범위 내 검색)
SELECT INSTR('CORPORATE FLOOR', 'OR', 3, 2) FROM dual; -- 14 반환됨 
-- 3번 인덱스부터 찾기 시작해서 두번째 'OR' 의 인덱스 반환 

-- Department 의 dname 필드에서 '과' 가 나오는 인덱스 찾기
-- 없을 경우 0 반환 
SELECT dname, INSTR(dname, '과') 
FROM DEPARTMENT;


-- LPAD, RPAD 예제
SELECT position, LPAD(position, 10, '야옹') AS LPAD_결과, userid, 
                 RPAD(userid, 12, '멍멍') AS RPAD_결과
FROM professor;

-- LTRIM, RTRIM 예제
SELECT dname, RTRIM(dname, '과') ,
              LTRIM(dname, '기')
-- 오른쪽에 '과'가 있으면 삭제해줌
-- 왼쪽에 '기'가 있으면 삭제해줌 
FROM department;

-- ROUND 예제
SELECT name, sal, 

sal/22 AS 그냥_계산,
ROUND(sal/22) AS 일의자리_남김, 
ROUND(sal/22,2) AS 소숫점_둘째자리,
ROUND(sal/22,-1) AS 일의자리_반올림,
ROUND(sal/22,-2) AS 십의자리_날려반올림

FROM professor
WHERE deptno = 101;


-- TRUNC 예제 
SELECT name, sal, 

sal/22 AS 그냥_계산,
TRUNC(sal/22) AS 일의자리_남겨버림, 
TRUNC(sal/22,2) AS 소숫점_둘째자리,
TRUNC(sal/22,-1) AS 일의자리_버림,
TRUNC(sal/22,-2) AS 십의자리_날려버림

FROM professor
WHERE deptno = 101;


-- MOD 예제



