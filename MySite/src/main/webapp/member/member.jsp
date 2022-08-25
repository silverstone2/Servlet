<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/include/navbar.jsp"></jsp:include>
	<div class="container">
		<h1>회원 전용 공간입니다.</h1>
		<ul>
			<li><a href="/MySite/index.jsp">Home</a></li>
			<li><a href="game.jsp">game</a></li>
			<li><a href="study.jsp">study</a></li>
		</ul>
	</div>
	<jsp:include page="/WEB-INF/include/footer.jsp"></jsp:include>
</body>
</html>