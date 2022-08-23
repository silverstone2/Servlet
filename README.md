# WebStudy
## 2022-08-11
- local server 구동 및 Servlet<br>
  File : https://github.com/silverstone2/Web/tree/main/Hello/src/main/webapp
-----------------------------------------
## 2022-08-12
- DB 연동
-----------------------------------------
## 2022-08-16
- index page에서 다른 jsp 파일들을 불러와 web에 출력
-----------------------------------------
## 2022-08-17
- bootstrap을 활용한 web design
-----------------------------------------
## 2022-08-18
- 
-----------------------------------------
## 2022-08-19
- 
-----------------------------------------
## 2022-08-22
- QuantumDB Plugin을 활용한 다른 방식의 DB 연동 & Form 
- 클라이언트 웹브라우저에서 서버에 요청을 하는 방법
1. 링크를 누른다 (Get 방식 요청)
2. 폼을 제출(전송)(Get of Post 방식)
3. javascript로 페이지 전환없이 ajax 요청을 할 수 있다.

회원가입폼 signup_form.jsp
가입 signup.jsp
로그인폼 login_form.jsp
로그인 login.jsp

로그아웃 logout.jsp

(javascript는 일단 무시하고 동작의 흐름을 따라가 보세요)


이클립스에서 DB에 접속할때 좀더 편하게 접근할 수 있는 플러그인 설치
1. http://quantum.sourceforge.net/ 접속하여 http://quantum.sourceforge.net/update-site 복사하기
2. eclipse 에서 help - install new software 클릭 후 아까 복사한 주소 붙여넣기 후 enter
3. 제일 위에 core만 체크 후 넘기기
4. license accept 누른 후 끝내기

----------------------------------------------------------------
## 2022-08-23

context path 을 얻어내는 두가지 방법

	1. java code 영역 : HttpServletRequest 객체의 .getContextPath() 메소드를 호출하면 context path 가 문자열로 리턴된다.


	2. jsp 페이지 에서 html 영역 : EL 을 이용하면 클라이언트 웹브라우저에 출력할 수 있다
		          		  $(pageContext.request.contextPath )

LoginFilter에서 Redirect는 요청을 다시하라는 강요의 응답

파일을 업로드 한다고 생각을 해보면
업로드된느 파일의 정보는

	1. 파일의 이름
	2. 실제 파일 데이터(byte 알갱이)
	3. 파일의 크기

[ 페이징 처리하는 방법]

1. 정렬하기
2. 행번호 붙이기
3. 원하는 범위의 행번호를 이용해서 SELECT 하기
