<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<jsp:include page="header.jsp" />

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
        