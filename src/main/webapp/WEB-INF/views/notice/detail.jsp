<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
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
	
	<h2 class="csh1">고객센터</h2>

	<h3 class="faqttl">공지사항 상세조회</h3>
	
	
	<div class="ntc_content">
		<div class="ntc_dtl">
	<ul>
		<li><label>제목</label> <span>${notice.noticeSubject }</span></li>
		<li><label>작성자</label> <span>${notice.noticeWriter }</span></li>
		<li><label>내용</label> <span>${notice.noticeContent }</span></li>
	</ul>
	<br>
	<div class="ntc_list">
<!-- 		<button type="button" onclick="showModifyPage();">수정하기</button> -->
<%-- 		<button type="button" onclick="deleteNotice(${notice.noticeNo});">삭제하기</button> --%>
		<button type="button" onclick="showNoticeList();">목록으로 이동</button>
	</div>
	<script>
		function deleteNotice(noticeNo) {
			if (confirm("삭제하시겠습니까?")) {
				location.href = "/notice/delete.oc?noticeNo=" + noticeNo;
			} 
			else {
				// 삭제 후 목록 페이지로 이동
				location.href = "/notice/list.oc";
			}			
		}
		
		function showModifyPage() {
			var noticeNo = "${notice.noticeNo}";
			location.href = "/notice/modify.oc?noticeNo=" + noticeNo;
		}
		
		function showNoticeList() {
			location.href = "/notice/list.oc";
		}
	</script>
	</div>
	</div>
</content>
</body>
</html>