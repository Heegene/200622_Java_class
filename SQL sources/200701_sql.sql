-- USER_CONSTRAINTS ������ �������� ���Ἲ �������� ��ȸ
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE 
FROM USER_CONSTRAINTS
WHERE table_name IN ('SUBJECT', 'SUGANG');
-- C = check Ȥ�� Not null, P = Primary key, U = Unique, R = Foreign key 
-- WHERE table_name IN ('subject', 'SUGANG'); �̷����ϸ� �� ��ȸ �ȵ�
-- ������ ��ųʸ����� �빮��ȭ�Ǿ� ���־ �빮�ڷθ� �ľ��� 

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE
FROM USER_CONSTRAINTS
WHERE TABLE_NAME ='STUDENT';

-- Student ���̺� idnum���� uk_stud_idnum�̶�� Ű�̸����� unique key ���� 
ALTER TABLE student
ADD CONSTRAINT uk_stud_idnum UNIQUE(idnum);

-- key�� ���� ������ add constraint�̰�,
-- NOT null�� �־��� ������ modify�� ��� 
ALTER TABLE student
MODIFY (name CONSTRAINT nn_stud_name NOT NULL);


-- ���������� ����
ALTER TABLE subject
DROP CONSTRAINT SUBJECT_TERM_CHECK; 

-- UNIQUE INDEX ����
CREATE UNIQUE INDEX idx_dept_name ON department(dname);
-- index �տ��� ���� idx��� �̸��� ����
-- ������ ������ ASC�� �⺻������ ������ 


-- �л� ���̺��� birthdate �÷��� ����� �ε����� ����
-- �ε����� idx_stud_birthdate
CREATE INDEX idx_stud_birthdate ON student(birthdate);


-- �л� ���̺��� deptno, grade �÷� ���� �ε����� ����
-- ���� �ε������� idx_stud_dno_grade �� ����
CREATE INDEX idx_stud_dno_grade ON student(deptno, grade);


-- �Լ���� �ε��� ����(function based index)
CREATE INDEX uppercase_idx ON emp (UPPER(ename));
-- �빮�ڷ� �� ename�� �ε����� ������ 

SELECT * FROM emp WHERE UPPER(ename) = 'KING';


-- �а� ���̺��� �а� �̸��� �����̵���к��� �а���ȣ �˻� ��� ������
-- dname �÷��� ���� �ε��� �����Ǿ� ����

SELECT deptno, dname
FROM department
WHERE dname = '�����̵���к�';


-- INDEX ����
DROP INDEX IDX_DEPT_NAME;


-- INDEX �籸��(�ε��� ������)
ALTER INDEX pk_studno REBUILD;



-- �� ����
CREATE VIEW view_professor AS
SELECT profno, name, userid, position, hiredate, deptno
FROM professor;

-- CREATE OR REPLACE VIEW
CREATE OR REPLACE VIEW view_professor AS
SELECT profno, name, userid, position, hiredate, deptno
FROM professor;


-- �� ���� ����
CREATE VIEW view_student AS
SELECT studno, name, deptno
FROM student;

-- ���� �� ����
CREATE OR REPLACE VIEW v_stud_dept102 AS
SELECT s.studno, s.name, s.grade, d.dname
FROM student s, department d
WHERE s.studno = d.deptno
AND s.deptno = 102;


-- �������̺��� �а��� ��ձ޿�(avg_sal)�� �Ѱ�(sum_sal)�� ���ǵǴ� �� ����
-- v_prof_avg_sal

CREATE OR REPLACE VIEW v_prof_avg_sal AS
SELECT deptno, AVG(sal) AS avg_sal, SUM(sal) AS sum_sal
FROM professor
GROUP BY deptno;


-- view ����
DROP VIEW v_stud_dept102;

-- VIEW �Է��� ���� �ʴ� ���
CREATE OR REPLACE VIEW dept_view
AS
SELECT dname, loc
FROM dept;

-- �̷��� ����� dept ���̺� null X�� �ʵ带 null�� �ؼ� �Է��ϸ� �����߻�
-- ���� ���̺��� not null �����Ǿ��ִ°ſ� insert�� null �����ؼ� Ŀ�� �Ұ�


-- VIEW �Է��� ���� �ʴ� ��� 2
CREATE OR REPLACE VIEW dept_view2
AS
SELECT deptno, dname, loc
FROM dept
WHERE deptno = 10
WITH CHECK OPTION;
-- �̷��� ���� ���̺� deptno �� 70������ �ؼ� �μ�Ʈ�Ϸ��� �ϸ�
-- WHERE ���ǿ� violation�� �� (WHERE ���� ������ check�ϹǷ� 10�� �ƴϸ� �ԷºҰ�)




