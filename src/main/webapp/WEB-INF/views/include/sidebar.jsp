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
	
	<div class="sidebar-overlay"></div>

	<nav class="sidebar">
    <button type="button" class="sidebar-close">X</button>

    <div class="side-els">
        <div class="side-logo">
            <img src="" alt="로고">
            <h3>유투버스코프</h3>
        </div>
        
        <div class="side-nav">
            <a href="index.jsp">홈</a>
            <a href="youtuber_list.jsp">유투버</a>
            <a href="">리뷰</a>
            <c:if test="${not empty sessionScope.loginMember and sessionScope.loginMember.adminYn eq 'Y'}" >
            <a href="${pageContext.request.contextPath}/reports">관리자</a>
            </c:if>
        </div>
    </div>
</nav>
	
	
	
	

</body>
</html>