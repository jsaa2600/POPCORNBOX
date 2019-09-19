<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="../header.jsp" />

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }
      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>



		<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto">
		  <h1 class="display-4">${memberDTO.nickname} 님</h1>
		  <p class="lead">${memberDTO.grade}</p>
		  <p class="lead">${memberDTO.good}</p>
		  <p class="lead">${memberDTO.bad}</p>
		</div>
  	<div class="row mb-2 justify-content-center">
    <div class="col-md-6 col-lg-3">
      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-400 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <h2 class="mb-3 text-center font-weight-bold">내정보 관리</h2>
          <a href="${pageContext.request.contextPath}/member/getMember/${sessionScope.user.id}" class="stretched-link small"></a>
        </div>
      </div>
    </div>
       <div class="col-md-6 col-lg-3">
      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-400 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <h2 class="mb-3 text-center font-weight-bold">비밀번호 변경</h2>
          <a href="${pageContext.request.contextPath}/member/changePwForm" class="stretched-link small"></a>
        </div>
      </div>
    </div>
       <div class="col-md-6 col-lg-3">
      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-400 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <h2 class="mb-3 text-center font-weight-bold">회원 탈퇴</h2>
          <a href="${pageContext.request.contextPath}/member/memberDeleteForm/${sessionScope.user.id}" class="stretched-link small"></a>
        </div>
      </div>
    </div>

  </div>

<jsp:include page="../footer.jsp" />