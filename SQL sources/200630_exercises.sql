-- 1. emp���̺� ���� ������ �Է� 
-- -> 1113,'�縸��','����',7369,���ó���,2000,100,10

INSERT INTO emp
VALUES (1113, '�縸��', '����', 7369, SYSDATE, 2000, 100, 10);
commit;

-- 2. emp���̺���  �縸�Ḧ �������� ����
UPDATE emp
SET ENAME = '������'
WHERE ENAME = '�縸��';
commit;

-- 3. . emp���̺��� 1113 ����� ������ SMITH�� ����, �޿��� ��� 7521�� ���� �ϼ���

UPDATE emp
SET job = (SELECT job
           FROM emp
           WHERE INITCAP(ename) = 'Smith')
           ,
    sal = (SELECT sal
           FROM emp
           WHERE empno = 7521)
WHERE empno = 1113;


--4. emp10 Table ����(emp TBL���� ���,�̸� , ������ 10�� �μ� Data�� ������ emp10  Table ����

CREATE TABLE emp10
AS SELECT empno, ename, job
   FROM emp
   WHERE deptno = 10;


--5. ����� 1�� �����ϴ� emp10  Table  �����͸� ���� �Ͻÿ�    

DELETE
FROM emp10
WHERE EMPNO LIKE '1%'; -- ������ ������ 


--6. emp10�� emp tbl�� 20�� �μ� ������ �߰�
INSERT ALL
INTO emp10 VALUES (empno, ename, job) 
SELECT empno, ename, job
FROM emp
WHERE deptno = 20;

--6. emp10�� emp tbl�� 20�� �μ� ������ �߰� (2��° ���)
INSERT 
INTO emp10 
SELECT empno, ename, job
FROM emp
WHERE deptno = 20;




--7. emp���̺�� Dept���̺� �̿� , �Ʒ� �׸��� �����ϴ� Emp_Dept   TABLE�ۼ�
-- ( EmpNo, e.Ename, e.Job,  d.dname, d.loc)
CREATE TABLE emp_dept
AS SELECT e.empno, e.ename, e.job, d.dname, d.loc
FROM emp e, dept d
WHERE e.deptno = d.deptno;



 


