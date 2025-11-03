<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
		</div>
		
		<section class="review-grid">

			<!-- 카드 1 -->
			<article class="review-card">
				<div class="review-header">
					<div class="channel-info">
						<img src="profile1.png" alt="채널 아이콘" class="channel-icon" />
						<div>
							<h3 class="channel-name">1번째 리뷰</h3>
							<p class="reviewer">1번째 리뷰어</p>
						</div>
					</div>
					<button class="like-btn">좋아요♡</button>
				</div>

				<div class="review-content">
					<p>리뷰 코멘트</p>
				</div>

				<div class="review-tags">
					<span>리뷰 태그</span> <span>리뷰 태그2</span> <span>리뷰 태그3</span> <span>리뷰
						태그4</span>
				</div>

				<div class="review-date">리뷰 작성 시간 2025년 10월 29일 게시</div>
			</article>

			<!-- 카드 2 -->
			<article class="review-card">
				<div class="review-header">
					<div class="channel-info">
						<img src="profile1.png" alt="채널 아이콘" class="channel-icon" />
						<div>
							<h3 class="channel-name">2번째 리뷰</h3>
							<p class="reviewer">2번째 리뷰어</p>
						</div>
					</div>
					<button class="like-btn">좋아요♡</button>
				</div>

				<div class="review-content">
					<p>리뷰 코멘트</p>
				</div>

				<div class="review-tags">
					<span>리뷰 태그</span> <span>리뷰 태그2</span> <span>리뷰 태그3</span> <span>리뷰
						태그4</span>
				</div>

				<div class="review-date">리뷰 작성 시간 2025년 10월 29일 게시</div>
			</article>

			<!-- 카드 3 -->
			<article class="review-card">
				<div class="review-header">
					<div class="channel-info">
						<img src="profile1.png" alt="채널 아이콘" class="channel-icon" />
						<div>
							<h3 class="channel-name">3번째 리뷰</h3>
							<p class="reviewer">3번째 리뷰어</p>
						</div>
					</div>
					<button class="like-btn">좋아요♡</button>
				</div>

				<div class="review-content">
					<p>리뷰 코멘트</p>
				</div>

				<div class="review-tags">
					<span>리뷰 태그</span> <span>리뷰 태그2</span> <span>리뷰 태그3</span> <span>리뷰
						태그4</span>
				</div>

				<div class="review-date">리뷰 작성 시간 2025년 10월 29일 게시</div>
			</article>

			<!-- 카드 4 -->
			<article class="review-card">
				<div class="review-header">
					<div class="channel-info">
						<img src="profile1.png" alt="채널 아이콘" class="channel-icon" />
						<div>
							<h3 class="channel-name">4번째 리뷰</h3>
							<p class="reviewer">4번째 리뷰어</p>
						</div>
					</div>
					<button class="like-btn">좋아요♡</button>
				</div>

				<div class="review-content">
					<p>리뷰 코멘트</p>
				</div>

				<div class="review-tags">
					<span>리뷰 태그</span> <span>리뷰 태그2</span> <span>리뷰 태그3</span> <span>리뷰
						태그4</span>
				</div>

				<div class="review-date">리뷰 작성 시간 2025년 10월 29일 게시</div>
			</article>

			<!-- 카드 5 -->
			<article class="review-card">
				<div class="review-header">
					<div class="channel-info">
						<img src="profile1.png" alt="채널 아이콘" class="channel-icon" />
						<div>
							<h3 class="channel-name">5번째 리뷰</h3>
							<p class="reviewer">5번째 리뷰어</p>
						</div>
					</div>
					<button class="like-btn">좋아요♡</button>
				</div>

				<div class="review-content">
					<p>리뷰 코멘트</p>
				</div>

				<div class="review-tags">
					<span>리뷰 태그</span> <span>리뷰 태그2</span> <span>리뷰 태그3</span> <span>리뷰
						태그4</span>
				</div>

				<div class="review-date">리뷰 작성 시간 2025년 10월 29일 게시</div>
			</article>

			<!-- 카드 6 -->
			<article class="review-card">
				<div class="review-header">
					<div class="channel-info">
						<img src="profile1.png" alt="채널 아이콘" class="channel-icon" />
						<div>
							<h3 class="channel-name">6번째 리뷰</h3>
							<p class="reviewer">6번째 리뷰어</p>
						</div>
					</div>
					<button class="like-btn">좋아요♡</button>
				</div>

				<div class="review-content">
					<p>리뷰 코멘트</p>
				</div>

				<div class="review-tags">
					<span>리뷰 태그</span> <span>리뷰 태그2</span> <span>리뷰 태그3</span> <span>리뷰
						태그4</span>
				</div>

				<div class="review-date">리뷰 작성 시간 2025년 10월 29일 게시</div>
			</article>

		</section>

		<div class="page">
			<a href="#">&laquo;</a> <a href="#" class="active">1</a> <a href="#">2</a>
			<a href="#">3</a> <a href="#">&raquo;</a>
		</div>
	</main>

	<jsp:include page="WEB-INF/views/include/footer.jsp" />
</body>
</html>