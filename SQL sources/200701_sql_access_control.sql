-- DBA �������� �����Ͽ� ���� �����ϱ� 
CREATE USER tiger IDENTIFIED BY tiger;

-- �̷��Ը� ����� �����Ϸ��� �ϸ� ������ ��� access denied �� 

GRANT connect, resource TO tiger;
-- ����(���ǿ���), �⺻���̺� �ڵ鸵 �� �� �ִ� ���� �ο� 

-- tiger ������ student table�� select ���� �ο�
GRANT SELECT ON student TO tiger;


-- tiger ������ update ������ �ֵ� Ư�� �÷��� ���ؼ��� ���� ��
GRANT UPDATE(height, weight) ON student TO tiger;

-- ���� ȸ��
REVOKE SELECT ON student FROM tiger;
-- student ���̺� ������ tiger�κ��� ȸ��
REVOKE UPDATE ON student FROM tiger;
-- update ���ѵ� ȸ��

CREATE ROLE hr_clerk;

-- ��ȣ�� �ִ� �� 
CREATE ROLE hr_mgr
            IDENTIFIED BY manager;
            

-- �� ������ �ϳ��� �� ���� ����
GRANT create session to hr_mgr;

-- Scott�� student ��� �÷��� ���� select, delete, insert ���� hr clerk�� �ο�
GRANT SELECT, DELETE, INSERT ON student TO hr_clerk;

-- hr_clerk�� ���� ������ hr_mgr�� �ο�
GRANT hr_clerk TO hr_mgr;

-- hr_clerk�� ���� ������ tiger�� �ο�
GRANT hr_clerk TO tiger;

GRANT create session TO hr_clerk;
GRANT SELECT, DELETE, INSERT ON dept TO hr_clerk;


CREATE TABLE project (
    project_id number(5) CONSTRAINT pro_id_pk PRIMARY KEY,
    project_name varchar2(100),
    studno number(5),
    profno number(5)
    );

-- ���Ǿ�(SYNONYM) ����
INSERT INTO project VALUES (12345, 'portfolio', 10101, 9901);
SELECT * FROM project;

GRANT SELECT ON project to tiger;

CREATE SYNONYM my_project FOR project;


select * from dba_sys_privs where grantee='tiger' ;




GRANT unlimited tablespace to tiger;



set role hr_clerk;


GRANT SELECT ON professor to hr_clerk;
GRANT hr_clerk to tiger;

REVOKE SELECT ON professor FROM hr_clerk;


-- ������ ���ǹ� ����Ͽ� �μ� ���̺��� �а�, �к�, 
-- �ܴ�, �к��а������� top down ���������� ���
-- �� ���� �����ʹ� 10�� �μ�

SELECT deptno, dname, college
FROM department
START WITH deptno = 10 -- dept 10������ �����ϵ�
CONNECT BY PRIOR deptno = college;
-- �ڽ��� ���ɰ� �θ� ���߿�
-- college�� ����ִ� ���� deptno�� ����ִٸ� �װ� �θ�


-- ������ ���ǹ� ����Ͽ� �μ� ���̺��� �а�, �к� , �ܰ����� �˻��Ͽ�
-- �а�, �й�, �ܴ� ������bottom up ���·� ���
-- ���۵����� 102��

SELECT deptno, dname, college
FROM department
START WITH deptno = 102
CONNECT BY PRIOR college = deptno;
-- bottom up�̴ϱ� �Ųٷ� �����ϸ� �� 


-- ������ ���ǹ� ����Ͽ� �μ� ���̺��� �μ� �̸� �˻��Ͽ�
-- �ܴ�, �к� , �а��� top-down �������� ���
-- �� ���� �����ʹ� '��������'�̰� �� �������� �������� 2ĭ �̵� ���

SELECT LEVEL, LPAD(' ', (Level-1)*2) || dname AS ������
FROM department
START WITH dname = '��������'
CONNECT BY PRIOR deptno = college;

-- LEVEL�̶�� �ǻ� ���� ���� ��Ʈ ���, ��Ʈ ����� �ڽ� ���, �� �ڽ� �̷���
-- depth�� ����


CREATE TABLE DEP (
     DEP_CD NUMBER NOT NULL, -- �μ��ڵ�
     PARENT_CD NUMBER, -- �����μ� �ڵ�
     DEPT_NAME VARCHAR2(100) NOT NULL, -- �μ��̸�
     PRIMARY KEY (DEP_CD)
);

INSERT INTO DEP VALUES ( 101, NULL, '�Ѱ����ߺ�');
INSERT INTO DEP VALUES ( 102, 101, '����ϰ��߼���');
INSERT INTO DEP VALUES ( 103, 101, '�����߼���');
INSERT INTO DEP VALUES ( 104, 101, '�ý��۰��߼���');

INSERT INTO DEP VALUES ( 105, 102, '���θ�(�����)');
INSERT INTO DEP VALUES ( 106, 103, '����SI');
INSERT INTO DEP VALUES ( 107, 103, '���θ�');
INSERT INTO DEP VALUES ( 108, 105, '����������');
INSERT INTO DEP VALUES ( 109, 106, '����1��');
INSERT INTO DEP VALUES ( 100, 106, '����2��');
INSERT INTO DEP VALUES ( 111, 104, 'ERP�ý���');

SELECT LPAD(' ', (level-1*2)) || dept_name AS ������,
dep_cd, parent_cd, level
FROM dep
START WITH parent_cd IS NULL
CONNECT BY PRIOR dep_cd = parent_cd;




-- ������ ���ǹ��� ����Ͽ� �μ� ���̺��� dname��
-- �ܴ�, �к�, �а������� top-down �������� ���
-- �� �����̵���к� ���� ���

SELECT deptno, college, dname, loc
FROM department
WHERE dname != '�����̵���к�'
START WITH college is null
CONNECT BY PRIOR deptno = college;

-- �����̵���к� ��ü�� �� �����������(���� ����)

SELECT deptno, college, dname, loc
FROM department
START WITH college is null
CONNECT BY PRIOR deptno = college
AND dname != '�����̵���к�';
