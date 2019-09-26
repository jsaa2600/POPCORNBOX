<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <meta name="description" content="">
 <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
 <meta name="generator" content="Jekyll v3.8.5">
  <!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/webjars/bootstrap/4.3.1/css/bootstrap.css" rel="stylesheet">
<!-- fontawesome -->
<link href="${pageContext.request.contextPath}/webjars/font-awesome/5.9.0/css/all.css" rel="stylesheet">
  <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="${pageContext.request.contextPath}/webjars/jquery/3.4.1/dist/jquery.js" ></script>
    <script src="${pageContext.request.contextPath}/webjars/popper.js/1.14.7/dist/umd/popper.js"></script>
    <script src="${pageContext.request.contextPath}/webjars/bootstrap/4.3.1/js/bootstrap.js"></script>

<head>
<script>

$(function(){
	
	$("#changePwBtn").on("click",function(e){
		//해당요소의 기본 이벤트 막기
		e.preventDefault(); 
		location.href="${pageContext.request.contextPath }/member/changePwForm";
		});
	$("#modifyBtn").on("click",function(e){
		//해당요소의 기본 이벤트 막기
		e.preventDefault(); 
		location.href="${pageContext.request.contextPath }/member/memberModifyForm/${sessionScope.user.id}";
		});
});


</script>
 </head> 
		<div class="mt-5 mb-5">
    <form class="formTotal">
    <div class="form-row">
    	<div class="col-md-4 mb-5 mx-auto text-center h2">마이페이지</div>
    </div>
    <div class="form-row">
        <div class="row col-md-4 mb-3 mx-auto">
          <div class="col-5" id="nickname" style="font-size: 2em;">${memberDTO.nickname} 님</div>
          <div class="col-2">Lv.${memberDTO.grade}</div>
          <div class="col-2">좋아요 (${memberDTO.good})</div>
          <div class="col-2">싫어요 (${memberDTO.bad})</div>
        </div>
      </div>
    <div class="form-row">
        <div class="col-md-4 mb-3 mx-auto">
          <label id="id">아이디</label>
          <div class="" id="id">${memberDTO.id}</div>
          <div class=""></div>
        </div>
      </div>
     <div class="form-row">
        <div class="col-md-4 mb-3 mx-auto">
          <label id="email">이메일</label>
          <div class="row mx-auto">
          <div id="email" class="col-3">${memberDTO.email }</div>
          <span class=" col-1">@</span>
          <div id="selectEmail" class="col-3">${memberDTO.selectEmail }</div>
          </div>
          <div class=""></div>
        </div>
      </div>
     <div class="form-row">
        <div class="col-md-4 mb-3 mx-auto">
          <label id="tel1">전화번호</label>
          <div class="row mx-auto" id="telDiv">
						<div class="col-2">${memberDTO.tel1 }</div>
          <span class="col-1">-</span>
          	<div class="col-2">${memberDTO.tel2 }</div>
          <span class="col-1">-</span>
          	<div class="col-2">${memberDTO.tel3 }</div>
          </div>
          <div class=""></div>
        </div>
      </div>
 <%--      <div class="form-row">
        <div class="col-md-4 mb-3 mx-auto">
            <label id="region">지역</label>
            <div class="" id="region">
              <div class="">${memberDTO.region }</div>
              <input class="btn btn-sm" type="button" value="추가"/>
            </div>
          </div>
        </div>
      <div class="form-row">
        <div class="col-md-4 mb-3 mx-auto">
            <label id="birth">생년월일</label>
            <div class="" id="birth">
              <div class="">${memberDTO.birth }</div>
              <input class="btn btn-sm" type="button" value="추가"/>
            </div>
          </div>
        </div> --%>
      <div class="form-row">
        <div class="col-md-4 mb-3 mx-auto">
            <label id="gender">성별</label>
            <div class="" id="gender">
              <div class="">${memberDTO.gender }</div>
            </div>
            <div class=""></div>
          </div>
        </div>
        <div class="form-row">
        <div class="col-md-4 mb-3 mx-auto">
          <label id="nickname">닉네임</label>
          	<div class="col-3">${memberDTO.nickname }</div>
          <div class=""></div>
      </div>
    </div>
        <div class="form-row">
        <div class="col-md-4 mb-3 mx-auto">
          <label id="nickname">가입일</label>
          	<div class="">${memberDTO.cdate }</div>
          <div class=""></div>
      </div>
    </div>
        <div class="form-row">
        <div class="col-md-4 mb-3 mx-auto">
          <label id="nickname">수정일</label>
          	<div class="">${memberDTO.udate }</div>
          <div class=""></div>
      </div>
    </div>
    <div class="form-row">
    <div class="mx-auto">
    	<input class="btn btn-warning btn-block" id="modifyBtn" type="button" value="회원정보수정">
    </div> 
     </div>
    </form>
  </div>