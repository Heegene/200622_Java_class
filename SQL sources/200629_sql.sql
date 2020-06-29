SELECT COUNT(comm)
FROM professor
WHERE deptno = 101;
-- null 제외하고 2개 반환됨


SELECT COUNT(*)
FROM professor
WHERE deptno = 101 ;
-- 4개 반환됨 (*를 기재할 경우 null 포함한 조건 만족하는 행의 개수 전체)


SELECT COUNT(*)
FROM professor
WHERE deptno = 101 AND comm IS NOT NULL ;
-- 2개 반환됨(null 값 제외) 

-- 101학과 학생들의 체중 평균과 합계
SELECT AVG(weight), SUM(weight)
FROM STUDENT
WHERE deptno = 101;

-- 102학과 학생들의 최대키와 최소키 
SELECT MAX(height), MIN(height)
FROM student
WHERE deptno = 102;

-- 교수 테이블 급여 표준편차 / 분산
SELECT STDDEV(sal), VARIANCE(sal)
FROM professor;

-- GROUP BY 틀린 예시
SELECT deptno, position, AVG(sal)
FROM professor
GROUP BY deptno;
-- 이렇게하면 에러발생 group by에는 deptno만 넣어놨으므로 안됨

-- GROUP BY 맞는 예시
SELECT deptno, position, AVG(sal)
FROM professor
GROUP BY deptno, position;
-- deptno, position 위에 썼으면 밑에도 deptno, position 써줘야 함 

-- 교수 테이블에서 학과별로 교수 수와 보직수당 받는 교수수 출력
SELECT deptno, COUNT(*) 교수수, COUNT(comm) 보직수당교수
FROM professor
GROUP BY deptno;

-- 전체학생 소속 학과별로 나누고 같은 학과 학생은 학년별 그룹핑
-- 학과와 학년별 인원수, 평균 몸무게
-- 단 평균 몸무게는 소수점 이하 첫번째 자리에서 반올림

SELECT deptno, grade, COUNT(*) 전체학생수, ROUND(AVG(weight),1) 몸무게평균
FROM student
GROUP BY deptno, grade
ORDER BY deptno, grade;

-- ROLLUP 예제
-- 소속 학과별로 교수 급여 합계와
-- 모든 학과 교수들의 급여 합계 출력
SELECT deptno, SUM(sal)
FROM professor
GROUP BY ROLLUP(deptno);

-- 소속 학과별, 직급별 교수 수, 학과별 교수수
-- 모든 교수수 합계 출력
SELECT deptno, position, COUNT(*)
FROM professor
GROUP BY ROLLUP(deptno, position)
ORDER BY deptno;


-- CUBE 예제
-- 직급별 교수 수, 학과별 교수 수, 전체 교수 수
SELECT deptno, position, count(*)
FROM professor
GROUP BY CUBE(deptno, position);
-- 전체합계가 먼저 나오고 그다음 position 별 합계 쭉 나오고
-- 그 다음에 학과별 합계가 밑에 나옴 

-- 학년별 키, 몸무게 
SELECT grade, Count(*), ROUND(AVG(height)) 평균키, ROUND(AVG(weight)) 평균체중
FROM student
GROUP BY grade
ORDER BY AVG(weight) DESC;


-- 학년별 키, 몸무게 
SELECT grade, Count(*), ROUND(AVG(height)) 평균키, ROUND(AVG(weight)) 평균체중
FROM student
GROUP BY grade
HAVING COUNT(*)>=4
ORDER BY AVG(weight) DESC;


-- GROUP by error (에러 발생하는 예제) 
SELECT grade, Count(*), ROUND(AVG(height)) 평균키, ROUND(AVG(weight)) 평균체중
FROM student
WHERE COUNT(*)>=4
GROUP BY grade
ORDER BY AVG(weight) DESC;
--  "group function is not allowed here" 라는 에러메시지 출력 

-- JOIN 예제
-- 학번이 10101인 학생의 이름과 소속 학과 이름 출력
SELECT studno, name, deptno
FROM student
WHERE studno = 10101;
-- 여기서 101번 학과라는 걸 알 수 있었음 

-- 2. 소속학과 이름 출력
SELECT dname
FROM department
WHERE deptno = 101;
-- 이렇게 해야 학과명을 알 수 있었음(2번에 걸쳐서)

