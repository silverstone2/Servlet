<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 1. get 방식 파라미터로 전달되는 수정할 회원의 번호를 읽어온다.
	int num = Integer.parseInt(request.getParameter("num"));
	// 2. DB에서 수정할 회원의 정보를 얻어온다
	MemberDto dto = MemberDao.getInstance().getData(num);
	// 3. 수정할 회원의 정보를 form에 출력해서 읍답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 폼</title>
</head>
<body>
	<div class="container">
   <h1>회원 수정 폼 입니다.</h1>
	   <form action="update.jsp" method="post">
	      <input type="hidden" name="num" value="<%=dto.getNum()%>"/>
	      <!-- input type="hidden"은 화면상에 보이지는 않지만 폼을 전송 -->
	      <div>
	         <label for="num">번호</label>
	         <!-- 
	         	번호는 primary key 로 사용이 되기 때문에 수정을 하지 않는다.
	         	그래서 수정할 필요가 없기 때문에 disabled 로 설정한 것이다.
	         	하지만 disabled 로 설정하면 form 전송했을 때 전송도 되지 않는다.
	         	이런 이유 때문에 input type = "hidden"으로 수정할 회원의 번호가
	         	폼 전송될때 같이 전송되도록 해 놓은 것이다.
	          -->
	         <input type="text" id="num" value="<%=dto.getNum()%>" disabled/>
	      </div>
	      <div>
	         <label for="name">이름</label>
	         <input type="text" name="name" id="name" value="<%=dto.getName()%>"/>
	      </div>
	      <div>
	         <label for="addr">주소</label>
	         <input type="text" name="addr" id="addr" value="<%=dto.getName()%>"/>
	      </div>
	      <button type="submit">수정</button>
	      <button type="reset">취소</button>
	   </form>
	</div>
</body>
</html>