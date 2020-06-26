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
SELECT name, sal, comm, MOD(sal,comm)
FROM professor;

-- CEIL, FLOOR 예제
SELECT CEIL(19.7), FLOOR(12.567) FROM dual;


-- 날짜 더하기 예제(30일 뒤, 60일 뒤) 
SELECT name, hiredate, hiredate + 30, hiredate + 60
FROM professor;

-- SYSDATE 예제
SELECT sysdate from dual;

-- 10년 미만 근속자 정보 확인 
SELECT profno, hiredate, name,
TRUNC(MONTHS_BETWEEN (sysdate, hiredate)) AS tenure ,
ADD_MONTHS(hiredate, 6) AS review
FROM Professor
WHERE MONTHS_BETWEEN (sysdate, hiredate) < 120;


-- LASTDAY 예제
SELECT sysdate, LAST_DAY(sysdate), NEXT_DAY(sysdate, '금') from dual;
--lastday는 해당 월의 마지막 날 계산, next_day는 돌아오는 다음 일요일 날짜 리턴


-- 날짜 ROUND, TRUNC 예제
SELECT TO_CHAR(sysdate, 'YY/MM/DD HH24:MI:SS') AS normal,
       TO_CHAR(TRUNC(sysdate), 'YY/MM/DD HH24:MI:SS') AS trunc, 
       -- 버림해서 26일 0시 0분 반환
       TO_CHAR(ROUND(sysdate), 'YY/MM/DD HH24:MI:SS') AS round
       -- 반올림해서(12시 지났으므로) 27일 0시 0분 반환 
FROM dual;


-- 날짜 출력형식 변환
SELECT TO_CHAR(hiredate, 'YY/MM/DD') AS normal,
       TO_CHAR(ROUND(hiredate, 'dd'), 'YY/MM/DD') AS round_dd, 
       -- dd(날짜기준으로 round 처리) 시간단위로 일 반올림
       TO_CHAR(ROUND(hiredate, 'mm'), 'YY/MM/DD') AS round_mm,
       -- mm 월기준 round 처리 일단위로 월 반올림
       TO_CHAR(ROUND(hiredate, 'yy'), 'YY/MM/DD') AS round_yy
       -- yy 연기준 round 처리 월단위로 연 반올림 
FROM professor;

-- 날짜 출력형식 변환 예제
SELECT name, studno, TO_CHAR(birthdate, 'YYMM') from student;


SELECT name, studno, 
CONCAT(CONCAT(TO_CHAR(birthdate, 'YY'),'년'),(CONCAT(TO_CHAR(birthdate, 'MM'),'월')))
from student;
-- 내가 했지만 이건 너무 강제적인 방법이라 다른 방식을 찾아봄
 
SELECT name, studno, TO_CHAR(birthdate,'YYYY"년"MM"월"DD"일"') birDay
from student;
-- 서식을 "" double quotation 처리해 주면 됨 

-- 시간표현의 다른 방식
SELECT name, TO_CHAR(hiredate, 'MONTH DD, YYYY HH24:MI:SS PM') AS 입사일
FROM professor;
-- 1월 24, 1982 13:00:00 오후 이렇게 출력됨 

-- 연봉 계산 (n,nnn 이렇게 구분자 넣는 숫자형식) 
SELECT name, sal, comm, TO_CHAR((sal+comm)*12, '99,999')
FROM professor;



--
SELECT TO_NUMBER('1') 숫자 FROM dual;
-- SELECT TO_NUMBER('*') 특수문자 FROM dual; 에러 발생
-- 숫자변환은 숫자형 문자열이어야 변환 가능 


-- 월급 계산 (null 일 경우 NVL을 이용하여 대체값 부여)
SELECT name, position, sal, comm, sal+comm, sal+NVL(comm, 0), NVL(sal+comm, sal) s2
from professor;

-- NVL2 예제 NVL2(exp 1, exp2, exp3) null 아니면 exp2출력, 맞으면 exp3출력
SELECT name, position, sal, comm, NVL2(comm, sal+comm, sal) AS 월급여
FROM professor;


-- NULLIF 예제
SELECT NVL(NULLIF('A','A'), '널값') FROM dual; -- '널값' 반환 
SELECT NVL(NULLIF('A','B'), '널값') FROM dual; -- 그냥 A 반환

-- COALESCE 함수
SELECT name, comm, sal, COALESCE(comm, sal, 0) from professor;


-- DECODE 함수 예제
SELECT name, deptno, 
      DECODE (deptno, 
               101, '컴퓨터공학과'
              ,102, '멀티미디어학과'
              ,201, '이콩이미용학과'
              ,     '해당되는게없는학과') AS 콩이대학과
FROM professor;

-- CASE 함수 예제
SELECT name, deptno, sal,
      CASE WHEN DEPTNO = 101 THEN sal*0.1
           WHEN DEPTNO = 102 THEN sal*0.2
           WHEN DEPTNO = 201 THEN sal*0.3
           ELSE 0
      END 상여금 -- 이 컬럼명으로 계산값이 들어감
FROM professor;


-- EXERCISE --
--1.
SELECT UPPER(ename), LOWER(ename), INITCAP(ename)
FROM emp;

--2.
SELECT ename, job, SUBSTR(job, 2,4)
FROM emp;

-- 3.
SELECT ename, LPAD(ename,10,'#') FROM emp;

--4.  주의사항: 문자열 값 비교할땐 대소문자 주의 
SELECT ename, job,
DECODE(job, 'MANAGER', '관리자')
FROM emp;

--5.
SELECT ename, ROUND(sal/7), ROUND(sal/7, 1), ROUND(sal/7, -1)
from emp;

--7.
SELECT ename, ROUND(sal/7), TRUNC(sal/7), CEIL(sal/7), FLOOR(sal/7)
FROM emp;

--8.
SELECT ename, sal, MOD(sal, 7)
FROM emp;

--9.
SELECT ename, sal, hiredate, 
TRUNC(MONTHS_BETWEEN(sysdate, hiredate)) AS 개월차,
TRUNC(MONTHS_BETWEEN(sysdate, hiredate)/12,0) AS 년,
TRUNC(MOD(MONTHS_BETWEEN(sysdate, hiredate)/12,1)*12,0) AS 월,
ROUND(MOD(MOD(MONTHS_BETWEEN(sysdate, hiredate)/12,1)*12,1)*(365/12),0) AS 일
FROM emp;

--10.
SELECT empno, ename, job, sal,
    CASE WHEN job = 'CLERK'    THEN sal*1.1
         WHEN job = 'ANALYST'  THEN sal*1.2
         WHEN job = 'MANAGER'  THEN sal*1.3
         WHEN job = 'SALESMAN' THEN sal*1.5
         ELSE sal*1.6
         END 인상급여
FROM emp;

--10. DECODE문
SELECT empno, ename, job, sal,
      DECODE (job,
          'CLERK',      sal*1.1
        , 'ANALYST',    sal*1.2
        , 'MANAGER',    sal*1.3
        , 'SALESMAN',   sal*1.5
        , sal*1.6) AS 인상급여
FROM emp;


-- 11. join
COUNT(ename)



      