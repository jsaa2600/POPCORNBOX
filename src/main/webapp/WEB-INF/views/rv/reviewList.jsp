<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" />

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
	var l_reqPage = "1";
	var l_condition = "moviecd";
	var l_data = "";
	var l_url = "${pageContext.request.contextPath}/rvrest"
	var l_pc;
	var l_id = "";
	
	
	$(function() {
		reviewList(l_reqPage, l_condition);
		
		// 최근 리뷰 버튼
		$("#recentReviewListBtn").on("click", function(e) {
			e.target.classList.toggle("active_B");
			e.target.classList.toggle("gradient_text");
			e.target.nextElementSibling.nextElementSibling.classList.toggle("active_B");
			e.target.nextElementSibling.nextElementSibling.classList.toggle("gradient_text");
			
			l_reqPage = "1";
			l_condition = "moviecd";
			
			reviewList(l_reqPage, l_condition);
		});
		
		// 베스트 리뷰 버튼
		$("#bestReviewListBtn").on("click", function(e) {
			e.target.classList.toggle("active_B");
			e.target.classList.toggle("gradient_text");
			e.target.previousElementSibling.previousElementSibling.classList.toggle("active_B");
			e.target.previousElementSibling.previousElementSibling.classList.toggle("gradient_text");
			
			l_reqPage = "1";
			l_condition = "best";
			reviewList(l_reqPage, l_condition);
		});
	});
	
	// 썸네일 오류 시 대체 이미지 표시
	function thumbnailError() {
		console.log(event);
		event.target.onerror = "";
		event.target.src = "${pageContext.request.contextPath}/resources/img/noThumbnail.jpg";
	}
	
	// 리뷰 목록 불러오기
	function reviewList(l_reqPage, l_condition) {
		let $url = l_url + "/" + l_reqPage + "/" + l_condition + "/" + l_data;
		let $str = "";
		
		$.ajax({
			type: "GET",		// http 전송 방식
			url: $url,			// 요청 url
			dataType: "JSON",	// 요청시 응답 데이터 타입
			
			success: function(result) {
				console.log(result);
				$str = "";
				
				$.each(result.reviewList, function(index, item) {
					$str += ''
					+'	<!-- 모바일 -->'
					+'	<div class="row m-0 p-0 list_M data-rvmoviecd="' + item.rvmoviecd + '">'
					+'		<div class="col item text-center">'
					+'			<a href="${pageContext.request.contextPath }/rv/info/' + item.rvmoviecd + '">'
					+'				<img src="${pageContext.request.contextPath}/resources/img/' + item.rvmoviecd + '.jpg" onError="thumbnailError()" class="img-thumbnail rounded img_fix">'
					+'			</a>'
					+'		</div>'
					+'		<div class="col-12 mt-3">'
					+'			<h2 class="label text-light">' + item.rvmovienm + '</h2>'
					+'			<span class="label_s text-light">' + item.rvmoviegenre + ' / ' + item.rvmovieopendt + ' 개봉</span>'
					+'			<h4 class="label_s text-primary">'
					+'			<img src="${pageContext.request.contextPath }/resources/img/face.png" class="rounded-cicle" style="width:50px" alt="" /> '
					+'			' + item.rvnickname + '<small class="mx-2">' + item.rvcdate + '</small>'
					+'			</h4>'
					+'			<p class="mt-3">' + item.rvtitle + '</p>'
					+'			<p class="mt-1">' + item.rvcontent + '</p>'
					+'		</div>'
					+'	</div>'
					+'	<!-- 태블릿 & PC -->'
					+'	<div class="row m-0 p-0 list_P data-rvmoviecd="' + item.rvmoviecd + '">'
					+'		<div class="col-0 item img_fix">'
					+'			<a href="${pageContext.request.contextPath }/rv/info/' + item.rvmoviecd + '">'
					+'				<img src="${pageContext.request.contextPath}/resources/img/' + item.rvmoviecd + '.jpg" onError="thumbnailError()" class="img-thumbnail rounded">'
					+'			</a>'
					+'		</div>'
					+'		<div class="col">'
					+'			<h2 class="label text-light">' + item.rvmovienm + '<small class="ml-2 label_s">' + item.rvmoviegenre + ' / ' + item.rvmovieopendt + ' 개봉</small></h2>'
					+'			<h4 class="label_s text-primary">'
					+'			<img src="${pageContext.request.contextPath }/resources/img/face.png" class="rounded-cicle" style="width:50px" alt="" /> '
					+'			' + item.rvnickname + '<small class="mx-2">' + item.rvcdate + '</small>'
					+'			</h4>'
					+'			<p class="mt-3">' + item.rvtitle + '</p>'
					+'			<p class="mt-1">' + item.rvcontent + '</p>'
					+'		</div>'
					+'	</div>'
					+'	<div class="row m-0 p-0">'
					+'		<div class="col text-right">'
					+'			<a href="' + item.rvmoviecd + '" class="badge reviewReportBtn badge-danger px-2 py-1 text-white">신고</a>'
					+'			<a href="' + item.rvmoviecd + '" class="badge reviewGoodBtn btn-bl px-2 py-1"><i class="far fa-thumbs-up mr-1"></i>(' + item.rvgood + ')</a>'
					+'			<a href="' + item.rvmoviecd + '" class="badge reviewBadBtn btn-bl px-2 py-1"><i class="far fa-thumbs-down mr-1"></i>(' + item.rvbad + ')</a>'
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
					console.log("report");
				});
			});
			
			// 좋아요 버튼
			$(".reviewGoodBtn").each(function(index, item) {
				$(item).on("click", function(event) {
					event.preventDefault();
					console.log("good");
					
				});		
			});
			
			// 싫어요 버튼
			$(".reviewBadBtn").each(function(index, item) {
				$(item).on("click", function(event) {
					event.preventDefault();
					console.log("bad");
					
				});
			});
		}
		// 버튼 기능 기본설정
		loginCheck {
			
		}
	}
