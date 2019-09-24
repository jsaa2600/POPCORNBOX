<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService"%>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Collection"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.util.JSONBuilder"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.util.Calendar" %>
<%@page import="java.text.*" %>
<%@ page session="false" %>
<jsp:include page="header.jsp" />

	<!-- 일일 박스오피스 & 주간 박스오피스 -->
	<%
		// 날짜 구하기
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DATE, -1);
		String yesterday = dateFormat.format(calendar.getTime());
		calendar.add(Calendar.DATE, -6);
		String lastWeek = dateFormat.format(calendar.getTime());
	
		// 파라메터 설정
		String targetDt = request.getParameter("targetDt") == null ? yesterday : request.getParameter("targetDt");			// 조회일자
		String itemPerPage = request.getParameter("itemPerPage") == null ? "10" : request.getParameter("itemPerPage");		// 결과row수
		String weekGb = request.getParameter("weekGb") == null ? "0" : request.getParameter("weekGb");				// 조회일자
		String multiMovieYn = request.getParameter("multiMovieYn") == null ? "" : request.getParameter("multiMovieYn");		// “Y” : 다양성 영화 “N” : 상업영화 (default : 전체)
		String repNationCd = request.getParameter("repNationCd") == null ? "" : request.getParameter("repNationCd");		// “K: : 한국영화 “F” : 외국영화 (default : 전체)
		String wideAreaCd = request.getParameter("wideAreaCd") == null ? "" : request.getParameter("wideAreaCd");			// “0105000000” 로서 조회된 지역코드
		
		// 발급키
		String key = "3e98a691f8e1085c47b3a919ed5d8dc9";
		// KOBIS 오픈 API Rest Client를 통해 호출
		KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);
		
		// 일일 박스오피스 서비스 호출 (boolean isJson, String targetDt, String itemPerPage,String multiMovieYn, String repNationCd, String wideAreaCd)
		String dailyResponse = service.getDailyBoxOffice(true, targetDt, itemPerPage, multiMovieYn, repNationCd, wideAreaCd);
		
		// 주간 박스오피스 서비스 호출 (boolean isJson, String targetDt, String itemPerPage, String multiMovieYn, String repNationCd, String wideAreaCd, String weekGb)
		targetDt = request.getParameter("targetDt") == null ? lastWeek : request.getParameter("targetDt");					// 조회일자
		String weeklyResponse = service.getWeeklyBoxOffice(true, targetDt, itemPerPage, weekGb, multiMovieYn, repNationCd, wideAreaCd);
		
		// Json 라이브러리를 통해 Handling
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String,Object> dailyResult = mapper.readValue(dailyResponse, HashMap.class);
		HashMap<String,Object> weeklyResult = mapper.readValue(weeklyResponse, HashMap.class);
		
		request.setAttribute("dailyResult",dailyResult);
		request.setAttribute("weeklyResult",weeklyResult);
	%>
	
	<script>
		// 썸네일 오류 시 대체 이미지 표시
		function thumbnailError() {
			console.log(event);
			event.target.onerror = "";
			event.target.src = "${pageContext.request.contextPath}/resources/img/noThumbnail.jpg";
		}
	</script>
	
    <!-- 상단 슬라이더 -->
    <header>
      <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
          <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
          <!-- Slide One - Set the background image for this slide in the line below -->
          <div class="carousel-item active" style="background-image: url('http://placehold.it/1900x1080')">
            <div class="carousel-caption d-none d-md-block">
              <h3>First Slide</h3>
              <p>This is a description for the first slide.</p>
            </div>
          </div>
          <!-- Slide Two - Set the background image for this slide in the line below -->
          <div class="carousel-item" style="background-image: url('http://placehold.it/1900x1080')">
            <div class="carousel-caption d-none d-md-block">
              <h3>Second Slide</h3>
              <p>This is a description for the second slide.</p>
            </div>
          </div>
          <!-- Slide Three - Set the background image for this slide in the line below -->
          <div class="carousel-item" style="background-image: url('http://placehold.it/1900x1080')">
            <div class="carousel-caption d-none d-md-block">
              <h3>Third Slide</h3>
              <p>This is a description for the third slide.</p>
            </div>
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </header>

    <!-- 본문 -->
    <section class="container">
        
        <!-- 모바일 버전 -->
        <!-- 일일 박스오피스 -->
        <div id="movie_M">
			<div class="row mt-5 justify-content-center text-center text-white">
				<span><c:out value="${dailyResult.boxOfficeResult.boxofficeType}" /></span>
				<span> (<c:out value="${dailyResult.boxOfficeResult.showRange}" />) </span>
			</div>
			<div class="owl-carousel owl-theme text-center text-white">
				<c:if test="${not empty dailyResult.boxOfficeResult.dailyBoxOfficeList}">
					<c:forEach items="${dailyResult.boxOfficeResult.dailyBoxOfficeList}" var="boxoffice">
						<a href="${pageContext.request.contextPath }/rv/info/${boxoffice.movieCd}" class="text-danger">
								<img src="${pageContext.request.contextPath}/resources/img/${boxoffice.movieCd }.jpg" onError="thumbnailError()" class="img-thumbnail rounded" alt="이미지가 없습니다">
								<span class="text-white">${boxoffice.movieNm }(${boxoffice.movieCd })</span>
							</a>
					</c:forEach>
				</c:if>
			</div>
        </div>
        <!-- 주간 박스오피스 -->
        <div id="movie_M">
			<div class="row mt-5 justify-content-center text-center text-white">
				<span><c:out value="${weeklyResult.boxOfficeResult.boxofficeType}" /></span>
				<span> (<c:out value="${weeklyResult.boxOfficeResult.showRange}" />) </span>
			</div>
			<div class="owl-carousel owl-theme mb-5 text-center text-white" id="movie_M">
				<c:if test="${not empty weeklyResult.boxOfficeResult.weeklyBoxOfficeList}">
					<c:forEach items="${weeklyResult.boxOfficeResult.weeklyBoxOfficeList}" var="boxoffice">
						<div class="item">
							<a href="${pageContext.request.contextPath }/rv/info/${boxoffice.movieCd}" class="text-danger">
								<img src="${pageContext.request.contextPath}/resources/img/${boxoffice.movieCd }.jpg" onError="thumbnailError()" class="img-thumbnail rounded" alt="이미지가 없습니다">
								<span class="text-white">${boxoffice.movieNm }(${boxoffice.movieCd })</span>
							</a>
						</div>
					</c:forEach>
				</c:if>
			</div>
        </div>
		
        <!-- PC 버전 -->
        <!-- 일일 박스오피스 -->
        <div class="row mb-5 justify-content-center" id="movie_P">
			<div class="row mt-5 justify-content-center text-center text-white">
				<span><c:out value="${dailyResult.boxOfficeResult.boxofficeType}" /></span>
				<span> (<c:out value="${dailyResult.boxOfficeResult.showRange}" />) </span>
			</div>
			<div class="row justify-content-center">
				<c:if test="${not empty dailyResult.boxOfficeResult.dailyBoxOfficeList}">
					<c:forEach items="${dailyResult.boxOfficeResult.dailyBoxOfficeList}" var="boxoffice">
						<div class="movieBox text-center">
							<a href="${pageContext.request.contextPath }/rv/info/${boxoffice.movieCd}" class="text-danger">
								<img src="${pageContext.request.contextPath}/resources/img/${boxoffice.movieCd }.jpg" onError="thumbnailError()" class="img-thumbnail rounded" alt="이미지가 없습니다">
								<span class="text-white">${boxoffice.movieNm }(${boxoffice.movieCd })</span>
							</a>
						</div>
					</c:forEach>
				</c:if>
			</div>
        </div>
        <!-- 주간 박스오피스 -->
        <div class="row mb-5 justify-content-center" id="movie_P">
	        <div class="row mt-5 justify-content-center text-center text-white">
				<span><c:out value="${weeklyResult.boxOfficeResult.boxofficeType}" /></span>
				<span> (<c:out value="${weeklyResult.boxOfficeResult.showRange}" />) </span>
			</div>
			<div class="row justify-content-center">
				<c:if test="${not empty weeklyResult.boxOfficeResult.weeklyBoxOfficeList}">
					<c:forEach items="${weeklyResult.boxOfficeResult.weeklyBoxOfficeList}" var="boxoffice">
						<div class="movieBox text-center text-white">
							<a href="${pageContext.request.contextPath }/rv/info/${boxoffice.movieCd}" class="text-danger">
								<img src="${pageContext.request.contextPath}/resources/img/${boxoffice.movieCd }.jpg" onError="thumbnailError()" class="img-thumbnail rounded" alt="이미지가 없습니다">
								<span class="text-white">${boxoffice.movieNm }(${boxoffice.movieCd })</span>
							</a>
						</div>
					</c:forEach>
				</c:if>
			</div>
        </div>
        
        <!-- 페이징 -->
        <div class="row my-5 justify-content-center" id="hidden_M">
          <nav aria-label="Page navigation example">
            <ul class="pagination">
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Previous">
                  <span aria-hidden="true">&laquo;</span>
                </a>
              </li>
              <li class="page-item"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Next">
                  <span aria-hidden="true">&raquo;</span>
                </a>
              </li>
            </ul>
          </nav>
        </div>
      </section>
      
<jsp:include page="footer.jsp" />
        