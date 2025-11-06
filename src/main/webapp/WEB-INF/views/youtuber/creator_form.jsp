<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신규 유튜버 등록</title>
<style>
    /* 전체 레이아웃 및 폰트 - 밝은 배경 */
    body { 
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
        background-color: #f0f0f0; /* 밝은 회색 배경 */
        color: #333333; /* 진한 텍스트 색상 */
        margin: 0;
    }
    
    /* 메인 콘텐츠 영역 스타일 */
    main { 
        padding: 40px 20px; 
        display: flex; 
        flex-direction: column; 
        align-items: center;
    }
    
    /* 제목 */
    h2 {
        color: #1a1a1a; /* 검정색 제목 */
        margin-bottom: 30px;
        font-weight: 600;
        border-bottom: 2px solid #ccc; /* 제목 아래 구분선 */
        padding-bottom: 10px;
    }

    /* 폼 컨테이너 스타일 - 하얀색 배경 */
    .creator-form-container { 
        max-width: 500px; 
        width: 100%;
        margin: 0 auto; 
        padding: 30px; 
        background: #ffffff; /* 폼 배경색 (하얀색) */
        border: 1px solid #ddd; /* 경계선 색상 */
        border-radius: 12px; 
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1); /* 은은한 그림자 */
    }
    
    /* 입력 필드 그룹 */
    .form-group { 
        margin-bottom: 25px; 
    }
    
    /* 라벨 */
    label { 
        display: block; 
        margin-bottom: 8px; 
        font-weight: 500; 
        color: #555; /* 진한 회색 라벨 텍스트 */
    }
    
    /* 텍스트/숫자 입력 필드 */
    input[type="text"], 
    input[type="number"],
    input[type="file"] { 
        width: 95%; 
        padding: 10px; 
        background-color: #ffffff; /* 입력 필드 내부 배경 */
        color: #333333; /* 입력 텍스트 색상 */
        border: 1px solid #ccc; /* 경계선 */
        border-radius: 6px; 
        box-sizing: border-box;
        transition: border-color 0.3s, box-shadow 0.3s;
    }
    
    input[type="text"]:focus, 
    input[type="number"]:focus,
    input[type="file"]:focus {
        border-color: #555; /* 포커스 시 경계선 색상 */
        box-shadow: 0 0 5px rgba(0, 0, 0, 0.1); /* 포커스 시 은은한 그림자 */
        outline: none;
    }
    
    /* 버튼 스타일 - 검정 계열 */
    button { 
        width: 100%;
        padding: 12px 15px; 
        background-color: #1a1a1a; /* 버튼 배경색 (검정) */
        color: #ffffff; 
        border: 1px solid #1a1a1a; /* 버튼 경계선 */
        border-radius: 6px; 
        cursor: pointer; 
        font-size: 16px;
        font-weight: 600;
        transition: background-color 0.3s, box-shadow 0.3s;
    }
    
    button:hover { 
        background-color: #333333; /* 마우스 오버 시 진한 회색 */
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    }
    
    /* 파일 입력 필드 자체 스타일 조정 (선택 사항) */
    input[type="file"] {
        padding: 8px;
    }
</style>
</head>
<body>

    <jsp:include page="../include/sidebar.jsp" />
    <jsp:include page="../include/header.jsp" />

    <main>
        <h2>신규 유튜버 등록</h2>
        
        <div class="creator-form-container">
            <form action="${pageContext.request.contextPath}/youtuber/add" method="POST" enctype="multipart/form-data">
                
                <div class="form-group">
                    <label for="creatorName">유튜버 이름:</label>
                    <input type="text" id="creatorName" name="creatorName" placeholder="예: 승철티비" required>
                </div>
                
                <div class="form-group">
                    <label for="subscrCount">구독자 수:</label>
                    <input type="number" id="subscrCount" name="subscrCount" placeholder="예: 100000 (숫자만 입력)" required min="0">
                </div>
                
                <div class="form-group">
                    <label for="nationCode">국가 코드:</label>
                    <input type="text" id="nationCode" name="nationCode" placeholder="예: KR (한국), US (미국), JP (일본)">
                </div>

                <%--
                <div class="form-group">
                    <label for="profileImage">프로필 사진:</label>
                    <input type="file" id="profileImage" name="profileImage" accept="image/*" />
                </div>
                --%>
                
                <button style="color: blue" type="submit">유튜버 정보 등록하기</button>
            </form>
        </div>
    </main>
    
    <jsp:include page="../include/footer.jsp" />

</body>
</html>