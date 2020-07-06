-- 단순 JOIN문
SELECT e.empno, e.ename, d.deptno, d.dname
FROM emp e, dept d
WHERE e.deptno = d.deptno;

ALTER SYSTEM SET OPTIMIZER_GOAL=RULE;

-- 세션상에서 변경
ALTER SESSION SET OPTIMIZER_MODE=RULE;
ALTER SESSION SET OPTIMIZER_MODE=CHOOSE;
ALTER SESSION SET OPTIMIZER_MODE=ROWS;
ALTER SESSION SET OPTIMIZER_MODE=ALL_ROWS;

-- Hint 문을 주는 법
-- RBO로 optimizer mode 걸어둔 상태에서
-- CBO로 first rows 힌트줌 
SELECT /*+first_rows */e.empno, e.ename, d.deptno, d.dname
FROM emp e, dept d
WHERE e.deptno = d.deptno;

-- Optimizer 모드 설정값 확인 커맨드 
SELECT NAME, VALUE, ISDEFAULT, ISMODIFIED, DESCRIPTION
FROM V$SYSTEM_PARAMETER
WHERE NAME LIKE '%optimizer_mode%';

-- 전체 시스템 세팅값 
SELECT *
FROM V$SYSTEM_PARAMETER;

SELECT empno, ename FROM emp;