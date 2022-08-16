<%@page import="test.todo.dto.TodoDto"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 한글 깨짐 방지
	request.setCharacterEncoding("utf-8");

	// 1. 수정할 회원 번호 읽어오기
	int num = Integer.parseInt(request.getParameter("num"));
	String content = request.getParameter("content");
	String regdate = request.getParameter("regdate");
	
	TodoDto dto = new TodoDto(num, content, regdate);
	// 2. DB에서 회원정보 수정
	boolean isSuccess = TodoDao.getInstance().update(dto);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(isSuccess){%>
		<script>
			alert("일정이 수정되었습니다.");
			location.href = 'list.jsp';
		</script>
	<%}else {%>
		<script>
			alert("일정 수정 실패!");
			location.href = 'updateform.jsp'	
		</script>
	<%} %>
</body>
</html>