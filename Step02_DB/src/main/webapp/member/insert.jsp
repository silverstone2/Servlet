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