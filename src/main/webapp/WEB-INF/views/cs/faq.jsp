<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의</title>
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
		<li class="cs_lnb_li3"><a href="/cs/faq.oc">1:1 문의</a></li>
	</ul>
	<!--// LNB -->

<div class="faq_content">

	<form action="/cs/faq.oc" method="POST">

		<input type="hidden" name="questionCategory" value="Q" /> <input
			type="hidden" name="questionStatus" value="new" /> <input
			type="hidden" name="userId" value="${userId }" /> <input
			type="hidden" name="questionWriter" value="${userName}" />

		<h2 class="csh1">고객센터</h2>
		<h3 class="faqttl">1:1문의</h3>
		
		<div class="faqcontent">
		<p>	제목 : <input type="text" size="50" name="questionTitle"><br></p>
		<p>휴대폰번호 : <input type="text" name="questionPhone"> <input
			type="checkbox">답변을 휴대폰 메시지로 받기<br> </p>
			<p>이메일주소 : <input
			type="text" name="questionEmail"> <input type="checkbox">답변을
		이메일로 받기<br> </p>
		<p>내용 :<br>
		<textarea rows="10" cols="55" name="questionContent"></textarea>
		<br>
		<br> 
		<div class="smbtn">
		<input type="submit" value="입력완료">
		</div>
		</div>
	</form>

</div>
</content>

	<!----------------- 푸터 start ---------------->
	<footer class="py-3 my-4">
		<ul
			class="nav justify-content-center border-bottom pb-3 mb-3 mx-auto bg-light">
			<li class="nav-item"><a href="#"
				class="nav-link px-2 text-body-secondary mx-5">사이트 이용약관</a></li>
			<li class="nav-item"><a href="#"
				class="nav-link px-2 text-body-secondary mx-5">개인정보 처리방침</a></li>
			<li class="nav-item"><a href="#"
				class="nav-link px-2 text-body-secondary mx-5">고객센터</a></li>
		</ul>

		<p class="text-center text-body-secondary">회사 주소 :</p>
		<p class="text-center text-body-secondary">회사 전화번호 :</p>
		<p class="text-center text-body-secondary">회사 대표 :</p>
		<p class="text-center text-body-secondary">사업자번호 :</p>
		<p class="text-center text-body-secondary">© All Right reserved
			OneCook</p>
	</footer>
	<!----------------- 푸터 end ---------------->


</body>
</html>