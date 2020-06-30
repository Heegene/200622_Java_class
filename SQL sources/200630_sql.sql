INSERT INTO student
VALUES (10110, 'ȫ�浿', 'hong', '1', '8501011143098','85/01/01',
        '010-2222-3333',170,70,101,9903);
        
commit;


-- ������ null �Է�
INSERT INTO department (deptno, dname) 
-- column�� ���� ���ϸ� ��ü values ���� �� �־��־����
VALUES (300, '������а�');
-- �̷����ϸ� ������ ���鿡�� �ڵ������� null �� �Էµ�
commit;

-- ����� null �Է�
INSERT INTO department
       VALUES(302,'ȯ����а�','',null);
       -- '' �̷��� �ְų� null �ְų� �� �� �ϳ��� �־��ָ� �� 
       commit;


-- ��¥ �Է�
INSERT INTO professor (profno, name, position, hiredate, deptno)
-- ���� ��¥�Է¹�� 
-- VALUES (9920, '������', '������', TO_DATE('2006/01/01', 'YYYY/MM/DD'), 102)
VALUES (9920, '������', '������', '2006/01/01', 102)
;
commit;

-- SYSDATE ����
INSERT INTO professor
VALUES (9910, '��̼�', 'white', '���Ӱ���', 200, SYSDATE, 10, 101);
-- sysdate�� ���ó�¥�� �ݿ��� 
commit;


-- student�� t_student�� ����
CREATE TABLE t_student
AS SELECT * FROM student
   WHERE 1 = 0; -- t_student�� ����ֵ� ������ ������ �����ϰ� �� ���� X
   
CREATE TABLE t_student2
AS SELECT * FROM student;
-- ������ ��� ���� 


-- INSERT ALL ����
CREATE TABLE heightinfo (
       studno number(5),
       name varchar2(10),
       height number(5,2)
       );
-- ���̺� 2�� ����
CREATE TABLE weightinfo (
       studno number(5),
       name varchar2(10),
       weight number(5,2)
       );       

-- �л� ���̺��� 2�г� �̻��� �л��� �˻��Ͽ�
-- height info ���̺��� �й�, �̸�, Ű
-- weight_info ���̺��� �й�, �̸�, ������ ���� �Է�

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

-- 2�г� �̻��� �л��� �߿���
-- 170�� �Ѵ� �л����� Ű��
-- ü���� 70�� �Ѵ� �л����� ����, ü������ �Է� 
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


-- 2�г��̻� �л� �˻��ؼ� heightinfo���� 170�̻����л��� �й�,�̸�,Ű
-- weightinfo���� 70���� ������ ū �л��� �й�, �̸� ������
-- �� Ű�� 170���� �۰� �����Ժ��� 70���� ū �л��� weightinfo���� �Է�

INSERT FIRST 
WHEN height > 170 THEN
    INTO heightinfo VALUES (studno, name, height)
    -- �̷��� �ϸ� 170 �Ѵ¾ֵ��� �� heightinfo ���̺�� ����
    
    -- 170�� �ƴ� �л��� �߿��� 70�� �Ѵ� �л����� ���� ��
WHEN weight > 70 THEN
    INTO weightinfo VALUES (studno, name, weight)
SELECT studno, name, height, weight
FROM student
WHERE grade >=2;
-- Ű 170 �Ѵ¾ֵ��� �ϴ� ù��°���̺� �ְ� ������
-- �ι�° WHEN������ 170 �ȵǴ¾ֵ� ������θ� ���ư�


-- PIVOTING ��� (��, �� �ٲٱ�)
-- ���̺� ����
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

-- PIVOTING ��� ���
-- SALES ���̺��� ���Ϻ� ������ �����Ͽ� SALES_DATA ���̺�
-- �ϳ��� ������ �Է�

INSERT ALL
-- ��� ���� �ٲ㼭 ����
-- dayno�� 1�̸� sales_mon ������� 
INTO sales_data VALUES (sales_no, week_no, '1', sales_mon)
INTO sales_data VALUES (sales_no, week_no, '2', sales_tue)
INTO sales_data VALUES (sales_no, week_no, '3', sales_wed)
INTO sales_data VALUES (sales_no, week_no, '4', sales_thu)
INTO sales_data VALUES (sales_no, week_no, '5', sales_fri)
SELECT sales_no, week_no, sales_mon, sales_tue, sales_wed, sales_thu,
sales_fri
FROM sales;

commit;


-- ������ȣ�� 9930�� ����� ������ �α����� ����

UPDATE professor
SET position = '�α���'
WHERE profno = 9903;

-- ���������� �̿��� �й��� 10201�� �л��� �г�� �а� ��ȣ��
-- 10103 �й� �л��� �г�� �а� ��ȣ�� �����ϰ� ����

UPDATE student
SET (grade, deptno) = (SELECT grade, deptno
                       FROM student
                       WHERE studno = 10103)
WHERE studno = 10201;
commit;


-- 20103 �л� ����
DELETE FROM student -- ���⼭ 'from'�� ���� ����
WHERE studno = 20103;
rollback;

DELETE student
WHERE deptno = (SELECT deptno 
                FROM department
                WHERE dname = '��ǻ�Ͱ��а�');
                
  
rollback;


CREATE TABLE professor_temp
AS           SELECT *
             FROM professor
             WHERE position = '����';

UPDATE professor_temp
SET position = '������'
WHERE position = '����';