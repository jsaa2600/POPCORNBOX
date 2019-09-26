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
	
		// 영화 정보 Ajax 호출
		var movieCd = "${movieCd}";
		console.log(movieCd);
		var info = [];
		$.ajax({
			type : "GET",			// http 전송 방식
			url : "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json",	// 요청 url
			/* headers : {				// 전송데이터(자바스크립트 객체)
				 "Content-Type" : "application/json"
			}, */
			dataType : "JSON",			// 요청시 응답데이터 타입
			data : {	// 전송 데이터
				movieCd: movieCd,
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
			+		'<div class="col">'
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
			
			$("#movieInfo").html(str);
		}
		
		// 썸네일 오류 시 대체 이미지 표시
		function thumbnailError() {
			console.log(event);
			event.target.onerror = "";
			event.target.src = "${pageContext.request.contextPath}/resources/img/noThumbnail.jpg";
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
			<div class="btn btn-sm btn-light">리뷰쓰기</div>
			<hr class="border-secondary">
			
		<!-- 댓글목록 -->
		<div class="row m-0 p-0 list_P" id="replyList">
				<div class="col">
					<h3 class="label text-primary">
						<img src="${pageContext.request.contextPath }/resources/img/face.png" class="rounded-cicle" style="width:50px" alt="" /> 
						<span class="text-light">***님</span>의 리뷰<small class="ml-3">리뷰작성일</small>
					</h3>
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
						<a href="#" class="badge badge-primary px-2 py-1 text-white"><i class="far fa-thumbs-up mr-1"></i>추천(1)</a>
						<a href="#" class="badge badge-primary px-2 py-1 text-white">댓글(10)</a>
					</div>
				</div>
				<hr class="border-secondary">
					
		<!-- 페이징 -->
		<div id="paging" class="row justify-content-center mt-5">
			<nav aria-label="">
			  <ul class="pagination pagination-sm">
			    <li class="page-item disabled">
			      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
			    </li>
			    <li class="page-item active"><a class="page-link" href="#">1</a></li>
			    <li class="page-item" aria-current="page">
			      <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
			    </li>
			    <li class="page-item"><a class="page-link" href="#">3</a></li>
			    <li class="page-item">
			      <a class="page-link" href="#">Next</a>
			    </li>
			  </ul>
			</nav>
		</div>
					
	</div>
</div>

<jsp:include page="../footer.jsp" />