<%@page import="test.todo.dao.TodoDao"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	TodoDto dto = TodoDao.getInstance().getData(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정 수정 양식</title>
</head>
<body>
	<div class="container">
   <h1>회원 수정 폼 입니다.</h1>
	   <form action="update.jsp" method="post">
	      <input type="hidden" name="num" value="<%=dto.getNum()%>"/>
	      <div>
	         <label for="num">번호</label>
	         <input type="text" id="num" value="<%=dto.getNum()%>" disabled/>
	      </div>
	      <div>
	         <label for="content">일정</label>
	         <input type="text" name="content" id="content" value="<%=dto.getContent()%>"/>
	      </div>
	      <div>
	         <label for="regdate">시간</label>
	         <input type="text" name="regdate" id="regdate" value="<%=dto.getRegdate()%>" disabled/>
	      </div>
	      <br>
	      <button type="submit">수정</button>
	      <button type="reset">취소</button>
	   </form>
	</div>
</body>
</html>