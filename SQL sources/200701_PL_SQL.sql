-- PL/SQL
-- ���� 7% ��ȯ �Լ�

CREATE OR REPLACE FUNCTION tax 
(v_num in   number) -- parameter
RETURN number   -- �������·� ��ȯ�Ͽ��� 
IS 
		v_tax      number ; -- variable tax�� number�̴�

BEGIN  
		v_tax := v_num * 0.07 ; -- v_tax = v_num*0.07 �̶� ������ 
 
-- EXCEPTION�� ������     
RETURN( v_tax ) ;  END ;   -- v_tax ���� �����϶� 


-- ��� ���
VARIABLE a Number; -- ���� a�� number ���·� ����
EXECUTE :a := TAX(1000000); -- a�ٰ� tax(1000000) �����ؼ� ����
PRINT a -- a��� 


-- ����� 2
SELECT name, tax(2000000), sal from emp;

