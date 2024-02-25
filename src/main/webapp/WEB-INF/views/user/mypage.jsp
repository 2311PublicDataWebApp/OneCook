<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마이페이지</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
		<link rel="stylesheet" href="../../../resources/css/header.css">
		<link rel="stylesheet" href="../../resources/css/mycs.css">
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
		


<!--마이페이지 LNB -->
<content>
		<ul class="my_lnb_ul">
			<li class="my_lnb_li1"><a href="/user/modify.oc?userId=${user.userId }">회원정보수정</a></li>		
			<li class="my_lnb_li4"><a href="/user/commentlist.oc">댓글관리</a></li>		
			<li class="my_lnb_li5"><a href="/cs/faqlist.oc">1:1문의관리</a></li>		
		
		</ul>
<!--// LNB -->	
	
	
	
		<div class="content">
			<form action="/user/mypage.oc" method="post">
			
			<h2>마이페이지</h2>
			<h4>회 원 정 보</h4>
			
			<table class="all_my">
			<tr>
			<td><label>아이디</label></td>
			<td><span>${user.userId }</span></td>
			</tr>
			<tr>
			<td><label>이름</label></td>
			<td><span>${user.userName }</span></td>
			</tr>
			<tr>
			<td><label>닉네임</label></td>
			<td><span>${user.userNick }</span></td>
			</tr>
			<tr>
			<td><label>이메일</label></td>
			<td><span>${user.userEmail }</span></td>
			</tr>
			<tr>
			<td><label>휴대폰 번호</label></td>
			<td><span>${user.userPhone }</span></td>
			</tr>
			<tr>
			<td><label>주소</label></td>
			<td><span>${user.userAddress }</span></td>
			</tr>
			
			</table>

			<div class="ahover">
		<a href="/user/delete.oc?userId=${user.userId }" >탈퇴하기</a><br>
		</div>


		</form>
		</div>
	</content>
	
	
				<!----------------- 푸터 start ---------------->
		<footer class="py-3 my-4">	
			<ul class="nav justify-content-center border-bottom pb-3 mb-3 mx-auto bg-light">
			      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary mx-5">사이트 이용약관</a></li>
			      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary mx-5">개인정보 처리방침</a></li>
			      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary mx-5">고객센터</a></li>
			</ul>
			
			<p class="text-center text-body-secondary">회사 주소 : 서울시 중구</p>
			<p class="text-center text-body-secondary">회사 전화번호 : 010</p>
			<p class="text-center text-body-secondary">회사 대표 :</p>
			<p class="text-center text-body-secondary">사업자번호 :</p>
			<p class="text-center text-body-secondary">© All Right reserved OneCook</p>
        </footer>
		<!----------------- 푸터 end ---------------->
	
		
		
	</body>
</html>

















