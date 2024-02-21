<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
<link rel="stylesheet" href="../resources/css/main.css">
</head>
<body>
	<h1>공지사항 수정</h1>
	<form action="noticemodify" method="post">
		<input type="hidden" name="noticeNo" value="${notice.noticeNo }">
		<ul>
			<li><label>제목</label><input type="text" name="noticeSubject"
				value="${notice.noticeSubject } }"></li>
			<li><label>작성자</label><input type="text" name="noticeWriter"
				value="${notice.noticeWriter } }"></li>
			<li><label>내용</label><input type="text" name="noticeContent"
				value="${notice.noticeContent } }"></li>
		</ul>
		
		<div>
			<input type="submit" value="수정하기">
			<button type="button" onclick="showNoticeList();">목록으로 이동</button>
		</div>		
	</form>
	
	<script>
	function showModifyPage() {
		var noticeNo = "${notice.noticeNo }";
		location.href = "/notice.modify?noticeNo=" + noticeNo;
	}
	function showNoticeList(){
		location.href = "/notice/list";
	}
	</script>
	
</body>
</html>