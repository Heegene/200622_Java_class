INSERT INTO student
VALUES (10110, '홍길동', 'hong', '1', '8501011143098','85/01/01',
        '010-2222-3333',170,70,101,9903);
        
commit;


-- 묵시적 null 입력
INSERT INTO department (deptno, dname) 
-- column명 기재 안하면 전체 values 값을 다 넣어주어야함
VALUES (300, '생명공학과');
-- 이렇게하면 나머지 값들에는 자동적으로 null 이 입력됨
commit;

-- 명시적 null 입력
INSERT INTO department
       VALUES(302,'환경공학과','',null);
       -- '' 이렇게 넣거나 null 넣거나 둘 중 하나로 넣어주면 됨 
       commit;


-- 날짜 입력
INSERT INTO professor (profno, name, position, hiredate, deptno)
-- 옛날 날짜입력방식 
-- VALUES (9920, '최윤식', '조교수', TO_DATE('2006/01/01', 'YYYY/MM/DD'), 102)
VALUES (9920, '최윤식', '조교수', '2006/01/01', 102)
;
commit;

-- SYSDATE 예제
INSERT INTO professor
VALUES (9910, '백미선', 'white', '전임강사', 200, SYSDATE, 10, 101);
-- sysdate는 오늘날짜가 반영됨 
commit;


-- student를 t_student로 복사
CREATE TABLE t_student
AS SELECT * FROM student
   WHERE 1 = 0; -- t_student로 집어넣되 데이터 구조만 복사하고 값 복사 X
   
CREATE TABLE t_student2
AS SELECT * FROM student;
-- 값까지 모두 복사 


-- INSERT ALL 예제
CREATE TABLE heightinfo (
       studno number(5),
       name varchar2(10),
       height number(5,2)
       );
-- 테이블 2개 생성
CREATE TABLE weightinfo (
       studno number(5),
       name varchar2(10),
       weight number(5,2)
       );       

-- 학생 테이블에는 2학년 이상의 학생을 검색하여
-- height info 테이블에는 학번, 이름, 키
-- weight_info 테이블에는 학번, 이름, 몸무게 각각 입력

INSERT ALL 
INTO heightinfo VALUES (studno, name, height)
INTO weightinfo VALUES (studno, name, weight)
SELECT studno, name, height, weight
FROM student
WHERE grade >= 2;
commit;


DELETE heightinfo;
DELETE weightinfo;
commit;

-- 2학년 이상인 학생들 중에서
-- 170이 넘는 학생들의 키와
-- 체중이 70을 넘는 학생들의 신장, 체중정보 입력 
INSERT ALL
WHEN height > 170 THEN
      INTO heightinfo VALUES(studno, name, height)
WHEN weight > 70 THEN
      INTO weightinfo VALUES (studno, name, weight)
SELECT studno, name, height, weight
FROM student
WHERE grade >= 2;

commit;


DELETE heightinfo;
DELETE weightinfo;
commit;


-- 2학년이상 학생 검색해서 heightinfo에는 170이상인학생만 학번,이름,키
-- weightinfo에는 70보다 몸무게 큰 학생의 학번, 이름 몸무게
-- 단 키가 170보다 작고 몸무게보다 70보다 큰 학생은 weightinfo에만 입력

INSERT FIRST 
WHEN height > 170 THEN
    INTO heightinfo VALUES (studno, name, height)
    -- 이렇게 하면 170 넘는애들은 다 heightinfo 테이블로 들어가고
    
    -- 170이 아닌 학생들 중에서 70이 넘는 학생들이 들어가게 됨
WHEN weight > 70 THEN
    INTO weightinfo VALUES (studno, name, weight)
SELECT studno, name, height, weight
FROM student
WHERE grade >=2;
-- 키 170 넘는애들은 싹다 첫번째테이블에 넣고 끝나고
-- 두번째 WHEN에서는 170 안되는애들 대상으로만 돌아감


-- PIVOTING 기능 (행, 열 바꾸기)
-- 테이블 생성
CREATE TABLE sales (
    sales_no number(4),
    week_no number(2),
    sales_mon number(7,2),
    sales_tue number(7,2),
    sales_wed number(7,2),
    sales_thu number(7,2),
    sales_fri number(7,2)
    )
    
INSERT INTO sales VALUES (1101, 4, 100, 150, 80, 60, 120);
commit;

CREATE TABLE sales_data (
    sales_no number(4),
    week_no  number(2),
    day_no   number(2),
    sales    number(7,2)
    );
    commit;

-- PIVOTING 기능 사용
-- SALES 테이블의 요일별 데이터 통합하여 SALES_DATA 테이블에
-- 하나의 행으로 입력

INSERT ALL
-- 행과 열을 바꿔서 넣음
-- dayno가 1이면 sales_mon 집어넣음 
INTO sales_data VALUES (sales_no, week_no, '1', sales_mon)
INTO sales_data VALUES (sales_no, week_no, '2', sales_tue)
INTO sales_data VALUES (sales_no, week_no, '3', sales_wed)
INTO sales_data VALUES (sales_no, week_no, '4', sales_thu)
INTO sales_data VALUES (sales_no, week_no, '5', sales_fri)
SELECT sales_no, week_no, sales_mon, sales_tue, sales_wed, sales_thu,
sales_fri
FROM sales;

commit;


-- 교수번호가 9930인 사람을 직급을 부교수로 수정

UPDATE professor
SET position = '부교수'
WHERE profno = 9903;

-- 서브쿼리를 이용해 학번이 10201인 학생의 학년과 학과 번호를
-- 10103 학번 학생의 학년과 학과 번호와 동일하게 수정

UPDATE student
SET (grade, deptno) = (SELECT grade, deptno
                       FROM student
                       WHERE studno = 10103)
WHERE studno = 10201;
commit;


-- 20103 학생 삭제
DELETE FROM student -- 여기서 'from'은 생략 가능
WHERE studno = 20103;
rollback;

DELETE student
WHERE deptno = (SELECT deptno 
                FROM department
                WHERE dname = '컴퓨터공학과');
                
  
rollback;


CREATE TABLE professor_temp
AS           SELECT *
             FROM professor
             WHERE position = '교수';

UPDATE professor_temp
SET position = '명예교수'
WHERE position = '교수';