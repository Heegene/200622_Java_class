CREATE OR REPLACE PROCEDURE show_emp3
(v_empno IN emp.empno%TYPE)

IS
  -- v_empno ��ȣ ���õ� employee number �����ֵ� �� ������
  -- �ڹ� Ȯ�������̶� �����
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
    DBMS_OUTPUT.PUT_LINE('�̸�   ' || '����  ' || '�޿� ');
    DBMS_OUTPUT.PUT_LINE('------------------------------');
  LOOP
    FETCH emp_cursor INTO v_ename, v_job, v_sal;
          -- v_ename���� ������ ���� ������ 
    EXIT WHEN emp_cursor%NOTFOUND;
           -- cursor�� ���̻� ����Ű�°��� ���������� �ݺ� 
    DBMS_OUTPUT.PUT_LINE(v_ename || '  ' || v_job || '  ' || v_sal);
  END LOOP;
    DBMS_OUTPUT.PUT_LINE(emp_cursor%ROWCOUNT||' ���� ���� ���õ�');
  CLOSE emp_cursor;
  
END;
    