<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>랭킹 페이지</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
		<link rel="stylesheet" href="../../../resources/css/header.css">
		<link rel="stylesheet" href="../../../resources/css/footer.css">


	</head>
	<body>
		<!----------------- 헤더, 네브바 start ---------------->
		<header class="p-3 text-bg-dark">
		    <div class="container-fluid">
		      	<div class="d-flex flex-wrap align-items-center justify-content-between">
		      	
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
                            <a class="nav-link bg-white text-dark" aria-current="page" href="/">추천</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active " href="/ranking/ranking.oc">랭킹</a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link bg-white text-dark" href="noticelist">고객센터</a>
                        </li>
                    </ul>
                </div>
            </nav>
		</div>
		<!----------------- 헤더, 네브바 end ---------------->
		<form action="/ranking/ranking.oc" method="post">
			<h1>랭킹 레시피</h1>
			<div>
				<div>
					<c:forEach items="${rImage }" var="rImage" varStatus="i">
							${rImage.imageNo }
							<img alt="${rImage.imageRename}" src="${pageContext.request.contextPath}/resources/RecipeDetailImgs/${rImage.imageRename}" style="width: 200px; height: 200px;">									
					</c:forEach>
				</div>	
					
				<table>
					<tr>
						<td>순서</td>
						<td>작성자</td>
						<td>레시피 이름</td>
						<td>레시피 상세</td>
						<td>레시피 카테고리</td>
						<td>레시피 조리시간</td>
						<td>레시피 등록일</td>
						<td>레시피 조회수 or 찜등록</td>
					</tr>
					
					<c:forEach items="${rList }" var="ranking" varStatus="i">
					<tr>
						<td>${i.count }</td>
						<td>${ranking.userId }</td>
						<td>${ranking.recipeName }</td>
						<td>${ranking.recipeDetail }</td>
						<td>${ranking.recipeCategory }</td>
						<td>${ranking.recipeTime }</td>
						<td>${ranking.recipeDate }</td>
						<td>${ranking.recipeCount }</td>
					</tr>
					</c:forEach>
					
				</table>
			</div>
		</form>
	</body>
</html>