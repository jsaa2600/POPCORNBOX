<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService"%>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Collection"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.util.JSONBuilder"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.util.Calendar" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../header.jsp" />
<%
	// 현재 연도 계산
	Calendar calendar = Calendar.getInstance();
	String year = String.valueOf(calendar.get(Calendar.YEAR));

    // 영화 코드 조회 REST 호출 - 서버측에서 호출하는 방식
    // 영화 코드
	String movieCd = request.getParameter("movieCd") == null ? "20188750" : request.getParameter("movieCd");
    
	// 발급키
	String key = "3e98a691f8e1085c47b3a919ed5d8dc9";
	// KOBIS 오픈 API Rest Client를 통해 호출
    KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);

	// 영화코드조회 서비스 호출 (boolean isJson, String curPage, String itemPerPage,String directorNm, String movieCd, String movieNm, String openStartDt,String openEndDt, String ordering, String prdtEndYear, String prdtStartYear, String repNationCd, String[] movieTypeCdArr)
    String movieInfoResponse = service.getMovieInfo(true, movieCd);
	
	// Json 라이브러리를 통해 Handling
	ObjectMapper mapper = new ObjectMapper();
	HashMap<String,Object> result = mapper.readValue(movieInfoResponse, HashMap.class);

	request.setAttribute("result", result);

