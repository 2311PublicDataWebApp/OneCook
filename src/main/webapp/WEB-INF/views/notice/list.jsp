<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="../resources/css/main.css">
</head>
<body>
	<h1>고객센터</h1>
	<br>
	<br>
	<h2>공지사항</h2>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>				
				<th>내용</th>
				<th>작성자</th>
				<th>날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${nList}" var="notice" varStatus="i">
				<tr>
					<td>${i.count }</td>
					<td><a href="/noticedetail?noticeNo=${notice.noticeNo }">${notice.noticeSubject }</a></td>
					<td>${notice.noticeContent}</td>
					<td>${notice.noticeWriter}</td>
					<td>${notice.noticeDate}</td>					
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<!-- 페이지네이션 위치 -->
			<tr align="center">
				<td colspan="5"><c:if test="${pInfo.startNavi ne '1' }">
						<a href="/noticelist?page=${pInfo.startNavi - 1 }"><  </a>
					</c:if> <c:forEach begin="${pInfo.startNavi }" end="${pInfo.endNavi }"
						var="p">
						<a href="/noticelist?page=${p }">${p }</a>
					</c:forEach> <c:if test="${pInfo.endNavi ne pInfo.naviTotalCount }">
						<a href="/noticelist?page=${pInfo.endNavi + 1 }">  ></a>
					</c:if></td>
			</tr>
		</tfoot>
	</table>

</body>
</html>