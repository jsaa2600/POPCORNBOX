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
      <style>
	.btn-group{
		width: 100%;
	}
	.form-control{
		border: 1px solid #fff;
	}
	.badge{
		font-weight: normal;
	}
	.active > a{
		font-weight: bold;
	}
	.review_btn a{
		font-size: 1.3em;
	}
	.active_B{
		font-weight: bold;
	}

	/*모바일*/
	@media (max-width:575px) {
		.list_P{
			display: none;
		}
		h2{
			font-size: 2.2em;
			margin: 0;
		}
		.img_fix{
			width: 280px !important;
		}
	}	
	/*태블릿*/
	@media (min-width:576px) {
		.list_M{
			display: none;
		}
		h2{
			font-size: 2.5em;
		}
		small{
			font-size: 0.6em;
		}
		.img_fix{
			width: 100px;
		}
	}
	/*PC*/
  @media (min-width:768px) {
		.container-fluid{
			width: 70%;
		}
		.img_fix{
			width: 150px;
		}
		h2{
			font-size: 3em;
		}
		small{
			font-size: 0.6em;
		}
	}
	
</style>

<script>

var l_url = "${pageContext.request.contextPath }/member/memberInfo";
var l_id = "${sessionScope.user.id}";
var l_reqPage = "1";
var l_condition = "moviecd";
var l_data = "";
var l_url = "${pageContext.request.contextPath}/rvrest"
var l_pc;
	
$(function() {
	
	memberInfo();
	reviewList(l_reqPage, l_condition);
	
	// 최근 리뷰 버튼
	$("#recentReviewListBtn").on("click", function(e) {
		e.target.classList.add("active_B");
		e.target.classList.add("gradient_text");
		e.target.nextElementSibling.nextElementSibling.classList.remove("active_B");
		e.target.nextElementSibling.nextElementSibling.classList.remove("gradient_text");
		
		l_reqPage = "1";
		l_condition = "moviecd";
		
		reviewList(l_reqPage, l_condition);
	});
	
	// 베스트 리뷰 버튼
	$("#bestReviewListBtn").on("click", function(e) {
		e.target.classList.add("active_B");
		e.target.classList.add("gradient_text");
		e.target.previousElementSibling.previousElementSibling.classList.remove("active_B");
		e.target.previousElementSibling.previousElementSibling.classList.remove("gradient_text");
		
		l_reqPage = "1";
		l_condition = "best";
		reviewList(l_reqPage, l_condition);
	});
});

function memberInfo(){
	let $id = l_id;
	let $url = "${pageContext.request.contextPath}/rvrest/totalRec/user/" + $id; 
	let str = "";
	
	// 댓글 총계
	$.ajax({
		type : "GET",    	 //http 전송 방식
		url  : $url,				 //요청 url
		dataType : "text",   //요청시 응답데이터 타입
		//응답 성공시 처리사항
		success:function(result){
			let response = JSON.parse(result);
			
			//좋아요 카운트
			let totalRecContent = "리뷰" + " : " + response.totalRec + "개";
			$("#totalRec").html(totalRecContent);
		},
		//응답 실패시 처리사항
		error:function(xhr, status, err){			
			console.log("code:"+xhr.status);
			console.log("message:"+xhr.responseText );
			console.log("status:"+status);
			console.log("err:"+err);
		}
	}); //End of $.ajax
					
}//End of memberInfo()

// 썸네일 오류 시 대체 이미지 표시
function thumbnailError() {
	console.log(event);
	event.target.onerror = "";
	event.target.src = "${pageContext.request.contextPath}/resources/img/noThumbnail.jpg";
}

