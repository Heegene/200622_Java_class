<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
  // 자바 코드를 넣는 부분
  // request 객체는 선언한 적이 없는데 오류 없이 사용됨
  // 내장객체이므로 사용 가능
  
  StringBuffer url = request.getRequestURL();
  out.print("url : " + url.toString());
  out.print("<br>");
  // out도 내장 객체
  // 따로 생성하거나 선언하지 않아도 사용할 수 있음
  // session, application, page, request, out, scope 등
  // 항상 기억할 건 jsp는 그 자체로 실행되는 게 아니라
  // 서블릿으로 바뀌어서 사용됨
  
  
%>

</body>
</html>