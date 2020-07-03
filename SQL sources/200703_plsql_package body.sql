create or replace PACKAGE BODY emp_info AS
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



PROCEDURE dept_emp_info(v_deptno IN NUMBER)
IS
  CURSOR emp_cursor IS
  SELECT empno, ename, to_char(hiredate, 'YYYY/MM/DD') hiredate
  FROM emp
  WHERE deptno = v_deptno
  ORDER BY hiredate;
  
BEGIN
  DBMS_OUTPUT.ENABLE;
  FOR aa IN emp_cursor LOOP
    DBMS_OUTPUT.PUT_LINE('���  : ' || aa.empno);
    DBMS_OUTPUT.PUT_LINE('����  : ' || aa.ename);
    DBMS_OUTPUT.PUT_LINE('�Ի���  : ' || aa.hiredate);
  END LOOP;
  
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM||'�����߻�');
  
    
END dept_emp_info;
  

PROCEDURE dept_sal_info (v_deptno IN NUMBER)

IS

    CURSOR emp_cursor IS
    SELECT ROUND(avg(sal),3) AS avg_sal, MAX(sal) AS max_sal, MIN(sal) AS min_sal
    FROM emp
    WHERE deptno = v_deptno;

BEGIN
    DBMS_OUTPUT.ENABLE;
    FOR emp_list IN emp_cursor LOOP
      DBMS_OUTPUT.PUT_LINE('�μ� �޿� ���: ' || emp_list.avg_sal);
      DBMS_OUTPUT.PUT_LINE('�μ� �޿� �ִ�: ' || emp_list.max_sal);
      DBMS_OUTPUT.PUT_LINE('�μ� �޿� �ּ�: ' || emp_list.min_sal);
    END LOOP;
    
EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM || '���� �߻�');

END dept_sal_info;


END emp_info;