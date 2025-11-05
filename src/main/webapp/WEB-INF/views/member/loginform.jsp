<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <style>
    
	.login-form {
		border: 1px solid black;
		width: 1000px;
		height: 800px;
		justify-content: center;
		align-items: center;
		padding-right: 10%;
	}
	
	#login-wrap {
		width: 50%;
		height: 100%;
		margin-top: 5%;
		margin-left: 30%;
		
	}
    
    #loginForm {
    
    	display: flex;
    	flex-direction: column;
    	
    }
    
    #login-button {
    	border: 1px solid black;
    }
    
    span:hover {
    	font-weight: bold;
    }
    
  
    
    </style>
</head>
<body>
    
    <!-- 메뉴바 -->
    <jsp:include page="../include/header.jsp" />


	<main>
	<div class="login-form">
	<div id="login-wrap">
	<form action="login" method="post" id="loginForm">
	<label>아이디</label>
	<input type=text id="memberId" name="memberId" placeholder="아이디를 입력해주세요." />
	<br />
	<label>비밀번호</label>
	<input type=password id="memberPwd" name="memberPwd" placeholder="비밀번호를 입력해주세요." />
	<br />
	<button type="submit" id="login-button">로그인</button>
	<div id=loginService">
	<br />
	<span class=hover.span>아이디찾기</span>
	<i>|</i>
	<span class=hover.span>비밀번호찾기</span>
	<i>|</i>
	<span class=hover.span onclick="location.href='${pageContext.request.contextPath}/member/enroll'">회원가입</span>
	</div>
	</form>
	</div>
	</div>
	
	
	</main>


    <!-- 푸터바 -->
    <jsp:include page="../include/footer.jsp" />

</body>
</html>
