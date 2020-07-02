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
      
      DBMS_OUTPUT.PUT_LINE('사원번호 : ' || v_empno || CHR(10) || CHR(13) || '줄바뀜' );
      DBMS_OUTPUT.PUT_LINE('사원이름: ' || p_ename );
      DBMS_OUTPUT.PUT_LINE('사원급여: ' || p_sal );
  
END;