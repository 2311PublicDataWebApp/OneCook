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
<!--고객센터 LNB -->
		<ul class="cs_lnb_ul">
			<li class="cs_lnb_li1"><a href="/notice/list.oc">공지사항</a></li>		
			<li class="cs_lnb_li2"><a href="/cs/qna.oc">자주묻는 질문</a></li>		
			<li class="cs_lnb_li3"><a href="/cs/faq.oc">1:1 문의</a></li>		
		</ul>
<!--// LNB -->



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
					<td><a href="/notice/detail.oc?noticeNo=${notice.noticeNo }">${notice.noticeSubject }</a></td>
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
						<a href="/notice/list.oc?page=${pInfo.startNavi - 1 }"><  </a>
					</c:if> <c:forEach begin="${pInfo.startNavi }" end="${pInfo.endNavi }"
						var="p">
						<a href="/notice/list.oc?page=${p }">${p }</a>
					</c:forEach> <c:if test="${pInfo.endNavi ne pInfo.naviTotalCount }">
						<a href="/notice/list.oc?page=${pInfo.endNavi + 1 }">  ></a>
					</c:if></td>
			</tr>

			<tr>
			<!-- 검색기능 (구현여부 상의 중)-->
<!-- 				<td colspan="4"> -->
<!-- 					<form action="/notice/search.kh" method="get"> -->
<!-- 						<select name="searchCondition"> -->
<!-- 							<option value="all" selected>전체</option> -->
<!-- 							<option value="writer" >작성자</option> -->
<!-- 							<option value="title">제목</option> -->
<!-- 							<option value="content">내용</option> -->
<!-- 						</select> -->
<!-- 						<input type="text" name="searchKeyword" placeholder="검색어를 입력하세요"> -->
<!-- 						<input type="submit" value="검색"> -->
<!-- 					</form> -->
<!-- 				</td> -->
				<!-- 글쓰기 버튼 -->		
				<td>
					<button type="button" onclick="showInsertForm();">글쓰기</button>
				</td>
		</tr>						
		</tfoot>
	</table>
	<script>
			function showInsertForm() {
				// 공지사항 글쓰기 페이지 이동
				location.href="/notice/insert.oc";
			}
		</script>

</body>
</html>