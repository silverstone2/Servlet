<%@page import="test.write.dto.WriteDto"%>
<%@page import="test.write.dao.WriteDao"%>
<%@page import="org.json.JSONWriter"%>
<%@page import="test.upload.dao.UploadDao"%>
<%@page import="test.upload.dto.UploadDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//글목록 얻어오기
	List<WriteDto> list=WriteDao.getInstance().getList();
	//JSON 문자열로 변환하기 
	String result=JSONWriter.valueToString(list);
%>
<%-- JSON 문자열을 그대로 client 에게 출력하기  --%>
<%=result%>