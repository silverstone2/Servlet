<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="test.util.DbcpBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// MemberDao 객체의 참조값을 얻어와서
	MemberDao dao = MemberDao.getInstance();
	// 회원목록을 얻어온다.
	List<MemberDto> list = dao.getList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/list.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" />
</head>
<body>
<div class="container">
	<a href="insertform.jsp">회원 추가</a>
	<h1>회원 목록입니다.</h1>
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>주소</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<%for(MemberDto tmp:list) { %>
				<tr>
					<td><%=tmp.getNum() %></td>
					<td><%=tmp.getName() %></td>
					<td><%=tmp.getAddr() %></td>
					<td>
						<a href="updateform.jsp?num=<%=tmp.getNum() %>">수정</a>
						</td>
					<td>
						<a href="delete.jsp?num=<%=tmp.getNum() %>">삭제</a>
					</td>
				</tr>
			<%} %>
		</tbody>
	</table>
</div>
</body>
</html>