-- 한번에 보기 위해 JOIN 사용
SELECT studno, name, student.deptno 학생이름, department.dname 소속학과이름
-- 학생 테이블에서 deptno 가져오고, department에서 dname 가져옴
FROM student, department -- 2개의 테이블이므로 테이블 2개 적어줌
WHERE student.deptno = department.deptno;
-- 두 테이블을 deptno로 연결 

-- 테이블명이 너무 길다면 alias 명 사용 
SELECT studno, name, s.deptno 학생이름, d.dname 소속학과이름
-- 학생 테이블에서 deptno 가져오고, department에서 dname 가져옴
FROM student s, department d -- allias명 사용
WHERE s.deptno = d.deptno; -- alias 명 사용한 경우 일반 이름 사용 못하고
-- alias명을 사용해야 호출 가능 



-- 테이블명이 너무 길다면 alias 명 사용 
SELECT s.studno, s.name, s.deptno 학생이름, d.dname 소속학과이름
-- 학생 테이블에서 deptno 가져오고, department에서 dname 가져옴
FROM student s, department d -- allias명 사용
WHERE s.deptno = d.deptno; -- alias 명 사용한 경우 일반 이름 사용 못하고
-- alias명을 사용해야 호출 가능


-- Cartesian product (카티션곱) 예제
SELECT s.studno, s.name, s.deptno, d.deptno, d.dname
FROM student s, department d; 
-- 학생테이블 건수*부서테이블 건수만큼 튜플 나옴 


-- Natural join
SELECT s.studno, s.name, s.deptno, d.deptno, d.dname
FROM student s
      NATURAL JOIN department d;
      -- 이렇게 하면 에러발생 Natural JOIN은  테이블 별명 사용 불가
      
      -- Natural join
SELECT studno, name, deptno, deptno, dname
FROM student 
      NATURAL JOIN department ;
      -- 이렇게 하면 돌아가는데 보는사람들이 알아보기 힘듦
  
-- JOIN ~USING 절  
SELECT studno, name, deptno, dname
FROM student s JOIN department d
USING(deptno);

-- NON-EQUI JOIN
SELECT p.profno, p.name, p.sal, s.grade
FROM professor p, salgrade s
WHERE p.sal BETWEEN s.losal AND s.HISAL;

-- OUTER JOIN 예제
SELECT s.name, s.grade, p.name, p.position
FROM student s, professor p
WHERE s.profno = p.profno(+); -- left outer join 왼쪽으로 던져줌
-- +로 outer join 하면 null 인것도 나타남 

-- EQUI JOIN 예제
SELECT s.name, s.grade, p.name, p.position
FROM student s, professor p
WHERE s.profno = p.profno; -- left outer join 왼쪽으로 던져줌
-- EQUI JOIN으로 하면 profno가 null인게 나타나지 않음

SELECT s.grade, s.name, p.name, p.position
FROM student s, professor p
WHERE s.profno = p.profno(+);


-- 

SELECT s.studno, s.name, s.profno, p.name
FROM student s
    LEFT OUTER JOIN professor p
    ON s.profno = p.profno;


-- FULL OUTER JOIN
-- 지도교수가 없는 학생과 지도학생이 배정되지 않은 교수를 함께 출력
SELECT studno, s.name, s.profno, p.name
FROM student s
      FULL OUTER JOIN professor p
      ON s.profno = p.profno;
-- full outer join은 상호간에 null 이면 넣어줌 

-- 한 테이블에서 조인 발생하는 SELF JOIN
SELECT c.deptno, c.dname, c.college, d.dname AS college_name
FROM department c, department d -- 서로 같은 테이블 
WHERE c.college = d.deptno; 
-- c의 college가 d의 deptno로 연결 
-- 조직도 같은 것 만들 때 사용 

-- '||'는 문자열 연결시켜주는 연산자

SELECT dept.dname || '의 소속은' || org.dname
FROM department dept
      JOIN department org
      ON dept.college = org.deptno;
      

-- Subquery 예제
-- 전은지 교수와 동일한 직급을 가진 모든 교수 출력 
SELECT name, position
FROM professor
WHERE position = (SELECT position FROM professor WHERE name = '전은지');


-- 1. 전은지 교수 직급 검색
SELECT position
FROM professor
WHERE name = '전은지';

-- 2. 전임강사인 교수 검색
SELECT name
FROM professor
WHERE position = '전임강사';

-- 3. 서브쿼리
SELECT name, position
FROM professor
WHERE position = (SELECT position FROM professor WHERE name = '전은지');


