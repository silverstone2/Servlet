<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	List<String> list=new ArrayList<String>();
	list.add("김구라");
	list.add("해골");
	list.add("원숭이");
	list.add("주뎅이");
	list.add("덩어리");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>frined_list.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" />
</head>
<body>
	<p class="alert alert-primary">친구 목록</p>
	<ul>
	<% 
		for(String name : list) {
			out.write("<li>"+name+"</li>");
			out.write("\r\n");
		}
	%>
	</ul>
	<<h1>친구 목록입니다.</h1>
	<ul>
		<%for(String tmp:list) {%>
			<li><%=tmp %></li>
		<%} %>
	</ul>
	<!-- 밑에 있는 방법으로 코딩을 생활화하자 -->
</body>
</html>