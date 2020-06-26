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
SELECT name, sal, comm, MOD(sal,comm)
FROM professor;

-- CEIL, FLOOR ����
SELECT CEIL(19.7), FLOOR(12.567) FROM dual;


-- ��¥ ���ϱ� ����(30�� ��, 60�� ��) 
SELECT name, hiredate, hiredate + 30, hiredate + 60
FROM professor;

-- SYSDATE ����
SELECT sysdate from dual;

-- 10�� �̸� �ټ��� ���� Ȯ�� 
SELECT profno, hiredate, name,
TRUNC(MONTHS_BETWEEN (sysdate, hiredate)) AS tenure ,
ADD_MONTHS(hiredate, 6) AS review
FROM Professor
WHERE MONTHS_BETWEEN (sysdate, hiredate) < 120;


-- LASTDAY ����
SELECT sysdate, LAST_DAY(sysdate), NEXT_DAY(sysdate, '��') from dual;
--lastday�� �ش� ���� ������ �� ���, next_day�� ���ƿ��� ���� �Ͽ��� ��¥ ����


-- ��¥ ROUND, TRUNC ����
SELECT TO_CHAR(sysdate, 'YY/MM/DD HH24:MI:SS') AS normal,
       TO_CHAR(TRUNC(sysdate), 'YY/MM/DD HH24:MI:SS') AS trunc, 
       -- �����ؼ� 26�� 0�� 0�� ��ȯ
       TO_CHAR(ROUND(sysdate), 'YY/MM/DD HH24:MI:SS') AS round
       -- �ݿø��ؼ�(12�� �������Ƿ�) 27�� 0�� 0�� ��ȯ 
FROM dual;


-- ��¥ ������� ��ȯ
SELECT TO_CHAR(hiredate, 'YY/MM/DD') AS normal,
       TO_CHAR(ROUND(hiredate, 'dd'), 'YY/MM/DD') AS round_dd, 
       -- dd(��¥�������� round ó��) �ð������� �� �ݿø�
       TO_CHAR(ROUND(hiredate, 'mm'), 'YY/MM/DD') AS round_mm,
       -- mm ������ round ó�� �ϴ����� �� �ݿø�
       TO_CHAR(ROUND(hiredate, 'yy'), 'YY/MM/DD') AS round_yy
       -- yy ������ round ó�� �������� �� �ݿø� 
FROM professor;

-- ��¥ ������� ��ȯ ����
SELECT name, studno, TO_CHAR(birthdate, 'YYMM') from student;


SELECT name, studno, 
CONCAT(CONCAT(TO_CHAR(birthdate, 'YY'),'��'),(CONCAT(TO_CHAR(birthdate, 'MM'),'��')))
from student;
-- ���� ������ �̰� �ʹ� �������� ����̶� �ٸ� ����� ã�ƺ�
 
SELECT name, studno, TO_CHAR(birthdate,'YYYY"��"MM"��"DD"��"') birDay
from student;
-- ������ "" double quotation ó���� �ָ� �� 

-- �ð�ǥ���� �ٸ� ���
SELECT name, TO_CHAR(hiredate, 'MONTH DD, YYYY HH24:MI:SS PM') AS �Ի���
FROM professor;
-- 1�� 24, 1982 13:00:00 ���� �̷��� ��µ� 

-- ���� ��� (n,nnn �̷��� ������ �ִ� ��������) 
SELECT name, sal, comm, TO_CHAR((sal+comm)*12, '99,999')
FROM professor;



--
SELECT TO_NUMBER('1') ���� FROM dual;
-- SELECT TO_NUMBER('*') Ư������ FROM dual; ���� �߻�
-- ���ں�ȯ�� ������ ���ڿ��̾�� ��ȯ ���� 


-- ���� ��� (null �� ��� NVL�� �̿��Ͽ� ��ü�� �ο�)
SELECT name, position, sal, comm, sal+comm, sal+NVL(comm, 0), NVL(sal+comm, sal) s2
from professor;

-- NVL2 ���� NVL2(exp 1, exp2, exp3) null �ƴϸ� exp2���, ������ exp3���
SELECT name, position, sal, comm, NVL2(comm, sal+comm, sal) AS ���޿�
FROM professor;


-- NULLIF ����
SELECT NVL(NULLIF('A','A'), '�ΰ�') FROM dual; -- '�ΰ�' ��ȯ 
SELECT NVL(NULLIF('A','B'), '�ΰ�') FROM dual; -- �׳� A ��ȯ

-- COALESCE �Լ�
SELECT name, comm, sal, COALESCE(comm, sal, 0) from professor;


-- DECODE �Լ� ����
SELECT name, deptno, 
      DECODE (deptno, 
               101, '��ǻ�Ͱ��а�'
              ,102, '��Ƽ�̵���а�'
              ,201, '�����̹̿��а�'
              ,     '�ش�Ǵ°Ծ����а�') AS ���̴��а�
FROM professor;

-- CASE �Լ� ����
SELECT name, deptno, sal,
      CASE WHEN DEPTNO = 101 THEN sal*0.1
           WHEN DEPTNO = 102 THEN sal*0.2
           WHEN DEPTNO = 201 THEN sal*0.3
           ELSE 0
      END �󿩱� -- �� �÷������� ��갪�� ��
FROM professor;


-- EXERCISE --
--1.
SELECT UPPER(ename), LOWER(ename), INITCAP(ename)
FROM emp;

--2.
SELECT ename, job, SUBSTR(job, 2,4)
FROM emp;

-- 3.
SELECT ename, LPAD(ename,10,'#') FROM emp;

--4.  ���ǻ���: ���ڿ� �� ���Ҷ� ��ҹ��� ���� 
SELECT ename, job,
DECODE(job, 'MANAGER', '������')
FROM emp;

--5.
SELECT ename, ROUND(sal/7), ROUND(sal/7, 1), ROUND(sal/7, -1)
from emp;

--7.
SELECT ename, ROUND(sal/7), TRUNC(sal/7), CEIL(sal/7), FLOOR(sal/7)
FROM emp;

--8.
SELECT ename, sal, MOD(sal, 7)
FROM emp;

--9.
SELECT ename, sal, hiredate, 
TRUNC(MONTHS_BETWEEN(sysdate, hiredate)) AS ������,
TRUNC(MONTHS_BETWEEN(sysdate, hiredate)/12,0) AS ��,
TRUNC(MOD(MONTHS_BETWEEN(sysdate, hiredate)/12,1)*12,0) AS ��,
ROUND(MOD(MOD(MONTHS_BETWEEN(sysdate, hiredate)/12,1)*12,1)*(365/12),0) AS ��
FROM emp;

--10.
SELECT empno, ename, job, sal,
    CASE WHEN job = 'CLERK'    THEN sal*1.1
         WHEN job = 'ANALYST'  THEN sal*1.2
         WHEN job = 'MANAGER'  THEN sal*1.3
         WHEN job = 'SALESMAN' THEN sal*1.5
         ELSE sal*1.6
         END �λ�޿�
FROM emp;

--10. DECODE��
SELECT empno, ename, job, sal,
      DECODE (job,
          'CLERK',      sal*1.1
        , 'ANALYST',    sal*1.2
        , 'MANAGER',    sal*1.3
        , 'SALESMAN',   sal*1.5
        , sal*1.6) AS �λ�޿�
FROM emp;


-- 11. join
COUNT(ename)



      