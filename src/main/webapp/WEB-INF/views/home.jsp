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
			          	<button type="button" class="btn btn-secondary me-2">레시피 등록</button>
			          	<button type="button" class="btn btn-warning">로그인</button>
			        </div>
		      	</div>
		    </div>
		</header>
		 
		<div>
			<nav>
                <div>
                    <ul class="nav nav-pills ">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">추천</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link bg-white text-dark " href="">랭킹</a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link bg-white text-dark" href="">고객센터</a>
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
			<table>
				<c:forEach items="${rList }" var="recommend" varStatus="i">
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
					<ul>
					<c:forEach items="${tImage }" var="tImage" varStatus="i">
							<li>
								<label>첨부파일</label>
								<span><a href="../resources/nuploadFiles/${tImage.imageFilePath }" download> ${tImage.imageFilePath }</a></span>
							</li>
					</c:forEach>
					</ul>
			</table>
		</div>
		<div>
			<h1>카테고리별</h1>
			<button id="koreanBtn" onclick="sendRequest('korean')">한식</button>
		    <button id="westernBtn" onclick="sendRequest('western')">양식</button>
		    <button id="japaneseBtn" onclick="sendRequest('japanese')">일식</button>
		    <button id="chineseBtn" onclick="sendRequest('chinese')">중식</button>
		    <button id="snackBtn" onclick="sendRequest('snack')">분식</button>
		    <br>
			<button id="fusion" onclick="sendRequest('fusion')">퓨전</button>
		    <button id="snack" onclick="sendRequest('snack')">간식</button>
		    <button id="appetizer" onclick="sendRequest('appetizer')">안주</button>
		    <button id="sideDish" onclick="sendRequest('sideDish')">반찬</button>
		    <button id="Other" onclick="sendRequest('Other')">기타</button>
			<div>
				<table>
					<c:forEach items="${rList }" var="category" varStatus="i">
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
					<c:forEach items="${tImage }" var="tImage" varStatus="i">
						<tr>
							<td></td>
							<td>파일경로</td>
						</tr>
						<tr>
							<td>${i.count }</td>
							<td>${tImage.imageFilePath }</td>
						</tr>
					</c:forEach>
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

	<script>
        function sendRequest(foodType) {
            // AJAX를 이용하여 서버에 요청을 보냄
            var xhr = new XMLHttpRequest();
            xhr.open('GET', '/home?foodType=' + foodType, true);

            xhr.onload = function() {
                if (xhr.status >= 200 && xhr.status < 300) {
                    // 성공적으로 응답을 받았을 때의 처리
                    console.log('Request successful');
                } else {
                    // 요청이 실패했을 때의 처리
                    console.error('Request failed');
                }
            };

            xhr.send();
        }
    </script>
	</body>
</html>