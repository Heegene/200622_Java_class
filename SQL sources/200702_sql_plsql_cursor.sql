CREATE OR REPLACE PROCEDURE show_emp3
(v_empno IN emp.empno%TYPE)

IS
  -- v_empno 번호 관련된 employee number 가진애들 다 가져옴
  -- 자바 확장포문이랑 비슷함
  CURSOR emp_cursor IS
      SELECT ename, job, sal
      FROM emp
      WHERE empno LIKE v_empno||'%';
      
      v_ename emp.ename%TYPE;
      v_sal   emp.sal%TYPE;
      v_job   emp.job%TYPE;
  
BEGIN
  OPEN emp_cursor;
    DBMS_OUTPUT.ENABLE;
    DBMS_OUTPUT.PUT_LINE('이름   ' || '업무  ' || '급여 ');
    DBMS_OUTPUT.PUT_LINE('------------------------------');
  LOOP
    FETCH emp_cursor INTO v_ename, v_job, v_sal;
          -- v_ename등의 변수에 각각 가져옴 
    EXIT WHEN emp_cursor%NOTFOUND;
           -- cursor가 더이상 가리키는것이 없을때까지 반복 
    DBMS_OUTPUT.PUT_LINE(v_ename || '  ' || v_job || '  ' || v_sal);
  END LOOP;
    DBMS_OUTPUT.PUT_LINE(emp_cursor%ROWCOUNT||' 개의 행이 선택됨');
  CLOSE emp_cursor;
  
END;
    