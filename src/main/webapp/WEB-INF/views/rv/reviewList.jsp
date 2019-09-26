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
	.under_line{
		border-color: #9bb3c9;
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
	var l_rvmoviecd = "";
	var l_condition = "";
	var l_url = "${pageContext.request.contextPath}/rvrest"
	var l_pc;
	
	$(function() {
		reviewList(l_reqPage);
	});
	
	// 썸네일 오류 시 대체 이미지 표시
	function thumbnailError() {
		console.log(event);
		event.target.onerror = "";
		event.target.src = "${pageContext.request.contextPath}/resources/img/noThumbnail.jpg";
	}
	
	// 리뷰 목록 불러오기
	function reviewList(l_reqPage) {
		let $url = l_url + "/" + l_reqPage + "/" + l_rvmoviecd + "/" + l_condition;
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
					+'		<div class="row m-0 p-0 list_M">'
					+'		<div class="col item">'
					+'			<a href="${pageContext.request.contextPath }/rv/info/' + item.rvmoviecd + '">'
					+'				<img src="${pageContext.request.contextPath}/resources/img/' + item.rvmoviecd + '.jpg" onError="thumbnailError()" class="img-thumbnail rounded">'
					+'			</a>'
					+'		</div>'
					+'		<div class="col-12 mt-2">'
					+'			<h2 class="label text-light">' + item.rvmovienm + '</h2>'
					+'			<span class="label_s text-light">' + item.rvmoviegenre + ' / ' + item.rvmovieopendt + ' 개봉</span>'
					+'			<h4 class="label_s mt-3 text-primary">' + item.rvnickname + '<small class="mx-2">' + item.rvcdate + '</small></h4>'
					+'			<p class="mt-3">' + item.rvtitle + '</p>'
					+'			<p class="mt-1">' + item.rvcontent + '</p>'
					+'		</div>'
					+'	</div>'
					+'	<!-- 태블릿 & PC -->'
					+'	<div class="row m-0 p-0 list_P">'
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
					+'			<a href="#" class="badge badge-danger px-2 py-1 text-white">신고</a>'
					+'			<a href="#" class="badge badge-dark px-2 py-1 text-white"><i class="far fa-thumbs-up mr-1"></i>좋아요(' + item.rvgood + ')</a>'
					+'			<a href="#" class="badge badge-dark px-2 py-1 text-white"><i class="far fa-thumbs-down mr-1"></i>싫어요(' + item.rvbad + ')</a>'
					+'		</div>'
					+'	</div>'
					+'	<hr class="under_line">';
				});
				
				$("#reviewList").html($str);
				showPageList(result.pc);
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
				+			'<a class="page-link  bg-dark" href="1" tabindex="-1" aria-disabled="true">First</a>'
				+		'</li>';
				
				// 이전 페이지
				str += 	'<li class="page-item active">'
				+			'<a class="page-link bg-dark" href="' + (pc.startPage - 1) + '" tabindex="-1" aria-disabled="true">Previous</a>'
				+		'</li>';
			}
			else {
				// 처음 페이지
				str += 	'<li class="page-item disabled">'
				+			'<a class="page-link bg-dark" href="1" tabindex="-1" aria-disabled="true">First</a>'
				+		'</li>';
				
				// 이전 페이지
				str += 	'<li class="page-item disabled">'
				+			'<a class="page-link bg-dark" href="' + (pc.startPage - 1) + '" tabindex="-1" aria-disabled="true">Previous</a>'
				+		'</li>';
			}
			
			// 페이지 1~10
			for(let i=pc.startPage; i<=pc.endPage; i++) {
				// 현재 페이지와 요청 페이지가 같을 때 & 다를 때
				if(pc.rc.reqPage == i) {
					str +=	'<li class="page-item disabled" aria-current="page">'
					+			'<a class="page-link" href="'+ i +'">'+ i +'<span class="sr-only">(current)</span></a>'
					+		'</li>';
				}
				else {
					str += 	'<li class="page-item bg-dark active"><a class="page-link" href="'+ i +'">'+ i +'</a></li>';
				}
			}
			
			// 다음 페이지 여부
			if(pc.next) {
				// 다음 페이지
				str += 	'<li class="page-item active">'
				+			'<a class="page-link bg-dark" href="' + (pc.endPage+1) + '" tabindex="-1" aria-disabled="true">Next</a>'
				+		'</li>';
				// 마지막 페이지
				str += 	'<li class="page-item active">'
				+			'<a class="page-link bg-dark" href="' + (pc.finalEndPage) + '" tabindex="-1" aria-disabled="true">Last</a>'
				+		'</li>';
			}
			else {
				// 다음 페이지
				str += 	'<li class="page-item disabled disabled">'
				+			'<a class="page-link bg-dark" href="' + (pc.endPage+1) + '" tabindex="-1" aria-disabled="true">Next</a>'
				+		'</li>';
				// 마지막 페이지
				str += 	'<li class="page-item disabled disabled">'
				+			'<a class="page-link bg-dark" href="' + (pc.finalEndPage) + '" tabindex="-1" aria-disabled="true">Last</a>'
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
				reviewList(l_reqPage);
			});
		}
		
	}
</script>

<div class="container-fluid">
	<div class="content_wrap">
	
		<div class="mb-4 review_btn">
			<a class="text-decoration-none label_s active_B gradient_text" href="#">최근 리뷰</a> <span class="label mx-1">|</span> <a class="text-decoration-none text-dark label_s" href="#">베스트 리뷰</a>
			<hr class="under_line">
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
	<div id="paging" class="row justify-content-center my-3">
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