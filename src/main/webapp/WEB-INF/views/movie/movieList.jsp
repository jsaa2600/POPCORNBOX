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
    // 현재 페이지
	String curPage = request.getParameter("curPage") == null ? "1" : request.getParameter("curPage");
	// 결과 레코드 수
	String itemPerPage = request.getParameter("itemPerPage") == null ? "25" : request.getParameter("itemPerPage");
	// 영화명
	String movieNm = request.getParameter("movieNm") == null ? "" : request.getParameter("movieNm");
	// 감독명
	String directorNm = request.getParameter("directorNm") == null ? "" : request.getParameter("directorNm");
	// 개봉연도 시작 조건 (YYYY)
	String openStartDt = request.getParameter("openStartDt") == null ? "2000" : request.getParameter("openStartDt");
	// 개봉연도 끝 조건 (YYYY)
	String openEndDt = request.getParameter("openEndDt") == null ? year : request.getParameter("openEndDt");
	// 제작연도 시작 조건 (YYYY)
	String prdtStartYear = request.getParameter("prdtStartYear") == null ? "" : request.getParameter("prdtStartYear");
	// 제작연도 끝조건 (YYYY)
	String prdtEndYear = request.getParameter("prdtEndYear") == null ? "" : request.getParameter("prdtEndYear");
	// 대표국적코드 (공통코드서비스에서 '2204'로 조회된 국가코드)
	String repNationCd = request.getParameter("repNationCd") == null ? "" : request.getParameter("repNationCd");
	// 영화형태코드 배열 (공통코드서비스에서 '2201'로 조회된 영화형태코드)
	String[] movieTypeCdArr = request.getParameterValues("movieTypeCdArr") == null ? null : request.getParameterValues("movieTypeCdArr");
	
	// 발급키
	String key = "3e98a691f8e1085c47b3a919ed5d8dc9";
	// KOBIS 오픈 API Rest Client를 통해 호출
    KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);

	// 영화코드조회 서비스 호출 (boolean isJson, String curPage, String itemPerPage,String directorNm, String movieCd, String movieNm, String openStartDt,String openEndDt, String ordering, String prdtEndYear, String prdtStartYear, String repNationCd, String[] movieTypeCdArr)
    String movieCdResponse = service.getMovieList(true, curPage, itemPerPage, movieNm, directorNm, openStartDt, openEndDt, prdtStartYear, prdtEndYear, repNationCd, movieTypeCdArr);
	
	// Json 라이브러리를 통해 Handling
	ObjectMapper mapper = new ObjectMapper();
	HashMap<String,Object> result = mapper.readValue(movieCdResponse, HashMap.class);

	request.setAttribute("result",result);

	// KOBIS 오픈 API Rest Client를 통해 코드 서비스 호출 (boolean isJson, String comCode )
	String nationCdResponse = service.getComCodeList(true,"2204");
	HashMap<String,Object> nationCd = mapper.readValue(nationCdResponse, HashMap.class);
	request.setAttribute("nationCd",nationCd);

	String movieTypeCdResponse = service.getComCodeList(true,"2201");
	HashMap<String,Object> movieTypeCd = mapper.readValue(movieTypeCdResponse, HashMap.class);
	request.setAttribute("movieTypeCd",movieTypeCd);
%>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>RestService</title>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
	<script type="text/javascript">
		<%
			String movieTypeCds = "[";
			if(movieTypeCdArr!=null){
				for(int i=0;i<movieTypeCdArr.length;i++){
					movieTypeCds += "'"+movieTypeCdArr[i]+"'";
					if(i+1<movieTypeCdArr.length){
						movieTypeCds += ",";
					}
				}
				movieTypeCds += "]";
		%>
		
		$(function(){
			var movieTypeCd = <%=movieTypeCds%>;
			$(movieTypeCd).each(function(){
				$("input[name='movieTypeCdArr'][value='"+this+"']").prop("checked",true);
			});
		});
		
		<%
			}
		%>
	</script>
</head>
<body>
	<c:out value="${result.movieListResult.totCnt}"/>
	<c:out value="${result }" />
	<table border="1">
		<tr>
			<td>영화명</td>
			<td>영화명(영)</td>
			<td>제작연도</td>
			<td>개봉연도</td>
			<td>제작국가</td>
			<td>감독</td>
			<td>참여영화사</td>
		</tr>
		<c:if test="${not empty result.movieListResult.movieList}">
			<c:forEach items="${result.movieListResult.movieList}" var="movie">
				<tr>
					<td><c:out value="${movie.movieNm }"/></td>
					<td><c:out value="${movie.movieNmEn }"/></td>
					<td><c:out value="${movie.prdtYear }"/></td>
					<td><c:out value="${movie.openDt }"/></td>
					<td><c:out value="${movie.repNationNm}"/></td>
					<td>
						<c:forEach items="${movie.directors}" var="director" varStatus="status">
							<c:out value="${director.peopleNm}"/><c:if test="${!status.last }">, </c:if>
						</c:forEach>
					</td>
					<td>
						<c:forEach items="${movie.companys}" var="company" varStatus="status">
							<c:out value="${company.companyNm}"/><c:if test="${!status.last }">, </c:if> 
						</c:forEach>
					</td>			
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<form action="">
		<div>현재페이지 :<input type="text" name="curPage" value="<%=curPage %>"></div>
		<div>감독명:<input type="text" name="directorNm" value="<%=directorNm %>"></div>
		<div>영화명:<input type="text" name="movieNm" value="<%=movieNm %>"></div>
		<div>개봉연도조건:<input type="text" name="openStartDt" value="<%=openStartDt %>"> ~ <input type="text" name="openEndDt" value="<%=openEndDt %>"></div>
		<div>제작연도조건:<input type="text" name="prdtStartYear" value="<%=prdtStartYear %>"> ~ <input type="text" name="prdtEndYear" value="<%=prdtEndYear %>"></div>		

		국적:<select name="repNationCd">
			<option value="">-전체-</option>
			<c:forEach items="${nationCd.codes}" var="code">
			<option value="<c:out value="${code.fullCd}"/>"<c:if test="${param.repNationCd eq code.fullCd}"> selected="seleted"</c:if>><c:out value="${code.korNm}"/></option>
			</c:forEach>
			</select><br/>
		영화형태:
			<c:forEach items="${movieTypeCd.codes}" var="code" varStatus="status">
				<input type="checkbox" name="movieTypeCdArr" value="<c:out value="${code.fullCd}"/>" id="movieTpCd_<c:out value="${code.fullCd}"/>"/> <label for="movieTpCd_<c:out value="${code.fullCd}"/>"><c:out value="${code.korNm}"/></label>
					<c:if test="${status.count %4 eq 0}"><br/></c:if>
				</c:forEach>
			<br/>
		<input type="submit" name="" value="조회">
	</form>
</body>
</html>