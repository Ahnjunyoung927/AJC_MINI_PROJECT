<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
	<style>
		#login-form-box {
			border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            background-color: #fafafa;
            width: 800px;
            height: 400px;
            margin: auto;
            justify-content: center; 
            align-items: center;     
            text-align: center;
		}
		.login-body{
			display : flex;
			height: 40px;
			margin: auto;
			justify-content: center; 
            align-items: center;     
            text-align: center;
            margin-top: 20px;
		}
		p {
			margin: auto;
		}
	
	
	</style>

</head>
<body>

	<jsp:include page="../include/header.jsp" />
	<jsp:include page="../include/sidebar.jsp" />


	<div id=login-form-box>
	<form action="${pageContext.request.contextPath}/members/login" method="post" >
		<div class="login-body">
			<h1> 회원 로그인 </h1>
		</div>
		
		<div class="login-body">
			<div>
			<p>아이디 : </p>
			</div>
			<input type="text" placeholder="아이디를 입력하세요." name="memberId" /> <br> 	
		</div>

		<div class="login-body">
			<div>
			<p>비밀번호 : </p>
			</div> 
			<input type="password" placeholder="비밀번호를 입력하세요." name="memberPw" />
		</div>

		<div class="login-body">
			<button type="submit">로그인</button>
			<button type="reset">초기화</button>
		</div>
	</form>
	</div>


	<jsp:include page="../include/footer.jsp" />

</body>
</html>