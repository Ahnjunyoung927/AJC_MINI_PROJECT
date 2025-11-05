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
    
    .enroll {
    width: 300px;
    height: 300px;
    }
    
    #enrollForm {
    	display: flex;
    	flex-direction: column;
    }
    
    
    
    </style>
</head>
<body>
    
    <!-- 메뉴바 -->
    <jsp:include page="../include/header.jsp" />


	<main>
	<div class="enroll">
	<form action="register" method="post" id="enrollForm">
	<h2>회원가입</h2>
	<label>아이디</label>
	<input type=text id="memberId" name="memberId" placeholder="영문과 숫자만 입력 가능합니다." />
	<label>비밀번호</label>
	<input type=password id="memberPwd" name="memberPwd" placeholder="영문+숫자+특수문자 6~15자 이내" />
	<label>비밀번호 확인</label>
	<input type="password" id="confirmPwd" placeholder="비밀번호를 다시 입력해주세요." />
	<label>이메일</label>
	<input type="text" id="email" name="email" placeholder="ex) user01@kh.com" />
	<label>연락처</label>
	<input type="text" id="phone" name="phone" placeholder="ex) 010-1234-5678" />
	<button type="submit">Join</button>
	</form> 
	</div>
	
	
	</main>


    <!-- 푸터바 -->
    <jsp:include page="../include/footer.jsp" />

</body>
</html>
