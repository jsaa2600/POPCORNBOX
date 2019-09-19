<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%-- <jsp:include page="../header.jsp"/> --%>
 <meta name="description" content="">
 <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
 <meta name="generator" content="Jekyll v3.8.5">
  <!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/webjars/bootstrap/4.3.1/css/bootstrap.css" rel="stylesheet">
<!-- fontawesome -->
<link href="${pageContext.request.contextPath}/webjars/font-awesome/5.9.0/css/all.css" rel="stylesheet">
<head>
<script>

(function(){
	window.addEventListener("load", init, false);
	function init() {
		let idTag 			= document.getElementById("id");
		let emailTag 		= document.getElementById("email");
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
		
		pwTag.addEventListener("blur"				,checkPw,false);		
		pwTag.addEventListener("change"			,checkPw,false);
	  pwTag.addEventListener("keydown"		,checkPw,false);
				
		pwchkTag.addEventListener("blur"		,checkPwchk,false);
 		pwchkTag.addEventListener("change"	,checkPwchk,false);
		pwchkTag.addEventListener("keydown"	,checkPwchk,false);
		
 	  tel2Tag.addEventListener("keyup",checkTel,false);
 	  tel3Tag.addEventListener("keyup",checkTel,false);
		
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
		
		
		
		//아이디
 	function checkId() {
			let emailReg = /^[A-Za-z0-9+]{4,12}$/;
			let status = emailReg.test(idTag.value);
			let msg = "";
			if(status) {
				validFeedback(idTag,status,"유효성 통과");
			}else{
				validFeedback(idTag,status,"이메일 정보가 잘못되었습니다.");
			}
			return status;
		}
		
		//이메일
		function checkEmail(){
			let emailReg = /^[A-Za-z0-9+]{4,12}$/;
			let status = emailReg.test(emailTag.value);
			let msg = "";
			if(status) {
				validFeedback(emailTag,status,"유효성 통과");
			}else{
				validFeedback(emailTag,status,"이메일 정보가 잘못되었습니다.");
			}
			return status;
		}

    // 비밀번호 체크 : 6~10이하, 소문자,숫자,대문자,특수문자가 들어가는 비밀번호		
		function checkPw() {
		  let pwdReg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{6,10}$/;
			let status = pwdReg.test(pwTag.value);
			let msg = "";
			if(status) {
				validFeedback(pwTag,status,"유효성 통과");
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
				validFeedback(pwchkTag,status,"유효성 통과");
			}else{
				validFeedback(pwchkTag,status,"비밀번호가 잘못되었습니다.");
			}
			return status;
		}
		
 		//전화번호 체크
 		function checkTel() {

 			let regexp =/[^0-9]/g;

 				status = regexp.test(tel2Tag.value);

 				if(status) {
 					validFeedback(tel2Tag,status,"유효성 통과");
 				}else{
 					validFeedback(tel2Tag,status,"숫자만 입력할 수 있습니다.");
 					
 				}
 				return status;
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
    	  validFeedback(genderTag[0].parentElement.parentElement,status,"유효성 통과");
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
    	  validFeedback(nicknameTag,status,"유효성 통과");
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
 </head> 
	<div class="mt-5 mb-5">
    <form:form class="formTotal" modelAttribute="mdto" action="${pageContext.request.contextPath }/member/memberJoin">
    <div class="form-row">
    	<div class="col-md-4 mb-5 mx-auto text-center h2">회원가입</div>
    </div>
    <div class="form-row">
        <div class="col-md-4 mb-3 mx-auto">
          <form:label path="id">아이디</form:label>
          <form:input type="text" cssClass="form-control" path="id" placeholder="영문/숫자 조합" required="required"/>
          <form:errors path="id" cssClass="errMsg"></form:errors>
          <div class=""></div>
        </div>
      </div>
      <div class="form-row">
        <div class="col-md-4 mb-3 mx-auto">
          <form:label path="email">이메일</form:label>
          <div class="row mx-auto">
          <form:input path="email" type="text" cssClass="form-control col-4" placeholder="ID" required="required"/>
          <span class="mx-1">@</span>
          <form:input path="selectEmail" id="text" type="text" cssClass="form-control col-4" placeholder="직접입력" required="required"/>
          <select class="custom-select col-3" id="selectEmail" >
          	<option value="0">-이메일 선택-</option>
          	<option value="naver.com">naver.com</option>
          	<option value="gmail.com">gmail.com</option>
          	<option value="daum.net">daum.net</option>
          	<option value="nate.com">nate.com</option>
          	<option value="yahoo.com">yahoo.com</option>
          </select>
          </div>
         <%--  <form:errors path="email" cssClass="errMsg"></form:errors> --%>
          <div class=""></div>
        </div>
      </div>
      <div class="form-row">
        <div class="col-md-4 mb-3 mx-auto">
          <form:label path="pw">비밀번호</form:label>
          <form:password cssClass="form-control" path="pw" placeholder="6자리 이상 영문/숫자 포함" required="required"/>
          <form:errors path="pw" cssClass="errMsg"></form:errors>
          <div class=""></div>
        </div>
      </div>
      <div class="form-row">
        <div class="col-md-4 mb-3 mx-auto">
          <label for="pwChk">비밀번호 확인</label>
          <input type="password" class="form-control" id="pwChk" name="pwChk" placeholder="6자리 이상 영문/숫자 포함" required>
          <div class=""></div>
        </div>
      </div>
      <div class="form-row">
        <div class="col-md-4 mb-3 mx-auto">
          <form:label path="tel1">전화번호</form:label>
          <div class="row mx-auto" id="telDiv">
          <select class="custom-select col-3" name="tel1" id="tel1">
	          <option value="010">010</option>
	          <option value="011">011</option>
	          <option value="016">016</option>
	          <option value="017">017</option>
	          <option value="018">018</option>
	          <option value="019">019</option>
          </select>
          <span class="col-1">-</span>
          <form:input type="text" cssClass="form-control col-3" path="tel2" placeholder="" maxlength="4" required="required"/>
          <span class="col-1">-</span>
          <form:input type="text" cssClass="form-control col-3" path="tel3" placeholder="" maxlength="4" required="required"/>
          </div>
          <form:errors path="tel3" cssClass="errMsg"></form:errors>
          <div class=""></div>
        </div>
      </div>
      <div class="form-row">
        <div class="col-md-4 mb-3 mx-auto">
            <form:label path="gender">성별</form:label>
            <div class="form-control" id="gender">
              <form:radiobuttons items="${gender }" cssClass="form-check-label ml-2" path="gender" itemValue="code" itemLabel="label"/>
            </div>
            <form:errors path="gender" cssClass="errMsg"></form:errors>
            <div class=""></div>
          </div>
        </div>
        <div class="form-row">
        <div class="col-md-4 mb-3 mx-auto">
          <form:label path="nickname">닉네임</form:label>
          <form:input type="text" cssClass="form-control" path="nickname" placeholder="Nickname" required="required"/>
          <form:errors path="nickname" cssClass="errMsg"></form:errors>
          <div class=""></div>
      </div >
    </div>
    <div class="form-row ">
    <div class="mx-auto">
    	<input class="btn btn-danger btn-block" id="joinBtn" type="button" value="회원가입">
    </div> 
     </div>
    </form:form>
  </div>
  <%--   <jsp:include page="../footer.jsp"/> --%>