</script>

<div class="container-fluid">
	<div class="content_wrap">
	
		<div class="mb-4 review_btn">
      
			<a id="recentReviewListBtn" class="text-decoration-none text-dark label_s active_B gradient_text" href="#">최근 리뷰</a>
			<span class="label mx-1">|</span>
			<a id="bestReviewListBtn" class="text-decoration-none text-dark label_s" href="#">베스트 리뷰</a>
      
			<hr>

		</div>
	
		<!-- 댓글목록 -->
		<div id="reviewList">
			<!-- 모바일 -->
			<%-- <div class="row m-0 p-0 list_M">
				<div class="col-4 item">
					<img src="${pageContext.request.contextPath}/resources/img/noThumbnail.jpg" class="img-thumbnail rounded">
				</div>
				<div class="col-8">
					<h2 class="label text-light">영 화 제 목</h2>
					<span class="label_s">영화장르/2019</span>
					<h4 class="label_s mt-3 text-primary">
            <img src="${pageContext.request.contextPath }/resources/img/face.png" class="rounded-cicle" style="width:50px" alt="" /> 
            아이디 <small class="mx-2 ">리뷰작성일</small></h4>
					<p class="mt-3">모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용
					 	모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용
						모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용
						모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용
						모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용
					</p>
				</div>
			</div>
			<!-- 태블릿 & PC -->
			<div class="row m-0 p-0 list_P">
				<div class="col-0 item img_fix">
					<img src="${pageContext.request.contextPath}/resources/img/noThumbnail.jpg" class="img-thumbnail rounded">
				</div>
				<div class="col">					
					<h2 class="label text-light">영 화 제 목<small class="ml-2 label_s">영화장르/2019</small></h2>
					<h4 class="label_s text-primary">
            <img src="${pageContext.request.contextPath }/resources/img/face.png" class="rounded-cicle" style="width:50px" alt="" /> 
            아이디 <small class="mx-2 text-light">리뷰작성일</small></h4>
					<p class="mt-3">
						댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용
						댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용
						댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용
						댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용
						댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용
						댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용
					</p>
				</div>
			</div>
			<div class="row m-0 p-0">	
				<div class="col text-right">
					<a href="#" class="badge badge-danger px-2 py-1 text-white">신고</a>
					<a href="#" class="badge badge-dark px-2 py-1 text-white"><i class="far fa-thumbs-up mr-1"></i>추천(1)</a>
					<a href="#" class="badge badge-dark px-2 py-1 text-white"><i class="far fa-thumbs-down mr-1"></i>비추천(1)</a>
          <a href="#" class="badge badge-primary px-2 py-1 text-white">댓글(10)</a>
				</div>
			</div>
			<hr> --%>

		</div>
	</div>	

	<!-- 페이징 -->
	<div id="paging" class="row justify-content-center my-1">
 		<%--<nav aria-label="">
			<ul class="pagination pagination-sm">
				<li class="page-item disabled">
					<a class="page-link bg-dark" href="#" tabindex="-1" aria-disabled="true">Previous</a>
				</li>
				<li class="page-item active">
					<a class="page-link" href="#">1</a>
				</li>
				<li class="page-item" aria-current="page">
					<a class="page-link bg-dark" href="#">2 <span class="sr-only">(current)</span></a>
				</li>
				<li class="page-item">
					<a class="page-link bg-dark" href="#">3</a>
				</li>
				<li class="page-item">
					<a class="page-link bg-dark" href="#">Next</a>
				</li>
			</ul>
		</nav> --%>
	</div>
		
</div>
  
<jsp:include page="../footer.jsp"/>