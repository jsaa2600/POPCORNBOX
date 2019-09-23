<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<link href="${pageContext.request.contextPath}/webjars/bootstrap/4.3.1/css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet">

	<!-- fontawesome -->
	<link href="${pageContext.request.contextPath}/webjars/font-awesome/5.9.0/css/all.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Gugi&display=swap" rel="stylesheet">

    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    <!-- owl carousel -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
    
    <!-- 영화 오픈 API -->
    <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/KobisOpenAPIRestService.js"></script>

    <title>팝 콘 박 스</title>
    
    <style>
    /* 모바일 */
    @media (max-width:575px) {
      #search_m, #movie_M{
        display: block;
      }
      #search_p, #hidden_M, #movie_P, .owl-dots{
        display: none;
      }
    }
    /* 태블릿 & PC */
    @media (min-width:576px) {
    
    	.navbar-brand{
    		font-family: 'Gugi', cursive;
    		background: linear-gradient(-20deg, #9795f0 0%, #fbc8d4 100%);
    		-webkit-background-clip: text;
  			-webkit-text-fill-color: transparent;
    	}
    
      #search_m, #movie_M{
        display: none;
      }
      #search_p{
        display: block;
      }
      #movie_P{
        display: flex;
      }
      .input_width{
        width: 430px !important;
      }
      .home_a{
        display: none;
      }
    }

    .movieBox{
      width: 150px;
      margin: 10px;
    }

    </style>

    <script>
        $(document).ready(function() {
          var owl = $('.owl-carousel');
          owl.owlCarousel({
            margin: 5,
            nav: false,
            loop: true,
            responsive: {
              0: {
                items: 4
              },
              600: {
                items: 0
              },
              1000: {
                items: 0
              }
            }
          })
        })
    </script>

  </head>
  <body>

    <!-- 상단메뉴 -->
    <div class="container-fluid">
      <div class="row">
        <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
            <div class="container">
              <!-- 상단 로고 -->
              <a class="navbar-brand" id="hidden_M" href="${pageContext.request.contextPath}">팝콘박스</a>
              <!-- 상단 검색 : 모바일 -->
              <div class="mx-0 px-0 col-9" id="search_m">
                <form class="form-inline px-0">
                    <div class="input-group border border-light rounded">
                        <input type="search" class="form-control bg-dark text-white border-0" placeholder="검색어 입력" aria-label="Search">
                        <div class="input-group-append">
                          <button class="btn btn-dark" type="submit">검색</button>
                        </div>
                    </div>
                </form>
              </div>
              <!-- 상단 메뉴 -->
              <button class="navbar-toggler navbar-toggler-right col-2.5" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                  <ul class="navbar-nav ml-auto">
                    <li class="nav-item home_a">
                      <a class="nav-link" href="${pageContext.request.contextPath}">홈</a>
                    </li>
                    
                    <!-- 로그인 메뉴 -->
                    <c:choose>
	                    <c:when test="${empty sessionScope.user }">
		                    <li class="nav-item">
		                      <a class="nav-link" href="${pageContext.request.contextPath}/login/loginForm">로그인</a>
		                    </li>
		                    <li class="nav-item">
		                      <a class="nav-link" href="${pageContext.request.contextPath}/member/memberJoinForm">회원가입</a>
		                    </li>
	                    </c:when>
	                    <c:otherwise>
		                    <li class="nav-item">
		                      <a class="nav-link" href="${pageContext.request.contextPath}/login/logout">로그아웃</a>
		                    </li>
		                    <li class="nav-item">
		                      <a class="nav-link" href="${pageContext.request.contextPath}/member/memberInfo/${sessionScope.user.id}">마이페이지</a>
		                    </li>
                    	</c:otherwise>
                    </c:choose>
                    
                    <!-- 기본 메뉴 -->
                    <li class="nav-item">
                      <a class="nav-link" href="${pageContext.request.contextPath }/movie/reviewList">영화리뷰</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="${pageContext.request.contextPath }/movie/movieList">작품찾기</a>
                    </li>
                  </ul>
                </div>
            </div>
          </nav>
       </div>
      </div>

			<!-- 상단 검색 : 576px 이상 -->
	    <div class="container my-3 " id="search_p">
	      <div class="row justify-content-center">
	        <form class="form-inline my-lg-0">
	          <div class="input-group input_width border border-light rounded">
	              <input type="search" class="form-control bg-dark text-white border-0" placeholder="검색어를 입력하세요." aria-label="Search">
	              <div class="input-group-append">
	                <button class="btn btn-dark" type="submit">검색</button>
	              </div>
	          </div>
	        </form>
	      </div>
	    </div>
