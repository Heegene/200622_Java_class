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


