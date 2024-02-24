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
		<!--관리자 LNB -->
		<ul class="ad_lnb_ul">
			<li class="ad_lnb_li1"><a href="/user/list.oc">회원 조회</a></li>		
			<li class="ad_lnb_li2"><a href="/">게시물 조회</a></li>		
			<li class="ad_lnb_li3"><a href="/">댓글 조회</a></li>		
			<li class="ad_lnb_li4"><a href="/">공지사항</a></li>		
			<li class="ad_lnb_li5"><a href="/admin/faqlist.oc">1:1문의 조회</a></li>		
		
		</ul>
<!--// LNB -->
	
	
		<h1>고객센터</h1>
	
		
		<form action="/user/faqreply.oc" method="post">
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
						<input type="checkbox">답변을 휴대폰 메시지로 받기<br>
					</li>
					<li>
						<label for="">이메일주소 : </label>
						<input type="text" name="questionEmail" id="" value="${cs.questionEmail }">
						<input type="checkbox">답변을 이메일로 받기<br>						
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