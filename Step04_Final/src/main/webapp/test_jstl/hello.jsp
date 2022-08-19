<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- 위의 import하는 코드는 jar를 미리 다운 받아서 넣어놔야한다. 그렇지 않은 경우에는 사용이 불가능하다 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_jstl/hello.jsp</title>
</head>
<body>
	<!-- 
		c:forEach는 3번 줄의 선언부가 있어야 정상동작한다.
		밑의 c는 마음대로 원하는대로 선언할 수 있고 이는 자바 코드를 대체한다
	-->
	
	<c:forEach var="i" begin="0" end="9" step="1">
		<p>안녕 ${i }</p>
	</c:forEach>
	
	<%for(int i=0; i<=9 ; i++){ %>
		<p>안녕 <%=i %></p>
	<%} %>
</body>
</html>








