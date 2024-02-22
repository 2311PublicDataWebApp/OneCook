<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마이페이지</title>
		<link rel="stylesheet" href="../resources/css/mycs.css">
	</head>
	<body>
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
				<li>
					<label>주소</label>
					<span>${user.userAddress }</span>
				</li>
				
			</ul>
		<a href="/index.jsp">메인으로 이동</a>
		<a href="/user/modify.oc">수정하기</a>
		<a href="/user/logout.oc">로그아웃</a>
		<a href="/cs/faq.oc">1:1문의</a>
		<a href="/delete?userId=${user.userId }">탈퇴하기</a>
		</form>
	</body>
</html>















