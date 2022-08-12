<%@page import="java.util.List"%>
<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");
	MemberDao dao = MemberDao.getInstance();
	
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");

	
	MemberDto dto = new MemberDto();
	dto.setName(name);
	dto.setAddr(addr);
	
	boolean isSuccess = dao.insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 추가</title>
</head>
<body>
	<%if(isSuccess){%>
		<script>
			alert("회원정보가 추가되었습니다.");
			location.href = 'list.jsp';
		</script>
	<%}else {%>
		<script>
			alert("추가 실패!");
			location.href = 'insertform.jsp'	
		</script>
	<%} %>
</body>
</html>