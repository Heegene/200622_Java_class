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


