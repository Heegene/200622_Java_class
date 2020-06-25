SELECT deptno, dname
FROM dept;
CREATE TABLE ex_type
(c CHAR(10), v VARCHAR2(10));

INSERT INTO ex_type
VALUES ('sql', 'sql');

SELECT * FROM EX_TYPE
WHERE C = 'sql';


SELECT * FROM EX_TYPE
WHERE V = 'sql';


SELECT * FROM EX_TYPE
WHERE C = V;


SELECT ROWNUM, ROWID, dname, loc FROM DEPT;


SELECT STUDNO, NAME, DEPTNO ,GRADE   FROM student
WHERE GRADE = 1;


SELECT STUDNO, NAME, GRADE, DEPTNO, WEIGHT FROM STUDENT
WHERE WEIGHT <= 70;

SELECT STUDNO, NAME, WEIGHT, DEPTNO, GRADE FROM STUDENT
WHERE WEIGHT <= 70 AND GRADE = 1;


SELECT STUDNO, NAME, WEIGHT  FROM STUDENT
WHERE WEIGHT BETWEEN 50 and 70;


SELECT name, birthdate from STUDENT
WHERE Birthdate between '81/01/01' and '83/12/31';


SELECT NAME, STUDNO, GRADE, DEPTNO FROM STUDENT 
WHERE DEPTNO IN (102,201) ORDER BY NAME;


SELECT NAME, STUDNO, GRADE, DEPTNO FROM STUDENT 
WHERE DEPTNO = 102 OR DEPTNO = 201 ORDER BY NAME; 


SELECT name FROM STUDENT
WHERE name LIKE '��%';


SELECT name FROM STUDENT
WHERE name LIKE '��%��';

SELECT name FROM STUDENT
WHERE name LIKE '��_��';


SELECT empno, ename, sal, comm, sal + comm
-- null �� �ִ� ���� sal+comm �� �� null�� ���ϵ� 
FROM emp;

-- null �� �ִ� ���� sal+comm �� �� null�� ���ϵ� 
-- null�� ���꿡�� ���ܵ� 
SELECT AVG(comm), SUM(sal)
FROM emp;

-- NVL, NVL2 ����

SELECT NVL(null, 'B') FROM dual;
-- dual�� ������ �ӽ� ���̺�

-- null �̸� comm �� 500���� �� �����Ҵ�� �÷��� ���� 
SELECT empno, ename, sal, comm, NVL(comm, 500)
FROM emp;

-- ���� ���̺��� �̸�, ����, �������� ��� 
SELECT NAME, POSITION, COMM FROM PROFESSOR
WHERE COMM IS NOT NULL;

-- ���� ���̺��� �������� ���� ���� ���
SELECT NAME, POSITION, COMM FROM PROFESSOR
WHERE COMM IS NULL;

SELECT NAME, POSITION, COMM, SAL+COMM AS SAL_COM FROM PROFESSOR;

-- 102�� �а� �л� �� 1�г� or 4�г� ����
SELECT name, grade, deptno FROM STUDENT
WHERE deptno = 102 AND grade IN(1,4);


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
MINUS
SELECT studno, name 
-- studno, name, grade �̷��� ���� ������ �÷��� �ȸ´ٰ� ������ 
FROM stud_101;


