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
            <button id="sidebar-toggle">사이드바 토글</button>
        </div>
        
        <div class="header-center">
            <h1 class="home">  <a class="logo" href="${pageContext.request.contextPath}/"></a> 유투버 스코프</h1>
        </div>

        <div class="header-right">
            <button id="login">로그인</button>
            <button id="enroll">회원가입</button>
        </div>
    </div>
	</header>

</body>
</html>