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
WHERE position = (
                  SELECT position
                  FROM professor
                  WHERE name = '전은지'
                  );

-- 사용자 아이디가 'jun123'인 학생과 같은 학년인
-- 학생의 학번, 이름, 학년 출력 
SELECT studno, name, grade
FROM student
WHERE grade = (
                SELECT grade
                FROM student
                WHERE userid = 'jun123'
                );
                
                
-- 101번 학과 학생들의 평균 몸무게보다
-- 몸무게가 적은 학생의 이름, 학과번호, 몸무게 출력 
SELECT name, deptno, weight
FROM student
WHERE weight < (
                SELECT AVG(weight)
                FROM student
                WHERE deptno = 101
                );
                
                
SELECT name, grade, height
FROM student
WHERE grade = (
               SELECT grade
               FROM student
               WHERE studno = 20101
               )
AND
height > (
          SELECT height
          FROM student
          WHERE studno = 20101
          )
          ;
                  
          
-- 다중행 서브쿼리
-- IN 예제
SELECT name, grade, deptno
FROM student
WHERE deptno IN (
                 SELECT deptno
                 FROM department
                 WHERE college = 100
                 );
                 -- 단과대학 100의 department 소속 학생들의 이름, 학년, 학과 


-- ANY 연산자 예제
SELECT studno, name, height
FROM student
WHERE height > ANY (
                    SELECT height
                    FROM student
                    WHERE grade = 4
                    );
                    -- 4학년 학생 중 아무나 한 명보다 키가 크면 해당 
                    
-- ALL 예제             
SELECT studno, name, height
FROM student
WHERE height > ALL (
                    SELECT height
                    FROM student
                    WHERE grade = 4
                    );
                    -- 4학년 학생들 모두의 키보다 키가 커야 함
                    -- 최대값이 177이므로 최대값보다 큰 경우 true 

-- EXISTS 예제
SELECT profno, name, sal, comm
FROM   professor
WHERE  EXISTS ( -- 하나라도 존재 하면 메인에서 select
               SELECT position
               FROM professor
               WHERE comm IS NOT NULL
               -- comm을 받는 사람이 있기 때문에 전체가 다 뿌려짐 
               -- 전체를 실행 시키느냐 마느냐 하는 문제
               );


-- NOT EXISTS 예제
SELECT profno, name, sal, comm
FROM   professor
WHERE  NOT EXISTS ( 
               SELECT position
               FROM professor
               WHERE comm IS NOT NULL
               -- 모든게 null이 아닌 이상 돌아가지 않음
               -- 빠른 판단을 위해 사용하므로
               -- 성능개선에 좋음 
               );
               
-- 한 명이라도 보직수당을 받으면 전체 교수의 번호,이름,수당,급여+보직수당         
SELECT profno, name, comm, sal+NVL(comm,0) AS 합계
FROM professor
WHERE EXISTS (
              SELECT comm
              FROM professor
              WHERE comm IS NOT NULL
              );


SELECT 1
FROM student
WHERE NOT EXISTS (
                  SELECT userid
                  FROM student
                  WHERE userid = 'goodstudent'
                  );
                  
SELECT 1 userid_exist 
FROM dual
WHERE NOT EXISTS ( 
                  SELECT userid
                  FROM student
                  WHERE userid = 'goodstudent'
                  );
                  
                  
-- 다중컬럼 서브쿼리(PAIRWISE)
SELECT name, grade, weight 
FROM student
WHERE (grade, weight) IN (-- 학년별 최소몸무게를 구함 
                          SELECT grade, MIN(weight)
                          FROM student
                          GROUP BY grade
                          -- grade로 묶은다음 MIN 과 비교
                          );
-- 학년별 최소 몸무게를 가진 학생의 이름, 학년, 몸무게 반환됨


-- 다중컬럼 서브쿼리(UNPAIRWISE)
SELECT name, grade, weight 
FROM student
WHERE grade IN ( SELECT grade
                 FROM student
                 GROUP BY grade
                 ) -- 1,2,3,4 학년 중 하나이면서 
AND
      weight IN ( SELECT MIN(weight)
                  FROM student
                  GROUP BY grade
                  ); -- 최소 몸무게에 해당하면 (MIN weight에 있던 값)
                  -- 해당됨
                  -- 1,2,3,4중에 하나이고 몸무게는 42,52,70,72 중 하나이면
                  -- 해당됨 


-- 상호 연관 서브쿼리
-- 각 학과 학생의 평균키보다 큰 학생의 이름, 학과번호, 키 출력
SELECT name, deptno, height
FROM   student s1
WHERE  height > ( SELECT AVG(height) -- 이부분만 따로 실행시키면 실행X
                  FROM student s2
                  WHERE s2.deptno = s1.deptno )
ORDER BY deptno
;
-- 1. 메인쿼리에서 학생 테이블의 정보를 서브쿼리로 전달(deptno 빼서 서브쿼리 전달)
-- 2. 메인쿼리에서 전달받은 학과번호로 평균키를 계산함(서브쿼리 수행)
-- 3. 메인쿼리에서 해당학과 평균키보다 큰 학생의 이름, 학과번호, 키 반환


