<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의</title>
</head>
<body>
	<form action="/cs/faq.oc" method="POST">

	<input type="hidden" name="questionCategory" value="Q"/>
	<input type="hidden" name="questionStatus" value="new"/>
	<input type="hidden" name="userId" value="${userId }"/>
	<input type="hidden" name="questionWriter" value="${userName}"/>

	
		<h3>1:1문의</h3>
		
		제목 : <input type="text" size="50" name="questionTitle"><br>
		휴대폰번호 : <input type="text" name="questionPhone" ><input type="checkbox">답변을 휴대폰 메시지로 받기<br>
		이메일주소 : <input type="text" name="questionEmail"><input type="checkbox">답변을 이메일로 받기<br>
		내용 : <textarea rows="5" cols="50" name="questionContent"></textarea>
		<br><br>
		<input type="submit" value="입력완료">
	</form>
</body>
</html>