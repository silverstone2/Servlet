<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	request.setCharacterEncoding("utf-8");
	/*
		폼 전송되는 모든 내용을 추출해서 아래에 정보를 출력한다.
	*/
	// 입력한 이메일
	String email = request.getParameter("email");
	// 입력한 코멘트
	String comment = request.getParameter("comment");
	// 선택한 직업
	String job = request.getParameter("job");
	// 체크한 관심사
	String[] concern = request.getParameterValues("concern");
	// 만일 concern 이 null 이라면
	if(concern == null) {
		concern = new String[0]; // 번 배열의 참조값을 넣어준다.
	}
	// 체크한 성별
	String gender = request.getParameter("gender");
	// String[] 을 List<String> 으로 변환하기
	// 변환하면 .contains() 메소드를 활용할 수 있다.
	List<String> list = Arrays.asList(concern);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/signup.jsp</title>
</head>
<body>
<div class="container">
	<h1>전송된 정보는 아래와 같습니다.</h1>
	<div>
		<label for="email">이메일</label>
		<input type="text" name="email" id="email" value="<%=email %>"/>
	</div>
	<div>
		<label for="comment">할 말</label>
		<textarea name="comment" id="comment"><%=comment %></textarea>
	</div>
	<div>
		<label for="job">직업</label>
		<select name="job" id="job">
			<option value="">선택</option>
			<option value="programmer" <%=job.equals("programmer") ? "selected" : "" %>>프로그래머</option>
			<option value="teacher" <%=job.equals("teacher") ? "selected" : "" %>>선생님</option>
			<option value="doctor" <%=job.equals("doctor") ? "selected" : "" %>>의사</option>
			<option value="etc" <%=job.equals("etc") ? "selected" : "" %>>기타</option>
		</select>
	</div>
	<div>
		<fieldset>
			<legend>관심사 체크</legend>
			<label>
				<input type="checkbox" name="concern" value="reading" <%=list.contains("reading") ? "checked" : ""%>/>
				독서
			</label>
			<label>
				<input type="checkbox" name="concern" value="game" <%=list.contains("game") ? "checked" : ""%>/>
				게임
			</label>
			<label>
				<input type="checkbox" name="concern" value="cooking" <%=list.contains("cooking") ? "checked" : ""%>/>
				요리
			</label>
		</fieldset>
	</div>
	<div>
		<fieldset>
			<legend>성별 체크</legend>
			<label>
				<input type="radio" name="gender" value="man" <%=gender.equals("man") ? "checked" : ""%>/>
				남자
			</label>
			<label>
				<input type="radio" name="gender" value="woman" <%=gender.equals("woman") ? "checked" : ""%>/>
				여자
			</label>
		</fieldset>
	</div>
</div>
</body>
</html>