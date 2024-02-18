<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
</head>
<body>

	<h2>관리자 로그인</h2>
	<fieldset>
		<legend>관리자 로그인</legend>
		<form action="/admin/login.ck" method="post">
			아이디: <input type="text" name="userId" placeholder="아이디를 입력하세요"><br>
			비밀번호: <input type="password" name="userPw" placeholder="비밀번호를 입력하세요"><br>

			<input type="submit" value="로그인"><br>
			<a href="#">아이디/비밀번호 찾기</a> 

			<h3>이 페이지는 원쿡 관리자를 위한 페이지 입니다.</h3>
			<br>
			<h3>원쿡 사이트 이용 고객님께서는 www.onecook.co.kr로 진입해 주세요</h3>

		</form>
	</fieldset>

	<!-- 로그인하면 바로 관리자 영역으로 넘어갈 예정 -->

</body>
</html>
