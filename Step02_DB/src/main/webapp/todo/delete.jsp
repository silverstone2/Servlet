<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 한글 깨짐 방지
	request.setCharacterEncoding("utf-8");

	// 1. 삭제할 회원 번호 읽어오기
	int num = Integer.parseInt(request.getParameter("num"));
	
	// 2. DB에서 회원정보 삭제
	boolean isSuccess = TodoDao.getInstance().delete(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 목록 삭제</title>
</head>
<body>
	<%if(isSuccess){%>
		<script>
			alert("일정이 삭제되었습니다.");
			location.href = 'list.jsp';
		</script>
	<%}else {%>
		<script>
			alert("일정 삭제 실패!");
			location.href = 'delete.jsp';
		</script>
	<%} %>
</body>
</html>