<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>유투버 전체 목록</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css"> 
    
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
    
    <style>
        /* 3x3 그리드 레이아웃 */
        .youtuber-list-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr); /* 한 줄에 3개씩 */
            gap: 20px; /* 카드 사이의 간격 */
            max-width: 1200px;
            margin: 0 auto 30px auto;
        }

        .youtuber-card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            text-align: center;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
            cursor: pointer;
            transition: transform 0.2s, box-shadow 0.2s;
        }
        
        .youtuber-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .youtuber-card img {
            width: 100%;
            max-width: 150px; /* 이미지 크기 조절 */
            height: 150px;
            border-radius: 50%; /* 원형 이미지 */
            object-fit: cover;
            margin-bottom: 15px;
            background-color: #f0f0f0;
        }
        
        .youtuber-card h4 {
            margin: 10px 0;
            font-size: 1.2em;
        }
        
        .youtuber-card p {
            font-size: 0.9em;
            color: #555;
            margin: 5px 0;
        }

        /* 페이징 CSS */
        .page {
            text-align: center;
            margin-top: 30px;
        }
        .page a {
            display: inline-block;
            padding: 8px 12px;
            margin: 0 3px;
            border: 1px solid #ddd;
            border-radius: 4px;
            text-decoration: none;
            color: #333;
        }
        .page a:hover {
            background-color: #f5f5f5;
        }
        .page a.active {
            background-color: #333; /* 활성 페이지 색상 */
            color: white;
            font-weight: bold;
            border-color: #333;
        }
    </style>
</head>
<body>

    <jsp:include page="../include/sidebar.jsp" />
    <jsp:include page="../include/header.jsp" />

    <main>
        <h3>유투버 전체 목록</h3>
        
        <div class="youtuber-list-container">
            
            <c:if test="${empty list}">
                <p style="grid-column: 1 / -1; text-align: center;">조회된 유튜버가 없습니다.</p>
            </c:if>

            <c:forEach var="y" items="${list}">
                <div class="youtuber-card" 
                     onclick="location.href='${pageContext.request.contextPath}/youtuber/detail?no=${y.youtuberNo}'">
                    
                    <img src="${pageContext.request.contextPath}/assets/images/default_profile.png" alt="기본 이미지" />
                    
                    <h4>${y.youtuberName}</h4>
                    <p>카테고리: (미정)</p>
                    <p>구독자: ${y.subscribe} 명</p>
                </div>
            </c:forEach>

        </div>

        <div class="page">
            
            <c:if test="${pi.currentPage > 1}">
                <a href="${pageContext.request.contextPath}/youtuber/list?page=${pi.currentPage - 1}">&laquo;</a>
            </c:if>

            <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
                <a href="${pageContext.request.contextPath}/youtuber/list?page=${p}"
                   class="${pi.currentPage == p ? 'active' : ''}">
                    ${p}
                </a>
            </c:forEach>

            <c:if test="${pi.currentPage < pi.maxPage}">
                <a href="${pageContext.request.contextPath}/youtuber/list?page=${pi.currentPage + 1}">&raquo;</a>
            </c:if>
        </div>
    </main>

    <jsp:include page="../include/footer.jsp" />

</body>
</html>