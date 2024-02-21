<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>레시피 상세 페이지</title>
		<style type="text/css">
			.star {
			    cursor: pointer;
			    font-size: 24px;
			    color: red;
			}
			
			.star:hover {
			    cursor: pointer;
			    color: pink;
			}
		</style>
	</head>
	<body>
	레시피 번호 : ${recipe.recipeNumber} <br>
	유저 아이디 : ${user.userId}
		<div id="recipeTitle">
			${recipe.recipeName}
		</div>
	
		
 		<img alt="#" src="../../../resources/RecipeTitleImgs/${title.imageRename }"> 
	
		<div id="descriptionarea">
				${recipe.recipeDetail}
			<div class="selectoption" style="float: left; margin-top: 30px;">
				${recipe.recipeCategory}
			</div>
	
			<div class="selectoption" style="float: left; margin-top: 30px;">
				${recipe.recipeTime}
			</div>
		</div>
	
 		<div id="igrdbox">
			<div id="box1">
				<h5>[재료]</h5>
				<c:forEach items="${igrd}" var="igrd" varStatus="i">
				    <c:out value="${igrd.igrdName}" />
				    <c:out value="${igrd.igrdUnit}" /><br>
				</c:forEach>
			</div>
	
			<div id="box2">
				<h5>[양념]</h5>
				<c:forEach items="${sause}" var="sause" varStatus="i">
				    <c:out value="${sause.sauseName}" />
				    <c:out value="${sause.sauseUnit}" /><br>
				</c:forEach>
			</div>
		</div>
	
 		<div id="recipeSoonserbox"
			style="width: 1000px; margin-bottom: 50px; border-top: 50px;">
			<h3>조리뜐뗘</h3>
			<div id="box3">
				<c:forEach items="${prcd}" var="prcd" varStatus="i">
				    <c:out value="${prcd.cookDetail}" /><br>
				</c:forEach>
			</div>
	
			<div id="box4">
			 	<c:if test="${not empty prcdImg}">
			        <c:forEach items="${prcdImg}" var="prcdImg" varStatus="i">
			            <c:if test="${not empty prcdImg.fileRename}">
			                <img alt="#" src="../../../resources/RecipeDetailImgs/${prcdImg.fileRename}">
			            </c:if>
			        </c:forEach>
			    </c:if>
			</div>
			<div style="width: 1000px; background-color: pink" >
				<h3>여기는 댓글 리스트 출력이야~</h3>
				<c:forEach items="${comment}" var="comment" varStatus="i">
				    <c:out value="${comment.commentWriter}"/>
				    <c:choose>
					    <c:when test="${comment.recipeScore == 1}">
					        ☆☆☆☆★
					    </c:when>
					    <c:when test="${comment.recipeScore == 2}">
					        ☆☆☆★★
					    </c:when>
					    <c:when test="${comment.recipeScore == 3}">
					        ☆☆★★★
					    </c:when>
					    <c:when test="${comment.recipeScore == 4}">
					        ☆★★★★
					    </c:when>
					    <c:when test="${comment.recipeScore == 5}">
					        ★★★★★
					    </c:when>
					    <c:otherwise>
					    	☆☆☆☆☆				    
					    </c:otherwise>
					</c:choose>
				    <c:out value="${comment.commentContent}" />
				    <c:out value="${comment.commentDate}" /><br>
				</c:forEach>
			</div>
		</div>
		<form action="/recipe/test.oc" method="post" onsubmit="return checkLogin()">
			<h3>후기작뗭!</h3>
			<input type="hidden" name="recipeNumber" value="${recipe.recipeNumber}">
			<input type="hidden" name="userId" value="">
			<input type="hidden" id="recipeScore" name="recipeScore" value="0">
			<div id="rating">
			    <span class="star" data-value="1">&#9733;</span>
			    <span class="star" data-value="2">&#9733;</span>
			    <span class="star" data-value="3">&#9733;</span>
			    <span class="star" data-value="4">&#9733;</span>
			    <span class="star" data-value="5">&#9733;</span>
			</div>
			<textarea rows="5" cols="70" name="commentContent"></textarea>
			<input type="hidden" name="recipeNumber" value=>
			<input type="button" value="쮬하기">
			<input type="submit" value="등록">
		</form>
	</body>
	<script type="text/javascript">
		document.addEventListener("DOMContentLoaded", function() {
		    const stars = document.querySelectorAll(".star");
		    const ratingValue = document.getElementById("recipeScore");
		    let initialRating = Number(ratingValue.value); // 초기 별점 가져오기
	
		    // 초기 별점 표시
		    for (let i = 0; i < stars.length; i++) {
		        if (i < initialRating) {
		            stars[i].textContent = "★";
		        } else {
		            stars[i].textContent = "☆";
		        }
		    }
	
		    stars.forEach(function(star, index) {
		        star.addEventListener("click", function() {
		            const rating = index + 1;
		            ratingValue.value = rating;
	
		            // 별점 업데이트
		            for (let i = 0; i < stars.length; i++) {
		                if (i <= index) {
		                    stars[i].textContent = "★";
		                } else {
		                    stars[i].textContent = "☆";
		                }
		            }
		            console.log("별점 값:", ratingValue.value);
		        });
		    });
		});
		
	    const form = document.querySelector("form");
	    form.addEventListener("submit", function(event) {
	        if (!checkLogin()) {
	            event.preventDefault(); // 폼 제출을 중단합니다.
	        }
	    });
		});
	
		function checkLogin() {
		    var userId = "${user.userId}";
		    if(userId === '' || userId === null) { // userId가 빈 문자열이거나 null인 경우
		        alert("로그인 후 사용 가능합니다");
		        return false;
		    }
		    return true; // 로그인이 되어 있다면 true 반환
		}
	</script>
</html>