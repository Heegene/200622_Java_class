create or replace PACKAGE emp_info AS 
    PROCEDURE all_sal_info;
    PROCEDURE all_emp_info; -- ��� ����� ����
    -- Ư�� �μ��� ��� ����
    PROCEDURE dept_emp_info(v_deptno IN NUMBER);
    -- Ư�� �μ��� �޿� ����
    PROCEDURE dept_sal_info(v_deptno IN NUMBER);
END emp_info;