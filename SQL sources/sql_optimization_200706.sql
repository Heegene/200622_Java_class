-- �ܼ� JOIN��
SELECT e.empno, e.ename, d.deptno, d.dname
FROM emp e, dept d
WHERE e.deptno = d.deptno;

ALTER SYSTEM SET OPTIMIZER_GOAL=RULE;

-- ���ǻ󿡼� ����
ALTER SESSION SET OPTIMIZER_MODE=RULE;
ALTER SESSION SET OPTIMIZER_MODE=CHOOSE;
ALTER SESSION SET OPTIMIZER_MODE=ROWS;
ALTER SESSION SET OPTIMIZER_MODE=ALL_ROWS;

-- Hint ���� �ִ� ��
-- RBO�� optimizer mode �ɾ�� ���¿���
-- CBO�� first rows ��Ʈ�� 
SELECT /*+first_rows */e.empno, e.ename, d.deptno, d.dname
FROM emp e, dept d
WHERE e.deptno = d.deptno;

-- Optimizer ��� ������ Ȯ�� Ŀ�ǵ� 
SELECT NAME, VALUE, ISDEFAULT, ISMODIFIED, DESCRIPTION
FROM V$SYSTEM_PARAMETER
WHERE NAME LIKE '%optimizer_mode%';

-- ��ü �ý��� ���ð� 
SELECT *
FROM V$SYSTEM_PARAMETER;

SELECT empno, ename FROM emp;