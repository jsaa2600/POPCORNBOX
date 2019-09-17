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
<!DOCTYPE html>
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
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>RestService</title>
	
	<!-- 자바스크립트 파일 -->
	<script src="${pageContext.request.contextPath }/webjars/jquery/3.4.1/dist/jquery.js"></script>
	<script src="${pageContext.request.contextPath }/webjars/popper.js/1.14.7/dist/umd/popper.js"></script>
	<script src="${pageContext.request.contextPath }/webjars/bootstrap/4.3.1/js/bootstrap.js"></script>
	
	<script>
	
		// 영화 정보 Ajax 호출
		var info = [];
		$.ajax({
			type : "GET",			// http 전송 방식
			url : "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json",	// 요청 url
			/* headers : {				// 전송데이터(자바스크립트 객체)
				 "Content-Type" : "application/json"
			}, */
			dataType : "JSON",			// 요청시 응답데이터 타입
			data : {	// 전송 데이터
				movieCd: "20188750",
				key: "3e98a691f8e1085c47b3a919ed5d8dc9"
			},
			success : function(result) {
				info = result.movieInfoResult.movieInfo
				showMovieInfo(info);
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
			let nations = "";	// 국가
			info.nations.forEach(function(item, index, array) {
				nations += item.nationNm;
				if(index < (array.length - 1)) {
					nations += ", ";
				}
			});
			let genres = "";	// 장르
			info.genres.forEach(function(item, index, array) {
				genres += item.genreNm;
				if(index < (array.length - 1)) {
					genres += ", ";
				}
			});
			let directors = "";	// 감독
			info.directors.forEach(function(item, index, array) {
				directors += item.peopleNm;
				if(index < (array.length - 1)) {
					directors += ", ";
				}
			});
			let actors = "";	// 배우
			info.actors.forEach(function(item, index, array) {
				actors += item.peopleNm;
				if(indezx < (array.length - 1)) {
					actors += ", ";
				}
			});
			let str = ""
			+	'<tr>'
			+		'<td>영화코드</td>'
			+		'<td>' + info.movieCd + '</td>'
			+	'</tr>'
			+	'<tr>'
			+		'<td>영화명</td>'
			+		'<td>' + info.movieNm + '</td>'
			+	'</tr>'
			+	'<tr>'
			+		'<td>상영시간</td>'
			+		'<td>' + info.showTm + '</td>'
			+	'</tr>'
			+	'<tr>'
			+		'<td>개봉일</td>'
			+		'<td>' + info.openDt + '</td>'
			+	'</tr>'
			+	'<tr>'
			+		'<td>국가</td>'
			+		'<td>' + nations + '</td>'
			+	'</tr>'
			+	'<tr>'
			+		'<td>장르</td>'
			+		'<td>' + genres + '</td>'
			+	'</tr>'
			+	'<tr>'
			+		'<td>감독</td>'
			+		'<td>' + directors + '</td>'
			+	'</tr>'
			+	'<tr>'
			+		'<td>배우</td>'
			+		'<td>' + actors + '</td>'
			+	'</tr>'
			+	'<tr>'
			+		'<td>관람등급</td>'
			+		'<td>' + info.audits[0].watchGradeNm + '</td>'
			+	'</tr>';
			
			$("#movieInfo").html(str);
		}

	</script>
</head>
<body>
	<table id="movieInfo" border="1">
	</table>
	<c:out value="${result.movieInfoResult.movieInfo }" />
</body>
</html>