<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
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
	<!--고객센터 LNB -->
	<ul class="cs_lnb_ul">
		<li class="cs_lnb_li1"><a href="/notice/list.oc">공지사항</a></li>
		<li class="cs_lnb_li2"><a href="/cs/faq.oc">1:1 문의</a></li>
	</ul>
	<!--// LNB -->


<div class="ntc_content">
	<h2 class="csh1">고객센터</h2>

	<h3 class="faqttl">공지사항</h3>
	
	<div class="all_ntc">
	<table class="ntctbl">
		<thead>
			<tr>
				<th class="1stth" style="width:80px">번호</th>
				<th class="2ndth" style="width:300px">제목</th>
				<th class="4thth" style="width:200px">작성자</th>
				<th class="5thth" style="width:200px">날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${nList}" var="notice" varStatus="i">
				<tr>
					<td class="1sttd" style="text-align:center;">${i.count }</td>
					<td class="2ndth"><a href="/notice/detail.oc?noticeNo=${notice.noticeNo }">${notice.noticeSubject }</a></td>
					<td class="4thth" style="text-align:center;">${notice.noticeWriter}</td>
					<td class="5thth" style="text-align:center;">${notice.noticeDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	
		
	</table>
	
		<div class="pinfo">
		<!-- 페이지네이션 위치 -->
			<c:if test="${pInfo.startNavi ne '1' }">
						<a href="/notice/list.oc?page=${pInfo.startNavi - 1 }">
						 </a>
					</c:if> <c:forEach begin="${pInfo.startNavi }" end="${pInfo.endNavi }"
						var="p">
						<a href="/notice/list.oc?page=${p }">${p }</a>
					</c:forEach> <c:if test="${pInfo.endNavi ne pInfo.naviTotalCount }">
						<a href="/notice/list.oc?page=${pInfo.endNavi + 1 }"> ></a>
					</c:if>
	<script>
			function showInsertForm() {
				// 공지사항 글쓰기 페이지 이동
				location.href="/notice/insert.oc";
			}
		</script>
		</div>
		</div>
		</div>
</content>
</body>
</html>