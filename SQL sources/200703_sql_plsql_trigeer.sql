-- emp-sal ���� üũ�ϴ� Ʈ���� ���� ����

create or replace TRIGGER check_salary
BEFORE UPDATE OR DELETE OR INSERT ON emp

BEGIN 
      -- �ݿ����̳� �Ͽ����̸�(�������� �ݿ����̶� ���Ƿ�) 
      IF (TO_CHAR(sysdate,'D') IN ('6', '1')) THEN 
        RAISE_APPLICATION_ERROR(-20500, '�ָ����� ������ �� �����ϴ�.');
      
      END IF;

END;

-- Ʈ���� ���� �ι�° ����


CREATE OR REPLACE TRIGGER triger_test
BEFORE UPDATE ON dept
FOR EACH ROW -- old, new�� ����ϱ� ���� �� �� 

BEGIN
      DBMS_OUTPUT.ENABLE;
      DBMS_OUTPUT.PUT_LINE('���� �� �÷��� : ' || : old.dname);
      DBMS_OUTPUT.PUT_LINE('���� �� �÷��� : ' || : new.dname);
END;



-- sample
UPDATE dept 
SET dname = '������'
WHERE dname = '���礩';



-- Ʈ���� �Ǵٸ� ����
-- emp ���̺� insert, update, delete���� �Ϸ翡 �� ���� row��ŭ �߻��ߴ���
-- Ȯ���Ͽ� emp_audit_row��
-- ������̸�, �۾�����, �۾��ð�, �����ȣ, �����޿�, ���ű޿� �����ϴ� Ʈ����

-- ������ ���� 
DROP SEQUENCE emp_row_seq;
CREATE SEQUENCE emp_row_seq
    INCREMENT BY 1
    START WITH 1
    MAXVALUE 999999
    MINVALUE 1
    NOCYCLE
    NOCACHE;

-- ������ ���� �α׸� ���� audit ���̺� ���� 
DROP TABLE emp_row_audit;
CREATE TABLE emp_row_audit(
      e_id    NUMBER(6) CONSTRAINT emp_row_pk PRIMARY KEY,
      e_name  VARCHAR2(30),
      e_gubun VARCHAR2(10),
      e_date  DATE);
      
      
-- audit ���̺� �����͸� �ִ� Ʈ���� ����
CREATE OR REPLACE TRIGGER emp_row_aud
    AFTER INSERT OR UPDATE OR DELETE ON emp
    FOR EACH ROW
    
BEGIN
    IF INSERTING THEN
      INSERT INTO emp_row_audit
      VALUES (emp_row_seq.NEXTVAL, :new.ename, 'inserting', sysdate);
    ELSIF UPDATING THEN
      INSERT INTO emp_row_audit
      VALUES (emp_row_seq.NEXTVAL, :old.ename, 'updating', sysdate);
    ELSIF DELETING THEN
      INSERT INTO emp_row_audit
      VALUES (emp_row_seq.NEXTVAL, :old.ename, 'deleting', sysdate);
    END IF;
END;



-- ��Ű�� ����
-- 1. ��Ű�� ����� 
CREATE OR REPLACE PACKAGE emp_info AS 
    PROCEDURE all_emp_info; -- ��� ����� ����
END emp_info;

-- 2. ��Ű�� body ����
CREATE OR REPLACE PACKAGE BODY emp_info AS
-- ��� ����� ��� ����
--
    PROCEDURE all_emp_info
    
    IS
    
        CURSOR emp_view IS
        SELECT ename, hiredate, empno
        FROM emp;

 
          BEGIN
          DBMS_OUTPUT.ENABLE;
          
          FOR emp_list IN emp_view LOOP
          DBMS_OUTPUT.PUT_LINE('�̸� : ' || emp_list.ename);
          DBMS_OUTPUT.PUT_LINE('�Ի��� : ' || emp_list.hiredate);
          DBMS_OUTPUT.PUT_LINE('��� : ' || emp_list.empno);
        
        END LOOP;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM||'�����߻�');
  
    
    END all_emp_info;
END emp_info;


EXEC EMP_INFO.ALL_EMP_INFO();


-- ��Ű�� ���� ���� 2
-- �̷��� ��������� �� �ΰ��� ���ν����� ���߿� ��������� �� 
CREATE OR REPLACE PACKAGE emp_info AS
    PROCEDURE all_emp_info;
    PROCEDURE all_sal_info;
END emp_info;


-- all_sal_info�� �̸� ���� ���ص����Ƿ� ���ν��� �����ؾ���
-- ��ü�޿����, �ִ�޿��ݾ�, �ּұ޿��ݾ�  �׷��Լ� �̿�

CREATE OR REPLACE PACKAGE BODY emp_info AS
PROCEDURE all_sal_info
  
IS
  
  CURSOR sal_view IS
      SELECT AVG(sal) AS avg, MAX(sal) AS max, MIN(sal) AS min
      FROM emp;
      
  BEGIN
      DBMS_OUTPUT.ENABLE;
      
      FOR sal_list IN sal_view LOOP
      DBMS_OUTPUT.PUT_LINE('��� ' || sal_list.avg);
      DBMS_OUTPUT.PUT_LINE('�ִ�޿� ' || sal_list.max);
      DBMS_OUTPUT.PUT_LINE('�ּұ޿� ' || sal_list.min);
      
      END LOOP;
  
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE(SQLERRM||'�����߻�');
  
  END all_sal_info;
  
  END emp_info;
  
  
-- Ư�� �μ��� ��� ���� ���ν��� ����



-
  
