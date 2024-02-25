<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>
<link rel="stylesheet" href="../resources/css/main.css">
</head>
<body>
	<h1>공지사항 상세조회</h1>
	<ul>
		<li><label>제목</label> <span>${notice.noticeSubject }</span></li>
		<li><label>작성자</label> <span>${notice.noticeWriter }</span></li>
		<li><label>내용</label> <span>${notice.noticeContent }</span></li>
	</ul>
	<br>
	<div>
		<button type="button" onclick="showModifyPage();">수정하기</button>
		<button type="button" onclick="deleteNotice(${notice.noticeNo});">삭제하기</button>
		<button type="button" onclick="showNoticeList();">목록으로 이동</button>
	</div>
	<script>
		function deleteNotice(noticeNo) {
			if (confirm("삭제하시겠습니까?")) {
				location.href = "/notice/delete.oc?noticeNo=" + noticeNo;
			} 
			else {
				// 삭제 후 목록 페이지로 이동
				location.href = "/notice/list.oc";
			}			
		}
		
		function showModifyPage() {
			var noticeNo = "${notice.noticeNo}";
			location.href = "/notice/modify.oc?noticeNo=" + noticeNo;
		}
		
		function showNoticeList() {
			location.href = "/notice/list.oc";
		}
	</script>

</body>
</html>