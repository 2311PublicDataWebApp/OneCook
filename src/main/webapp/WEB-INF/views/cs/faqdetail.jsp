<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>1:1문의 상세</title>
<!-- 		<link rel="stylesheet" href="../resources/css/.css"> -->
	</head>
	<body>
		<h1>1:1문의 상세조회</h1>
		<ul>
			<li>
				<label>제목</label>
				<span>${cs.questionTitle }</span>
			</li>
			<li>
				<label>작성자</label>
				<span>${cs.questionWriter }</span>
			</li>
			<li>
				<label>내용</label>
				<span>${cs.questionContent }</span>
			</li>
		</ul>
		<br>
		<br>
		<div>
			<button type="button" onclick="goBack();">뒤로가기</button>
			<button type="button" onclick="showModifyPage();">수정하기</button>
<%-- 			<button type="button" onclick="deleteNotice(${notice.noticeNo });">삭제하기</button> --%>
		</div>
		<script>
// 			function deleteNotice(noticeNo) {
// 				if(confirm("삭제하시겠습니까?")) {
// 					location.href = "/notice/delete.kh?noticeNo="+noticeNo;
// 				}
// 			}
			function showModifyPage() {
				var questionNo = "${cs.questionNo }";
				location.href = "/cs/faqmodify.oc?questionNo="+questionNo;
			}
			function showNoticeList() {
				location.href = "/cs/faqlist.oc";
			}
			function goBack(){
				history.back();
			}
		</script>
	</body>
</html>