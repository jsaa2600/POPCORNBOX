<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	  let tel1Tag  		= document.getElementById("tel1");
	  let tel2Tag  		= document.getElementById("tel2");
	  let tel3Tag  		= document.getElementById("tel3");
		let regionTag 	= document.getElementById("region");
		let genderTag 	= document.getElementsByName("gender");
		let nicknameTag = document.getElementById("nickname");
		let modifyBtn     = document.getElementById("modifyBtn");
		
		emailTag.addEventListener("blur"				,checkEmail,false);		
		emailTag.addEventListener("change"			,checkEmail,false);
		emailTag.addEventListener("keydown"		,checkEmail,false);
		
		selectEmailTag.addEventListener("blur"				,checkSEmail,false);	
		selectEmailTag.addEventListener("change"			,checkSEmail,false);
		selectEmailTag.addEventListener("keydown"		,checkSEmail,false);
	
		sEmailTag2.addEventListener("blur"				,checksEmailTag2,false);	
		sEmailTag2.addEventListener("change"			,checksEmailTag2,false);
		sEmailTag2.addEventListener("keydown"		,checksEmailTag2,false);

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
		
		modifyBtn.addEventListener("click",modifyBtnf,false);
		
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
			let status = this.value != "" || this.value != null;
      if(status) {
    	  validFeedback(nicknameTag,status,"");
      }else{
    	  validFeedback(nicknameTag,status,"닉네임을 입력해주세요.");
      }			
      return status;
		}
				
		//가입하기 버튼 클릭시
		function modifyBtnf(e) {
			e.preventDefault();
			
			let result = checkEmail() && checkSEmail() && checkTel2() && checkTel3() && checkGender() && checkNickname();
			if(result) {
      	alert('회원 수정이 정상적으로 처리되었습니다.');
      	document.getElementById("modify").submit();
			}
		}				
	}	
})();
</script>

<div class="container-fluid">
	<div class="content_wrap">
    <form class="formTotal" id="modify" action="${pageContext.request.contextPath }/member/memberModify" method="post">
    <div class="form-row">
    	<div class="mb-5 mx-auto text-center"><h1 class="gradient_text">❝ 회 원 수 정 ❞</h1></div>
    </div>
    <div class="form-row">
        <div class="col mb-4 mx-auto">
          <label id="id" class="label">아이디</label>
          <input type="text" class="form-control" id="id" name="id" placeholder="영문/숫자 조합"  readonly value="${memberDTO.id }"/>
          <input type="hidden" class="form-control" id="pw" name="pw" value="${memberDTO.pw }"/>
          <div class=""></div>
        </div>
      </div>
      <div class="form-row">
        <div class="col mb-4 mx-auto">
          <label id="email" class="label">이메일</label>
          <div class="row mx-auto">
          <input id="email" name="email" type="text" class="form-control col" placeholder="ID" value="${memberDTO.email }"/>
          <span class="col-0 mx-1">@</span>
          <input id="selectEmail" name="selectEmail" type="text" class="form-control col mr-2" placeholder=".com" value="${memberDTO.selectEmail }"/>
          <select class="custom-select col border-white" id="selectEmail2" >
          	<option value="0">-직접입력-</option>
          	<option value="naver.com"
          	<c:if test="${memberDTO.selectEmail eq 'naver.com'}">selected</c:if>>naver.com</option>
          	<option value="gmail.com"
          	<c:if test="${memberDTO.selectEmail eq 'gmail.com'}">selected</c:if>>gmail.com</option>
          	<option value="daum.net"
          	<c:if test="${memberDTO.selectEmail eq 'daum.net'}">selected</c:if>>daum.net</option>
          	<option value="nate.com"
          	<c:if test="${memberDTO.selectEmail eq 'nate.com'}">selected</c:if>>nate.com</option>
          	<option value="yahoo.com"
          	<c:if test="${memberDTO.selectEmail eq 'yahoo.com'}">selected</c:if>>yahoo.com</option>
          </select>
          <!-- <div class=""></div> -->
          </div>
        </div>
      </div>
 <%--      <div class="form-row">
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
      </div> --%>
      <div class="form-row">
        <div class="col mb-4 mx-auto">
          <label id="tel1" class="label">전화번호</label>
          <div class="row mx-auto" id="telDiv">
          <select class="custom-select col border-white" name="tel1" id="tel1">
	          <option value="010"
	          <c:if test="${memberDTO.tel1 eq '010'}">selected</c:if>>010</option>
	          <option value="011"
	          <c:if test="${memberDTO.tel1 eq '011'}">selected</c:if>>011</option>
	          <option value="016"
	          <c:if test="${memberDTO.tel1 eq '016'}">selected</c:if>>016</option>
	          <option value="017"
	          <c:if test="${memberDTO.tel1 eq '017'}">selected</c:if>>017</option>
	          <option value="018"
	          <c:if test="${memberDTO.tel1 eq '018'}">selected</c:if>>018</option>
	          <option value="019"
	          <c:if test="${memberDTO.tel1 eq '019'}">selected</c:if>>019</option>
          </select>
          <span class="col-1 text-center">-</span>
          <input type="text" class="form-control col" id="tel2" name="tel2" maxlength="4" value="${memberDTO.tel2 }"/>
          <span class="col-1 text-center">-</span>
          <input type="text" class="form-control col" id="tel3" name="tel3" maxlength="4" value="${memberDTO.tel3}"/>
          </div>
          <div class=""></div>
        </div>
      </div>
      <div class="form-row">
       	<div class="col mb-4 mx-auto">
           <div><label for="gender" class="label">성별</label></div>
					<div class="btn-group btn-group-toggle" data-toggle="buttons">
					  <label class="btn btn-light border-white">
					    <input type="radio" name="gender" id="gender1" value="남" autocomplete="off"
					     <c:if test="${memberDTO.gender eq '남' }">checked</c:if>> 남성
					  </label>
					  <label class="btn btn-light border-white">
					    <input type="radio" name="gender" id="gender2" value="여" autocomplete="off"
					    <c:if test="${memberDTO.gender eq '여' }">checked</c:if>> 여성
					  </label>
					</div>
       	</div>
       </div>
        
        <div class="form-row">
        <div class="col mb-5 mx-auto">
          <label id="nickname" class="label">닉네임</label>
          <input type="text" class="form-control" id="nickname" name="nickname" placeholder="Nickname" value="${memberDTO.nickname }"/>
          <div class=""></div>
      </div>
    </div>
    <div class="form-row ">
    <div class="col mx-auto">
    	<input class="btn btn-lg btn-dark btn-block label" id="modifyBtn" type="button" value="E D I T">
    </div> 
     </div>
    </form>
  </div>
</div>
  
<jsp:include page="../footer.jsp"/>