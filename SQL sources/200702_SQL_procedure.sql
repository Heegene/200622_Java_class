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