<%@page import="java.util.ArrayList"%>
<%@page import="test.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //DB 에서 불러온 회원 목록이라고 가정하자
   List<MemberDto> list=new ArrayList<>();
   list.add(new MemberDto(1, "김구라", "노량진"));
   list.add(new MemberDto(2, "해골", "행신동"));
   list.add(new MemberDto(3, "원숭이", "상도동"));
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/list.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" />
</head>
<body>
<div class="container">
   <h1>회원 목록 입니다.</h1>
   <table class="table table-striped">
      <thead class="table-dark">
         <tr>
            <th>번호</th>
            <th>이름</th>
            <th>주소</th>
         </tr>
      </thead>
      <tbody>
      <%for(MemberDto tmp:list){ %>
         <tr>
            <td><%=tmp.getNum() %></td>
            <td><%=tmp.getName() %></td>
            <td><%=tmp.getAddr() %></td>
         </tr>
      <%} %>
      </tbody>
   </table>
</div>
</body>
</html>








