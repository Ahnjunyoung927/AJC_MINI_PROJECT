<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="/resources/css/product/product_detail.css">
<script src="/resources/js/product/product_detail.js"></script>
<style>
.content {
	background-color: rgb(247, 245, 245);
	width: 80%;
	margin: auto;
}

.innerOuter {
	border: 1px solid lightgray;
	width: 80%;
	margin: auto;
	padding: 5% 10%;
	background-color: white;
}

button {
	border: 1px solid black;
}
#report-table{
	border: 1px solid gray;
	border-radius: 5px;
	margin: auto;
	margin-top: 10px;
	width: 100%;
}

td {
	border-top: 1px solid gray;
	height : 25px;
	width : 20%;
	text-align: center;
}

</style>
</head>

<body>
	<jsp:include page="../include/header.jsp" />
	<jsp:include page="../include/sidebar.jsp" />

	<main class="content">
	
		<div>
			<h2>신고 목록</h2>
			<button style="border:1px solid black" onclick="findReportsByDate();"> 최신순 조회</button>
			<button style="border:1px solid black"> 신고누적순 조회</button>
			<table id="report-table" >
				<thead>
					<tr >
						<th>아이디</th>
						<th>신고분류</th>
						<th>신고내용</th>
						<th>신고일자</th>
						<th>관리자 확인</th>
					</tr>
				</thead>
			
				<tbody>
                    <tr>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                    </tr>
                </tbody>
			</table>
		</div>

		<div>
			<h2>회원 정보 조회</h2>
			
			조회할 회원 아이디를 입력하세요 : <input type="text" id="detail" />
			
			<button onclick="detail();" style="border:1px solid black">회원 정보 조회</button>
			
			<br />
			
			<hr />
			
			아이디
			<p id="memberId">-</p>
			<hr />
			이메일
			<p id="email">-</p>
			<hr />
			휴대폰
			<p id="phone">-</p>
			<hr />
			가입일
			<p id="enrollDate">-</p>
			<hr />
			활동여부
			<p id="memberStatus">-</p>
			<hr />
			관리자여부
			<p id="adminYn">-</p>
			<hr />
		</div>
		
		
		<br /><hr />

		<h2>회원 정보 수정</h2>
		<p>(상단에서 조회한 회원의 정보를 수정합니다.)</p>
		<hr />
		<br /> 
		이메일 : <input type="text" id="changeEmail" />
		<button id="updateEmailButton" onclick="updateEmail()" style="border: 1px solid black" disabled> 이메일 변경 </button>
		<hr />
		휴대폰 : <input type="text" id="changePhone" />
		<button id="updatePhoneButton" onclick="updatePhone()" style="border: 1px solid black" disabled> 휴대폰번호 변경 </button>
		<hr />
		활동여부 : <button style="border: 1px solid black" id="updateStatusNButton" onclick="updateStatus('N')" disabled>회원 정지</button>
				 <button style="border: 1px solid black" id="updateStatusYButton" onclick="updateStatus('Y')" disabled>정지 해제</button>
		<hr />
		관리자여부 : <button style="border: 1px solid black" id="updateAdminNButton" onclick="updateAdmin('Y')" disabled>관리자 권한 등록</button>
				   <button style="border: 1px solid black" id="updateAdminYButton" onclick="updateAdmin('N')" disabled>관리자 권한 회수</button>
		<script> 
	
		let selectedMemberId = null; 
	
	function detail(){ 
		const value = $("#detail").val();

		if (!value || value.trim() === "" || value.trim().length > 40) {
	        document.querySelector("#memberId").innerText = 
	            value && value.trim().length > 40 ? "입력값은 40자 이하여야 합니다." : "입력값이 없습니다.";
	        return;
	    }
		
		$.ajax({ url : `${pageContext.request.contextPath}/reports/searchM`, 
			    type : 'get', 
			    data : { 
			    	"userId" : $("#detail").val()
			    	}, 
			    	success : result => { 
			    		console.log(result);
			    		document.querySelector("#memberId").innerText = result.memberId;
			    		document.querySelector("#email").innerText = result.email; 
			    		document.querySelector("#phone").innerText = result.phone; 
			    		document.querySelector("#enrollDate").innerText = result.enrollDate; 
			    		document.querySelector("#memberStatus").innerText = result.memberStatus; 
			    		document.querySelector("#adminYn").innerText = result.adminYn; 
			    		
			    		selectedMemberId = result.memberId; 
			    		
			    		document.querySelector("#updateEmailButton").disabled = false; 
			    		document.querySelector("#updatePhoneButton").disabled = false; 
			    		document.querySelector("#updateStatusNButton").disabled = false; 
			    		document.querySelector("#updateStatusYButton").disabled = false; 
			    		document.querySelector("#updateAdminNButton").disabled = false; 
			    		document.querySelector("#updateAdminYButton").disabled = false; }, 
			    		
			    	error : err => {
			    		document.querySelector("#memberId").innerText = "조회된 정보가 없습니다."; 
			    		document.querySelector("#email").innerText = "-"; 
			    		document.querySelector("#phone").innerText = "-"; 
			    		document.querySelector("#enrollDate").innerText = "-"; 
			    		document.querySelector("#memberStatus").innerText = "-"; 
			    		document.querySelector("#adminYn").innerText = "-"; 
			    		
			    		document.querySelector("#updateEmailButton").disabled = true; 
			    		document.querySelector("#updatePhoneButton").disabled = true; 
			    		document.querySelector("#updateStatusNButton").disabled = true; 
			    		document.querySelector("#updateStatusYButton").disabled = true; 
			    		document.querySelector("#updateAdminNButton").disabled = true; 
			    		document.querySelector("#updateAdminYButton").disabled = true; 
			    	} 
			  }); 
		}
		
		function updateEmail() {
		    if(!selectedMemberId){
		        alert("먼저 회원을 조회하세요.");
		        return;
		    }
		    const newEmail = $("#changeEmail").val();
		    $.ajax({
		        url : `${pageContext.request.contextPath}/reports/updateEmail`,
		        type : 'post',
		        data : {
		            "memberId" : selectedMemberId,
		            "email" : newEmail
		        },
		        success : result => {
		            alert("이메일이 수정되었습니다!");
		            document.querySelector("#email").innerText = newEmail;
		        },
		        error : () => {
		            alert("이메일 수정 중 오류가 발생했습니다.");
		        }
		    });
		}
		
		function updatePhone(){
		    if(!selectedMemberId){
		        alert("먼저 회원을 조회하세요.");
		        return;
		    }
		    const newPhone = $("#changePhone").val();
		    $.ajax({
		        url : `${pageContext.request.contextPath}/reports/updatePhone`,
		        type : 'post',
		        data : {
		            "memberId" : selectedMemberId,
		            "phone" : newPhone
		        },
		        success : result => {
		            alert("휴대폰 번호가 수정되었습니다!");
		            document.querySelector("#phone").innerText = newPhone;
		        },
		        error : () => {
		            alert("휴대폰 번호 수정 중 오류가 발생했습니다.");
		        }
		    });
		}
		
		function updateStatus(status) {
	        if (!selectedMemberId) {
	            alert("먼저 회원을 조회하세요.");
	            return;
	        }
	        $.ajax({
	            url: `${pageContext.request.contextPath}/reports/updateStatus`,
	            type: 'post',
	            data: {
	                "memberId": selectedMemberId,
	                "memberStatus": status
	            },
	            success: function (response) {
	                    alert("회원 상태가 성공적으로 업데이트되었습니다.");
	                    document.querySelector("#memberStatus").innerText = status;
	            },
	            error: function () {
	                alert("서버 오류가 발생했습니다.");
	            }
	        });
	    }
		
		function updateAdmin(admin) {
	        if (!selectedMemberId) {
	            alert("먼저 회원을 조회하세요.");
	            return;
	        }
	        $.ajax({
	            url: `${pageContext.request.contextPath}/reports/updateAdmin`,
	            type: 'post',
	            data: {
	                "memberId": selectedMemberId,
	                "adminYn": admin
	            },
	            success: function (response) {
	                    alert("회원 상태가 성공적으로 업데이트되었습니다.");
	                    document.querySelector("#adminYn").innerText = admin;
	            },
	            error: function () {
	                alert("서버 오류가 발생했습니다.");
	            }
	        });
	    }
		
		
		
		</script>

		<!-- 뒤로 가기 -->
		<hr />
		<div class="btns" align="center">
			<button class="btn btn-primary" onclick="abc();">뒤로 가기</button>
		</div>

		<script>
					function abc(){
						history.back();
					}
				</script>


	</main>

	<jsp:include page="../include/footer.jsp" />


</body>
</html>