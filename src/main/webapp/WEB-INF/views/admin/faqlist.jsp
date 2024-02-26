<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의조회</title>
<link rel="stylesheet" href="../resources/css/userlist.css">
		<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<link rel="stylesheet" href="../../../resources/css/header.css">
<link rel="stylesheet" href="/../resources/css/mycs.css">
<link rel="stylesheet" href="../../../resources/css/footer.css">



</head>
<body>
	<!----------------- 헤더, 네브바 start ---------------->
		<header class="top-top p-3 text-bg-dark">
		    <div class="container-fluid">
		      	<div class="d-flex flex-wrap align-items-center justify-content-around">
				<a href="/">
		          	<img src="../../../resources/img/logo.png" alt="logo">
				</a>	
					
					<form class="d-flex align-items-center">
					    <div class="flex-grow-1" style="width: 400px;">
					        <input type="search" class="form-control form-control-dark text-bg-dark" placeholder="레시피 검색..." aria-label="Search">
					    </div>
					    <div>
					        <i class="fa-solid fa-magnifying-glass fa-2x"></i>
					    </div>
					</form>

			        <div class="text-end">
				

			        </div>
		      	</div>
		    </div>
		</header>	  
		<div class="sunkite">
			<nav class="container-nav align-items-center justify-content-center">
                <div>
                    <ul class="nav nav-pills justify-content-center pb-3 mb-3">
                        <li class="nav-item  mx-5">
                            <a class="nav-link text-white" aria-current="page" href="/">추천</a>
                        </li>
                        <li class="nav-item  mx-5">
                            <a class="nav-link text-white " href="/ranking/ranking.oc">랭킹</a>
                        </li>
                        <li class="nav-item  mx-5">
                            <a class="nav-link text-white" href="/notice/list.oc">고객센터</a>
                        </li>
                    </ul>
                </div>
            </nav>
		</div>
		<!----------------- 헤더, 네브바 end ---------------->



		<!--어드민 LNB -->
<content>
		<ul class="my_lnb_ul">
			<li class="my_lnb_li1"><a href="/user/list.oc">회원조회</a></li>		
		<li class="my_lnb_li4"><a href="/admin/faqlist.oc">1:1문의</a></li>
		
		</ul>
<!--// LNB -->	
	<div class="content">
					<h2>관리자</h2>
				<h4>1:1문의관리</h4>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th><input type="checkBox"></th>
				<th>제목</th>
				<th>상태</th>
				<th>작성일시</th>
				<th>x</th>
			</tr>
		</thead>
		<tbody>


			<c:forEach items="${cList }" var="cs" varStatus="i">
				<tr>
					<td>${i.count }</td>
					<td><input type="checkBox" ></td>
					<td><a href="/admin/faqdetail.oc?questionNo=${cs.questionNo }">${cs.questionTitle }</a></td>
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
		<button style="margin-left:500px;">삭제</button>
	</div>
	</div>
	</content>
</body>
</html>