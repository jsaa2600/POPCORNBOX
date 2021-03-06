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
		var deleteBtn=document.getElementById("deleteBtn");
		deleteBtn.addEventListener("click",deleteBtnF,false);
		
		pwTag= document.getElementById("pw");
		
		function validFeedback(obj, result, msg) {
			if(result){
				if(!obj.classList.contains("is-valid")) {
					obj.classList.add("is-valid");
					obj.classList.remove("is-invalid")
					obj.nextElementSibling.innerHTML = msg;
					if(!obj.classList.contains("valid-feedback")) {
						obj.nextElementSibling.classList.add("valid-feedback");
						obj.nextElementSibling.classList.remove("invalid-feedback");
					}
				}
			}else{
				if(!obj.classList.contains("is-invalid")) {
					obj.classList.add("is-invalid");
					obj.classList.remove("is-valid")
					obj.nextElementSibling.innerHTML = msg;
					if(!obj.classList.contains("invalid-feedback")) {
						obj.nextElementSibling.classList.add("invalid-feedback");
						obj.nextElementSibling.classList.remove("valid-feedback");
					}
				}
				if(obj.id != "pwchk") {
					obj.focus();
				}
			}
		}
		
		function deleteBtnF(){
		
			//유효성 체크
			let pwdReg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{6,10}$/;
			let status = pwdReg.test(pwTag.value);
			let msg = "";
			if(status) {
				validFeedback(pwTag,status,"");
			}else{
				validFeedback(pwTag,status,"비밀번호를 올바르게 입력하세요.");
			}
			return status;

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
		<button class="btn btn-lg btn-primary btn-block" id="deleteBtn" type="submit">회원탈퇴</button>
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