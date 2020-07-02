-- ���ν��� ���� (���ν����� �ǹ� return ����) 
create or replace PROCEDURE tax 
(v_num in   number, -- parameter
 v_tax out  number) -- return�� �Է����� �ʴ� ��� out ���� ����
 -- parameter �� �ְ� parameter�� ������ 
IS 
		-- v_tax      number ; -- variable tax�� number�̴�
    -- �տ� v_tax�� number�ΰ� ���������� ���� ����
    
BEGIN  
		v_tax := v_num * 0.07 ; -- v_tax = v_num*0.07 �̶� ������ 

END ;   -- v_tax ���� �����϶�



CREATE OR REPLACE PROCEDURE user_exception
      (v_deptno IN emp.deptno%TYPE)

IS

      user_defined_error EXCEPTION;
      cnt NUMBER;

BEGIN
 
      DBMS_OUTPUT.ENABLE;
      SELECT COUNT(empno)
      INTO cnt
      FROM emp
      WHERE deptno = v_deptno;
      
      IF cnt < 5 THEN
      -- ���� �߻���Ŵ
      RAISE user_defined_error;
      
      ELSE
        DBMS_OUTPUT.PUT_LINE('���� 5�� �̻�/���� �������');
      END IF;
      
EXCEPTION 
      WHEN user_defined_error THEN
        RAISE_APPLICATION_ERROR(-20001, '5������/�ο�������');

END;





