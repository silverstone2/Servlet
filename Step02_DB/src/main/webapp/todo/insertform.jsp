<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/todo/insertform.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" />
</head>
<body>
	<div class="container">
	<h1>할일 목록 추가 양식</h1>
	<form action="insert.jsp" method="post">
		<div>
			<label for="content">할 일</label>
			<input type="text" name="content" id="content" />
		</div>
		<br>
		<button type="submit">추가</button>
	</form>
</div>
</body>
</html>