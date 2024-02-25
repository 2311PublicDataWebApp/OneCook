<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>1:1문의조회</title>

			<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
		<link rel="stylesheet" href="../../../resources/css/header.css">
		<link rel="stylesheet" href="/../resources/css/mycs.css">
		<link rel="stylesheet" href="../../../resources/css/footer.css">
				<style>
		
		a{
		text-decoration: none;
	color: #AB6840;
	font-size: 0.9em;
	cursor:pointer;}
		a:hover {
	text-decoration:line;
	color: #AB6840;
	font-size: 1.0em;
}
		
.pinfo	{margin-left:500px;
margin-top:10px;}	
		.ntctbl{margin-left:30px;}
		</style>
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
						<!-- 로그인 상태에 따른 처리 -->
						<c:choose>
						    <c:when test="${loggedIn}">
						        <!-- 로그인 중인 경우에 보이는 내용 -->
						        <button id="headerBtn" type="button" class="btn me-2" onclick="window.location.href='/recipe/register.oc'">레시피 등록</button>
						        <button id="headerBtn" type="button" class="btn me-2" onclick="window.location.href='/user/logout.oc'">로그아웃</button>
						        <button id="headerBtn" type="button" class="btn me-2" onclick="window.location.href='/user/mypage.oc'">마이페이지</button>
						    </c:when>
						    <c:otherwise>
						        <!-- 로그인 중이 아닌 경우에 보이는 내용 -->
						        <button id="headerBtn" type="button" class="btn me-2" onclick="window.location.href='/user/login.oc'">로그인</button>
						    </c:otherwise>
						</c:choose>

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
		

<content>
	
		<!--마이페이지 LNB -->
		<ul class="my_lnb_ul">
		<li class="my_lnb_li1"><a href="/user/modify.oc?userId=${user.userId }">회원정보수정</a></li>
<!-- 			<li class="my_lnb_li3"><a href="/user/recipelist.oc">레시피</a></li>		 -->
<!-- 			<li class="my_lnb_li4"><a href="/user/commentlist.oc">댓글관리</a></li>		 -->
			<li class="my_lnb_li5"><a href="/cs/faqlist.oc">1:1문의관리</a></li>		
		
		</ul>
	<!--// LNB -->

<div class="content">
					<h2>마이페이지</h2>
				<h4>내가 등록한 문의</h4>
	<table>
		<thead>
			<tr>
				<th style="padding-right:3px;">번호</th>
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
					<td style="text-align:center">${i.count }</td>
					<td><input type="checkBox" ></td>
					<td style="padding-left:3px; width:200px"><a href="/cs/faqdetail.oc?questionNo=${cs.questionNo }">${cs.questionTitle }</a></td>
					<td style="text-align:center; width:70px">${cs.questionStatus }</td>
					<td style="text-align:center; width:200px">${cs.questionDate }</td>
					<td style="text-align:center; width:70px">X</td>
				</tr>
			</c:forEach>


		</tbody>
		<tfoot>
			<tr align="center" >
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
		<button style="margin-left:300px;">삭제</button>
	</div>
	
	</div>
	</content>
	
<!----------------- 푸터 start ---------------->
		<footer class="py-3 my-4">	
			<ul class="nav justify-content-center border-bottom pb-3 mb-3 mx-auto bg-light">
			      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary mx-5">사이트 이용약관</a></li>
			      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary mx-5">개인정보 처리방침</a></li>
			      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary mx-5">고객센터</a></li>
			</ul>
			
			<p class="text-center text-body-secondary">회사 주소 :</p>
			<p class="text-center text-body-secondary">회사 전화번호 :</p>
			<p class="text-center text-body-secondary">회사 대표 :</p>
			<p class="text-center text-body-secondary">사업자번호 :</p>
			<p class="text-center text-body-secondary">© All Right reserved OneCook</p>
        </footer>
		<!----------------- 푸터 end ---------------->
	
</body>
</html>