-- 학과별 최소키 보다 큰 학생의 이름, 학과번호ㅡ 학번,
-- 키를 출력하는 JDBC 프로그램을 작성하시오.


SELECT name, deptno, studno, height
FROM student s1 -- 학생 테이블에서 
WHERE height > ( SELECT MIN(height) -- 학생 테이블의 최소값 호출
                 FROM student s2
                 WHERE s1.deptno = s2.deptno -- deptno 로 sync
                 )
                 ;
                 
                 
                 
SELECT ename, hiredate
FROM EMP
WHERE deptno = ( SELECT deptno
                 FROM emp
                 WHERE INITCAP(ename) = 'Blake'
                 )
                 ;
                 
SELECT empno, ename
FROM EMP
WHERE sal > ( SELECT AVG(sal)
              FROM emp
              )
ORDER BY sal DESC;
                 
                 
-- 부서번호와 급여가 보너스를 받는 어떤 사원의 부서 번호와 급여에 일치하는
-- 사원의 이름, 부서번호, 그리고 급여를 디스플레이

SELECT ename, deptno, sal
FROM emp
WHERE comm = ANY (SELECT comm
                 FROM emp
                 WHERE comm IS NOT NULL
                 );


SELECT ename, deptno, sal
FROM emp
WHERE (deptno, sal) IN
                (SELECT deptno, sal
                 FROM emp
                 WHERE comm IS NOT NULL
                 );

-- 1. 회사전체 급여합계, 급여평균, 인원수[emp Table]

SELECT SUM(sal), ROUND(AVG(sal)), COUNT(*)
FROM emp;

-- 2. 부서코드별  급여합계, 급여평균[emp Table]
SELECT deptno, SUM(sal), ROUND(AVG(sal))
FROM emp
GROUP BY deptno;

-- 3. job별 최대급여, 최소급여, 인원수[emp Table]
SELECT job, MAX(sal), MIN(sal), COUNT(*)
FROM emp
GROUP BY job;


-- 4. comm이 null이 아닌 사람의 부서코드별 급여합계,최대급여,인원수[emp Table]
SELECT deptno, SUM(sal), MAX(sal), COUNT(*)
FROM emp
WHERE comm IS NOT NULL
GROUP BY deptno;


-- 5. 부서명별 급여합계, 최소급여, 인원수[emp Table]
SELECT deptno, SUM(sal), MIN(sal), COUNT(*)
FROM emp
GROUP BY deptno;


-- 6. 부서코드,근무지별 급여합계,최대급여, 인원수[emp Table  / dept Table]
SELECT e.deptno, d.LOC, SUM(e.sal), MAX(e.sal), COUNT(*)
FROM emp e, dept d
WHERE e.deptno = d.deptno
GROUP BY e.deptno, d.LOC
ORDER BY e.deptno;



-- 7. 부서명,업무별  급여합계,최대급여,인원수[emp Table  / dept Table]
SELECT d.dname, e.job, SUM(e.sal), MAX(e.sal), COUNT(*) 
FROM emp e, dept d
WHERE e.deptno = d.deptno
GROUP BY d.dname, e.job;




-- 8. 가장 먼저 입사한 사람의 이름, 급여. 입사일 [emp Table]
SELECT ename, sal, hiredate
FROM emp
WHERE hiredate = ( SELECT MIN(hiredate)
                   FROM emp
                   );
                  

-- 9. 회사에서 가장 급여가 적은 사람의 이름, 급여 [emp Table]
SELECT ename, sal
FROM emp
WHERE sal = (SELECT MIN(sal)
             FROM emp
             );

 
-- 11. 회사평균 이하의 급여를 받는 사람의 이름, 급여, 부서명  [emp Table  / dept Table]
SELECT e.ename, e.sal, d.dname
FROM emp e, dept d
WHERE e.deptno = d.deptno
AND sal < (SELECT AVG(sal)
             FROM emp
             );


-- 12. MARTIN보다 먼저 입사한 사람의 이름, 급여, 입사일, 급여 등급  
-- [emp Table  / salgrade Table]
-- 급여등급 다 초과해서 그냥 comm 기준으로 급여등급 잡았음 

SELECT e.ename, e.sal, e.hiredate, s.grade
FROM emp e, salgrade s
WHERE e.comm BETWEEN s.losal and s.hisal
AND
hiredate < (SELECT hiredate
            from emp
            WHERE INITCAP(ename) = 'Martin');




-- 13. 평균 급여 이상을 받는 모든 사원에 대해서 사원 번호와 이름을
-- 디스플레이하는 질의문을 생성하라. 단 출력은 급여 내림차순 정렬하라

SELECT empno, ename
FROM emp
WHERE sal >=  ( SELECT AVG(sal)
              FROM emp
              )
ORDER BY sal DESC;



