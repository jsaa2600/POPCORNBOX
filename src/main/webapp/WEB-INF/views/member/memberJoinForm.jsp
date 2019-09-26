<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../header.jsp" />

<style>
	#search_p{
		display: none;
	}
	.btn-group{
		width: 100%;
	}
	.form-control{
		border: 1px solid #fff;
	}
  @media (min-width:768px) {
		.container-fluid{
			width: 680px;
		}
	}
</style>

<script>
(function(){
	window.addEventListener("load", init, false);
	function init() {
		let idTag 			= document.getElementById("id");
		let emailTag 		= document.getElementById("email");
		let selectEmailTag 		= document.getElementById("selectEmail");
		let sEmailTag2 		= document.getElementById("selectEmail2");
		let pwTag 			= document.getElementById("pw");
		let pwchkTag 		= document.getElementById("pwChk");
	  let tel1Tag  		= document.getElementById("tel1");
	  let tel2Tag  		= document.getElementById("tel2");
	  let tel3Tag  		= document.getElementById("tel3");
		let regionTag 	= document.getElementById("region");
		let genderTag 	= document.getElementsByName("gender");
		let nicknameTag = document.getElementById("nickname");
		let joinBtn     = document.getElementById("joinBtn");
		
	 
		idTag.addEventListener("blur"				,checkId,false);		
		idTag.addEventListener("change"			,checkId,false);
		idTag.addEventListener("keydown"		,checkId,false);
		emailTag.addEventListener("blur"				,checkEmail,false);		
		emailTag.addEventListener("change"			,checkEmail,false);
		emailTag.addEventListener("keydown"		,checkEmail,false);
		
		selectEmailTag.addEventListener("blur"				,checkSEmail,false);	
		selectEmailTag.addEventListener("change"			,checkSEmail,false);
		selectEmailTag.addEventListener("keydown"		,checkSEmail,false);
	
		sEmailTag2.addEventListener("blur"				,checksEmailTag2,false);	
		sEmailTag2.addEventListener("change"			,checksEmailTag2,false);
		sEmailTag2.addEventListener("keydown"		,checksEmailTag2,false);
		
		pwTag.addEventListener("blur"				,checkPw,false);		
		pwTag.addEventListener("change"			,checkPw,false);
	  pwTag.addEventListener("keydown"		,checkPw,false);
				
		pwchkTag.addEventListener("blur"		,checkPwchk,false);
 		pwchkTag.addEventListener("change"	,checkPwchk,false);
		pwchkTag.addEventListener("keydown"	,checkPwchk,false);
		
		tel2Tag.addEventListener("blur"		,checkTel2,false);
		tel2Tag.addEventListener("change"	,checkTel2,false);
		tel2Tag.addEventListener("keydown"	,checkTel2,false);
		
		tel3Tag.addEventListener("blur"		,checkTel3,false);
		tel3Tag.addEventListener("change"	,checkTel3,false);
		tel3Tag.addEventListener("keydown"	,checkTel3,false);
		
		
		Array.from(genderTag).forEach(function(item) {
			item.addEventListener("blur"	,checkGender,false);
			item.addEventListener("change",checkGender,false);
		});
		
		nicknameTag.addEventListener("blur"		,checkNickname,false);
		nicknameTag.addEventListener("change"	,checkNickname,false);
		nicknameTag.addEventListener("keydown",checkNickname,false);
		
		joinBtn.addEventListener("click",joinBtnf,false);
		
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
			
		function validFeedback2(obj, result) {
			if(result){
				if(!obj.classList.contains("is-valid")) {
					obj.classList.add("is-valid");
					obj.classList.remove("is-invalid")
				}
			}else{
				if(!obj.classList.contains("is-invalid")) {
					obj.classList.add("is-invalid");
					obj.classList.remove("is-valid")
				}
			}
		}
			
			
		
		//아이디
 		function checkId() {
			let emailReg = /^[A-Za-z0-9+]{4,12}$/;
			let status = emailReg.test(idTag.value);
			let msg = "";
			if(status) {
				validFeedback(idTag,status,"");
			}else{
				validFeedback(idTag,status,"아이디를 올바르게 입력하세요.");
			}
			return status;
		}
		
		//이메일1
		function checkEmail(){
			let emailReg = /^[A-Za-z0-9+]{4,12}$/;
			let status = emailReg.test(emailTag.value);
			let msg = "";
			if(status) {
				validFeedback2(emailTag,status,"");
			}else{
				validFeedback2(emailTag,status,"");
			}
			return status;
		}
		
		//이메일2
		function checkSEmail(){
			let selectEmailReg = /[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{1,5}$/;
			let status = selectEmailReg.test(selectEmailTag.value);
			let msg = "";
	
	 		if(status) {
				validFeedback2(selectEmailTag,status,"");
			}else{
				validFeedback2(selectEmailTag,status,"");
			} 
			return status;
			
		}
		
		//이메일Select
		function checksEmailTag2(){
		
			//수정필요
		    $("#selectEmail2 option:selected").each(function () {
						if($(this).val()== '0'){ 
							$("#selectEmail").val('');
							$("#selectEmail").attr("readonly",false); 
							
							}else{  
								$("#selectEmail").val($(this).text());
								$("#selectEmail").attr("readonly",true);
						}
       
         });

		}
		
    // 비밀번호 체크 : 6~10이하,소문자,숫자,대문자,특수문자가 들어가는 비밀번호		
		function checkPw() {
		  let pwdReg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{6,10}$/;
			let status = pwdReg.test(pwTag.value);
			let msg = "";
			if(status) {
				validFeedback(pwTag,status,"");
			}else{
				validFeedback(pwTag,status,"비밀번호를 올바르게 입력하세요.");
			}
			return status;
		}
		// 비밀번호 확인체크
		function checkPwchk() {
      let pwdReg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{6,10}$/;
			let status = pwdReg.test(pwchkTag.value) && pwTag.value == pwchkTag.value;
			let msg = "";
			if(status) {
				validFeedback(pwchkTag,status,"");
			}else{
				validFeedback(pwchkTag,status,"비밀번호를 올바르게 입력하세요.");
			}
			return status;
		}
		
 		//전화번호 체크
 		function checkTel2(){
			let telReg =/\d{3,4}$/;
			let status2 = telReg.test(tel2Tag.value);
			
			if(status2) {
				validFeedback2(tel2Tag,status2,"");
			}else{
				validFeedback2(tel2Tag,status2,"");
			}
			return status2;
		}
 		function checkTel3(){
 			let telReg =/\d{4}$/;
			let status3 = telReg.test(tel3Tag.value);

			if(status3) {
				validFeedback2(tel3Tag,status3,"");
			}else{
				validFeedback2(tel3Tag,status3,"");
			}
			return status3;
 		
		}
		
	 
		//성별 체크
		function checkGender() {
			let status = false;
			Array.from(genderTag).forEach(function(item){
				if(item.checked) {
					status = true;
				}
			});
  /*     if(status) {
    	  validFeedback(genderTag[0].parentElement.parentElement,status,"");
      }else{
    	  validFeedback(genderTag[0].parentElement.parentElement,status,"성별을 선택해주세요.");
      }	 */	
      return status;
		}
		
		//별칭 체크
		function checkNickname() {
      let status = nicknameTag.value.trim().length != 0;
      if(status) {
    	  validFeedback(nicknameTag,status,"");
      }else{
    	  validFeedback(nicknameTag,status,"닉네임을 입력해주세요.");
      }			
      return status;
		}
				
		//가입하기 버튼 클릭시
		function joinBtnf(e) {
			e.preventDefault();
			
			let result = checkId() && checkEmail() && checkSEmail() && checkPw() && 
									 checkPwchk() && checkTel2() && checkTel3() && checkGender() && checkNickname();
			if(result) {
      	alert('회원 가입이 정상적으로 처리되었습니다.');
      	document.getElementById("mdto").submit();
			}
		}				
	}	
})();
</script>

<div class="container-fluid">
	<div class="content_wrap">
    <form:form class="formTotal" modelAttribute="mdto" action="${pageContext.request.contextPath }/member/memberJoin">
    <div class="form-row">
    	<div class="mb-5 mx-auto text-center"><h1 class="gradient_text">❝ 회 원 가 입 ❞</h1></div>
    </div>
    <div class="form-row">
        <div class="col mb-4 mx-auto">
          <form:label path="id" cssClass="label text-light">아이디</form:label>
          <form:input type="text" cssClass="form-control" path="id" placeholder="영문/숫자 조합" required="required"/>
          <form:errors path="id" cssClass="errMsg"></form:errors>
          <div class=""></div>
        </div>
      </div>
      <div class="form-row">
        <div class="col mb-4 mx-auto">
          <form:label path="email" cssClass="label text-light">이메일</form:label>
          <div class="row mx-auto">
          <form:input path="email" type="text" cssClass="form-control col" placeholder="ID" required="required"/>
          <span class="col-0 mx-1">@</span>
          <form:input path="selectEmail" type="text" cssClass="form-control col mr-2" placeholder=".com" required="required"/>
          <select class="custom-select col border-white" id="selectEmail2" >
          	<option value="0">-직접입력-</option>
          	<option value="naver.com">naver.com</option>
          	<option value="gmail.com">gmail.com</option>
          	<option value="daum.net">daum.net</option>
          	<option value="nate.com">nate.com</option>
          	<option value="yahoo.com">yahoo.com</option>
          </select>
          <!-- <div class=""></div> -->
          </div>
        </div>
      </div>
      <div class="form-row">
        <div class="col mb-4 mx-auto">
          <form:label path="pw" cssClass="label text-light">비밀번호</form:label>
          <form:password cssClass="form-control" path="pw" placeholder="6자리 이상 영문/숫자 포함" required="required"/>
          <form:errors path="pw" cssClass="errMsg"></form:errors>
          <div class=""></div>
        </div>
      </div>
      <div class="form-row">
        <div class="col mb-4 mx-auto">
          <label for="pwChk" class="label text-light">비밀번호 확인</label>
          <input type="password" class="form-control" id="pwChk" name="pwChk" placeholder="6자리 이상 영문/숫자 포함" required>
          <div class=""></div>
        </div>
      </div>
      <div class="form-row">
        <div class="col mb-4 mx-auto">
          <form:label path="tel1" cssClass="label text-light">전화번호</form:label>
          <div class="row mx-auto" id="telDiv">
          <select class="custom-select col border-white" name="tel1" id="tel1">
	          <option value="010">010</option>
	          <option value="011">011</option>
	          <option value="016">016</option>
	          <option value="017">017</option>
	          <option value="018">018</option>
	          <option value="019">019</option>
          </select>
          <span class="col-1 text-center">-</span>
          <form:input type="text" cssClass="form-control col" path="tel2" maxlength="4" required="required"/>
          <span class="col-1 text-center">-</span>
          <form:input type="text" cssClass="form-control col" path="tel3" maxlength="4" required="required"/>
          </div>
          <form:errors path="tel3" cssClass="errMsg"></form:errors>
          <div class=""></div>
        </div>
      </div>
      <div class="form-row">
       	<div class="col mb-4 mx-auto">
           <div><label for="gender" class="label text-light">성별</label></div>
					<div class="btn-group btn-group-toggle" data-toggle="buttons">
					  <label class="btn btn-light border-white">
					    <input type="radio" name="gender" id="gender1" value="남" autocomplete="off" checked> 남성
					  </label>
					  <label class="btn btn-light border-white">
					    <input type="radio" name="gender" id="gender2" value="여" autocomplete="off"> 여성
					  </label>
					</div>
       	</div>
       </div>
        
        <div class="form-row">
        <div class="col mb-5 mx-auto">
          <form:label path="nickname" cssClass="label text-light">닉네임</form:label>
          <form:input type="text" cssClass="form-control" path="nickname" placeholder="Nickname" required="required"/>
          <form:errors path="nickname" cssClass="errMsg"></form:errors>
          <div class=""></div>
      </div>
    </div>
    <div class="form-row ">
    <div class="col mx-auto">
    	<input class="btn btn-lg btn-bl btn-block label" id="joinBtn" type="button" value="S I G N &nbsp; U P">
    </div> 
     </div>
    </form:form>
  </div>
</div>
  
<jsp:include page="../footer.jsp"/>