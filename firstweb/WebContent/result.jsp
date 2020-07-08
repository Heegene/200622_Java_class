<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% // 값을 다시 꺼내옴
    int v1 = (int)request.getAttribute("v1");
	int v2 = (int)request.getAttribute("v2");
	int result = (int)request.getAttribute("result");
	
	// 출력할때는 표현식 사용
  %>
  
 <h1><%=v1%> + <%=v2%> = <%=result%> 입니다. </h1> 

<!-- 위와 같이 jsp 안에서 보여지는 java 문법을
	프론트단에서 보고 관리하기가 귀찮아서
	EL문법, JSTL이 나오게 됨
	EL문법은 아래와 같이 \${} 안에 넣어주면
	알맞은 변수를 알아서 찾아서 넣어주게 됨
	주석문 안에 있는 저 EL문법도 인식해서 탈출자 \ 줄여야됨 
	아무튼 JSP 안에 자바코드를 최대한 줄이기위해 사용하는게 EL
	 -->

${v1 } + ${v2 } = ${result}



</body>
</html>