SELECT COUNT(comm)
FROM professor
WHERE deptno = 101;
-- null �����ϰ� 2�� ��ȯ��


SELECT COUNT(*)
FROM professor
WHERE deptno = 101 ;
-- 4�� ��ȯ�� (*�� ������ ��� null ������ ���� �����ϴ� ���� ���� ��ü)


SELECT COUNT(*)
FROM professor
WHERE deptno = 101 AND comm IS NOT NULL ;
-- 2�� ��ȯ��(null �� ����) 

-- 101�а� �л����� ü�� ��հ� �հ�
SELECT AVG(weight), SUM(weight)
FROM STUDENT
WHERE deptno = 101;

-- 102�а� �л����� �ִ�Ű�� �ּ�Ű 
SELECT MAX(height), MIN(height)
FROM student
WHERE deptno = 102;

-- ���� ���̺� �޿� ǥ������ / �л�
SELECT STDDEV(sal), VARIANCE(sal)
FROM professor;

-- GROUP BY Ʋ�� ����
SELECT deptno, position, AVG(sal)
FROM professor
GROUP BY deptno;
-- �̷����ϸ� �����߻� group by���� deptno�� �־�����Ƿ� �ȵ�

-- GROUP BY �´� ����
SELECT deptno, position, AVG(sal)
FROM professor
GROUP BY deptno, position;
-- deptno, position ���� ������ �ؿ��� deptno, position ����� �� 

-- ���� ���̺��� �а����� ���� ���� �������� �޴� ������ ���
SELECT deptno, COUNT(*) ������, COUNT(comm) �������米��
FROM professor
GROUP BY deptno;

-- ��ü�л� �Ҽ� �а����� ������ ���� �а� �л��� �г⺰ �׷���
-- �а��� �г⺰ �ο���, ��� ������
-- �� ��� �����Դ� �Ҽ��� ���� ù��° �ڸ����� �ݿø�

SELECT deptno, grade, COUNT(*) ��ü�л���, ROUND(AVG(weight),1) ���������
FROM student
GROUP BY deptno, grade
ORDER BY deptno, grade;

-- ROLLUP ����
-- �Ҽ� �а����� ���� �޿� �հ��
-- ��� �а� �������� �޿� �հ� ���
SELECT deptno, SUM(sal)
FROM professor
GROUP BY ROLLUP(deptno);

-- �Ҽ� �а���, ���޺� ���� ��, �а��� ������
-- ��� ������ �հ� ���
SELECT deptno, position, COUNT(*)
FROM professor
GROUP BY ROLLUP(deptno, position)
ORDER BY deptno;


-- CUBE ����
-- ���޺� ���� ��, �а��� ���� ��, ��ü ���� ��
SELECT deptno, position, count(*)
FROM professor
GROUP BY CUBE(deptno, position);
-- ��ü�հ谡 ���� ������ �״��� position �� �հ� �� ������
-- �� ������ �а��� �հ谡 �ؿ� ���� 

-- �г⺰ Ű, ������ 
SELECT grade, Count(*), ROUND(AVG(height)) ���Ű, ROUND(AVG(weight)) ���ü��
FROM student
GROUP BY grade
ORDER BY AVG(weight) DESC;


-- �г⺰ Ű, ������ 
SELECT grade, Count(*), ROUND(AVG(height)) ���Ű, ROUND(AVG(weight)) ���ü��
FROM student
GROUP BY grade
HAVING COUNT(*)>=4
ORDER BY AVG(weight) DESC;


-- GROUP by error (���� �߻��ϴ� ����) 
SELECT grade, Count(*), ROUND(AVG(height)) ���Ű, ROUND(AVG(weight)) ���ü��
FROM student
WHERE COUNT(*)>=4
GROUP BY grade
ORDER BY AVG(weight) DESC;
--  "group function is not allowed here" ��� �����޽��� ��� 

-- JOIN ����
-- �й��� 10101�� �л��� �̸��� �Ҽ� �а� �̸� ���
SELECT studno, name, deptno
FROM student
WHERE studno = 10101;
-- ���⼭ 101�� �а���� �� �� �� �־��� 

-- 2. �Ҽ��а� �̸� ���
SELECT dname
FROM department
WHERE deptno = 101;
-- �̷��� �ؾ� �а����� �� �� �־���(2���� ���ļ�)

