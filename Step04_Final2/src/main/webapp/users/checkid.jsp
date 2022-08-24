<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// inputId 라는 파라미터명으로 전달되는 문자열 읽어오기
	String inputId=request.getParameter("inputId");
	// dto 는 null 일수도 있고 아닐수도 있다 
	UsersDto dto=UsersDao.getInstance().getData(inputId);	
%>    
<%if(dto==null){ %>
	{"isExist":false}
<%}else{ %>
	{"isExist":true}
<%}%>

<%--
	if문에서 {"isExist":false} 뒤에 ; 를 붙이면 jsp 변환하는 과정에서 error 가 발생한다.(즉, json 형식에 어긋남)
	{"isExist":false} 에서 isExist 를 " 로 안 감싸도 jsp 변환하는 과정에서 error 가 발생한다.(즉, json 형식에 어긋남)
--%>