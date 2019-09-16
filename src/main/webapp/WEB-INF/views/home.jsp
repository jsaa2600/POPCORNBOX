<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%-- <html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
</body>
</html> --%>

<jsp:include page="header.jsp" />
<!--  -->
    <!-- 본문 -->
    <section class="container">
        <!-- Best 영화 -->
        
        <!-- 모바일 버전 -->
        <div class="owl-carousel owl-theme mt-5 mb-4 text-center text-white" id="movie_M">
          <div class="item"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화11</div>
          <div class="item"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화12</div>
          <div class="item"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화3</div>
          <div class="item"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화4</div>
          <div class="item"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화5</div>
          <div class="item"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화6</div>
          <div class="item"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화7</div>
          <div class="item"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화8</div>
          <div class="item"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화9</div>
          <div class="item"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화10</div>
        </div>
        <div class="owl-carousel owl-theme mb-4 text-center text-white" id="movie_M">
          <div class="item"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화11</div>
          <div class="item"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화12</div>
          <div class="item"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화3</div>
          <div class="item"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화4</div>
          <div class="item"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화5</div>
          <div class="item"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화6</div>
          <div class="item"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화7</div>
          <div class="item"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화8</div>
          <div class="item"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화9</div>
          <div class="item"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화10</div>
        </div>
        <div class="owl-carousel owl-theme mb-4 text-center text-white" id="movie_M">
          <div class="item"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화11</div>
          <div class="item"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화12</div>
          <div class="item"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화3</div>
          <div class="item"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화4</div>
          <div class="item"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화5</div>
          <div class="item"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화6</div>
          <div class="item"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화7</div>
          <div class="item"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화8</div>
          <div class="item"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화9</div>
          <div class="item"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화10</div>
        </div>
        <div class="owl-carousel owl-theme mb-5 text-center text-white" id="movie_M">
          <div class="item"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화11</div>
          <div class="item"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화12</div>
          <div class="item"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화3</div>
          <div class="item"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화4</div>
          <div class="item"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화5</div>
          <div class="item"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화6</div>
          <div class="item"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화7</div>
          <div class="item"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화8</div>
          <div class="item"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화9</div>
          <div class="item"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화10</div>
        </div>
        
        <!-- PC 버전 -->
        <div class="row my-5 justify-content-center" id="movie_P">
          <div class="movieBox text-center text-white"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화제목1</div>
          <div class="movieBox text-center text-white"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화제목2</div>
          <div class="movieBox text-center text-white"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화제목3</div>
          <div class="movieBox text-center text-white"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화제목4</div>
          <div class="movieBox text-center text-white"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화제목5</div>
          <div class="movieBox text-center text-white"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화제목6</div>
          <div class="movieBox text-center text-white"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화제목7</div>
          <div class="movieBox text-center text-white"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화제목8</div>
          <div class="movieBox text-center text-white"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화제목9</div>
          <div class="movieBox text-center text-white"><img src="${pageContext.request.contextPath}/resources/img/movie1.jpg" class="img-thumbnail rounded">영화제목10</div>
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
        