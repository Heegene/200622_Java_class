CREATE OR REPLACE FUNCTION fc_update_sal
-- 10% �λ��Ͽ� �����ϴ� �Լ�
(v_empno IN NUMBER)

RETURN NUMBER

IS

  v_increased emp.sal%TYPE;
  
BEGIN
  SELECT empno, sal
  INTO v_empno, v_increased
  FROM emp
  WHERE empno = v_empno;
  
  v_increased := v_increased * 1.1;
  
  

RETURN (v_increased) ; 

END;



