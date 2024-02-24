<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>레시피 상세 페이지</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
		<link rel="stylesheet" href="../../../resources/css/header.css">
		<link rel="stylesheet" href="../../../resources/css/footer.css">
		<style type="text/css">
		body {
			display: flex;
		    justify-content: center;
		    align-items: center;
		    flex-direction: column;
		    margin: 0;
		    padding: 0;
		    gap: 30px;
		}
		
		#recipeTitle {
			font-size: 30px;
			text-align: center;
		}
		
		#container {
			width: 100%;
			/* max-width: 1200px;
			padding: 20px; */
		}
		
		.star {
			cursor: pointer;
			font-size: 24px;
			color: red;
		}
		
		.star:hover {
			cursor: pointer;
			color: pink;
		}
		
		.comment {
			display: flex;
			align-items: center;
		}
		
		.comment .writer {
			flex: 10%;
		}
		
		.comment .rating {
			flex: 5%;
			text-align: center;
			margin-right: 50px;
			white-space: nowrap;
		}
		
		.comment .content {
			flex: 50%;
		}
		
		.comment .date {
			flex: 30%;
			text-align: right;
		}
		
		#igrdbox {
			display: flex;
			justify-content: center;
			align-items: flex-start; /* 아이템을 세로로 정렬 */
		}
		
		#box1 h5, #box2 h5 {
			text-align: left; /* 텍스트를 왼쪽으로 정렬 */
		}
		
		#box1, #box2 {
			margin-bottom: 10px; /* 텍스트 아래 여백 설정 */
			margin-bottom: 20px; /* 재료와 양념 사이에 여백 추가 */
			margin-right: 100px;
			margin-left: 50px
		}
		/* 설명 번호를 동그라미로 감싸고 스타일링 */
		.number-circle {
		    width: 50px; /* 동그라미의 너비 */
		    height: 50px; /* 동그라미의 높이 */
		    border-radius: 50%; /* 동그라미를 만들기 위해 반지름을 50%로 설정 */
		    background-color: #f0f0f0; /* 배경색 지정 */
		    text-align: center; /* 텍스트를 가운데 정렬 */
		    line-height: 50px; /* 텍스트의 높이를 동그라미의 높이와 동일하게 설정하여 가운데 정렬 */
		    font-size: 20px; /* 텍스트 크기 */
		    font-weight: bold; /* 텍스트를 굵게 표시 */
		}
		
		.ingredient {
			display: inline-block;
			width: 150px; /* 원하는 너비로 조정하세요 */
			white-space: nowrap; /* 텍스트가 너비를 초과할 경우 줄바꿈 방지 */
			border-bottom: 1px solid gray;
			margin-bottom: 10px;
			margin-right: 20px;
		}
		
		.igrdUnit {
			display: inline-block;
			width: 70px; /* 원하는 너비로 조정하세요 */
			white-space: nowrap; /* 텍스트가 너비를 초과할 경우 줄바꿈 방지 */
			border-bottom: 1px solid gray;
			text-align: right;
			margin-bottom: 10px;
		}
		
		#recipeSoonserbox {
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    flex-direction: column;
		    width: 60%;
		    gap: 30px;
		}
		
		.recipeContent {
			height: 300px;
		    width: 80%;
		    overflow-y: auto;
		    display: flex;
		    align-items: center;
		    margin-left: 30px;
		}
		
		.commentForm {
		    display: flex;
		    flex-direction: column;
		    gap: 10px;
		    padding-top: 20px;
		}
		</style>
	</head>
	<body>
		<header class="top-top p-3 text-bg-dark" style="width:100%;">
		    <div class="container-fluid">
		      	<div class="d-flex flex-wrap align-items-center justify-content-around">
		      	
				
				<a href="#">
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
		<div id="recipeTitle">${recipe.recipeName}(★${averageRating })</div>	
			<div style="text-align: center; border-bottom: 1px solid gray; width: 70%;">
				<img alt="#"
					src="../../../resources/RecipeTitleImgs/${title.imageRename }"
					style="width: 650px; height: 400px; display: block; margin: auto; margin-top: 20px; margin-bottom: 20px; border-radius: 10px;">
	
				<div id="descriptionarea"
				    style="display: flex; align-items: center; justify-content: center; margin-bottom: 30px; margin-top: 42px; width: 650px; margin: 0 auto; margin-bottom: 35px;">
				    <div style="margin-right: 20px; text-align: left; width:80%">${recipe.recipeDetail}</div>
					<div class="selectoption" style="text-align: right; width:20%">
					    카테고리 : ${recipe.recipeCategory} <br>조리시간 :
					    ${recipe.recipeTime}
					</div>
				</div>
			</div>
			<div id="igrdbox" style="margin-top: 20px;">
				<div id="box1">
					<h3>[재료]</h3>
					<c:forEach items="${igrd}" var="igrd" varStatus="i">
						<span class="ingredient"> <c:out value="${igrd.igrdName}" />
						</span>
						<span class="igrdUnit"> <c:out value="${igrd.igrdUnit}" />
						</span>
						<br>
					</c:forEach>
				</div>
	
				<div id="box2">
					<h3>[양념]</h3>
					<c:forEach items="${sause}" var="sause" varStatus="i">
						<span class="ingredient"> <c:out value="${sause.sauseName}" />
						</span>
						<span class="igrdUnit"> <c:out value="${sause.sauseUnit}" />
						</span>
						<br>
					</c:forEach>
				</div>
			</div>
	
			<h2
				style="height: 40px; width: 500px; text-align: center; margin: 0 auto; margin-bottom: 20px; margin-top: 30px">조리순서</h2>
			<div id="recipeSoonserbox" style="display: flex; justify-content: center; align-items: center;">
				<!-- 레시피 설명과 이미지를 함께 출력 -->
				<c:forEach items="${prcd}" var="prcd" varStatus="i">
					<div
						style="display: flex; align-items: center; width: 100%;">
						<!-- 설명과 이미지를 같은 줄에 나오게 함 -->
						<!-- 설명 번호 -->
						<div class="number-circle">${i.index + 1}</div>
						<!-- 설명 번호를 동그라미로 감싸서 표시 -->
						<!-- 레시피 설명 -->
						<div style="flex: 1; display: flex; align-items: center;">
							<div class= "recipeContent">
								<c:out value="${prcd.cookDetail}" />
								<br>
							</div>
						</div>
						<!-- 이미지 -->
						<c:if test="${not empty prcdImg}">
					<c:forEach items="${prcdImg}" var="img" varStatus="j">
					    <c:if test="${not empty img.fileRename && j.index == i.index}">
					        <!-- j.index와 i.index가 같은 경우에만 이미지 출력 -->
					        <div style="margin-left: 20px; border-radius: 10px; overflow: hidden;">
					            <!-- 이미지 사이 여백 조절 및 테두리 둥글게 설정 -->
					            <!-- 이미지를 출력하고 크기를 300x300으로 고정 -->
					            <img alt="#" src="../../../resources/RecipeDetailImgs/${img.fileName}" style="width: 300px; height: 300px;">
					            <!-- 이미지 사이에 여백 추가 -->
					        </div>
					    </c:if>
					</c:forEach>
						</c:if>
					</div>
				</c:forEach>
			</div>
			<div style="padding-top: 20px; padding-bottom: 20px; width: 70%">
				<div style="border-top: 1px solid gray;"></div>
					<div>
						<div
							style="border-bottom: 1px solid gray; display: flex; align-items: center; padding-top: 10px; padding-bottom: 10px;">
							<div style="flex-grow: 1;">
								<h3>
									요리후기 <span id="commentCount">${fn:length(comment)}</span>
								</h3>
							</div>
							<div>
								<button id="showAllComments"
									style="background-color: transparent; border: none; cursor: pointer; text-decoration: underline; font-size: 16px; padding-bottom: 5px;">전체보기</button>
							</div>
						</div>
						<c:set var="commentCount" value="0" />
						<c:forEach items="${comment}" var="comment" varStatus="loop">
						    <c:set var="commentCount" value="${commentCount + 1}" />
						    <div class="comment-wrapper"
						        ${loop.index > 2 ? 'style="display: none;"' : ''}>
						        <div class="comment"
						            style="padding-top: 20px; padding-bottom: 20px;">
						            <div class="writer">${comment.commentWriter}</div>
						            <div class="rating">
						                <c:choose>
						                    <c:when test="${comment.recipeScore == 1}">☆☆☆☆★</c:when>
						                    <c:when test="${comment.recipeScore == 2}">☆☆☆★★</c:when>
						                    <c:when test="${comment.recipeScore == 3}">☆☆★★★</c:when>
						                    <c:when test="${comment.recipeScore == 4}">☆★★★★</c:when>
						                    <c:when test="${comment.recipeScore == 5}">★★★★★</c:when>
						                    <c:otherwise>☆☆☆☆☆</c:otherwise>
						                </c:choose>
						            </div>
						            <div class="content">${comment.commentContent}</div>
						            <div class="date">${comment.commentDate}</div>
						        </div>
						    </div>
						    <div
						        style="border-top: 1px solid gray; ${loop.index > 2 ? 'display: none;' : ''}"></div>
						</c:forEach>
					</div>
			<form class="commentForm" action="/recipe/test.oc" method="post" onsubmit="return validateForm()" style="margin-bottom: 100px;">
			    <input type="hidden" name="recipeNumber" value="${recipe.recipeNumber}" style="display: inline-block; margin-right: 10px;">
			    <input type="hidden" name="userId" value="" style="display: inline-block; margin-right: 10px;">
			    <input type="hidden" id="recipeScore" name="recipeScore" value="5" style="display: inline-block; margin-right: 10px;"> <!-- 초기 별점을 5로 설정 -->
			
			    <div id="rating" style="display: flex; align-items: center; margin-bottom: 5px ">
			        <h3 style="margin-right: 20px;">후기작성</h3>
			        <span class="star" data-value="1">&#9733;</span>
			        <span class="star" data-value="2">&#9733;</span>
			        <span class="star" data-value="3">&#9733;</span>
			        <span class="star" data-value="4">&#9733;</span>
			        <span class="star" data-value="5">&#9733;</span>
			        <input type="button" value="찜하기" style="margin-left: auto; width: 130px; height: 40px">
			    </div>
			    <div style="display: flex; justify-content: space-between;">
			        <textarea id="commentContent" rows="14" cols="160" name="commentContent" style="height: 140px; margin-right: 10px; width:100%; resize: none;"></textarea>
			        <input type="submit" value="등록" style="height: 145px; width: 140px">
			    </div>
			</form>
		</div>
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
	</body>
	<script>
    document.addEventListener("DOMContentLoaded", function() {
        const stars = document.querySelectorAll(".star");
        const recipeScoreInput = document.getElementById("recipeScore");

        stars.forEach(function(star) {
            star.addEventListener("click", function() {
                const value = parseInt(star.dataset.value);
                recipeScoreInput.value = value;
                resetStars();
                fillStars(value);
            });
        });

        // 초기 별점을 ☆☆☆☆☆로 설정하는 함수
        function setInitialRating() {
            recipeScoreInput.value = 0;
            resetStars();
        }
        setInitialRating(); // 페이지 로드시 초기 별점 설정

        function resetStars() {
            stars.forEach(function(star) {
                star.innerHTML = "&#9734;"; // 빈 별
            });
        }

        function fillStars(value) {
            for (let i = 0; i < value; i++) {
                stars[i].innerHTML = "&#9733;"; // 채워진 별
            }
        }
    });
    
    var commentsHidden = true; // 댓글이 숨겨져 있는지 여부를 저장하는 변수

    function toggleComments() {
        var comments = document.querySelectorAll(".comment-wrapper");
        if (commentsHidden) {
            // 전체 댓글 보이기
            comments.forEach(function(comment) {
                comment.style.display = "block";
            });
            document.getElementById("showAllComments").textContent = "접기";
        } else {
            // 3개의 댓글만 보이기
            for (var i = 3; i < comments.length; i++) {
                comments[i].style.display = "none";
            }
            document.getElementById("showAllComments").textContent = "전체보기";
        }
        commentsHidden = !commentsHidden; // 변수 업데이트
    }
    
    function validateCommentContent() {
        var commentContent = document.getElementById("commentContent").value;

        if (commentContent.trim() === "") {
            alert("댓글을 입력해주세요.");
            return false;
        }
        return true;
    }

    function validateForm() {
        // 이미 후기가 작성되었는지 확인
        var commentWrappers = document.querySelectorAll(".comment-wrapper");
        if (commentWrappers.length > 0) {
            alert("이미 댓글을 작성하였습니다.");
            return false;
        }
        
        // 댓글 내용과 별점이 모두 입력되었는지 확인
        var commentContent = document.getElementById("commentContent").value;
        var recipeScore = parseInt(document.getElementById("recipeScore").value);
        if (commentContent.trim() === "" || recipeScore === 0) {
            alert("내용을 입력하고 별점을 선택해주세요.");
            return false;
        }
        
        return true;
    }
	</script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</html>