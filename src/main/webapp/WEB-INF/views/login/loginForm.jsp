<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" />
<style>
	#search_p{
		display: none;
	}
@media (min-width:768px) {
	.container-fluid{
		width: 560px;
	}
}
</style>
<script>
	window.addEventListener("load", init,false);
	function init(){
		var loginBtn=document.getElementById("loginBtn");
		loginBtn.addEventListener("click",loginBtnF,false);
		
		function loginBtnF(){
		
			//유효성 체크
			var idTag=document.getElementById("id");
			var pwTag=document.getElementById("pw");
			var result="${result}";
			
			//1)아이디
			if(idTag.value.length==0){
				idTag.nextElementSibling.innerText="아이디를 올바르게 입력해주세요.";
		    return false;
			}
			
			//2)비번
			if(pwTag.value.length==0){
				pwTag.nextElementSibling.innerText="비밀번호를 올바르게 입력해주세요.";
				return false;
			}
			
			//양식을 서버에 전송
				document.getElementById("frm").submit();
			
			}
		}

</script>


<div class="container-fluid">
<div class="row justify-content-center content_wrap">
<div class="col">
	<form class="form-signin" id="frm" action="${pageContext.request.contextPath}/login/loginOk" method="post">
		<div class="text-center">
			<img class="mb-4" src="/docs/4.3/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
			<h1 class="mb-5 gradient_text">❝ 로 그 인 ❞</h1>
		</div>

		<div class="form-label-group mb-3">
		<label for="inputEmail" class="label text-light">아이디</label>
			<input type="text" id="id" name="id" class="form-control"
				placeholder="아이디" required autofocus> 
				<p class="errMsg small"></p>
		</div>

		<div class="form-label-group">
		<label for="inputPassword" class="label text-light">비밀번호</label>
			<input type="password" id="pw" name="pw" class="form-control"
				placeholder="6자리 이상 영문/숫자/특수문자 포함" required>
				<p class="errMsg small"></p> 
		</div>

		<div class="checkbox mb-4 ml-1 label text-light">
			<label>로그인 유지 <input type="checkbox" value="remember-me"></label>
		</div>
		<button class="btn btn-lg btn-bl btn-block label" id="loginBtn" type="submit">L O G I N</button>
		<div class="d-flex justify-content-center my-3 text-center">
			<div class="col">
				<a href="#" class="text-decoration-none text-light label_s">아이디/비밀번호 찾기</a>
				<span class="text-light label_s mx-2">|</span>
				<a href="${pageContext.request.contextPath}/member/memberJoinForm" class="text-decoration-none text-light label_s">회 원 가 입</a>
			</div>
		</div>
	</form>
</div>
</div>
</div>

<jsp:include page="../footer.jsp" />