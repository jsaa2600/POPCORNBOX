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
	.page-link{
		color: #eee;
		border: none;
	}
	.active > a{
		font-weight: bold;
	}
	.review_btn a{
		font-size: 1.3em;
	}
	.active_B{
    background: linear-gradient(-20deg, #9795f0 0%, #fbc8d4 100%);
  	-webkit-background-clip: text;
		-webkit-text-fill-color: transparent;
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

</script>

<div class="container-fluid">
	<div class="content_wrap">

		<div class="mb-4 review_btn">
			<a class="text-decoration-none text-dark label_s active_B" href="#">최근 리뷰</a> <span class="label mx-1">|</span> <a class="text-decoration-none text-dark label_s" href="#">베스트 리뷰</a>
			<hr>
		</div>
	
		<!-- 댓글목록 -->
		<!-- 모바일 -->
		<div class="row m-0 p-0 list_M" id="replyList">
				<div class="col-4 item"><img src="${pageContext.request.contextPath}/resources/img/noThumbnail.jpg" class="img-thumbnail rounded"></div>
					<div class="col-8">
						<h2 class="label">영 화 제 목</h2>
						<span class="label_s">영화장르/2019</span>
						<h4 class="label_s mt-3 text-light">아이디 <small class="mx-2 ">리뷰작성일</small></h4>
						<p class="mt-3">모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용
						 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용
						  모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용
						   모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용
						    모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용</p>
					</div>
		</div>
		<!-- 태블릿 & PC -->
		<div class="row m-0 p-0 list_P" id="replyList">
				<div class="col-0 item img_fix"><img src="${pageContext.request.contextPath}/resources/img/noThumbnail.jpg" class="img-thumbnail rounded"></div>
				<div class="col">					
					<h2 class="label">영 화 제 목<small class="ml-2 label_s">영화장르/2019</small></h2>
					<h4 class="label_s">아이디 <small class="mx-2 text-light">리뷰작성일</small></h4>
					<p class="mt-3">댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용
					댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용
					댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용
					댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용
					댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용
					댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용</p>
				</div>
		</div>
				<div class="row m-0 p-0">	
					<div class="col text-right">
						<a href="#" class="badge badge-danger px-2 py-1 text-white">신고</a>
						<a href="#" class="badge badge-dark px-2 py-1 text-white"><i class="far fa-thumbs-up mr-1"></i>추천(1)</a>
						<a href="#" class="badge badge-dark px-2 py-1 text-white">댓글(10)</a>
					</div>
				</div>
					<hr>
		<!-- 모바일 -->
		<div class="row m-0 p-0 list_M" id="replyList">
				<div class="col-4 item"><img src="${pageContext.request.contextPath}/resources/img/noThumbnail.jpg" class="img-thumbnail rounded"></div>
					<div class="col-8">
						<h2 class="label">영 화 제 목</h2>
						<span class="label_s">영화장르/2019</span>
						<h4 class="label_s mt-3 text-light">아이디 <small class="mx-2 ">리뷰작성일</small></h4>
						<p class="mt-3">모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용
						 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용
						  모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용
						   모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용
						    모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용 모바일 확인용</p>
					</div>
		</div>
		<!-- 태블릿 & PC -->
		<div class="row m-0 p-0 list_P" id="replyList">
				<div class="col-0 item img_fix"><img src="${pageContext.request.contextPath}/resources/img/noThumbnail.jpg" class="img-thumbnail rounded"></div>
				<div class="col">					
					<h2 class="label">영 화 제 목<small class="ml-2 label_s">영화장르/2019</small></h2>
					<h4 class="label_s">아이디 <small class="mx-2 text-light">리뷰작성일</small></h4>
					<p class="mt-3">댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용
					댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용
					댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용
					댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용
					댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용
					댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용</p>
				</div>
		</div>
				<div class="row m-0 p-0">	
					<div class="col text-right">
						<a href="#" class="badge badge-danger px-2 py-1 text-white">신고</a>
						<a href="#" class="badge badge-dark px-2 py-1 text-white"><i class="far fa-thumbs-up mr-1"></i>추천(1)</a>
						<a href="#" class="badge badge-dark px-2 py-1 text-white">댓글(10)</a>
					</div>
				</div>
					<hr>
		</div>	

		<!-- 페이징 -->
		<div id="paging" class="row justify-content-center my-3">
			<nav aria-label="">
			  <ul class="pagination pagination-sm">
			    <li class="page-item disabled">
			      <a class="page-link bg-dark" href="#" tabindex="-1" aria-disabled="true">Previous</a>
			    </li>
			    <li class="page-item active"><a class="page-link" href="#">1</a></li>
			    <li class="page-item" aria-current="page">
			      <a class="page-link bg-dark" href="#">2 <span class="sr-only">(current)</span></a>
			    </li>
			    <li class="page-item"><a class="page-link bg-dark" href="#">3</a></li>
			    <li class="page-item">
			      <a class="page-link bg-dark" href="#">Next</a>
			    </li>
			  </ul>
			</nav>
		</div>

  </div>
  
<jsp:include page="../footer.jsp"/>