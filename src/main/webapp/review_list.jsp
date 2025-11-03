<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body {
	background-color: white;
	color: black;
	font-family: 'Noto Sans KR', sans-serif;
	margin: 0;
}

.review-container {
	width: 90%;
	max-width: 1400px;
	margin: 40px auto;
}

.section-title {
	font-size: 1.8rem;
	text-align: center;
	margin-bottom: 20px;
	font-weight: 700;
}

.filter-buttons {
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
	gap: 10px;
	margin-bottom: 30px;
}

.filter-buttons button {
	background: #1c1c1c;
	color: #fff;
	border: none;
	padding: 8px 16px;
	border-radius: 20px;
	cursor: pointer;
	transition: 0.2s;
}

.filter-buttons button:hover, .filter-buttons .active {
	background: #ff4b4b;
}

.review-grid {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
	/* ✅ 자동 가로 배치 */
	gap: 25px;
	justify-content: center;
	align-items: start;
}

/* ✅ 카드 스타일 개선 */
.review-card {
	background: white;
	border: 1px solid #333; /* ✅ 테두리 추가 */
	border-radius: 12px;
	padding: 20px;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	transition: 0.2s;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.4); /* ✅ 기본 그림자 */
}

.review-card:hover {
	transform: translateY(-4px);
	border-color: #ff4b4b; /* ✅ hover 시 선 강조 */
	box-shadow: 0 4px 10px rgba(255, 75, 75, 0.3);
}

.review-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 10px;
}

.channel-info {
	display: flex;
	align-items: center;
	gap: 10px;
}

.channel-icon {
	width: 45px;
	height: 45px;
	border-radius: 50%;
	background: #333;
}

.channel-name {
	margin: 0;
	font-size: 1rem;
	font-weight: 600;
}

.reviewer {
	font-size: 0.85rem;
	color: #bbb;
}

.review-content {
	margin: 15px 0;
	line-height: 1.4;
	font-size: 0.95rem;
}

.review-tags {
	display: flex;
	flex-wrap: wrap;
	gap: 6px;
	margin-bottom: 10px;
}

.review-tags span {
	background: gray;
	padding: 4px 8px;
	border-radius: 10px;
	border: black;
	font-size: 0.75rem;
	color: black;
}

.review-date {
	font-size: 0.8rem;
	color: #888;
	text-align: right;
}

.like-btn {
	background: none;
	border: none;
	color: #bbb;
	font-size: 1.1rem;
	cursor: pointer;
	transition: color 0.2s;
}

.like-btn:hover {
	color: #ff4b4b;
}

.review-grid {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
	gap: 20px;
	justify-content: center;
	align-items: start;
	border: 1px;
}

.card {
	background: var(- -panel);
	border: 1px solid var(- -card-border);
	border-radius: 10px;
	padding: 18px;
	position: relative;
	box-shadow: 0 6px 18px rgba(0, 0, 0, 0.45);
	min-height: 180px;
	display: flex;
	flex-direction: column;
	gap: 12px;
}
</style>
<body>

	<jsp:include page="WEB-INF/views/include/sidebar.jsp" />
	<jsp:include page="WEB-INF/views/include/header.jsp" />

	<main class="review-container">
		<h2 class="section-title">YouTube 채널 리뷰</h2>

		<!-- 필터 버튼 영역 -->
		<div class="filter-buttons">
			<button onclick="getReviews();">최신 리뷰 </button>
			
			<!--<script>
				pageNo = 1;
				$(function() {
					getReviews();
				})
				
				function detailReview(num) {
					location.href=`
				}
				
				function getReviews() {
					$.ajax({
						url : `/review_list`,
						data : {
							pageNo : pageNo
						},
						success : response => {
							pageNo++
							console.log(response);
							
							const reviews = response.get
							
							const result = reviews.map(e => `
									<div
										
							)							
						}
					})
				}
							
			</script>-->
			
			
			<button onclick="goToPage('latest.jsp')">🕓 최신 리뷰</button>
			<button onclick="goToPage('top_liked.jsp')">❤️ 가장 많이 좋아요를 받은 리뷰</button>
			<button>⭐ 별점</button>
			<button onclick="goToPage('reviewAll.jsp')">📋 모든 리뷰</button>
		</div>

		<!-- 리뷰 카드 리스트 -->
		
		<section class="review-grid">
			<c:choose>
			<c:when test="${ not empty map.reviews }">
			<c:forEach var="review" items="${ map.reviews }">
				<article class="review-card">
					<div class="review-header">
						<div class="channel-info">
							<img src="profile1.png" alt="채널 아이콘" class="channel-icon" />
							<div>
								<h3 class="channel-name">${ review.reviewNo }</h3>
								<p class="reviewer">${ review.reviewWriter }</p>
							</div>
						</div>
						<button class="like-btn">좋아요♡</button>
					</div>
	
					<div class="review-content">
						<p>${ review.reviewContent }</p>
					</div>
	
					<div class="review-tags">
						<span>리뷰 태그</span> <span>리뷰 태그2</span> <span>리뷰 태그3</span> <span>리뷰
							태그4</span>
					</div>
	
					<div class="review-date">${ review.reviewWriteDate }</div>
				</article>
			</c:forEach>
			</c:when>	
			</c:choose>
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
	</main>
	<jsp:include page="WEB-INF/views/include/footer.jsp" />
</body>
</html>