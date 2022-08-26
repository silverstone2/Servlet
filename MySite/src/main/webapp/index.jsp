<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/index.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</head>
<body>
	<%--
		navbar.jsp 페이지를 include 하고
		"thisPage" 라는 파라미터 명으로 "file" 이라는 문자열 전달하기
		그러면 navbar.jsp 페이지에서는
		request.getParameter("thisPage")
		또는
		$(param.thisPage } 로 파라미터를 추출할 수 있다.
	 --%>
	<jsp:include page="/WEB-INF/include/navbar.jsp"></jsp:include>
	
	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
     <!-- 케러셀 하단의 표시바 -->
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
  			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4" aria-label="Slide 5"></button>
     	</div>
		<div class="carousel-inner">
			<div class="carousel-item active" data-bs-interval="3000">
				<img src="${pageContext.request.contextPath }/imgs/carousel1.jpg" height="650px" class="d-block w-100" alt="1번 슬라이드">
			</div>
	  		<div class="carousel-item" data-bs-interval="3000">
				<img src="${pageContext.request.contextPath }/imgs/carousel2.jpg" height="650px" class="d-block w-100" alt="2번 슬라이드">
			</div>
	       <div class="carousel-item" data-bs-interval="3000">
	         <img src="${pageContext.request.contextPath }/imgs/carousel3.jpg" height="650px" class="d-block w-100" alt="3번 슬라이드">
	       </div>
	        <div class="carousel-item" data-bs-interval="3000">
	         <img src="${pageContext.request.contextPath }/imgs/carousel4.jpg" height="650px" class="d-block w-100" alt="4번 슬라이드">
	       </div>
	        <div class="carousel-item" data-bs-interval="3000">
	         <img src="${pageContext.request.contextPath }/imgs/carousel5.jpg" height="650px" class="d-block w-100" alt="5번 슬라이드">
	       </div>
     	</div>
     <!-- 케러셀 좌우 버튼 -->
	     <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
	       <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	       <span class="visually-hidden">Previous</span>
	     </button>
	     <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
	       <span class="carousel-control-next-icon" aria-hidden="true"></span>
	       <span class="visually-hidden">Next</span>
	     </button>
   	</div>
	<jsp:include page="/WEB-INF/include/footer.jsp"></jsp:include>
	<script>
</script>
</body>
</html>