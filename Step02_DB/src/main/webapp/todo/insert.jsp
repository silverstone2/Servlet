<%@page import="test.todo.dto.TodoDto"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// post 방식 한글 깨짐 방지
	request.setCharacterEncoding("utf-8");

	// 1.content와 date를 추출
	String content = request.getParameter("content");
	
	TodoDto dto = new TodoDto();
	dto.setContent(content);
	
	// 2. DB에 저장후 리턴
	boolean isSuccess = TodoDao.getInstance().insert(dto);
	
	// 3. 응답
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>할 일 목록 추가</title>
</head>
<body>
	<%if(isSuccess){%>
		<script>
			alert("일정이 추가되었습니다.");
			location.href = 'list.jsp';
		</script>
	<%}else {%>
		<script>
			alert("일정 추가 실패!");
			location.href = 'insertform.jsp'	
		</script>
	<%} %>
</body>
</html>