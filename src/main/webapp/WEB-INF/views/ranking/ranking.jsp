<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
	<style>
		.rankboxs {
			width: 100%;
		    display: flex;
		    flex-flow: wrap;
		    gap: 50px;
		    justify-content: center;
		    
		}
		.rankboxs > div:hover {
			transform: scale(1.1);
			cursor: pointer;
		}
		
		.pagingbox {
			display: flex;
		    justify-content: center;
		    align-items: center;
		    margin-top: 30px;
		    margin-bottom: 30px;
		    gap: 30px;
		    font-size: 18px;
		    border-top: 20px;
		}
		
		.pagingbox > a {
			text-decoration: none;
	    	color: black;
		}
	</style>
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
		<div>
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
	    <h1 style="text-align: center;">레시피 랭킹</h1>
		<div class="rankboxs">
			<c:forEach items="${recipeDTOList}" var="recipeDTO">
			    <div onclick="goRecipeDetail(${recipeDTO.recipeVO.recipeNumber})" style="margin-top: 50px; margin-right: 20px;"> <!-- recipeNumber 전달 -->
			        <h3 style="text-align: center;">${recipeDTO.recipeVO.recipeName}</h3>
			        <div style="border: 1px solid black; width: 350px; height: 410px; border-radius: 10px;">
			            <!-- 레시피 이미지 및 기타 정보 출력 -->
			            <img alt="타이틀이미지" src="../../../resources/RecipeTitleImgs/${recipeDTO.titleVO.imageRename}" style="width: 100%; height: 300px; border-top-left-radius: 10px; border-top-right-radius: 10px;">
			            <p>평점 : ★★★★★(${recipeDTO.averageRating})</p>
			            <p>분류 : ${recipeDTO.recipeVO.recipeCategory}</p>
			            <p>조회수 : ${recipeDTO.recipeVO.recipeCount}</p>
			        </div>                 
			    </div>
			</c:forEach>
		 </div> 
		 <div class="pagingbox">
				<c:if test="${pInfo.startNavi ne '1' }">
				    <a href="/ranking/ranking.oc?page=${pInfo.startNavi -1 }">이전</a>
				</c:if>
				<c:forEach begin="${pInfo.startNavi }" end="${pInfo.endNavi }" var="p">
				    <a href="/ranking/ranking.oc?page=${p }">${p }</a>
				</c:forEach>
				<c:if test="${pInfo.endNavi ne pInfo.naviTotalCount }">
				    <a href="/ranking/ranking.oc?page=${pInfo.endNavi +1 }">다음</a>
				</c:if>	
			</div>
	</body>
	<script type="text/javascript">
	    function goRecipeDetail(recipeNumber) {
	        window.location.href = '/recipe/detail.oc?recipeNumber=' + recipeNumber;
	    }
	</script>
</html>