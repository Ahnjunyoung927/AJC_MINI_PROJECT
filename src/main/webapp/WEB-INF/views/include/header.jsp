<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    
    
    
</head>
<body>
	<header>
    <div class="header-main">
        <div class="header-left">
            <a class="logo" href="index.jsp">LOGO</a>
            <button id="sidebar-toggle">사이드바 토글</button>
        </div>
        
        <div class="header-center">
            <h1 class="home">유투버 스코프</h1>
        </div>
		
		
		<c:choose>
		
		<c:when test="${ empty sessionScope.loginMember }">
        <div class="header-right">
            <button id="login" onclick="window.location.href='${pageContext.request.contextPath}/members/loginForm'">로그인</button>
            <button id="enroll">회원가입</button>
        </div>
        
        </c:when>
        
        <c:otherwise>
        <div class="header-right">
            <button id="login">로그아웃</button>
            <button id="enroll">내 정보</button>
        </div>
        </c:otherwise>
        
        </c:choose>
        
        
    </div>
	</header>

</body>
</html>