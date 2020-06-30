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

-- MERGE 예제

-- 테이블 생성
CREATE TABLE professor_temp
AS           SELECT *
             FROM professor
             WHERE position = '교수';

-- 교수를 명예교수로 변경
UPDATE professor_temp
SET position = '명예교수'
WHERE position = '교수';

-- 테이블 생성 후 INSERT
INSERT INTO professor_temp
Values(9999, '김도경', 'arom21', '전임강사', 200, SYSDATE, 10, 101);

-- MERGE
MERGE INTO professor p
USING professor_temp f
ON(p.profno = f.profno) -- ON의 전제하에 MERGE
WHEN MATCHED THEN -- 매칭이 되면
UPDATE -- 업데이트
SET p.position = f.position
WHEN NOT MATCHED THEN -- PK가 매칭이 되지 않으면
INSERT -- 삽입하라
VALUES (f.profno, f.name, f.userid, f.position, f.sal, f.hiredate, f.comm, f.deptno);
commit;



-- Sequence 예제
CREATE SEQUENCE s_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 100;
-- 1부터 시작해서 1씩 증가해서 최대 100까지 갈 수 있는 sequence 


INSERT INTO dept (deptno, dname) VALUES (60, ''); -- 이렇게하면 '이대' 디폴트값 들어감 
commit;

DESC dept;

-- alter 사용을 위한 테이블 생성

CREATE TABLE address (
             id     number(3),
             name   varchar2(50),
             addr   varchar2(100),
             phone  varchar2(30),
             email  varchar2(100)
             );

-- 샘플 데이터 삽입
INSERT INTO address
VALUES (1, 'HGDong', 'SEOUL', '111-333', 'gdhong@naver.com');
       

-- 주소록 테이블에 날짜타입 가지는 birth 칼럼 추가
ALTER TABLE address
ADD birth DATE;
commit;

-- addr_second 테이블로 복사 
CREATE TABLE addr_second(id, name, addr, phone, e_mail, birth)
AS SELECT * FROM address;

-- id, name만 복사한 addr_fourth
CREATE TABLE addr_fourth(id, name)
AS SELECT id, name FROM address
WHERE 1 = 2; -- 1 0이라고하든 뭐든 같지않게 입력하면 구조만 복사됨


-- id, name만 복사한 addr_fourth
CREATE TABLE addr_third(id, name)
AS SELECT id, name FROM address;
-- 값 까지 복사

-- address 에 comment 컬럼 추가
ALTER TABLE address
ADD (comments VARCHAR2(200) DEFAULT 'No comments');

-- 만든 컬럼 삭제
ALTER TABLE address
      DROP COLUMN comments;

-- 만든 컬럼의 저장형식 변경하기(바이트수 줄잉기)
ALTER TABLE address
      MODIFY phone VARCHAR2(50);
-- 사이즈를 50바이트로 변경

-- 만약 기존에 있는 데이터 저장값보다도 적게 바이트수를 줄이면
ALTER TABLE address
      MODIFY phone VARCHAR(5);
      -- 에러 발생(cannot decrease ... value too big)
      
      
-- 테이블 이름 변경하기 rename 예제
RENAME addr_second TO client_address;


-- DROP TABLE: 기존 테이블과 데이터를 모두 삭제(구조, 데이터 모두)
DROP TABLE addr_third ;
commit;
-- DELETE와의 차이점: DELETE는 데이터만 날아감 

DELETE client_address; -- 데이터만 날아감 

-- 자르는 기능을 하는 TRUNCATE 
TRUNCATE TABLE client_address;
-- 자른다음 자른 데이터를 버림 Rollback 해도 되돌아오지 않음


-- COMMENT(주석/필드 설명) 넣기
COMMENT ON TABLE address
IS '고객 주소록을 관리';
-- 테이블 편집의 '설명' 탭에 가면 정보 나옴 

-- column에 대한 설명도 가능 
COMMENT ON COLUMN address.name
IS '고객 이름';


SELECT table_name FROM user_tables;
-- 로그인한 계정에서 생성된 테이블들의 이름 

SELECT owner, table_name FROM all_tables;
-- SYS, SYSTEM 등이 오너로 있음. 전체사용자 관련된 뷰

SELECT owner, table_name FROM DBA_tables;
-- DBA와 관련된 테이블 조회 가능 



-- 제약조건 부여
CREATE TABLE subject (
              subno   NUMBER(5)    CONSTRAINT pk_subjectno PRIMARY KEY,
              subname VARCHAR2(20) CONSTRAINT subjectname_nn NOT NULL, -- null값 입력불가
              term    VARCHAR2(1)  CONSTRAINT subject_term_check CHECK(term in ('1','2')) , -- 1,2만 입력가능
              type    VARCHAR(1)
              );


CREATE TABLE sugang
     (
      studno    NUMBER(5) CONSTRAINT FK_sugang_studno REFERENCES student(studno), 
      -- 부모키로 student의 studno를 삼겠다(그러면 student의 studno 없으면 입력불가)
      subno     NUMBER(5) CONSTRAINT FK_sugang_subno  REFERENCES subject(subno),
      regdate   DATE,
      result    NUMBER(3),
      -- primary 가 복합키인 경우 별도로 잡아줌 
      CONSTRAINT PK_sugang PRIMARY KEY(studno, subno)
      );
      commit;
          
         
          
