-- 1. emp테이블에 다음 데이터 입력 
-- -> 1113,'양만춘','영업',7369,오늘날자,2000,100,10

INSERT INTO emp
VALUES (1113, '양만춘', '영업', 7369, SYSDATE, 2000, 100, 10);
commit;

-- 2. emp테이블에서  양만춘를 강감찬로 변경
UPDATE emp
SET ENAME = '강감찬'
WHERE ENAME = '양만춘';
commit;

-- 3. . emp테이블에서 1113 사번을 업무가 SMITH와 같게, 급여를 사번 7521과 같게 하세요

UPDATE emp
SET job = (SELECT job
           FROM emp
           WHERE INITCAP(ename) = 'Smith')
           ,
    sal = (SELECT sal
           FROM emp
           WHERE empno = 7521)
WHERE empno = 1113;


--4. emp10 Table 생성(emp TBL에서 사번,이름 , 업무를 10번 부서 Data만 가지고 emp10  Table 생성

CREATE TABLE emp10
AS SELECT empno, ename, job
   FROM emp
   WHERE deptno = 10;


--5. 사번이 1로 시작하는 emp10  Table  데이터를 삭제 하시오    

DELETE
FROM emp10
WHERE EMPNO LIKE '1%'; -- 강감찬 삭제됨 


--6. emp10에 emp tbl의 20번 부서 데이터 추가
INSERT ALL
INTO emp10 VALUES (empno, ename, job) 
SELECT empno, ename, job
FROM emp
WHERE deptno = 20;

--6. emp10에 emp tbl의 20번 부서 데이터 추가 (2번째 방식)
INSERT 
INTO emp10 
SELECT empno, ename, job
FROM emp
WHERE deptno = 20;




--7. emp테이블과 Dept테이블 이용 , 아래 항목을 생성하는 Emp_Dept   TABLE작성
-- ( EmpNo, e.Ename, e.Job,  d.dname, d.loc)
CREATE TABLE emp_dept
AS SELECT e.empno, e.ename, e.job, d.dname, d.loc
FROM emp e, dept d
WHERE e.deptno = d.deptno;



 


