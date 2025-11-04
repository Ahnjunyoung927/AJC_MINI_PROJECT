<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${youtuber.youtuberName} 상세 정보 및 리뷰</title>
<style>
    /* 기본 설정 */
    body { 
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
        background-color: #f0f0f0; 
        color: #333333; 
        margin: 0;
    }
    main { 
        padding: 40px 20px; 
        display: flex; 
        flex-direction: column; 
        align-items: center;
    }
    h2 {
        color: #1a1a1a; 
        margin-bottom: 30px;
        font-weight: 700;
        border-bottom: 2px solid #ccc; 
        padding-bottom: 10px;
    }

    /* 유튜버 상세 정보 섹션 */
    .creator-detail-container {
        width: 100%;
        max-width: 900px;
        background: #ffffff;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
        display: flex;
        gap: 30px;
        margin-bottom: 50px;
        align-items: flex-start;
    }

    .creator-profile-img {
        width: 150px;
        height: 150px;
        border-radius: 50%; /* 원형 이미지 */
        object-fit: cover;
        border: 4px solid #1a1a1a;
        flex-shrink: 0;
    }

    .creator-info {
        flex-grow: 1;
    }

    .creator-info h3 {
        font-size: 28px;
        margin: 0 0 10px 0;
        color: #1a1a1a;
    }

    .creator-info p {
        margin: 5px 0;
        font-size: 16px;
        color: #555;
    }

    .info-label {
        font-weight: 600;
        color: #333;
        display: inline-block;
        width: 90px;
    }

    /* 리뷰 섹션 제목 */
    h3.review-section-title {
        width: 100%;
        max-width: 900px;
        text-align: left;
        color: #1a1a1a;
        border-bottom: 1px solid #ddd;
        padding-bottom: 10px;
        margin-bottom: 30px;
    }

    /* 리뷰 그리드 레이아웃 */
    .review-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
        gap: 25px;
        width: 100%;
        max-width: 900px;
        margin-bottom: 50px;
    }

    .review-card {
        background: #ffffff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        border: 1px solid #eee;
        transition: transform 0.2s;
    }

    .review-card:hover {
        transform: translateY(-3px);
        box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
    }

    .review-header {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
        border-bottom: 1px solid #f0f0f0;
        padding-bottom: 15px;
        margin-bottom: 15px;
    }

    .channel-info {
        display: flex;
        align-items: center;
    }

    .channel-icon {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        margin-right: 10px;
        object-fit: cover;
        background-color: #eee; /* 이미지 없을 때 배경 */
    }

    .channel-name {
        font-size: 18px;
        margin: 0;
        font-weight: 600;
    }

    .reviewer {
        font-size: 14px;
        color: #888;
        margin: 0;
    }

    .like-btn {
        background: none;
        border: 1px solid #ccc;
        color: #333;
        padding: 5px 10px;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.2s, border-color 0.2s;
    }

    .like-btn:hover {
        background-color: #f0f0f0;
        border-color: #333;
    }

    .review-content p {
        font-size: 15px;
        line-height: 1.6;
        margin-bottom: 15px;
    }

    .review-tags span {
        display: inline-block;
        background-color: #e0e0e0;
        color: #555;
        padding: 3px 8px;
        border-radius: 15px;
        font-size: 12px;
        margin-right: 5px;
        margin-top: 5px;
    }

    .review-date {
        font-size: 12px;
        color: #aaa;
        margin-top: 15px;
        text-align: right;
    }

    /* 리뷰 작성 폼 영역 */
    .review-form-area {
        width: 100%;
        max-width: 900px;
        background: #ffffff;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
        margin-bottom: 50px;
    }

    .review-form-area textarea {
        width: 98%;
        height: 100px;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 6px;
        resize: none;
        margin-bottom: 10px;
    }

    .review-form-area button { 
        width: 150px;
        padding: 10px 15px; 
        background-color: #1a1a1a; 
        color: #ffffff; 
        border: 1px solid #1a1a1a; 
        border-radius: 6px; 
        cursor: pointer; 
        font-size: 14px;
        float: right;
    }

    .review-form-area button:hover {
        background-color: #333333;
    }

    /* 반응형 디자인 */
    @media (max-width: 768px) {
        .creator-detail-container {
            flex-direction: column;
            align-items: center;
            padding: 20px;
        }
        .creator-profile-img {
            margin-bottom: 20px;
        }
        .creator-info {
            text-align: center;
        }
        .review-grid {
            grid-template-columns: 1fr;
        }
    }
