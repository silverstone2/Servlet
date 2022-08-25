<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

	<nav class="navbar navbar-light bg-light navbar-expand-lg">
		<div class="container-fluid">
		    <a class="navbar-brand" href="${pageContext.request.contextPath}/">
		      	<img src="./imgs/airplane_icon.jpg" alt="" width="50" height="34" class="d-inline-block align-text-top">
		      	Journey
		    </a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
		    	data-bs-target="#navbarNav">
   				<span class="navbar-toggler-icon"></span>
    		</button>
    		<div class="collapse navbar-collapse  justify-content-between" id="navbarNav">
      			<ul class="nav nav-tabs">
  					<li class="nav-item">
					    <a class="nav-link ${param.thisPage eq 'board' ? 'active' : '' }" aria-current="page" href="${pageContext.request.contextPath}/board/list.jsp">Board</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link ${param.thisPage eq 'member' ? 'active' : '' }" href="${pageContext.request.contextPath}/member/member.jsp">Member</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link ${param.thisPage eq 'gallery' ? 'active' : '' }" href="${pageContext.request.contextPath}/gallery/list.jsp">Gallery</a>
				</ul>
				<ul class=navbar-nav>
					<c:choose>
      				<c:when test="${empty id }">
	      				<a class="btn btn-outline-primary btn-sm me-2" href="${pageContext.request.contextPath}/user/signup_form.jsp">SignUp</a>
	      				<a class="btn btn-outline-success btn-sm me-2" href="${pageContext.request.contextPath}/user/loginform.jsp">Login</a>
      				</c:when>
      				<c:otherwise>
	      				<span class="navbar-text me-2">
	      					<a href="${pageContext.request.contextPath}/user/private/info.jsp">${id }</a> Logging In...
	      				</span>
	      				<a class="btn btn-outline-danger btn-sm me-2" href="${pageContext.request.contextPath}/user/logout.jsp">Logout</a>
      				</c:otherwise>
      			</c:choose>
				</ul>
    		</div>
		</div>
	</nav>
	
	
	
	
	
	
	
	
	
	
	