<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
	<h1>고객센터</h1>
	<br>
	<br>
	<h2>공지사항</h2>
	<table>
		<thead>
			<tr>
				<th>제목</th>
				<th>내용</th>
				<th>날짜</th>				
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${nList }" var="notice" varStatus="i">
				<tr>
					<td>${i.count }</td>
					<td><a href="/notice/detail.kh?noticeNo=${notice.noticeNo }">${notice. }</a>
				</tr>
				
			</c:forEach>
		</tbody>
	</table>

</body>
</html>