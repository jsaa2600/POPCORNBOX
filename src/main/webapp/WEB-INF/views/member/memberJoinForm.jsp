<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="../header.jsp" />

<style>
	#search_p{
		display: none;
	}

	 @media (min-width:768px) {

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
		
		pwTag.addEventListener("blur"				,checkPw,false);		
		pwTag.addEventListener("change"			,checkPw,false);
	  pwTag.addEventListener("keydown"		,checkPw,false);
				
		pwchkTag.addEventListener("blur"		,checkPwchk,false);
 		pwchkTag.addEventListener("change"	,checkPwchk,false);
		pwchkTag.addEventListener("keydown"	,checkPwchk,false);
		
/* 		tel1Tag.addEventListener("blur"		,checkTel,false);
		tel1Tag.addEventListener("change"	,checkTel,false);
		tel1Tag.addEventListener("keydown"	,checkTel,false); */
		
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
				
/* 		$("#selectEmail").change(function(){
			   $("#selectEmail option:selected").each(function () {
					
					if($(this).val()== '0'){ //직접입력일 경우
						 $("#email").val('');                        //값 초기화
						 $("#email").attr("disabled",false); //활성화
					}else{ //직접입력이 아닐경우
						 $("#email").val($(this).text());      //선택값 입력
						 $("#email").attr("disabled",true); //비활성화
					}
			   });
			}); */
		
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
					/* obj.nextElementSibling.innerHTML = msg;
					if(!obj.classList.contains("valid-feedback")) {
						obj.nextElementSibling.classList.add("valid-feedback");
						obj.nextElementSibling.classList.remove("invalid-feedback");
					} */
				}
			}else{
				if(!obj.classList.contains("is-invalid")) {
					obj.classList.add("is-invalid");
					obj.classList.remove("is-valid")
					/* obj.nextElementSibling.innerHTML = msg;
					if(!obj.classList.contains("invalid-feedback")) {
						obj.nextElementSibling.classList.add("invalid-feedback");
						obj.nextElementSibling.classList.remove("valid-feedback");
					} */
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
			let selectEmailReg = /^[A-Za-z0-9+]{4,12}$/;
			let status = selectEmailReg.test(selectEmailTag.value);
			let msg = "";
			if(status) {
				validFeedback2(selectEmailTag,status,"");
			}else{
				validFeedback2(selectEmailTag,status,"");
			}
			return status;
		}
    // 비밀번호 체크 : 6~10이하, 소문자,숫자,대문자,특수문자가 들어가는 비밀번호		
		function checkPw() {
		  let pwdReg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{6,10}$/;
			let status = pwdReg.test(pwTag.value);
			let msg = "";
			if(status) {
				validFeedback(pwTag,status,"");
			}else{
				validFeedback(pwTag,status,"비밀번호가 잘못되었습니다.");
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
				validFeedback(pwchkTag,status,"비밀번호가 잘못되었습니다.");
			}
			return status;
		}
		
 		//전화번호 체크
 		function checkTel2(){
			let telReg =/^[0-9]*$/;
			let status2 = telReg.test(tel2Tag.value);
			let msg = "";
			
			if(status2) {
				validFeedback2(tel2Tag,status,"");
			}else{
				validFeedback2(tel2Tag,status,"");
				tel2Tag.value.replace(/^[0-9]*$/,"");
			}
			return status2;
		}
 		function checkTel3(){
 			let telReg = /[^0-9]/g;
			let status3 = telReg.test(tel3Tag.value);
			let msg = "";
			if(status3) {
				validFeedback2(tel3Tag,status,"");
			}else{
				validFeedback2(tel3Tag,status,"");
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
      if(status) {
    	  validFeedback(genderTag[0].parentElement.parentElement,status,"");
      }else{
    	  validFeedback(genderTag[0].parentElement.parentElement,status,"성별 선택하세요!");
      }		
      return status;
		}
		
		//별칭 체크
		function checkNickname() {
      let status = nicknameTag.value.trim().length != 0;
      //console.log(nicknameTag.value, status);
      if(status) {
    	  validFeedback(nicknameTag,status,"");
      }else{
    	  validFeedback(nicknameTag,status,"별칭을 입력하세요!");
      }			
      return status;
		}
				
		//가입하기 버튼 클릭시
		function joinBtnf(e) {
			e.preventDefault();
			
			let result = checkId() && checkEmail() && checkPw() && 
									 checkPwchk() && checkTel() && checkGender() && checkNickname();
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
          <form:label path="id" cssClass="label">아이디</form:label>
          <form:input type="text" cssClass="form-control" path="id" placeholder="영문/숫자 조합" required="required"/>
          <form:errors path="id" cssClass="errMsg"></form:errors>
          <div class=""></div>
        </div>
      </div>
      <div class="form-row">
        <div class="col mb-4 mx-auto">
          <form:label path="email" cssClass="label">이메일</form:label>
          <div class="row mx-auto">

          <form:input path="email" type="text" cssClass="form-control col-4" placeholder="ID" required="required"/>
          <span class="mx-1">@</span>
          <form:input path="selectEmail" type="text" cssClass="form-control col-4" placeholder="직접입력" required="required"/>
          <select class="custom-select col-3" id="selectEmail2" >
          	<option value="0">-이메일 선택-</option>
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
          <form:label path="pw" cssClass="label">비밀번호</form:label>
          <form:password cssClass="form-control" path="pw" placeholder="6자리 이상 영문/숫자 포함" required="required"/>
          <form:errors path="pw" cssClass="errMsg"></form:errors>
          <div class=""></div>
        </div>
      </div>
      <div class="form-row">
        <div class="col mb-4 mx-auto">
          <label for="pwChk" class="label">비밀번호 확인</label>
          <input type="password" class="form-control" id="pwChk" name="pwChk" placeholder="6자리 이상 영문/숫자 포함" required>
          <div class=""></div>
        </div>
      </div>
      <div class="form-row">
        <div class="col mb-4 mx-auto">
          <form:label path="tel1" cssClass="label">전화번호</form:label>
          <div class="row mx-auto" id="telDiv">
          <select class="custom-select col" name="tel1" id="tel1">
	          <option value="010">010</option>
	          <option value="011">011</option>
	          <option value="016">016</option>
	          <option value="017">017</option>
	          <option value="018">018</option>
	          <option value="019">019</option>
          </select>

          <span class="col-1">-</span>
          <form:input type="text" cssClass="form-control col-3" path="tel2" maxlength="4" required="required"/>
          <span class="col-1">-</span>
          <form:input type="text" cssClass="form-control col-3" path="tel3" maxlength="4" required="required"/>

          <span class="col-1 text-center">-</span>
          <form:input type="text" cssClass="form-control col" path="tel2" placeholder="" maxlength="4" required="required"/>
          <span class="col-1 text-center">-</span>
          <form:input type="text" cssClass="form-control col" path="tel3" placeholder="" maxlength="4" required="required"/>

          </div>
          <form:errors path="tel3" cssClass="errMsg"></form:errors>
          <div class=""></div>
        </div>
      </div>
      <div class="form-row">
        <div class="col mb-2 mx-auto">
            <form:label path="gender" cssClass="label">성별</form:label>
            <div id="gender">
              <form:radiobuttons items="${gender }" cssClass="form-check-label ml-2" path="gender" itemValue="code" itemLabel="label"/>
            </div>
            <form:errors path="gender" cssClass="errMsg"></form:errors>
          </div>
        </div>
        <div class="form-row">
        <div class="col mb-5 mx-auto">
          <form:label path="nickname" cssClass="label">닉네임</form:label>
          <form:input type="text" cssClass="form-control" path="nickname" placeholder="Nickname" required="required"/>
          <form:errors path="nickname" cssClass="errMsg"></form:errors>
          <div class=""></div>
      </div >
    </div>
    <div class="form-row ">
    <div class="col mx-auto">
    	<input class="btn btn-lg btn-dark btn-block label" id="joinBtn" type="button" value="S I G N &nbsp; U P">
    </div> 
     </div>
    </form:form>
  </div>
</div>
  
<jsp:include page="../footer.jsp"/>