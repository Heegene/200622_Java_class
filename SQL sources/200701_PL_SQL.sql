-- PL/SQL
-- 세금 7% 반환 함수

CREATE OR REPLACE FUNCTION tax 
(v_num in   number) -- parameter
RETURN number   -- 숫자형태로 반환하여라 
IS 
		v_tax      number ; -- variable tax는 number이다

BEGIN  
		v_tax := v_num * 0.07 ; -- v_tax = v_num*0.07 이랑 같은뜻 
 
-- EXCEPTION은 생략함     
RETURN( v_tax ) ;  END ;   -- v_tax 값을 리턴하라 


-- 사용 방법
VARIABLE a Number; -- 변수 a를 number 형태로 선언
EXECUTE :a := TAX(1000000); -- a다가 tax(1000000) 실행해서 대입
PRINT a -- a출력 


-- 사용방법 2
SELECT name, tax(2000000), sal from emp;

