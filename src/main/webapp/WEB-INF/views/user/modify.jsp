<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원정보 수정</title>
	<link rel="stylesheet" href="/../resources/css/mycs.css">
	</head>
	<body>
			<!----------------- 헤더, 네브바 start ---------------->
<!-- 		<header class="p-3 text-bg-dark"> -->
<!-- 		    <div class="container-fluid"> -->
<!-- 		      	<div class="d-flex flex-wrap align-items-center justify-content-between mt-4"> -->
		      	
<!-- 					로고 넣을공간 -->
<!-- <!-- 		          	<svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg> --> -->
<!-- 		          	<img src="https://via.placeholder.com/100x100" alt="임시 이미지" href="/home.jsp"> -->
			
<!-- 			        <form class="col-12 col-lg-6" role="search"> -->
<!-- 			          	<input type="search" class="form-control form-control-dark text-bg-dark" placeholder="레시피 검색..." aria-label="Search"> -->
<!-- 			        </form> -->
			
<!-- 			        <div class="text-end"> -->

<!-- 			          	<button type="button" class="btn btn-secondary me-2" onclick="window.location.href='/recipe/register.kh'">레시피 등록</button> -->
<!-- 			          	<button type="button" class="btn btn-warning me-2" onclick="window.location.href='/user/login.oc'">로그인</button> -->
<!-- 			        </div> -->

<!-- 		      	</div> -->
<!-- 		    </div> -->
<!-- 		</header> -->
		 
<!-- 		<div> -->
<!-- 			<nav> -->
<!--                 <div> -->
<!--                     <ul class="nav nav-pills "> -->
<!--                         <li class="nav-item"> -->
<!--                             <a class="nav-link active" aria-current="page" href="/">추천</a> -->
<!--                         </li> -->
<!--                         <li class="nav-item"> -->
<!--                             <a class="nav-link bg-white text-dark " href="/ranking/ranking.oc">랭킹</a> -->
<!--                         </li> -->
<!--                         <li class="nav-item "> -->
<!--                             <a class="nav-link bg-white text-dark" href="noticelist">고객센터</a> -->
<!--                         </li> -->
<!--                     </ul> -->
<!--                 </div> -->
<!--             </nav> -->
<!-- 		</div> -->
		<!----------------- 헤더, 네브바 end ---------------->
		



	<div class="">
		<!--마이페이지 LNB -->
		<ul class="my_lnb_ul">
		<li class="my_lnb_li1"><a href="/user/modify.oc?userId=${user.userId }">회원정보수정</a></li>
			<li class="my_lnb_li2"><a href="/user/wishlist.oc">찜목록</a></li>		
			<li class="my_lnb_li3"><a href="/user/recipelist.oc">레시피</a></li>		
			<li class="my_lnb_li4"><a href="/user/commentlist.oc">댓글관리</a></li>		
			<li class="my_lnb_li5"><a href="/cs/faqlist.oc">1:1문의관리</a></li>		
		
		</ul>
	<!--// LNB -->
	
	
	
		<div class="content">
		<h1>원쿡 회원정보 수정</h1>
		<form action="/user/modify.oc" method="POST">
			<input type="hidden" name="userId" 	     id="" value="${user.userId }">
			
				<h3>정보수정</h3>
				<ul>
					<li>
						<label for="">아이디 *</label>
						<span>${user.userId }</span>
					</li>
					<li>
						<label for="">비밀번호 *</label>
						<input type="password" name="userPw" 	     id="" value="${user.userPw }">
					</li>
						<li>
						<label for="">비밀번호 *</label>
						<input type="password" name="userPwre" id="">
					</li>
					<li>
						<label for="">이름 *</label>
						<span>${user.userName }</span>
					</li>
					<li>
						<label for="">닉네임 </label>
						<input type="text" name="userNick" id="" value="${user.userNick }">
					</li>

					<li>
						<label for="">이메일</label>
						<input type="text" 		name="userEmail" 	 id="" value="${user.userEmail }">
					</li>
					<li>
						<label for="">휴대폰번호</label>
						<input type="text" 		name="userPhone" 	 id="" value="${user.userPhone }">
					</li>
					<li>
						<label for="">주소</label>
						<input type="text" 		name="userAddress" id="" value="${user.userAddress }">
					</li>

					
				</ul>
		
			<div>
				<input type="submit" value="수정">
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
		</script>
		</form>
		</div>
		</content>
		
		
			<!----------------- 푸터 start ---------------->
<!-- 		<footer class="py-3 my-4">	 -->
<!-- 			<ul class="nav justify-content-center border-bottom pb-3 mb-3 mx-auto bg-light"> -->
<!-- 			      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary mx-5">사이트 이용약관</a></li> -->
<!-- 			      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary mx-5">개인정보 처리방침</a></li> -->
<!-- 			      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary mx-5">고객센터</a></li> -->
<!-- 			</ul> -->
			
<!-- 			<p class="text-center text-body-secondary">회사 주소 :</p> -->
<!-- 			<p class="text-center text-body-secondary">회사 전화번호 :</p> -->
<!-- 			<p class="text-center text-body-secondary">회사 대표 :</p> -->
<!-- 			<p class="text-center text-body-secondary">사업자번호 :</p> -->
<!-- 			<p class="text-center text-body-secondary">© All Right reserved OneCook</p> -->
<!--         </footer> -->
	<!----------------- 푸터 end ---------------->
		
		
		
	</body>
</html>