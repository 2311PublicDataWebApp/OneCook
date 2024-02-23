<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>댓글 관리</title>
		<link rel="stylesheet" href="../resources/css/mycs.css">
	</head>
	<body>
<!--마이페이지 LNB -->
		<ul class="my_lnb_ul">
			<li class="my_lnb_li1"><a href="/user/modify.oc">회원정보수정</a></li>		
			<li class="my_lnb_li2"><a href="/user/wishlist.oc">찜목록</a></li>		
			<li class="my_lnb_li3"><a href="/user/recipelist.oc">레시피</a></li>		
			<li class="my_lnb_li4"><a href="/user/commentlist.oc">댓글관리</a></li>		
			<li class="my_lnb_li5"><a href="/cs/faqlist.oc">1:1문의관리</a></li>		
		
		</ul>
<!--// LNB -->
		<h1>댓글 관리</h1>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th><input type="checkBox"></th>
					<th>내용</th>
					<th>작성일시</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
<%-- 				<c:forEach items="${cList }" var="board" varStatus="i"> --%>
<!-- 					<tr> -->
<%-- 						<td>${i.count }</td> --%>
<%-- 						<td>${board.boardTitle }</td> --%>
<%-- 						<td>${board.boardWriter }</td> --%>
<%-- 						<td>${board.bCreateDate }</td> --%>
<!-- 						<td>O</td> -->
<%-- 						<td>${board.boardCount }</td> --%>
<!-- 					</tr> -->
<%-- 				--%>
		<c:forEach items="${uList }" var="comment" varStatus="i">
					<tr>
						<td>${i.count }</td>
						<td><input type="checkBox"></td> 
						<td>${comment.commentContent }</td>
						<td>${comment.commentDate }</td>
						<td>X</td> 
					</tr>
</c:forEach> 


			</tbody>	
			<tfoot>
				<tr align="center">
					<td colspan="5">
						<c:if test="${pInfo.startNavi != 1 }">
							<a href="/user/commentlist.oc?page=${pInfo.startNavi - 1 }">이전</a>
						</c:if>
						<c:forEach begin="${pInfo.startNavi }" end="${pInfo.endNavi }" var="p">
							<a href="/user/commentlist.oc?page=${p }">${p }</a>
						</c:forEach>
						<c:if test="${pInfo.endNavi != pInfo.naviTotalCount }">
							<a href="/user/commentlist.oc?page=${pInfo.endNavi + 1 }">다음</a>
						</c:if>
					</td>
				</tr>
			</tfoot>
		</table>
		<div>
		<button>삭제</button></div>
	</body>
</html>











