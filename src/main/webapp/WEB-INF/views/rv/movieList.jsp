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
    // 현재 페이지
	String reqPage = request.getAttribute("reqPage") == null ? "1" : (String)request.getAttribute("reqPage");
	// 결과 레코드 수
	String itemPerPage = "20";
	// 영화명
	String movieNm = request.getAttribute("movieNm") == null ? "" : (String)request.getAttribute("movieNm");
	// 감독명
	String directorNm = request.getAttribute("directorNm") == null ? "" : (String)request.getAttribute("directorNm");
	// 개봉연도 시작 조건 (YYYY)
	String openStartDt = "2000";
	// 개봉연도 끝 조건 (YYYY)
	String openEndDt = year;
	// 제작연도 시작 조건 (YYYY)
	String prdtStartYear = "";
	// 제작연도 끝조건 (YYYY)
	String prdtEndYear = "";
	// 대표국적코드 (공통코드서비스에서 '2204'로 조회된 국가코드)
	String repNationCd = request.getAttribute("repNationCd") == null ? "" : (String)request.getAttribute("repNationCd");
	// 영화형태코드 배열 (공통코드서비스에서 '2201'로 조회된 영화형태코드)
	String[] movieTypeCdArr = {""};
	
	// 발급키
	String key = "3e98a691f8e1085c47b3a919ed5d8dc9";
	// KOBIS 오픈 API Rest Client를 통해 호출
    KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);

	// 영화코드조회 서비스 호출 (boolean isJson, String reqPage, String itemPerPage,String directorNm, String movieCd, String movieNm, String openStartDt,String openEndDt, String ordering, String prdtEndYear, String prdtStartYear, String repNationCd, String[] movieTypeCdArr)
    String movieCdResponse = service.getMovieList(true, reqPage, itemPerPage, movieNm, directorNm, openStartDt, openEndDt, prdtStartYear, prdtEndYear, repNationCd, movieTypeCdArr);
	
	// Json 라이브러리를 통해 Handling
	ObjectMapper mapper = new ObjectMapper();
	HashMap<String,Object> result = mapper.readValue(movieCdResponse, HashMap.class);

	request.setAttribute("result",result);
	request.setAttribute("reqPage", reqPage);
	request.setAttribute("directorNm", directorNm);
	request.setAttribute("movieNm", movieNm);
	request.setAttribute("repNationCd", repNationCd);

	// KOBIS 오픈 API Rest Client를 통해 코드 서비스 호출 (boolean isJson, String comCode )
	String nationCdResponse = service.getComCodeList(true,"2204");
	HashMap<String,Object> nationCd = mapper.readValue(nationCdResponse, HashMap.class);
	request.setAttribute("nationCd",nationCd);

%>
<style>
	#search_p{
		display: none;
	}
	table tr td{
		padding: 15px 0;
		border-bottom: 1px solid #9bb3c9;
	}
	.pointer:hover{
		background-color: #007BFF;
		color: #fff;
	}
	.border_b{
		border-top: 1px solid #9bb3c9;
		border-bottom: 2px solid #9bb3c9;
	}
}
</style>

<section class="container">
	<form action="${pageContext.request.contextPath}/rv/movieList" id="searchForm">
		<div class="row justify-content-center my-5">	
			<!-- 영화명 검색 -->
			<div class="col-3 input-group">
			  <div class="input-group-prepend">
			    <span class="input-group-text bg-black text-light" id="inputGroup-sizing-default">영화명</span>
			  </div>
			  <input type="text" class="form-control" name="movieNm" id="movieNm" value="${movieNm }" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>

			<!-- 감독명 검색 -->
			<div class="col-3 input-group">
			  <div class="input-group-prepend">
			    <span class="input-group-text bg-black text-light" id="inputGroup-sizing-default">감독명</span>
			  </div>
			  <input type="text" class="form-control" name="directorNm" id="directorNm" value="${directorNm }" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
			
			<!-- 국가 검색 -->			
			<div class="col-3 input-group">
			  <div class="input-group-prepend">
			    <label class="input-group-text bg-black text-light" for="inputGroupSelect01">국가</label>
			  </div>
				<select class="custom-select" name="repNationCd" id="repNationCd">
					<option value="">-전체-</option>
					<c:forEach items="${nationCd.codes}" var="code">
						<option value="${code.fullCd}" <c:if test="${repNationCd eq code.fullCd}"> selected="seleted"</c:if>>${code.korNm}</option>
					</c:forEach>
				</select>
			</div>
			
			<!-- 조회버튼 -->
			<input type="submit" class="col-1 btn btn-bl" id="searchFormSubmitBtn" value="조회">
		</div>

		<!-- 검색된 총 영화 수 -->
		<div class="text-right mb-2">
			${result.movieListResult.totCnt}건의 영화 검색됨
		</div>
	</form>
	
	
		<!-- 검색 테이블 -->
			<table class="col text-center">
				<tr class="bg-black text-light font-weight-bold border_b">
					<td>영화명</td>
					<td>개봉일</td>
					<td>제작국</td>
					<td>감독</td>
					<td>영화사</td>
					<td>제작상태</td>
				</tr>
				<c:if test="${not empty result.movieListResult.movieList}">
					<c:forEach items="${result.movieListResult.movieList}" var="movie">
						<tr class="pointer" style = "cursor:pointer;" onClick = " location.href='${pageContext.request.contextPath }/rv/info/${movie.movieCd}' " onMouseOver = " indow.status = '${pageContext.request.contextPath }/rv/info/${movie.movieCd}' " onMouseOut = " window.status = '' ">
							<td><a class="font-weight-bold text-decoration-none text-white" href="${pageContext.request.contextPath }/rv/info/${movie.movieCd}"><c:out value="${movie.movieNm }"/></a></td>
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
							<td><c:out value="${movie.prdtStatNm}"/></td>
						</tr>
						</c:forEach>
					</c:if>
			</table>

			
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
		

</section>
	
<jsp:include page="../footer.jsp"/>