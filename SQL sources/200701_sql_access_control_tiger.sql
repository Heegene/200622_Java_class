SELECT * FROM scott.student;

DELETE scott.student;

UPDATE scott.student
SET    height = 180,
       weight = 80
WHERE  deptno = 101;

-- name은 업데이트 권한 없으므로 에러발생
UPDATE scott.student
SET    name = '홍길동'
WHERE  deptno = 101;

-- 본인(user)에게 할당된 권한 조회 
SELECT * FROM user_tab_privs_recd;


-- CONNECT 권한만 있어도 테이블은 만들 수 있음
CREATE TABLE kkk (
        id number(5),
        name varchar2(20)
        );
        

-- 롤 정의 조회
SELECT * FROM role_sys_privs;

SELECT * FROM scott.student;
SELECT * FROM scott.dept;


Select *
from session_roles;


Select * FROM USER_TAB_PRIVS_RECD;


-- Scott에서 만든 project 이므로 이렇게 지정함
SELECT * FROM my_project;

-- 근데 Synonym을 통해 더 쉽게 사용할 수 있음

CREATE SYNONYM my_project FOR scott.project;
DROP SYNONYM my_project;


SELECT * FROM pub_project;

SELECT * FROM scott.dept;