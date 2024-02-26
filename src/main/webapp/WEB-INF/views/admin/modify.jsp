<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원정보 수정</title>
		  <link rel="stylesheet" href="../resources/css/mycs.css">
		  <link rel="stylesheet" href="../resources/css/userlist.css">
		<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<link rel="stylesheet" href="../../../resources/css/header.css">
<link rel="stylesheet" href="/../resources/css/mycs.css">
<link rel="stylesheet" href="../../../resources/css/footer.css">
	</head>
	<body>
	<!----------------- 헤더, 네브바 start ---------------->
		<header class="top-top p-3 text-bg-dark">
		    <div class="container-fluid">
		      	<div class="d-flex flex-wrap align-items-center justify-content-around">
				<a href="/">
		          	<img src="../../../resources/img/logo.png" alt="logo">
				</a>	
					
					<form class="d-flex align-items-center">
					    <div class="flex-grow-1" style="width: 400px;">
					        <input type="search" class="form-control form-control-dark text-bg-dark" placeholder="레시피 검색..." aria-label="Search">
					    </div>
					    <div>
					        <i class="fa-solid fa-magnifying-glass fa-2x"></i>
					    </div>
					</form>

			        <div class="text-end">
				

			        </div>
		      	</div>
		    </div>
		</header>	  
		<div class="sunkite">
			<nav class="container-nav align-items-center justify-content-center">
                <div>
                    <ul class="nav nav-pills justify-content-center pb-3 mb-3">
                        <li class="nav-item  mx-5">
                            <a class="nav-link text-white" aria-current="page" href="/">추천</a>
                        </li>
                        <li class="nav-item  mx-5">
                            <a class="nav-link text-white " href="/ranking/ranking.oc">랭킹</a>
                        </li>
                        <li class="nav-item  mx-5">
                            <a class="nav-link text-white" href="/notice/list.oc">고객센터</a>
                        </li>
                    </ul>
                </div>
            </nav>
		</div>
		<!----------------- 헤더, 네브바 end ---------------->



		<!--어드민 LNB -->
<content>
		<ul class="my_lnb_ul">
			<li class="my_lnb_li1"><a href="/user/list.oc">회원조회</a></li>		
		<li class="my_lnb_li4"><a href="/admin/faqlist.oc">1:1문의</a></li>
		
		</ul>
<!--// LNB -->	
	<div class="content">
		<h1>원쿡 회원정보 수정</h1>
		<form action="/admin/modify.oc" method="post">
			<input type="hidden" name="userId" 	     id="" value="${user.userId }">
			
				<h3>정보수정</h3>
				<div class="content">
				<ul>
					<li>
						<label for="">아이디 *</label>
						<span>${user.userId }</span>
					</li>
					<li>
						<label for="userPw">비밀번호 *</label>
						<input type="password" name="userPw" 	     id="" value="${user.userPw }">
					<li>
              			  <label for="userPwre">비밀번호 확인 *</label> <!-- 수정: id 추가 -->
             		  	 <input type="password" name="userPwre" id="userPwre"> <!-- 수정: id 추가 -->
          		  </li>
					<li>
						<label for="userName">이름 *</label>
						<span>${user.userName }</span>
					</li>
					<li>
						<label for="userNick">닉네임 </label>
						<input type="text" name="userNick" id="userNick" value="${user.userNick }">
					</li>

					<li>
						<label for="userEmail">이메일</label>
						<input type="text" 		name="userEmail" 	 id="userEmail" value="${user.userEmail }">
					</li>
					<li>
						<label for="userPhone">휴대폰번호</label>
						<input type="text" 		name="userPhone" 	 id="userPhone" value="${user.userPhone }">
					</li>
					<li>
						<label for="userAddress">주소</label>
						<input type="text" 		name="userAddress" id="userAddress" value="${user.userAddress }">
					</li>

					
				</ul>
		
			<div>
				<input type="button" value="이전으로" onclick="goBack()">
				<input type="submit" value="수정하기" onclick="return confirmUpdate()">
				<input type="button" value="회원삭제">
			</div>
			
			
					<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
			function execDaumPostcode() {
				new daum.Postcode({
			        oncomplete: function(data) {
			            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
			            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
			            console.log(data.autoJibunAddress + ", " + data.zonecode + ", " + data.buildingName);
			            document.querySelector("#memberAddr").value = data.address + ", " + data.zonecode + ", " + data.buildingName;
			        }
			    }).open();
			}
			
			 function goBack() {
		            window.location.href = "/user/list.oc";
		            return false; // 폼 전송 중단
		        }
			 
			 function confirmUpdate() {
		            if (confirm("수정하시겠습니까?")) {
		                showAlert();
		                return true;
		            } else {
		                return false;		            
		        }
		        function showAlert() {
		            alert("수정되었습니다.");
		        }
			 }
		        
		        
		        
			
		</script>
		</form>
		</div>
		</div>
		</content>
	</body>
</html>