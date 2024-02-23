<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 조회</title>
		<link rel="stylesheet" href="../resources/css/userlist.css">
	</head>
	<body>
		<h1>회원 조회</h1>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>닉네임</th>
					<th>이름</th>
					<th>가입일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${uList }" var="user" varStatus="i">
				<tr>
					<td>${i.count }</td>
<%-- 					<td>${user.userId }</td> --%>
					<td><a href="/admin/modify.oc?userId=${user.userId}">${user.userId}</a></td>		
					<td>${user.userNick }</td>
					<td>${user.userName }</td>
					<td>${user.userDate }</td>
				</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<!-- 페이지네이션 위치 -->
				<tr align="center">
					<td colspan="5">
						<c:if test="${pInfo.startNavi ne '1' }">
							<a href="/user/list.oc?page=${pInfo.startNavi - 1 }"> 이전 </a>
						</c:if>
						<c:forEach begin="${pInfo.startNavi }" end="${pInfo.endNavi }" var="p">
							<a href="/user/list.oc?page=${p }">${p }</a>
						</c:forEach>
						<c:if test="${pInfo.endNavi ne pInfo.naviTotalCount }">
							<a href="/user/list.oc?page=${pInfo.endNavi + 1 }"> > </a>
						</c:if>
					</td>
				</tr>
				<tr>
				
				
				
					<!-- 0221 추가 -->
					<td colspan="4">
						<form action="/user/search.oc" method="get">
							<select name="searchCondition">
								<option value="all" selected>전체</option>
								<option value="userId" >아이디</option>
								<option value="userName">이름</option>
								<option value="userPhone">휴대폰번호</option>
							</select>
							<input type="text" name="searchKeyword" placeholder="검색어를 입력하세요">
							<input type="submit" value="검색">
						</form>
					</td>
			
							
				</tr>
			</tfoot>
		</table>
	</body>
</html>