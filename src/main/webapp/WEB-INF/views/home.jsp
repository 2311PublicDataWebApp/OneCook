<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>메인 페이지</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
		<link rel="stylesheet" href="../../../resources/css/header.css">
		<link rel="stylesheet" href="../../../resources/css/footer.css">
		<link rel="stylesheet" href="../../../resources/css/index.css">

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
		
		<h1>추천 레시피</h1>
		<div>
			<form action="/home.oc" method="get" enctype="multipart/form-data">
			    <input type="submit" name="popRecipe" value="추천"/>
			    <input type="submit" name="recRecipe" value="인기"/>
			</form>
			<br>
			
			<!-- 추천, 인기 레시피 -->
						
			<div>
				<c:forEach items="${tImage }" var="tImage" varStatus="i">
						${tImage.imageNo }
						<img alt="${tImage.imageRename}" src="${pageContext.request.contextPath}/resources/RecipeDetailImgs/${tImage.imageRename}" style="width: 200px; height: 200px;">									
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
				
				<c:forEach items="${rList }" var="recommend" varStatus="i">
				<tr>
					<td>${i.count }</td>
					<td>${recommend.userId }</td>
					<td>${recommend.recipeName }</td>
					<td>${recommend.recipeDetail }</td>
					<td>${recommend.recipeCategory }</td>
					<td>${recommend.recipeTime }</td>
					<td>${recommend.recipeDate }</td>
					<td>${recommend.recipeCount }</td>
				</tr>
				</c:forEach>
				
			</table>
	
		</div>
		
		<div>
			<h1>카테고리별</h1>
			<form action="/home.oc" method="get" enctype="multipart/form-data">
			    <input type="submit" name="foodType" value="한식"/>
			    <input type="submit" name="foodType" value="양식"/>
			    <input type="submit" name="foodType" value="일식"/>
			    <input type="submit" name="foodType" value="중식"/>
			    <input type="submit" name="foodType" value="분식"/>
			    <br>
			    <input type="submit" name="foodType" value="퓨전"/>
			    <input type="submit" name="foodType" value="간식"/>
			    <input type="submit" name="foodType" value="안주"/>
			    <input type="submit" name="foodType" value="반찬"/>
			    <input type="submit" name="foodType" value="기타"/>
			    
			</form>
			
			<!-- 카테고리별 레시피 -->
			<div>
				<table>
					<tr>
						<td>순서</td>
						<td>작성자</td>
						<td>레시피 이름</td>
						<td>레시피 상세</td>
						<td>레시피 카테고리</td>
						<td>레시피 조리시간</td>
						<td>레시피 등록일</td>
						<td>레시피 조회수</td>
					</tr>
	
					<c:forEach items="${foodList }" var="category" varStatus="i">
					<tr>
						<td>${i.count }</td>
						<td>${category.userId }</td>
						<td>${category.recipeName }</td>
						<td>${category.recipeDetail }</td>
						<td>${category.recipeCategory }</td>
						<td>${category.recipeTime }</td>
						<td>${category.recipeDate }</td>
						<td>${category.recipeCount }</td>
					</tr>
					</c:forEach>
					
					<div>
						<c:forEach items="${tImageCategory }" var="tImageCategory" varStatus="i">
								${tImageCategory.imageNo }
								<img alt="${tImageCategory.imageRename }" src="${pageContext.request.contextPath}/resources/RecipeDetailImgs/${tImageCategory.imageRename }" style="width: 200px; height: 200px;">
						</c:forEach>
					</div>	
					
					
					<tr align="center">
						<td colspan="5">
							<c:if test="${pInfo.startNavi ne '1' }">
								<a href="/notice/list.kh?page=${pInfo.startNavi -1 }">이전</a>
							</c:if>
							<c:forEach begin="${pInfo.startNavi }" end="${pInfo.endNavi }" var="p">
								<a href="/notice/list.kh?page=${p }">${p }</a>
							</c:forEach>
							<c:if test="${pInfo.endNavi ne pInfo.naviTotalCount }">
								<a href="/notice/list.kh?page=${pInfo.endNavi +1 }">다음</a>
							</c:if>
						</td>
					</tr>
				</table>
	
			</div>
		</div>
		
		<!----------------- 푸터 start ---------------->
		
		<!----------------- 푸터 end ---------------->
	</body>
</html>