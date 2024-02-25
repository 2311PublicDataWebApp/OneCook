<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마이페이지</title>
		<link rel="stylesheet" href="/../resources/css/mycs.css">


	</head>
	<body>


	
<!--마이페이지 LNB -->

		<ul class="my_lnb_ul">
			<li class="my_lnb_li1"><a href="/user/modify.oc?userId=${user.userId }">회원정보수정</a></li>		
			<li class="my_lnb_li2"><a href="/user/wishlist.oc">찜목록</a></li>		
			<li class="my_lnb_li3"><a href="/user/recipelist.oc">레시피</a></li>		
			<li class="my_lnb_li4"><a href="/user/commentlist.oc">댓글관리</a></li>		
			<li class="my_lnb_li5"><a href="/cs/faqlist.oc">1:1문의관리</a></li>		
		
		</ul>
<!--// LNB -->	
	
	
	
		<div class="all_my">
			<form action="/user/mypage.oc" method="post">
			<h3>마이페이지</h3>
			<ul>
				<li>
					<label>아이디</label>
					<span>${user.userId }</span>
				</li>
				<li>
					<label>이름</label>
					<span>${user.userName }</span>
				</li>
				<li>
					<label>닉네임</label>
					<span>${user.userNick }</span>
				</li>
			
				<li>
					<label>이메일</label>
					<span>${user.userEmail }</span>
				</li>
				<li>
					<label>휴대폰 번호</label>
					<span>${user.userPhone }</span>
				</li>
			
					<label>주소</label>
					<span>${user.userAddress }</span>
				</li>
				
			<li>
		<a href="/user/delete.oc?userId=${user.userId }">탈퇴하기</a>
		<a href="/user/modify.oc?userId=${user.userId }">수정하기</a>
		<input type="reset" value="이전으로">

		
			</li>
			
			</ul>

		</form>
		</div>
	
		
		
		
	</body>
</html>

















