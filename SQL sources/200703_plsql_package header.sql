create or replace PACKAGE emp_info AS 
    PROCEDURE all_sal_info;
    PROCEDURE all_emp_info; -- 모든 사원의 정보
    -- 특정 부서의 사원 정보
    PROCEDURE dept_emp_info(v_deptno IN NUMBER);
    -- 특정 부서의 급여 정보
    PROCEDURE dept_sal_info(v_deptno IN NUMBER);
END emp_info;

-- 헤더이므로 들어가야하는 프로시저의 정보만 담음
-- 내용은 바디 안에 프로시저별로 정의할 것 
