<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test/form.jsp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<!-- animate css 로딩 -->
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
  />
<style>
   form legend{
      font-size: 1rem;
   }
   .animate__zoomInLeft{
   		animation-duration: 1s;
   		animation-iteration-count: 2;
   }
</style>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-md-6 offset-md-3 animate__animated animate__flipInX">
			   <h1>테스트 폼 입니다.</h1>
			   <form action="signup.jsp" method="post" class="shadow p-3 rounded">
			      <div class="mb-2">
			         <label class="form-label" for="email">이메일</label>
			         <input class="form-control" type="text" name="email" id="email"/>
			      </div>
			      <div class="mb-2">
			         <label class="form-label" for="comment">할말</label>
			         <textarea class="form-control" name="comment" id="comment"></textarea>
			      </div>
			      <div class="mb-2">
			         <label class="form-label" for="job">직업</label>
			         <select class="form-control" name="job" id="job">
			            <option value="">선택</option>
			            <option value="programmer">프로그래머</option>
			            <option value="teacher">선생님</option>
			            <option value="doctor">의사</option>
			            <option value="etc">기타</option>
			         </select>
			      </div>
			      <div class="mb-2">
			         <fieldset>
			            <legend>관심사 체크</legend>
			            <div class="form-check">
			               <label>
			                  <input class="form-check-input" type="checkbox" name="concern" value="reading"/> 
			                  독서
			               </label>   
			            </div>
			            <div class="form-check">
			               <label>
			                  <input class="form-check-input" type="checkbox" name="concern" value="game"/> 
			                  게임
			               </label>
			            </div>
			            <div class="form-check">
			               <label>
			                  <input class="form-check-input" type="checkbox" name="concern" value="cooking"/> 
			                  요리
			               </label>
			            </div>
			         </fieldset>
			      </div>
			      <div class="mb-2">
			         <fieldset>
			            <legend>성별 체크</legend>
			            <div class="form-check form-check-inline">
			               <label>
			                  <input class="form-check-input" type="radio" name="gender" value="man" checked/>
			                  남자
			               </label>
			            </div>
			            <div class="form-check form-check-inline">
			               <label>
			                  <input class="form-check-input" type="radio" name="gender" value="woman"/>
			                  여자
			               </label>
			            </div>
			         </fieldset>
			      </div>
			      <button id="submitBtn" class="btn btn-primary" type="submit">전송</button>
			   </form>
		</div>
	</div>
</div>
<script>
	// 특정 요소에 이벤트가 발생했을 때 실행할 함수 등록
	document.querySelector("#submitBtn").addEventListener("mouseover", function(){
		// 원하는 애니메이션 클래스를 추가해서 애니메이션을 동작시킨다.
		this.classList.add("animate__animated");
		this.classList.add("animate__pulse");
	});
	// 특정 요소에 애니메이션이 끝나느 이벤트가 발생했을 때 실행할 함수 등록
	document.querySelector("#submitBtn").addEventListener("animationend", function(){
		// 추가했던 클래스를 제거해야지만 다음번에 클래스를 추가 했을 때 또 애니메이션이 동작한다.
		this.classList.remove("animate__animated");
		this.classList.remove("animate__pulse");
	});
</script>
</body>
</html>










