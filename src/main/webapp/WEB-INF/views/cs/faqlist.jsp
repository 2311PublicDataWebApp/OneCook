<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>1:1문의조회</title>
	<link rel="stylesheet" href="/../resources/css/mycs.css">
</head>
<body>
		<!----------------- 헤더, 네브바 start ---------------->
		<header class="p-3 text-bg-dark">
		    <div class="container-fluid">
		      	<div class="d-flex flex-wrap align-items-center justify-content-between mt-4">
		      	
					<!-- 로고 넣을공간 -->
<!-- 		          	<svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg> -->
		          	<img src="https://via.placeholder.com/100x100" alt="임시 이미지">
			
			        <form class="col-12 col-lg-6" role="search">
			          	<input type="search" class="form-control form-control-dark text-bg-dark" placeholder="레시피 검색..." aria-label="Search">
			        </form>
			
			        <div class="text-end">

			          	<button type="button" class="btn btn-secondary me-2" onclick="window.location.href='/recipe/register.kh'">레시피 등록</button>
			          	<button type="button" class="btn btn-warning me-2" onclick="window.location.href='/user/login.oc'">로그인</button>
			        </div>

		      	</div>
		    </div>
		</header>
		 
		<div>
			<nav>
                <div>
                    <ul class="nav nav-pills ">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/">추천</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link bg-white text-dark " href="/ranking/ranking.oc">랭킹</a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link bg-white text-dark" href="noticelist">고객센터</a>
                        </li>
                    </ul>
                </div>
            </nav>
		</div>
		<!----------------- 헤더, 네브바 end ---------------->
		


	
<!--마이페이지 LNB -->
		<ul class="my_lnb_ul">
		<li class="my_lnb_li1"><a href="/user/modify.oc?userId=${user.userId }">회원정보수정</a></li>
			<li class="my_lnb_li2"><a href="/user/wishlist.oc">찜목록</a></li>		
			<li class="my_lnb_li3"><a href="/user/recipelist.oc">레시피</a></li>		
			<li class="my_lnb_li4"><a href="/user/commentlist.oc">댓글관리</a></li>		
			<li class="my_lnb_li5"><a href="/cs/faqlist.oc">1:1문의관리</a></li>	
			</ul>	
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