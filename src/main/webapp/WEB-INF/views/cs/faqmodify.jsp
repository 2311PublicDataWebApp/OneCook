<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>1:1문의</title>
<!-- 		  <link rel="stylesheet" href="../resources/css/.css"> -->
	</head>
	<body>
		<!--마이페이지 LNB -->
		<ul class="my_lnb_ul">
			<li class="my_lnb_li1"><a href="/user/modify.oc">회원정보수정</a></li>		
			<li class="my_lnb_li2"><a href="/user/wishlist.oc">찜목록</a></li>		
			<li class="my_lnb_li3"><a href="/user/recipelist.oc">레시피</a></li>		
			<li class="my_lnb_li4"><a href="/user/commentlist.oc">댓글관리</a></li>		
			<li class="my_lnb_li5"><a href="/cs/faqlist.oc">1:1문의관리</a></li>		
		
		</ul>
	<!--// LNB -->
	
	
		<h1>고객센터</h1>
	
		
		<form action="/cs/faqmodify.oc" method="post">
			<input type="hidden" name="userId" id="" value="${user.userId }">
			
				<h3>1:1문의 수정</h3>
				<ul>
					<li>
						<label for="">작성자 : </label>
						<span>${user.userNick }</span>
					</li>
					<li>
						<label for="">제목 : </label>
						<input type="text" name="questionTitle" id="" value="${cs.questionTitle }">
					</li>
						<li>
						<label for="">휴대폰번호 : </label>
						<input type="text" name="questionPhone" id="" value="${cs.questionPhone }">
					</li>
					<li>
						<label for="">이메일주소 : </label>
						<input type="text" name="questionEmail" id="" value="${cs.questionEmail }">						
					</li>
					<li>
						<label for="">문의내용 : </label>
						<input type="text" name="questionContent" id="" value="${cs.questionContent }">
					</li>
					
				</ul>
		
			<div>
				<input type="submit" value="수정">
			</div>
		<script>
			
		</script>
		</form>
	</body>
</html>