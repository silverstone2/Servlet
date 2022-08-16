<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="test.member.dao.MemberDao"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// post 방식 전송 파라미터 추출할 때 한글 깨짐 방지
	request.setCharacterEncoding("utf-8");

	// 1. get 방식 파라미터로 전달되는 삭제할 회원의 번호를 읽어온다.
	int num = Integer.parseInt(request.getParameter("num"));

	// 2. DB에서 해당 회원의 정보를 삭제한다.
	boolean isSuccess = MemberDao.getInstance().delete(num);
	// 3. 응답한다.

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 삭제</title>
</head>
<body>
	<%if(isSuccess){%>
		<p>
			<strong><%=num %></strong> 번 회원의 정보를 삭제했습니다.
			<a href="list.jsp">확인</a>
		</p>
	<%}else {%>
		<p>
			삭제 실패! <a href="delete.jsp">다시 시도
		</p>
	<%} %>
</body>
</html>