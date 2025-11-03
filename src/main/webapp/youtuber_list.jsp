<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>유투버 전체 목록</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<link rel="stylesheet" href="assets/css/style.css">

<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
</head>
<body>

	<jsp:include page="WEB-INF/views/include/sidebar.jsp" />
	<jsp:include page="WEB-INF/views/include/header.jsp" />

	<main>
		<h3>유투버 전체 목록</h3>

		<div class="youtuber-list-container">
			<div class="youtuber-card">
				<img />
				<h4>유투버 이름</h4>
				<p>카테고리: ?</p>
				<p>구독자: 만명</p>
			</div>
			<%

			%>
		</div>



		<div class="page">
			<a href="#">&laquo;</a> <a href="#" class="active">1</a> <a href="#">2</a>
			<a href="#">3</a> <a href="#">&raquo;</a>
		</div>
	</main>

	<jsp:include page="WEB-INF/views/include/footer.jsp" />
</body>
</html>