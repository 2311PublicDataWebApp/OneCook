<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>댓글 관리</title>
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
		      	
				
				<a href="/home.oc">
		          	<img src="../../../resources/img/logo.png" alt="logo">
				</a>
				
			
			        <form class="col-8 col-lg-4" role="search">
			          	<input type="search" class="form-control form-control-dark text-bg-dark" placeholder="레시피 검색..." aria-label="Search">
			        </form>
			
			        <div class="text-end">

			          	<button type="button" class="btn btn-secondary me-2" onclick="window.location.href='/recipe/register.kh'">레시피 등록</button>
			          	<button type="button" class="btn btn-warning me-2" onclick="window.location.href='/user/login.oc'">로그인</button>
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
			<li class="my_lnb_li4"><a href="/user/commentlist.oc">댓글관리</a></li>		
			<li class="my_lnb_li5"><a href="/cs/faqlist.oc">1:1문의관리</a></li>		
		
		</ul>
	<!--// LNB -->
		
		<div class="content">
					<h2>마이페이지</h2>
				<h4>내가 쓴 댓글</h4>
				
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











