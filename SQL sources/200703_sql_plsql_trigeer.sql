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
      VALUES (emp_row_seq.NEXTVAL, :old.ename, 'inserting', sysdate);
    ELSIF UPDATING THEN
      INSERT INTO emp_row_audit
      VALUES (emp_row_sseq.NEXTVAL, :old.ename, 'updating', sysdate);
    ELSIF DELETING THEN
      INSERT INTO emp_row_audit
      VALUES (emp_row_seq.NEXTVAL, :old.ename, 'deleting', sysdate);
    END IF;
END;



