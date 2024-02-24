<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의조회</title>
</head>
<title>1:1문의조회</title>
<link rel="stylesheet" href="../resources/css/mycs.css">
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

	<h1>1:1문의관리</h1>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th><input type="checkBox"></th>
				<th>제목</th>
				<th>상태</th>
				<th>작성일시</th>
				<th>x버튼</th>
			</tr>
		</thead>
		<tbody>


			<c:forEach items="${cList }" var="cs" varStatus="i">
				<tr>
					<td>${i.count }</td>
					<td><input type="checkBox" ></td>
					<td><a href="/cs/faqdetail.oc?questionNo=${cs.questionNo }">${cs.questionTitle }</a></td>
					<td>${cs.questionStatus }</td>
					<td>${cs.questionDate }</td>
					<td>X</td>
				</tr>
			</c:forEach>


		</tbody>
		<tfoot>
			<tr align="center">
				<td colspan="5"><c:if test="${pInfo.startNavi != 1 }">
						<a href="/cs/faqlist.oc?page=${pInfo.startNavi - 1 }">이전</a>
					</c:if> <c:forEach begin="${pInfo.startNavi }" end="${pInfo.endNavi }"
						var="p">
						<a href="/cs/faqlist.oc?page=${p }">${p }</a>
					</c:forEach> <c:if test="${pInfo.endNavi != pInfo.naviTotalCount }">
						<a href="/cs/faqlist.oc?page=${pInfo.endNavi + 1 }">다음</a>
					</c:if></td>
			</tr>
		</tfoot>
	</table>
	<div>
		<button>삭제</button>
	</div>
</body>
</html>