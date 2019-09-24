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

//호감 비호감 기능 일단 여기 설정 해놓음
/* 		
var l_url = "${pageContext.request.contextPath }/member";
let l_id = "${session.Scope.user.id}";

$(function(){
	
	$(".goodBtn").on("click",function(){
		//console.log("호감!");
		let $id = l_id;
		let $url = l_url +'/'+ $id + '/good';
		console.log("${session.Scope.user.id}");
		if($id ==''){
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
			},
			//응답 실패시 처리사항
			error:function(xhr, status, err){			
				console.log("code:"+xhr.status);
				console.log("message:"+xhr.responseText );
				console.log("status:"+status);
				console.log("err:"+err);
			}			
		});						
	});//End of 호감
	
	
	//비호감
	$(".badBtn").on("click",function(){
		console.log("비호감!"+page);
		let $rid = l_id;
		let $rnum = $(this).closest("div[data-rnum]").attr("data-rnum");
		let $url = l_url +'/'+ $rnum + '/bad';
		
		if($rid ==''){
			if(confirm('로그인 후 댓글작성이 가능합니다\n로그인 하시겠습니까?')){
				document.location.href='${pageContext.request.contextPath }/login/login';
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

				replyList(page);
			},
			//응답 실패시 처리사항
			error:function(xhr, status, err){			
				console.log("code:"+xhr.status);
				console.log("message:"+xhr.responseText );
				console.log("status:"+status);
				console.log("err:"+err);
			}			
		});					
	});// End of 비호감		
});
*/

</script>


		<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto">
		  <h1 class="display-4">${memberDTO.nickname} 님</h1>
		  <p class="lead">${memberDTO.grade}</p>
		  <p class="goodBtn">${memberDTO.good}</p>
		  <p class="badBtn">${memberDTO.bad}</p>
		</div>
		<div class="">
			<!-- 본인이 쓴 리뷰 -->
			</div>
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

<jsp:include page="../footer.jsp" />