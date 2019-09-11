<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<a href="${pageContext.request.contextPath }/member/memberJoinForm">회원가입</a>
<a href="${pageContext.request.contextPath }/login/loginForm">로그인</a>
</body>
</html>
