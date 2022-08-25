<%@page import="test.user.dao.UserDao"%>
<%@page import="test.user.dto.UserDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// inputId 라는 파라미터명으로 전달되는 문자열 읽어오기
	String inputId=request.getParameter("inputId");
	// dto 는 null 일수도 있고 아닐수도 있다 
	UserDto dto=UserDao.getInstance().getData(inputId);	
%>    
<%if(dto==null){ %>
	{"isExist":false}
<%}else{ %>
	{"isExist":true}
<%}%>