-- �ѹ��� ���� ���� JOIN ���
SELECT studno, name, student.deptno �л��̸�, department.dname �Ҽ��а��̸�
-- �л� ���̺��� deptno ��������, department���� dname ������
FROM student, department -- 2���� ���̺��̹Ƿ� ���̺� 2�� ������
WHERE student.deptno = department.deptno;
-- �� ���̺��� deptno�� ���� 

-- ���̺���� �ʹ� ��ٸ� alias �� ��� 
SELECT studno, name, s.deptno �л��̸�, d.dname �Ҽ��а��̸�
-- �л� ���̺��� deptno ��������, department���� dname ������
FROM student s, department d -- allias�� ���
WHERE s.deptno = d.deptno; -- alias �� ����� ��� �Ϲ� �̸� ��� ���ϰ�
-- alias���� ����ؾ� ȣ�� ���� 



-- ���̺���� �ʹ� ��ٸ� alias �� ��� 
SELECT s.studno, s.name, s.deptno �л��̸�, d.dname �Ҽ��а��̸�
-- �л� ���̺��� deptno ��������, department���� dname ������
FROM student s, department d -- allias�� ���
WHERE s.deptno = d.deptno; -- alias �� ����� ��� �Ϲ� �̸� ��� ���ϰ�
-- alias���� ����ؾ� ȣ�� ����


-- Cartesian product (īƼ�ǰ�) ����
SELECT s.studno, s.name, s.deptno, d.deptno, d.dname
FROM student s, department d; 
-- �л����̺� �Ǽ�*�μ����̺� �Ǽ���ŭ Ʃ�� ���� 


-- Natural join
SELECT s.studno, s.name, s.deptno, d.deptno, d.dname
FROM student s
      NATURAL JOIN department d;
      -- �̷��� �ϸ� �����߻� Natural JOIN��  ���̺� ���� ��� �Ұ�
      
      -- Natural join
SELECT studno, name, deptno, deptno, dname
FROM student 
      NATURAL JOIN department ;
      -- �̷��� �ϸ� ���ư��µ� ���»������ �˾ƺ��� ����
  
-- JOIN ~USING ��  
SELECT studno, name, deptno, dname
FROM student s JOIN department d
USING(deptno);

-- NON-EQUI JOIN
SELECT p.profno, p.name, p.sal, s.grade
FROM professor p, salgrade s
WHERE p.sal BETWEEN s.losal AND s.HISAL;

-- OUTER JOIN ����
SELECT s.name, s.grade, p.name, p.position
FROM student s, professor p
WHERE s.profno = p.profno(+); -- left outer join �������� ������
-- +�� outer join �ϸ� null �ΰ͵� ��Ÿ�� 

-- EQUI JOIN ����
SELECT s.name, s.grade, p.name, p.position
FROM student s, professor p
WHERE s.profno = p.profno; -- left outer join �������� ������
-- EQUI JOIN���� �ϸ� profno�� null�ΰ� ��Ÿ���� ����

SELECT s.grade, s.name, p.name, p.position
FROM student s, professor p
WHERE s.profno = p.profno(+);


-- 

SELECT s.studno, s.name, s.profno, p.name
FROM student s
    LEFT OUTER JOIN professor p
    ON s.profno = p.profno;


-- FULL OUTER JOIN
-- ���������� ���� �л��� �����л��� �������� ���� ������ �Բ� ���
SELECT studno, s.name, s.profno, p.name
FROM student s
      FULL OUTER JOIN professor p
      ON s.profno = p.profno;
-- full outer join�� ��ȣ���� null �̸� �־��� 

-- �� ���̺��� ���� �߻��ϴ� SELF JOIN
SELECT c.deptno, c.dname, c.college, d.dname AS college_name
FROM department c, department d -- ���� ���� ���̺� 
WHERE c.college = d.deptno; 
-- c�� college�� d�� deptno�� ���� 
-- ������ ���� �� ���� �� ��� 

-- '||'�� ���ڿ� ��������ִ� ������

SELECT dept.dname || '�� �Ҽ���' || org.dname
FROM department dept
      JOIN department org
      ON dept.college = org.deptno;
      

-- Subquery ����
-- ������ ������ ������ ������ ���� ��� ���� ��� 
SELECT name, position
FROM professor
WHERE position = (SELECT position FROM professor WHERE name = '������');


-- 1. ������ ���� ���� �˻�
SELECT position
FROM professor
WHERE name = '������';

-- 2. ���Ӱ����� ���� �˻�
SELECT name
FROM professor
WHERE position = '���Ӱ���';

-- 3. ��������
SELECT name, position
FROM professor
WHERE position = (SELECT position FROM professor WHERE name = '������');


