<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp"/>
<style>
	.errMsg{
		color: red;
	}
</style>
<script>
	window.addEventListener("load", init,false);
	function init(){
		var loginBtn=document.getElementById("loginBtn");
		loginBtn.addEventListener("click",loginBtnF,false);
		
		function loginBtnF(){
		
			//유효성 체크
			//2)비번
			if(pwTag.value.length>5){
				pwTag.nextElementSibling.innerText="비밀번호를 올바르게 입력해주세요.";
				return false;
			}

			var result=confirm("회원 탈퇴 하시겠습니까?");
			if(result){
				//양식을 서버에 전송
				document.getElementById("frm").submit();
				
				}else{
					return false;
				}
			}
		}

</script>
<div class="container-fluid">
<div class="row justify-content-center my-5">
<div class="col-sm-4">
	<form class="form-signin" id="frm" action="${pageContext.request.contextPath}/member/memberDelete" method="post">
		<div class="text-center mb-4">
			<img class="mb-4" src="/docs/4.3/assets/brand/bootstrap-solid.svg"
				alt="" width="72" height="72">
			<h1 class="h3 mb-3 font-weight-nomal">회 원 탈 퇴</h1>
		</div>

		<div class="form-label-group mb-3">
		<label for="inputEmail">아이디</label>
			<input type="email" id="id" name="id" class="form-control"
				placeholder="ID@test.com" readOnly value="${memberDTO.id }"/> 
				<p class="errMsg small"></p>
		</div>

		<div class="form-label-group mb-3">
		<label for="inputPassword">비밀번호</label>
			<input type="password" id="pw" name="pw" class="form-control"
				placeholder="6자리 이상 영문/숫자 포함" required>
				<p class="errMsg small"></p> 
		</div>
		<button class="btn btn-lg btn-primary btn-block" id="loginBtn" type="submit">회원탈퇴</button>
		<div class="d-flex justify-content-center my-3">
			<div class="col-sm-4">
				<a href="${pageContext.request.contextPath}/" class="text-decoration-none text-muted">홈으로</a>
			</div>
		</div>
	</form>
</div>
</div>
</div>
   <jsp:include page="../footer.jsp"/>