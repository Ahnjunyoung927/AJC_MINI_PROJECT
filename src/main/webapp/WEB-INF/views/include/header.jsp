<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
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

	
        <div class="header-right">
    <c:choose>
    <c:when test="${ empty sessionScope.loginMember }">    
            <button onclick="location.href='${pageContext.request.contextPath}/member/loginform'" id="login">로그인</button>
            <button onclick="location.href='${pageContext.request.contextPath}/member/enroll'" id="enroll">회원가입</button>
    </c:when>
    
    <c:otherwise>
    <label style="margin-top: 5px;"><span style="color: red;">♥</span> 
    ${ sessionScope.loginMember.memberId }님 
    <span style="color: red;">♥</span></label> &nbsp;&nbsp;
    		<button onclick="location.href='${pageContext.request.contextPath}/member/mypage'" id="mypage" style="font-weight: 500; font-size: 15px;">마이페이지</button>
            <button onclick="location.href='${pageContext.request.contextPath}/member/logout'" id="logout" style="font-weight: 500; font-size: 15px;">로그아웃</button>
    </c:otherwise>
    </c:choose>
        </div>
    </div>
	</header>
	
	<script>
    // DOM 로드 후 버튼 클릭 시 페이지 이동
    
  </script>
  

</body>
</html>