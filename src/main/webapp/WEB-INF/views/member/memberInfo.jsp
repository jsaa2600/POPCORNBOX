<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../header.jsp" />

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }
      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
<script>

var l_url = "${pageContext.request.contextPath }/member/memberInfo";
let l_id = "${sessionScope.user.id}";
	
$(function(){
	//memberInfo();
	doActionEvent();
function memberInfo(){
	let $id = "${memberDTO.id}";
	let $url = l_url+"/goodOrbad/"+$id; 
	let str = "";
	
	$.ajax({
		type : "GET",    	 //http 전송 방식
		url  : $url,				 //요청 url
		dataType : "text",   //요청시 응답데이터 타입
		//응답 성공시 처리사항
		success:function(result){		
			console.log(result);
			let mem = JSON.parse(result); // joson => 자바스크립트 객체변환
			console.log(mem.good);					

				//좋아요 카운트
				let goodContent = '좋아요 ' + "(" + mem.good + ")";
				$("#good").html(goodContent);
				
				//싫어요 카운트
				let badContent = '싫어요 ' + "(" + mem.bad + ")";
				$("#bad").html(badContent);
				
		},
		//응답 실패시 처리사항
		error:function(xhr, status, err){			
			console.log("code:"+xhr.status);
			console.log("message:"+xhr.responseText );
			console.log("status:"+status);
			console.log("err:"+err);
		}	
				
	});//End of $.ajax
					
}//End of memberInfo()	
	
function doActionEvent(){
	let $id = "${memberDTO.id}";
	if($id!=l_id){
		
	//좋아요
	$("#good").on("click",function(){
		//console.log("호감!");
		
		let $url = l_url +'/'+ $id + '/good';
		console.log("${sessionScope.user.id}");
		if(l_id ==""){
			if(confirm('로그인 후 댓글작성이 가능합니다\n로그인 하시겠습니까?')){
				document.location.href='${pageContext.request.contextPath }/login/loginForm';
			}
			return;
		}
		 
		//AJAX 비동기 처리기술
		$.ajax({
			type : "PUT",    	 //http 전송 방식
			url  : $url,				 //요청 url
			dataType : "text",   //요청시 응답데이터 타입
			//응답 성공시 처리사항
			success:function(result){		
				console.log(result);
			 	memberInfo();
			},
			//응답 실패시 처리사항
			error:function(xhr, status, err){			
				console.log("code:"+xhr.status);
				console.log("message:"+xhr.responseText );
				console.log("status:"+status);
				console.log("err:"+err);
			}			
		});						
	});//End of 좋아요
	
	
	//싫어요
	$("#bad").on("click",function(){
		/* let $id = "${memberDTO.id}"; */
		let $url = l_url +'/'+ $id + '/bad';
		console.log("${sessionScope.user.id}");
		if(l_id ==''){
			if(confirm('로그인 후 댓글작성이 가능합니다\n로그인 하시겠습니까?')){
				document.location.href='${pageContext.request.contextPath }/login/loginForm';
			}
			return;
		}
		 
		//AJAX 비동기 처리기술
		$.ajax({
			type : "PUT",    	 //http 전송 방식
			url  : $url,				 //요청 url
			dataType : "text",   //요청시 응답데이터 타입
			//응답 성공시 처리사항
			success:function(result){		
				console.log(result);
	
			 	memberInfo();

			},
			//응답 실패시 처리사항
			error:function(xhr, status, err){			
				console.log("code:"+xhr.status);
				console.log("message:"+xhr.responseText );
				console.log("status:"+status);
				console.log("err:"+err);
			}			
		});	
	});// End of 싫어요	
	}
}// End of doActionEvent()
});

</script>

		<div id="goodOrBadList">
		<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto">
		  <h1 class="display-4">${memberDTO.nickname} 님</h1>
		  <p class="lead">Lv.${memberDTO.grade}</p>
		  <p class="lead">리뷰 ${memberDTO.review} 개</p>
		  <p class="goodBtn" id="good">좋아요 (${memberDTO.good})</p>
		  <p class="badBtn"	id="bad">싫어요 (${memberDTO.bad})</p>
		</div>
		</div>
		<div class="">
			<!-- 본인이 쓴 리뷰 -->
			</div>
			<c:choose>
			<c:when test="${sessionScope.user.id==memberDTO.id}">
  	<div class="row mb-2 justify-content-center">
    <div class="col-md-6 col-lg-3">
      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-400 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <h2 class="mb-3 text-center font-weight-bold">내정보 관리</h2>
          <a href="${pageContext.request.contextPath}/member/getMember/${sessionScope.user.id}" class="stretched-link small"></a>
        </div>
      </div>
    </div>
       <div class="col-md-6 col-lg-3">
      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-400 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <h2 class="mb-3 text-center font-weight-bold">비밀번호 변경</h2>
          <a href="${pageContext.request.contextPath}/member/changePwForm" class="stretched-link small"></a>
        </div>
      </div>
    </div>
       <div class="col-md-6 col-lg-3">
      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-400 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <h2 class="mb-3 text-center font-weight-bold">회원 탈퇴</h2>
          <a href="${pageContext.request.contextPath}/member/memberDeleteForm/${sessionScope.user.id}" class="stretched-link small"></a>
        </div>
      </div>
    </div>

  </div>
			</c:when>
			<c:otherwise>
			<div></div>
			</c:otherwise>
			</c:choose>

<jsp:include page="../footer.jsp" />