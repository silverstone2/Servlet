<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" />
</head>
<body>
<div class = "container">
	<h1>목록 추가, 삭제, 수정, 불러오기</h1>
	<ul>
		<li><a href="member/list.jsp">회원 목록 보기</a></li>
		<li><a href="todo/list.jsp">할일 목록 보기</a></li>
	</ul>
</div>
</body>
</html>


<!-- 
	1. MemberDto 클래의 insert 메소드를 완성해 보세요
	2. /member/insert.jsp 페이지를 만들고
		해당 페이지로 전송되는 회원의 이름과 주소를
		MemberDao 객체를 이용해서 DB에 저장하고
		성공여부를 클라이언트에게 응답하도록 해보세요
		
		또한 확인 링크나 버튼을 누르면 회원 목록페이지가 다시 나오도록 해보세요
 -->