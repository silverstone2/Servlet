<%@page import="test.user.dao.UserDao"%>
<%@page import="test.user.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 폼 전송되는 아이디, 비밀번호, 이메일 추출
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String email=request.getParameter("email");
	//2. DB 에 저장
	UserDto dto=new UserDto();
	dto.setId(id);
	dto.setPwd(pwd);
	dto.setEmail(email);
	
	boolean isSuccess=UserDao.getInstance().insert(dto);
	//3. 결과 응답하기
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/user/signup.jsp</title>
</head>
<body>
	<h1>Notice</h1>
	<%if(isSuccess){ %>
		<p>
			<strong><%=id %></strong>님 가입을 축하드립니다!
			<a href="loginform.jsp">로그인 하러 가기</a>
		</p>
	<%}else{ %>
		<p>
			가입에 실패했습니다.
			<a href="signup_form.jsp">재가입하러 가기</a>
		</p>
	<%} %>
</body>
</html>



