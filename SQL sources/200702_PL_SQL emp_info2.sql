CREATE OR REPLACE PROCEDURE emp_info2
(p_empno IN  emp.empno%TYPE,
 p_ename OUT emp.ename%TYPE,
 p_sal   OUT emp.sal%TYPE)
 
 IS
 
 v_empno emp.empno%TYPE;
 
 BEGIN
 
      DBMS_OUTPUT.ENABLE;
      SELECT empno, ename, sal
      INTO v_empno, p_ename, p_sal
      FROM emp
      WHERE empno = p_empno;
      
      DBMS_OUTPUT.PUT_LINE('�����ȣ : ' || v_empno || CHR(10) || CHR(13) || '�ٹٲ�' );
      DBMS_OUTPUT.PUT_LINE('����̸�: ' || p_ename );
      DBMS_OUTPUT.PUT_LINE('����޿�: ' || p_sal );
  
END;