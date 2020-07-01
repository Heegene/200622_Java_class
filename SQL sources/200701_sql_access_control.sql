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
START WITH deptno = 10
CONNECT BY PRIOR deptno = college;



