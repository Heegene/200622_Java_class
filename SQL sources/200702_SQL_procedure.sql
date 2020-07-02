-- 프로시저 생성 (프로시저는 의무 return 없음) 
create or replace PROCEDURE tax 
(v_num in   number, -- parameter
 v_tax out  number) -- return을 입력하지 않는 대신 out 으로 정의
 -- parameter 로 넣고 parameter를 가져옴 
IS 
		-- v_tax      number ; -- variable tax는 number이다
    -- 앞에 v_tax가 number인걸 선언했으니 생략 가능
    
BEGIN  
		v_tax := v_num * 0.07 ; -- v_tax = v_num*0.07 이랑 같은뜻 

END ;   -- v_tax 값을 리턴하라