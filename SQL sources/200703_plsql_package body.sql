create or replace PACKAGE BODY emp_info AS
-- 모든 사원의 사원 정보
--
    PROCEDURE all_emp_info
    
    IS
    
        CURSOR emp_view IS
        SELECT ename, hiredate, empno
        FROM emp;

 
          BEGIN
          DBMS_OUTPUT.ENABLE;
          
          FOR emp_list IN emp_view LOOP
          DBMS_OUTPUT.PUT_LINE('이름 : ' || emp_list.ename);
          DBMS_OUTPUT.PUT_LINE('입사일 : ' || emp_list.hiredate);
          DBMS_OUTPUT.PUT_LINE('사번 : ' || emp_list.empno);
        
        END LOOP;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM||'에러발생');
  
    
    END all_emp_info;
  

PROCEDURE all_sal_info
  
IS
  
  CURSOR sal_view IS
      SELECT AVG(sal) AS avg, MAX(sal) AS max, MIN(sal) AS min
      FROM emp;
      
  BEGIN
      DBMS_OUTPUT.ENABLE;
      
      FOR sal_list IN sal_view LOOP
      DBMS_OUTPUT.PUT_LINE('평균 ' || sal_list.avg);
      DBMS_OUTPUT.PUT_LINE('최대급여 ' || sal_list.max);
      DBMS_OUTPUT.PUT_LINE('최소급여 ' || sal_list.min);
      
      END LOOP;
  
  EXCEPTION
    WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE(SQLERRM||'에러발생');
  
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
    DBMS_OUTPUT.PUT_LINE('사번  : ' || aa.empno);
    DBMS_OUTPUT.PUT_LINE('성명  : ' || aa.ename);
    DBMS_OUTPUT.PUT_LINE('입사일  : ' || aa.hiredate);
  END LOOP;
  
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM||'에러발생');
  
    
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
      DBMS_OUTPUT.PUT_LINE('부서 급여 평균: ' || emp_list.avg_sal);
      DBMS_OUTPUT.PUT_LINE('부서 급여 최대: ' || emp_list.max_sal);
      DBMS_OUTPUT.PUT_LINE('부서 급여 최소: ' || emp_list.min_sal);
    END LOOP;
    
EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE(SQLERRM || '에러 발생');

END dept_sal_info;


END emp_info;