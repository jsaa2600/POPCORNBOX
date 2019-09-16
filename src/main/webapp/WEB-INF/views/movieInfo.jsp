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
</head>
<body>
	<c:out value="${result.movieInfoResult.movieInfo }" />
</body>
</html>