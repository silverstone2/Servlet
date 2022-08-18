<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/insertform.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
	<nav class="mt-2">
		<!-- 접속한 경로의 목록을 보여주는 기능 -->
		<ol class="breadcrumb">
			<li class="breadcrumb-item">
		 		<a href="${pageContext.request.contextPath }/index.jsp">Home</a>
            </li>
            <li class="breadcrumb-item">
               <a href="${pageContext.request.contextPath }/member/list.jsp">회원목록</a>
            </li>
			<li class="breadcrumb-item active">회원 추가 페이지</li>
		</ol>
	</nav>
	<h1>회원 추가 폼입니다</h1>
	<form action="${pageContext.request.contextPath }/member/insert.jsp" method="post" class="row g-3">
		<div class="mb-3">
		    <label for="name" class="form-label">이 름</label>
		    <input type="text" class="form-control" name="name" id="name" placeholder="홍길동">
  		</div>
  		<div class="mb-3">
		    <label for="addr" class="form-label">주 소</label>
		    <input type="text" class="form-control" name="addr" id="addr" placeholder="강남역">
		    <br>
		    <button type="submit" class="btn btn-primary btn-sm">추 가</button>
  		</div>
	</form>
</div>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>
