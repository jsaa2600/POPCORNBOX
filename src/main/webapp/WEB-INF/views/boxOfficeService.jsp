<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Collection" %>
<%@ page import="net.sf.json.JSONObject" %>
<%@ page import="net.sf.json.util.JSONBuilder" %>
<%@ page import="net.sf.json.JSONArray" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>RestService</title>
</head>
<body>
	<%
		// 파라메터 설정
		// 조회일자
		String targetDt = request.getParameter("targetDt") == null ? "20190828" : request.getParameter("targetDt");
		// 결과 레코드 수
		String itemPerPage = request.getParameter("itemPerPage") == null ? "10" : request.getParameter("itemPerPage");
		// "Y" : 다양성 영화 "N" : 상업 영화 (default : 전체);
		String multiMovieYn = request.getParameter("multiMovieYn") == null ? "" : request.getParameter("multiMovieYn");
		// "K" : 한국 영화 "F" : 외국 영화 (default : 전체);
		String repNationCd = request.getParameter("repNationCd") == null ? "" : request.getParameter("repNationCd");
		// 상영 지역 코드
		String wideAreaCd = request.getParameter("wideAreaCd") == null ? "" : request.getParameter("wideAreaCd");
		
		// 발급 키
		String key = "3e98a691f8e1085c47b3a919ed5d8dc9";
		// KOBIS 오픈 API Rest Client를 통해 호출
		KobisOpenAPIRestService kobisService = new KobisOpenAPIRestService(key);
		
		// 일일 박스오피스 서비스 호출
		// (boolean isJson, String targetDt, String itemPerPage, String multiMovieYn, String repNationCd, String wideAreaCd)
		String dailyResponse = kobisService.getDailyBoxOffice(true, targetDt, itemPerPage, multiMovieYn, repNationCd, wideAreaCd);
		
		// Json 라이브러리를 통해 핸들링
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> dailyResult = mapper.readValue(dailyResponse, HashMap.class);
		request.setAttribute("dailyResult", dailyResult);
		
		// KOBIS 오픈 API Rest Client를 통해 코드 서비스 호출 
		// (boolean isJson, boolean comCode)
		String codeResponse = kobisService.getComCodeList(true, wideAreaCd);
		HashMap<String, Object> codeResult = mapper.readValue(codeResponse, HashMap.class);
		request.setAttribute("codeResult", codeResult);
		
	%>
	<c:out value="${dailyResult }" />
	<table border="1">
		<tr>
			<td>순위</td>
			<td>영화명</td>
			<td>개봉일</td>
			<td>매출액</td>
			<td>매출액점유율</td>
			<td>매출액증감(전일대비)</td>
			<td>누적매출액</td>
			<td>관객수</td>
			<td>관객수증감(전일대비)</td>
			<td>누적관객수</td>
			<td>스크린수</td>
			<td>상영횟수</td>
		</tr>
		<c:if test="${not empty dailyResult.boxOfficeResult.dailyBoxOfficeList }">
			<c:forEach items="${dailyResult.boxOfficeResult.dailyBoxOfficeList }" var="boxOffice">
				<tr>
					<td><c:out value="${boxOffice.rank }" /></td>
					<td><c:out value="${boxOffice.movieNm }" /></td>
					<td><c:out value="${boxOffice.openDt }" /></td>
					<td><c:out value="${boxOffice.salesAmt }" /></td>
					<td><c:out value="${boxOffice.salesShare }" /></td>
					<td><c:out value="${boxOffice.salesInten }" /> / <c:out value="${boxOffice.salesChange }" /></td>
					<td><c:out value="${boxOffice.salesAcc }" /></td>
					<td><c:out value="${boxOffice.audiCnt }" /></td>
					<td><c:out value="${boxOffice.audiInten }" /> / <c:out value="${boxOffice.audiChange }" /></td>
					<td><c:out value="${boxOffice.audiAcc }" /></td>
					<td><c:out value="${boxOffice.scrnCnt }" /></td>
					<td><c:out value="${boxOffice.showCnt }" /></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</body>
</html>