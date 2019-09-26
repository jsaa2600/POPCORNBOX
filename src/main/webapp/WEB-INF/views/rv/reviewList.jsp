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
	var l_url = "${pageContext.request.contextPath}/rvrest"
	
	$(function() {
		reviewList();
	});
	
	// 썸네일 오류 시 대체 이미지 표시
	function thumbnailError() {
		console.log(event);
		event.target.onerror = "";
		event.target.src = "${pageContext.request.contextPath}/resources/img/noThumbnail.jpg";
	}
	
	// 리뷰 목록 불러오기
	function reviewList() {
		let $url = l_url + "/" + l_reqPage + "/";
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
					+'		<div class="row m-0 p-0 list_M">'
					+'		<div class="col-4 item">'
					+'			<img src="${pageContext.request.contextPath}/resources/img/' + item.rvmoviecd + '.jpg" onError="thumbnailError()" class="img-thumbnail rounded">'
					+'		</div>'
					+'		<div class="col-8">'
					+'			<h2 class="label">' + item.rvmovienm + '</h2>'
					+'			<span class="label_s">' + item.rvmoviegenre + ' / ' + item.rvmovieopendt + '개봉</span>'
					+'			<h4 class="label_s mt-3 text-light">' + item.rvnickname + '<small class="mx-2 ">' + item.rvcdate + '</small></h4>'
					+'			<p class="mt-3">' + item.rvtitle + '</p>'
					+'			<p class="mt-1">' + item.rvcontent + '</p>'
					+'		</div>'
					+'	</div>'
					+'	<!-- 태블릿 & PC -->'
					+'	<div class="row m-0 p-0 list_P">'
					+'		<div class="col-0 item img_fix">'
					+'			<img src="${pageContext.request.contextPath}/resources/img/' + item.rvmoviecd + '.jpg" onError="thumbnailError()" class="img-thumbnail rounded">'
					+'		</div>'
					+'		<div class="col">'
					+'			<h2 class="label">' + item.rvmovienm + '<small class="ml-2 label_s">' + item.rvmoviegenre + ' / ' + item.rvmovieopendt + '개봉</small></h2>'
					+'			<h4 class="label_s">' + item.rvnickname + '<small class="mx-2 text-light">' + item.rvcdate + '</small></h4>'
					+'			<p class="mt-3">' + item.rvtitle + '</p>'
					+'			<p class="mt-1">' + item.rvcontent + '</p>'
					+'		</div>'
					+'	</div>'
					+'	<div class="row m-0 p-0">'
					+'		<div class="col text-right">'
					+'			<a href="#" class="badge badge-danger px-2 py-1 text-white">신고</a>'
					+'			<a href="#" class="badge badge-dark px-2 py-1 text-white"><i class="far fa-thumbs-up mr-1"></i>추천(1)</a>'
					+'			<a href="#" class="badge badge-dark px-2 py-1 text-white"><i class="far fa-thumbs-down mr-1"></i>비추천(1)</a>'
					+'		</div>'
					+'	</div>'
					+'	<hr>';
				});
				
				$("#reviewList").html($str);
			},
			
			error: function(xhr, status, err) {
				console.log("code : " + xhr.status);
				console.log("message : " + xhr.responseText);
				console.log("status : " + status);
				console.log("err : " + err);
			}
		});
		
	}
</script>

<div class="container-fluid">
	<div class="content_wrap">
	
		<div class="mb-4 review_btn">
			<a class="text-decoration-none text-dark label_s active_B gradient_text" href="#">최근 리뷰</a> <span class="label mx-1">|</span> <a class="text-decoration-none text-dark label_s" href="#">베스트 리뷰</a>
			<hr>
		</div>
	
		<!-- 댓글목록 -->
		<div id="reviewList">
		
			<!-- 모바일 -->
			<div class="row m-0 p-0 list_M">
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
			<hr>
		</div>
	</div>	

	<!-- 페이징 -->
	<div id="paging" class="row justify-content-center my-3">
		<nav aria-label="">
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
		</nav>
	</div>
		
</div>
  
<jsp:include page="../footer.jsp"/>