// 리뷰 목록 불러오기
function reviewList(l_reqPage, l_condition) {
	let $id="${memberDTO.id}";
	l_condition = "user";
	let $url = "${pageContext.request.contextPath}/rvrest/" + l_reqPage + "/"+ l_condition +"/" + $id;
	let $str = "";
	
	$.ajax({
		type: "GET",		// http 전송 방식
		url: $url,			// 요청 url
		dataType: "JSON",	// 요청시 응답 데이터 타입
		
		success: function(result) {
			console.log(result);
			$str = "";
			
			$.each(result.reviewList, function(index, item) {
				let rvpopContent = "";
				for(let i=0; i<5; i++) {
					if(i < item.rvpop) {
						rvpopContent += '<i class="fas fa-thumbs-up mr-1"></i>';
					}
					else {
						rvpopContent += '<i class="far fa-thumbs-down mr-1"></i>';
					}
				}
				
				item.rvtitle = (item.rvtitle == null)? "" : item.rvtitle;
				
				$str += ''
					+'	<!-- 모바일 -->'
					+'	<div class="row m-0 p-0 list_M" data-rvnum="' + item.rvnum + '">'
					+'		<input type="hidden" class="reviewRvnum" value="' + item.rvnum + '">'
					+'		<input type="hidden" class="reviewRvid" value="' + item.rvid + '">'
					+'		<input type="hidden" class="reviewRvmoviecd" value="' + item.rvmoviecd + '">'
					+'		<div class="col item text-center">'
					+'			<a href="${pageContext.request.contextPath }/rv/info/' + item.rvmoviecd + '">'
					+'				<img src="${pageContext.request.contextPath}/resources/img/' + item.rvmoviecd + '.jpg" onError="thumbnailError()" class="img-thumbnail rounded img_fix">'
					+'			</a>'
					+'		</div>'
					+'		<div class="col-12 mt-3">'
					+'			<h2 class="label text-light">' + item.rvmovienm + '</h2>'
					+'			<span class="label_s text-light">' + item.rvmoviegenre + ' / ' + item.rvmovieopendt + ' 개봉</span>'
					+'			<h4 class="label_s text-primary">'
					+'			<i class="far fa-paper-plane"></i>'
					+'			' + item.rvnickname + '<small class="mx-2 text-white">' + item.rvgrade + '등급</small>' + '<small class="mx-2 text-info">' + item.rvcdate + '</small>'
					+'			</h4>'
					+'			<p class="mt-3"><b>' + rvpopContent + '</b></p>'
					+'			<p class="mt-3"><b>' + item.rvtitle + '</b></p>'
					+'			<p class="mt-1">' + item.rvcontent + '</p>'
					+'		</div>'
					+'	</div>'
					+'	<!-- 태블릿 & PC -->'
					+'	<div class="row m-0 p-0 list_P" data-rvnum="' + item.rvnum + '">'
					+'		<input type="hidden" class="reviewRvnum" value="' + item.rvnum + '">'
					+'		<input type="hidden" class="reviewRvid" value="' + item.rvid + '">'
					+'		<input type="hidden" class="reviewRvmoviecd" value="' + item.rvmoviecd + '">'
					+'		<div class="col-0 item img_fix">'
					+'			<a href="${pageContext.request.contextPath }/rv/info/' + item.rvmoviecd + '">'
					+'				<img src="${pageContext.request.contextPath}/resources/img/' + item.rvmoviecd + '.jpg" onError="thumbnailError()" class="img-thumbnail rounded">'
					+'			</a>'
					+'		</div>'
					+'		<div class="col">'
					+'			<h2 class="label text-light">' + item.rvmovienm + '<small class="ml-2 label_s">' + item.rvmoviegenre + ' / ' + item.rvmovieopendt + ' 개봉</small></h2>'
					+'			<h4 class="label_s text-primary">'
					+'			<i class="far fa-paper-plane"></i>'
					+'			' + item.rvnickname + '<small class="mx-2 text-white">' + item.rvgrade + '등급</small>' + '<small class="mx-2 text-info">' + item.rvcdate + '</small>'
					+'			</h4>'
					+'			<p class="mt-3"><b>' + rvpopContent + '</b></p>'
					+'			<p class="mt-3"><b>' + item.rvtitle + '</b></p>'
					+'			<p class="mt-1">' + item.rvcontent + '</p>'
					+'		</div>'
					+'	</div>'
					+'	<div class="row m-0 p-0">'
					+'		<div class="col text-right">'
					+'			<a href="' + item.rvnum + '" class="badge reviewReportBtn badge-danger px-2 py-1 text-white">신고</a>'
					+'			<a href="' + item.rvnum + '" class="badge reviewGoodBtn btn-bl px-2 py-1"><i class="far fa-thumbs-up mr-1"></i>(' + item.rvgood + ')</a>'
					+'			<a href="' + item.rvnum + '" class="badge reviewBadBtn btn-bl px-2 py-1"><i class="far fa-thumbs-down mr-1"></i>(' + item.rvbad + ')</a>'
					+'		</div>'
					+'	</div>'
					+'	<hr class="under_line">';
			});
			
			$("#reviewList").html($str);
			showPageList(result.pc);
			readyReviewListBtns();
		},
		
		error: function(xhr, status, err) {
			console.log("code : " + xhr.status);
			console.log("message : " + xhr.responseText);
			console.log("status : " + status);
			console.log("err : " + err);
		}
	});
	
	// 페이지 삽입
	function showPageList(pc) {
		
		let str = "";
		str +=	'<nav aria-label="">'
		+			'<ul class="pagination pagination-sm">';
		
		// 이전 페이지 여부
		if(pc.prev) {
			// 처음 페이지
			str += 	'<li class="page-item active">'
			+			'<a class="page-link" href="1" tabindex="-1" aria-disabled="true">처음</a>'
			+		'</li>';
			
			// 이전 페이지
			str += 	'<li class="page-item active">'
			+			'<a class="page-link" href="' + (pc.startPage - 1) + '" tabindex="-1" aria-disabled="true">이전</a>'
			+		'</li>';
		}
		else {
			// 처음 페이지
			str += 	'<li class="page-item disabled">'
			+			'<a class="page-link" href="1" tabindex="-1" aria-disabled="true">처음</a>'
			+		'</li>';
			
			// 이전 페이지
			str += 	'<li class="page-item disabled">'
			+			'<a class="page-link" href="' + (pc.startPage - 1) + '" tabindex="-1" aria-disabled="true">이전</a>'
			+		'</li>';
		}
		
		// 페이지 1~10
		for(let i=pc.startPage; i<=pc.endPage; i++) {
			// 현재 페이지와 요청 페이지가 같을 때 & 다를 때
			if(pc.rc.reqPage == i) {
				str +=	'<li class="page-item active" aria-current="page">'
				+			'<a class="page-link" href="'+ i +'">'+ i +'<span class="sr-only">(current)</span></a>'
				+		'</li>';
			}
			else {
				str += 	'<li class="page-item"><a class="page-link" href="'+ i +'">'+ i +'</a></li>';
			}
		}
		
		// 다음 페이지 여부
		if(pc.next) {
			// 다음 페이지
			str += 	'<li class="page-item active">'
			+			'<a class="page-link" href="' + (pc.endPage+1) + '" tabindex="-1" aria-disabled="true">다음</a>'
			+		'</li>';
			// 마지막 페이지
			str += 	'<li class="page-item active">'
			+			'<a class="page-link" href="' + (pc.finalEndPage) + '" tabindex="-1" aria-disabled="true">끝</a>'
			+		'</li>';
		}
		else {
			// 다음 페이지
			str += 	'<li class="page-item disabled">'
			+			'<a class="page-link" href="' + (pc.endPage+1) + '" tabindex="-1" aria-disabled="true">다음</a>'
			+		'</li>';
			// 마지막 페이지
			str += 	'<li class="page-item disabled">'
			+			'<a class="page-link" href="' + (pc.finalEndPage) + '" tabindex="-1" aria-disabled="true">끝</a>'
			+		'</li>';
		}
		
		str +=		'</ul>'
		+		'</nav>';
		
		$("#paging").html(str);
		readyPagingBtn();

	}
	
	// 페이지 번호 클릭시 이벤트 처리
	// id값이 paging인 요소의 하위 요소 li a 에 클릭이벤트가 발생 시 실행
	function readyPagingBtn() {
		$("#paging").on("click", "li a", function(event) {
			// 상위 및 현재 레벨에 걸린 다른 이벤트가 동작 않도록 중단
			event.preventDefault();
			event.stopImmediatePropagation();
			
			l_reqPage = $(this).attr("href");
			reviewList(l_reqPage, l_condition);
		});
	}
	
	// 리뷰 태그의 버튼들 활성화
	function readyReviewListBtns() {
		// 신고 버튼
		$(".reviewReportBtn").each(function(index, item) {
			$(item).on("click", function(event) {
				event.preventDefault();
				if(loginCheck()) {
					let $data_rvnum = $(item).attr("href");
					let target = $("div[data-rvnum='" + $data_rvnum + "']");
				}
			});
		});
		
		// 좋아요 버튼
		$(".reviewGoodBtn").each(function(index, item) {
			$(item).on("click", function(event) {
				event.preventDefault();
				if(loginCheck()) {
					goodOrBadBtn(item, "good");
				}
			});		
		});
		
		// 싫어요 버튼
		$(".reviewBadBtn").each(function(index, item) {
			$(item).on("click", function(event) {
				event.preventDefault();
				if(loginCheck()) {
					goodOrBadBtn(item, "bad");
				}
			});
		});
	}
	
	// 좋아요&싫어요 버튼
	function goodOrBadBtn(item, $gobstatus) {
		let $data_rvnum = $(item).attr("href");
		let target = $("div[data-rvnum='" + $data_rvnum + "']");
		let $gobidfrom = l_id;
		let $gobidto = $(target).children("input.reviewRvid").val();
		let $gobrvnum = $(target).children("input.reviewRvnum").val();
		let $gobmoviecd = $(target).children("input.reviewRvmoviecd").val();
		let $url = "${pageContext.request.contextPath}/rvrest/gob";
		
		// ajax
		$.ajax({
			type: "POST",				// http 전송 방식
			url: $url,					// 요청 url
			headers: {					// 전송데이터(자바스크립트 객체)
				"Content-Type": "application/json"
			},
			dataType: "text",			// 요청시 응답데이터 타입
			data: JSON.stringify({		// 전송 데이터
				gobidfrom: $gobidfrom,
				gobidto: $gobidto,
				gobrvnum: $gobrvnum,
				gobmoviecd: $gobmoviecd,
				gobstatus: $gobstatus
			}),
			
			success: function(result) {
				console.log(result);
				reviewList(l_reqPage, l_condition);
			},
			
			error: function(xhr, status, err) {
				console.log("xhr : " + xhr);
				console.log("status : " + status);
				console.log("err : " + err);
			}
		});
	}
	
}