</style>
</head>
<body>

    <jsp:include page="../include/sidebar.jsp" />
    <jsp:include page="../include/header.jsp" />

    <main>
        <h2>유튜버 상세 정보</h2>
        
        <!-- =================================================== -->
        <!-- 1. 유튜버 상세 정보 섹션 (TB_CREATOR, TB_NATION, TB_CATEGORY_MD 기반) -->
        <!-- =================================================== -->
        <c:choose>
            <c:when test="${not empty youtuber}">
                <div class="creator-detail-container">
                    
                    <!-- 프로필 이미지 (PROFILE_IMG) -->
                    <img 
                        src="${youtuber.profileImg != null ? youtuber.profileImg : '/resources/images/default_profile.png'}" 
                        alt="${youtuber.youtuberName} 프로필 이미지" 
                        class="creator-profile-img"
                    />
                    
                    <div class="creator-info">
                        <!-- 유튜버 이름 (CREATOR_NAME) -->
                        <h3>${youtuber.youtuberName}</h3>
                        
                        <!-- 구독자 수 (SUBSCR_COUNT) -->
                        <p>
                            <span class="info-label">구독자 수</span>: 
                            <fmt:formatNumber value="${youtuber.subscribe}" pattern="#,###"/>명
                        </p>
                        
                        <!-- 국가 (NATION_CODE) -->
                        <p>
                            <span class="info-label">국가</span>: 
                            ${youtuber.nationName != null ? youtuber.nationName : youtuber.nationCode}
                        </p>
                        
                        <!-- 주 카테고리 (TB_CATEGORY_MD / field) -->
                        <p>
                            <span class="info-label">주요 분야</span>:
                            <c:choose>
                                <c:when test="${not empty categoryList}">
                                    <c:forEach var="category" items="${categoryList}" varStatus="status">
                                        ${category.categoryName}
                                        <c:if test="${!status.last}">, </c:if>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    정보 없음
                                </c:otherwise>
                            </c:choose>
                        </p>

                        <!-- 유튜버 상태 (CREATOR_STATUS) -->
                        <p>
                            <span class="info-label">상태</span>: 
                            <c:choose>
                                <c:when test="${youtuber.status eq 'Y'}"><span style="color: green;">활동 중</span></c:when>
                                <c:when test="${youtuber.status eq 'N'}"><span style="color: orange;">휴면</span></c:when>
                                <c:otherwise>알 수 없음</c:otherwise>
                            </c:choose>
                        </p>
                        
                        <!-- 북마크 버튼 (TB_BOOKMARK 기능 구현 필요) -->
                        <button class="like-btn" style="margin-top: 15px;">
                            <c:if test="${isBookmarked eq true}">★ 북마크 해제</c:if>
                            <c:if test="${isBookmarked eq false}">☆ 북마크 추가</c:if>
                        </button>

                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="creator-detail-container">
                    <p>유효하지 않거나 존재하지 않는 유튜버 정보입니다.</p>
                </div>
            </c:otherwise>
        </c:choose>

        <!-- =================================================== -->
        <!-- 2. 리뷰 작성 폼 영역 -->
        <!-- =================================================== -->
        <h3 class="review-section-title">리뷰 작성</h3>
        <div class="review-form-area">
            <form action="${pageContext.request.contextPath}/review/add" method="POST">
                <!-- 유튜버 번호 숨김 -->
                <input type="hidden" name="creatorNo" value="${youtuber.youtuberNo}" />
                
                <!-- 리뷰 제목 (REVIEW_NAME) -->
                <input type="text" name="reviewName" placeholder="리뷰 제목을 입력하세요." style="width: 98%; padding: 10px; margin-bottom: 10px; border: 1px solid #ccc; border-radius: 6px;" required>
                
                <!-- 리뷰 내용 (REVIEW_CONTENT) -->
                <textarea name="reviewContent" placeholder="이 유튜버에 대한 평가를 상세하게 작성해주세요. (최대 1000자)" required></textarea>
                
                <!-- 태그 (TB_TAG_MD / TB_TAG) 입력 필드 Placeholder -->
                <input type="text" name="tags" placeholder="#태그를 쉼표로 구분하여 입력하세요 (예: #기술, #IT)" style="width: 98%; padding: 8px; margin-bottom: 15px; border: 1px solid #ccc; border-radius: 6px;">

                <button type="submit">리뷰 등록</button>
                <div style="clear: both;"></div>
            </form>
        </div>


        <!-- =================================================== -->
        <!-- 3. 리뷰 목록 그리드 (TB_REVIEW, TB_LIKE, TB_TAG_MD 기반) -->
        <!-- =================================================== -->
        <h3 class="review-section-title">유튜버 리뷰 목록 (${not empty reviewList ? reviewList.size() : 0}개)</h3>
        
        <div class="review-grid">
            <c:choose>
                <c:when test="${not empty reviewList}">
                    <c:forEach var="review" items="${reviewList}">
                        <!-- REVIEW_NO를 기반으로 상세 리뷰 카드 구성 -->
                        <article class="review-card">
                            <div class="review-header">
                                <div class="channel-info">
                                    <!-- 리뷰어 정보 -->
                                    <img src="/resources/images/user_icon.png" alt="리뷰어 아이콘" class="channel-icon" />
                                    <div>
                                        <!-- 리뷰 제목 (REVIEW_NAME) -->
                                        <h3 class="channel-name">${review.reviewName}</h3>
                                        <!-- 리뷰어 ID/닉네임 (MEMBER_NO 기반) -->
                                        <p class="reviewer">${review.reviewerId != null ? review.reviewerId : '익명 사용자'}</p>
                                    </div>
                                </div>
                                <!-- 좋아요 버튼 (TB_LIKE 기능) -->
                                <button class="like-btn">
                                    <c:if test="${review.isLiked eq true}">❤️</c:if>
                                    <c:if test="${review.isLiked eq false}">♡</c:if>
                                    좋아요 (${review.likeCount != null ? review.likeCount : 0})
                                </button>
                            </div>

                            <!-- 리뷰 내용 (REVIEW_CONTENT) -->
                            <div class="review-content">
                                <p>${review.reviewContent}</p>
                            </div>

                            <!-- 리뷰 태그 (TB_TAG_MD) -->
                            <div class="review-tags">
                                <c:if test="${not empty review.tagList}">
                                    <c:forEach var="tag" items="${review.tagList}">
                                        <span>#${tag}</span>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${empty review.tagList}">
                                    <span>#태그없음</span>
                                </c:if>
                            </div>

                            <!-- 리뷰 작성 시간 (REVIEW_DATE) -->
                            <div class="review-date">
                                리뷰 작성 시간 
                                <fmt:parseDate value="${review.reviewDate}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate" />
                                <fmt:formatDate value="${parsedDate}" pattern="yyyy년 MM월 dd일 게시" />
                            </div>
                            
                            <!-- 신고 버튼 (TB_REPORT 기능) -->
                            <div style="text-align: right; margin-top: 5px;">
                                <a href="#" style="color: #999; font-size: 12px; text-decoration: none;">신고하기</a>
                            </div>
                        </article>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <p style="width: 100%; text-align: center; color: #777;">아직 등록된 리뷰가 없습니다. 첫 리뷰를 작성해 보세요!</p>
                </c:otherwise>
            </c:choose>
        </div>

    </main>
    
    <jsp:include page="../include/footer.jsp" />

</body>
</html>
