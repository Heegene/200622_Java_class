SELECT * FROM scott.student;

DELETE scott.student;

UPDATE scott.student
SET    height = 180,
       weight = 80
WHERE  deptno = 101;

-- name�� ������Ʈ ���� �����Ƿ� �����߻�
UPDATE scott.student
SET    name = 'ȫ�浿'
WHERE  deptno = 101;

-- ����(user)���� �Ҵ�� ���� ��ȸ 
SELECT * FROM user_tab_privs_recd;


-- CONNECT ���Ѹ� �־ ���̺��� ���� �� ����
CREATE TABLE kkk (
        id number(5),
        name varchar2(20)
        );
        

-- �� ���� ��ȸ
SELECT * FROM role_sys_privs;

SELECT * FROM scott.student;
SELECT * FROM scott.dept;


Select *
from session_roles;


Select * FROM USER_TAB_PRIVS_RECD;


-- Scott���� ���� project �̹Ƿ� �̷��� ������
SELECT * FROM my_project;

-- �ٵ� Synonym�� ���� �� ���� ����� �� ����

CREATE SYNONYM my_project FOR scott.project;
DROP SYNONYM my_project;


SELECT * FROM pub_project;

SELECT * FROM scott.dept;