// 로그인 체크
function loginCheck() {
	if(l_id == "" || l_id == null) {
		if(confirm("로그인이 필요한 기능입니다. 로그인 하시겠습니까?")) {
			document.location.href="${pageContext.request.contextPath}/login/loginForm";
		}
		return false;
	}
	return true;
}

</script>

	<div class="container-fluid">
		<div id="goodOrBadList">
			<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto">
				<h1 class="display-4">${memberDTO.nickname} 님</h1>
				<p class="lead">${memberDTO.grade}등급</p>
				<p class="lead" id="totalRec">리뷰 : 개</p>
				<p class="goodBtn" id="good">좋아요 : ${memberDTO.good}개</p>
				<p class="badBtn"	id="bad">싫어요 : ${memberDTO.bad}개</p>
			</div>
		</div>

			<c:choose>
			<c:when test="${sessionScope.user.id==memberDTO.id}">
  	<div class="row mb-2 justify-content-center">
    <div class="col-md-4 col-lg-3">
      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-400 position-relative">
        <div class="col p-1 d-flex flex-column position-static">
          <h5 class="text-center font-weight-bold">내정보 관리</h5>
          <a href="${pageContext.request.contextPath}/member/getMember/${sessionScope.user.id}" class="stretched-link small"></a>
        </div>
      </div>
    </div>
       <div class="col-md-4 col-lg-3">
      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-400 position-relative">
        <div class="col p-1 d-flex flex-column position-static">
          <h5 class="text-center font-weight-bold">비밀번호 변경</h5>
          <a href="${pageContext.request.contextPath}/member/changePwForm" class="stretched-link small"></a>
        </div>
      </div>
    </div>
       <div class="col-md-4 col-lg-3">
      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-400 position-relative">
        <div class="col p-1 d-flex flex-column position-static">
          <h5 class="text-center font-weight-bold">회원 탈퇴</h5>
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
			<div class="content_wrap">
			<div class="mb-4 review_btn">
      
			<a id="recentReviewListBtn" class="text-decoration-none text-dark label_s active_B gradient_text" href="#">최신 리뷰</a>
			<span class="label mx-1">|</span>
			<a id="bestReviewListBtn" class="text-decoration-none text-dark label_s" href="#">베스트 리뷰</a>
      
			<hr>

		</div>
			
			<div id="reviewList">
			
			</div>
			<!-- 페이징 -->
			<div id="paging" class="row justify-content-center my-1">
			
			</div>
			</div>
		</div>
	
<jsp:include page="../footer.jsp" />