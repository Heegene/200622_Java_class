-- UNION ����� ����ϱ� ���� ���̺� ����
CREATE TABLE stud_heavy
AS SELECT * FROM student
WHERE weight >= 70 AND grade = 1;

-- ���Ͼ� ����� �Ǵ� ���̺� ���� 2
CREATE TABLE stud_101
AS SELECT * FROM student
WHERE DEPTNO = 101 AND grade = 1;


-- ���տ��� ����
SELECT studno, name 
FROM stud_heavy
INTERSECT
SELECT studno, name 
-- studno, name, grade �̷��� ���� ������ �÷��� �ȸ´ٰ� ������ 
FROM stud_101;

-- ORDER BY 'NAME'
SELECT name, grade, tel
FROM student
ORDER BY name; -- �̸� �����ټ����� ��µ�

-- �̸�, �г�, ��ȭ��ȣ ���(�г� ��������) 
SELECT name, grade, tel
FROM student
ORDER BY grade DESC;


-- deptno�� ��������(����Ʈ), sal�� ������������ �����÷� ���� 
SELECT ename, sal, deptno
FROM emp
ORDER BY deptno, sal DESC;


-- �μ� 10, 30�� ��� ����� �̸��� �μ���ȣ
SELECT ename, deptno
FROM emp
WHERE deptno IN (10,30)
ORDER BY ename;


-- 82�⵵�� �Ի��� ������ �̸��� �Ի����� 
SELECT ename, hiredate
from emp
WHERE hiredate LIKE '82%';
-- ���������̶� �ȵǸ�
-- WHERE to_char(hiredate, 'yymmdd') LIKE '82%'; 

-- ��¥�������ε� ����
SELECT ename, hiredate
FROM emp
WHERE hiredate BETWEEN '82/01/01' and '82/12/31';


-- ���ʽ��� �޴� ����� ��� �޿�, ���ʽ� �������� 
SELECT ename, sal, comm
FROM emp
WHERE comm IS NOT NULL
ORDER BY sal DESC, comm DESC;


-- ���ʽ��� �޿��� 20% �̻��̰� �μ���ȣ�� 30�� ���
SELECT ename, sal, comm
FROM emp
WHERE comm >= (sal*0.2) and deptno = 30;


-- INITCAP �Լ� ����
SELECT name, userid, INITCAP(userid)
FROM STUDENT
WHERE name = '�迵��';

-- lower, upper �Լ� ����
SELECT name, userid, LOWER(userid) AS �ҹ���, UPPER(userid) AS �빮��
FROM student;


-- LENGTH, LENGTHB �Լ� ����
SELECT dname, LENGTH(dname), LENGTHB(dname)
FROM department;


-- CONCAT �Լ� ����
-- 2���� argument�� ���� �� ���� 
SELECT CONCAT(CONCAT(name, '�� ��å�� '), position) AS ��å����
FROM professor;

-- SUBSTR �Լ� ����
SELECT name, idnum, SUBSTR(idnum, 1, 6) birthDate,
                    SUBSTR(idnum, 3, 2) birthMonth,
                    SUBSTR(idnum, 7, 1) gender
FROM student
WHERE grade = 1;


-- INSTR �Լ� ����
SELECT INSTR('CORPORATE FLOOR', 'OR') FROM dual;  -- 2 ��ȯ�� (c'OR' ��ġ)
-- ���̺� ���� �׳� pseudo table �� dual ���

-- INSTR �Լ� ���� 2(��ġ �����ؼ� ���� �� �˻�)
SELECT INSTR('CORPORATE FLOOR', 'OR', 3, 2) FROM dual; -- 14 ��ȯ�� 
-- 3�� �ε������� ã�� �����ؼ� �ι�° 'OR' �� �ε��� ��ȯ 

-- Department �� dname �ʵ忡�� '��' �� ������ �ε��� ã��
-- ���� ��� 0 ��ȯ 
SELECT dname, INSTR(dname, '��') 
FROM DEPARTMENT;


-- LPAD, RPAD ����
SELECT position, LPAD(position, 10, '�߿�') AS LPAD_���, userid, 
                 RPAD(userid, 12, '�۸�') AS RPAD_���
FROM professor;

-- LTRIM, RTRIM ����
SELECT dname, RTRIM(dname, '��') ,
              LTRIM(dname, '��')
-- �����ʿ� '��'�� ������ ��������
-- ���ʿ� '��'�� ������ �������� 
FROM department;

-- ROUND ����
SELECT name, sal, 

sal/22 AS �׳�_���,
ROUND(sal/22) AS �����ڸ�_����, 
ROUND(sal/22,2) AS �Ҽ���_��°�ڸ�,
ROUND(sal/22,-1) AS �����ڸ�_�ݿø�,
ROUND(sal/22,-2) AS �����ڸ�_�����ݿø�

FROM professor
WHERE deptno = 101;


-- TRUNC ���� 
SELECT name, sal, 

sal/22 AS �׳�_���,
TRUNC(sal/22) AS �����ڸ�_���ܹ���, 
TRUNC(sal/22,2) AS �Ҽ���_��°�ڸ�,
TRUNC(sal/22,-1) AS �����ڸ�_����,
TRUNC(sal/22,-2) AS �����ڸ�_��������

FROM professor
WHERE deptno = 101;


-- MOD ����



