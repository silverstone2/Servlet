<%@page import="java.util.List"%>
<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// post 방식 전송 파라미터 추출할 때 한글 깨짐 방지
	request.setCharacterEncoding("utf-8");
	
	// 1. 폼 전송되는 name 과 addr 을 추출한다.
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");

	// MemberDto 객체에 회원 정보를 담고
	MemberDto dto = new MemberDto();
	dto.setName(name);
	dto.setAddr(addr);
	
	// 2. DB에 저장한다.
	MemberDao dao = MemberDao.getInstance();
	
	// 3. MemberDao 객체를 이용해서 DB에 저장을 하고 성공여부를 리턴 받는다.
	boolean isSuccess = dao.insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 추가</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container mt-5">
		<%if(isSuccess){%>
			<p class="alert alert-success">
				<strong><%=name %></strong> 의 정보를 추가했습니다.
				<a class="alert-link" href="list.jsp">확인</a>
			</p>
		<%}else {%>
			<p class="alert alert-danger">
				회원 정보 추가 실패!
				<a class="alert-link" href="insertform.jsp">다시 입력</a>
			</p>
		<%} %>
	</div>
</body>
</html>