<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="/resources/css/product/product_detail.css">
    <script src="/resources/js/product/product_detail.js"></script>
    <style>
    #reports-main {
            width: 1000px;
            height: 1000px;

        }
        .report-main {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            background-color: #fafafa;
            width: 30%;
            height: 300px;
            margin: auto;
            font-size: 35px;
            font-weight: 400;
            display: flex;
            justify-content: center; 
            align-items: center;     
            text-align: center;
        }
        .report-main:hover {
            font-size: 38px;
            box-shadow: 5px 5px 10px grey;
        }
        #report-main-box {
            display: flex;
        }
        #report-head {
            height: 200px;
            display: flex;
            justify-content: center; 
            align-items: center;     
            text-align: center;
        }
        #report-head {
            font-size: 25px;
        }
    </style>

</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<jsp:include page="../include/sidebar.jsp" />
		
	
	<main>

        <div id="report-head">
            <h1>관리자 페이지</h1>
        </div>
        <hr>
        
        <div id="report-main-box">
            <a href="#" class="report-main" >
            	<div >리뷰 조회</div>
            </a>

            <a href="#" class="report-main" >
            	<div >리뷰 삭제</div>
            </a>
			
			<a href="#" class="report-main" >
            	<div >뭐 하 지 </div>
            </a>
            
        </div>

        <div id="report-foot">
            
        </div>

    </main>
	
	
	<jsp:include page="../include/footer.jsp" />
	
	
</body>
</html>