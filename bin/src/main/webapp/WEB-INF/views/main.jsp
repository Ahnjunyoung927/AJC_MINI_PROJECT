<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AJC</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="/resources/css/product/product_detail.css">
    <script src="/resources/js/product/product_detail.js"></script>
    
</head>
<body>
	<jsp:include page="include/header.jsp" />
	<jsp:include page="include/sidebar.jsp" />
	
	<main>
        <h3>추천 유투버</h3>
        <div class="swiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide"><img src="https://via.placeholder.com/600x250?text=Slide+1"></div>
                <div class="swiper-slide"><img src="https://via.placeholder.com/600x250?text=Slide+2"></div>
                <div class="swiper-slide"><img src="https://via.placeholder.com/600x250?text=Slide+3"></div>
                <div class="swiper-slide"><img src="https://via.placeholder.com/600x250?text=Slide+4"></div>
                <div class="swiper-slide"><img src="https://via.placeholder.com/600x250?text=Slide+5"></div>
                <div class="swiper-slide"><img src="https://via.placeholder.com/600x250?text=Slide+6"></div>
                <div class="swiper-slide"><img src="https://via.placeholder.com/600x250?text=Slide+7"></div>
            </div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-pagination"></div>
        </div>

        <section class="ranking-section">
            <h3>실시간 유투버 순위 (최근 유투버, 좋아요 많이 달린 리뷰 즐겨찾기고려)</h3>
            <div class="ranking-container">
                <div class="ranking-item"><h4>A 유투버</h4><p>구독자: 100만</p><p>작성된 리뷰 ?개</p><p>즐겨찾기 ?개</p></div>
                <div class="ranking-item"><h4>B 유투버</h4><p>구독자: 80만</p><p>작성된 리뷰 ?개</p><p>즐겨찾기 ?개</p></div>
                <div class="ranking-item"><h4>C 유투버</h4><p>구독자: 50만</p><p>작성된 리뷰 ?개</p><p>즐겨찾기 ?개</p></div>
            </div>
        </section>

        <section class="ranking-section">
            <h3>실시간 리뷰 순위 (최근 리뷰, 좋아요 많이 달린 리뷰 고려)</h3>
            <div class="ranking-container">
                <div class="ranking-item"><h4>리뷰 제목 1</h4><p>유투버: A</p><p>좋아요: 1000개</p></div>
                <div class="ranking-item"><h4>리뷰 제목 2</h4><p>유투버: C</p><p>좋아요: 800개</p></div>
                <div class="ranking-item"><h4>리뷰 제목 3</h4><p>유투버: B</p><p>좋아요: 500개</p></div>
            </div>
        </section>

        <section>
             <h3>추가 정보 영역</h3>
             <div class="placeholder-section">
                 <p>추가 콘텐츠  영역</p>
             </div>
        </section>

    </main>
	
	
	
	
	
	
	<jsp:include page="include/footer.jsp" />
</body>
</html>