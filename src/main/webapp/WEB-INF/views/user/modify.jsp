<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원정보 수정</title>
		  <link rel="stylesheet" href="../resources/css/mycs.css">
	</head>
	<body>
		<!--마이페이지 LNB -->
		<ul class="my_lnb_ul">
			<li class="my_lnb_li1"><a href="/user/modify.oc">회원정보수정</a></li>		
			<li class="my_lnb_li2"><a href="/user/wishlist.oc">찜목록</a></li>		
			<li class="my_lnb_li3"><a href="/user/recipelist.oc">레시피</a></li>		
			<li class="my_lnb_li4"><a href="/user/commentlist.oc">댓글관리</a></li>		
			<li class="my_lnb_li5"><a href="/cs/faqlist.oc"">1:1문의관리</a></li>		
		
		</ul>
	<!--// LNB -->
	
	
	
	
		<h1>원쿡 회원정보 수정</h1>
		<form action="/user/modify.oc" method="post">
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
	</body>
</html>