%>
	<style>
		/*태블릿*/
		@media (min-width:576px) {
			h2{
				font-size: 2.5em;
			}
			small{
				font-size: 0.7em;
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
				width: 250px;
			}
			h2{
				font-size: 3em;
			}
			small{
				font-size: 0.8em;
			}
		}
	</style>

	<script>
	
		var l_reqPage = "1";
		var l_condition = "moviecd";
		var l_data = "${movieCd}";
		var l_url = "${pageContext.request.contextPath}/rvrest";
		var l_id = "${sessionScope.user.id}";
		var l_nickname = "${sessionScope.user.nickname}";
		var l_movieCd = "${movieCd}";
		var l_movieNm;
		var l_movieOpendt;
		var l_movieGenre;
		
		// 영화 정보 Ajax 호출
		var info = [];
		$.ajax({
			type : "GET",			// http 전송 방식
			url : "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json",	// 요청 url
			dataType : "JSON",			// 요청시 응답데이터 타입
			data : {	// 전송 데이터
				movieCd: l_movieCd,
				key: "3e98a691f8e1085c47b3a919ed5d8dc9"
			},
			success : function(result) {
				info = result.movieInfoResult.movieInfo
				showMovieInfo();
			},
			error : function(xhr, status, err) {
				console.log("code : " + xhr.status);
				console.log("message : " + xhr.responseText);
				console.log("status : " + status);
				console.log("err : " + err);
			}
		});
		
		// 영화 정보 표시
		function showMovieInfo() {
			console.log(info);
			// 개봉일
			let openDt = info.openDt.substr(0, 4) + "."
			+ info.openDt.substr(4, 2) + "."
			+ info.openDt.substr(6, 2);
			// 국가
			let nations = "";
			info.nations.forEach(function(item, index, array) {
				nations += item.nationNm;
				if(index < (array.length - 1)) {
					nations += ", ";
				}
			});
			// 장르
			let genres = "";
			info.genres.forEach(function(item, index, array) {
				genres += item.genreNm;
				if(index < (array.length - 1)) {
					genres += ", ";
				}
			});
			// 감독
			let directors = "";
			info.directors.forEach(function(item, index, array) {
				directors += item.peopleNm;
				if(index < (array.length - 1)) {
					directors += ", ";
				}
			});
			// 배우
			let actors = "";
			info.actors.forEach(function(item, index, array) {
				actors += item.peopleNm;
				if(index < (array.length - 1)) {
					actors += ", ";
				}
			});
			let str = ""
			+ 	'<div class="col-0 item img_fix"><img src="${pageContext.request.contextPath}/resources/img/'+ info.movieCd +'.jpg" onError="thumbnailError()" class="img-thumbnail rounded" alt="이미지가 없습니다"></div>'
			+		'<div class="col mt-3">'
			+			'<h2 class="label text-light">' + info.movieNm + '<small class="ml-3 label_s">' + genres + '/' + openDt + '</small></h2>'
			+			'<h4 class="label_s text-primary">개요</h4>'
			+			'<h4 class="label_s text-primary">'
			+				'<small class="mr-3">상영시간: ' + info.showTm + '분</small>'
			+				'<small class="mr-3">/</small>'
			+				'<small class="mr-3">관람등급: ' + info.audits[0].watchGradeNm + '</small>'
			+				'<small class="mr-3">/</small>'
			+				'<small>국가: ' + nations + '</small>'
			+				'<br>'
			+				'<small class="mr-3">감독: ' + directors + '</small>'
			+				'<small class="mr-3">/</small>'
			+				'<small>배우: ' + actors + '</small>'
			+			'</h4>'
			+		'</div>'
			
			l_movieNm = info.movieNm;
			l_movieOpendt = openDt;
			l_movieGenre = genres;
				
			$("#movieInfo").html(str);
			reviewList();
		}
		
		// 썸네일 오류 시 대체 이미지 표시
		function thumbnailError() {
			console.log(event);
			event.target.onerror = "";
			event.target.src = "${pageContext.request.contextPath}/resources/img/noThumbnail.jpg";
		}
		
		$(function() {
			
			// 별점 마우스 이벤트
			$(".reviewPopcorn").each(function(index, item) {
				// click
				$(item).on("click", function() {
					let flag = false;
					console.log("click");
					for(let i=0; i<5; i++) {
						$(".reviewPopcorn:nth-child(" + (i+1) + ")").attr("data-selected", "");
						$(".reviewPopcorn:nth-child(" + (i+1) + ")").attr("class", "far fa-thumbs-down mr-1 reviewPopcorn");
					}
					$(item).attr("data-selected", "selected");
					for(let i=0; i<5; i++) {
						let selected = $(".reviewPopcorn:nth-child(" + (i+1) + ")").attr("data-selected");
						if(flag == false) {
							$(".reviewPopcorn:nth-child(" + (i+1) + ")").attr("class", "fas fa-thumbs-up mr-1 reviewPopcorn");
						}
						if(selected == "selected") {
							flag = true;
						}
					}
				});
			});
			
			// 별점 주기 버튼
			$("#reviewPopBtn").on("click", function() {
				console.log("pop");
				$("#reviewPopcornBorder .fa-thumbs-up").attr("class", "fas fa-thumbs-up mr-1 reviewPopcorn")
			});
			
			// 리뷰 쓰기 버튼
			$("#reviewFormSubmitBtn").on("click", function() {
				let $url = l_url;
				let $rvtitle = $("#rvtitle").val();
				let $rvpop = $("#reviewPopcornBorder .fa-thumbs-up").length;
				
				// ajax 
				$.ajax({
					type: "POST",				// http 전송 방식
					url: $url,					// 요청 url
					headers: {					// 전송데이터(자바스크립트 객체)
						 "Content-Type" : "application/json"
					},
					dataType: "text",			// 요청시 응답데이터 타입
					data: JSON.stringify({		// 전송 데이터
						rvid: l_id,
						rvnickname: l_nickname,
						rvtitle: $("#rvtitle").val(),
						rvcontent: $("#rvcontent").val(),
						rvpop: $rvpop,
						rvmoviecd: l_movieCd,
						rvmovienm: l_movieNm,
						rvmovieopendt: l_movieOpendt,
						rvmoviegenre: l_movieGenre
					}),
					 
					success: function(result) {
						console.log(result);
						reviewList();
						$("#rvtitle").val("");
						$("#rvcontent").val("");
					 },
					
					error: function(xhr, status, err) {
						console.log("xhr : " + xhr);
						console.log("status : " + status);
						console.log("err : " + err);
					}
					
				});
			});
			
		});
		
		// 리뷰 목록 불러오기
		function reviewList() {
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
						item.rvtitle = (item.rvtitle == null)? "" : item.rvtitle;
						$str += ''
						+'	<!-- 모바일 -->'
						+'	<div class="row col-12 m-0 p-0" data-rvnum="' + item.rvnum + '">'
						+'		<input type="hidden" class="reviewRvnum" value="' + item.rvnum + '">'
						+'		<input type="hidden" class="reviewRvid" value="' + item.rvid + '">'
						+'		<input type="hidden" class="reviewRvmoviecd" value="' + item.rvmoviecd + '">'
						+'		<div class="col-12 mt-3">'
						// +'			<h2 class="label text-light">' + item.rvmovienm + '</h2>'
						// +'			<span class="label_s text-light">' + item.rvmoviegenre + ' / ' + item.rvmovieopendt + ' 개봉</span>'
						+'			<h4 class="label_s text-primary">'
						+'			<img src="${pageContext.request.contextPath }/resources/img/face.png" class="rounded-cicle" style="width:50px" alt="" /> '
						+'			' + item.rvnickname + '<small class="mx-2">' + item.rvcdate + '</small>'
						+'			</h4>'
						+'			<p class="mt-3"><b>' + item.rvtitle + '</b></p>'
						+'			<p class="mt-1">' + item.rvcontent + '</p>'
						+'		</div>'
						+'	</div>'
						+'	<div class="row col-12 m-0 p-0">'
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
					reviewList();
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
		
		// 좋아요&싫어요 버튼
		function goodOrBadBtn(item, $gobstatus) {
			let $data_rvnum = $(item).attr("href");
			let target = $("div[data-rvnum='" + $data_rvnum + "']");
			let $gobidfrom = l_id;
			let $gobidto = $(target).children("input.reviewRvid").val();
			let $gobrvnum = $(target).children("input.reviewRvnum").val();
			let $gobmoviecd = $(target).children("input.reviewRvmoviecd").val();
			let $url = l_url + "/gob";
			
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

	</script>

<div class="container-fluid">
	<div class="content_wrap">
		<!-- 영화개요 -->
		<div class="row m-0 pb-4" id="movieInfo">
			<div class="col-0 item img_fix"><img src="${pageContext.request.contextPath}/resources/img/${movieCd }.jpg" onError="thumbnailError()" class="img-thumbnail rounded" alt="이미지가 없습니다"></div>				
			<div class="col">
						<h2 class="label text-light">영 화 제 목<small class="ml-2 label_s">영화장르/2019</small></h2>
						<h4 class="label_s">개요 <small class="mx-2">개요 내용</small></h4>
						<p class="mt-3">영화내용</p>
			</div>
		</div>

		<form id="reviewForm" action="" method="POST">
			<div class="row">
				<div class="col justify-content-center text-center">
					<textarea id="rvtitle" class="col" rows="1" placeholder="한줄평을 입력해주세요 (미입력 가능)"></textarea>
				</div>
			</div>
			<div class="row">
				<div class="col justify-content-center text-center">
					<textarea id="rvcontent" class="col" rows="6" placeholder="리뷰 내용을 입력해주세요"></textarea>
				</div>
			</div>
			<div class="row mb-1">
				<div class="col text-start">
					<!-- <div id="reviewPopBtn" class="btn btn-sm btn-light">별점 주기</div> -->
					<div id="reviewPopcornBorder" class="btn btn-sm border border-white bg-light">
						<i class="fas fa-thumbs-up mr-1 reviewPopcorn" data-selected=""></i>
						<i class="fas fa-thumbs-up mr-1 reviewPopcorn" data-selected=""></i>
						<i class="fas fa-thumbs-up mr-1 reviewPopcorn" data-selected=""></i>
						<i class="fas fa-thumbs-up mr-1 reviewPopcorn" data-selected=""></i>
						<i class="fas fa-thumbs-up mr-1 reviewPopcorn" data-selected="selected"></i>
					</div>
				</div>
				<div class="col-3 text-right">
					<div id="reviewFormSubmitBtn" class="btn btn-sm btn-light">리뷰쓰기</div>
				</div>
			</div>
		</form>

		<hr class="border-secondary">
			
		<!-- 댓글목록 -->
		<div class="row m-0 p-0 list_P" id="reviewList">
		</div>
	</div>
</div>

<jsp:include page="../footer.jsp" />