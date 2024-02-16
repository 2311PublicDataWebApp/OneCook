<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>레시피 등록</title>
		<link rel="stylesheet" href="../../../resources/css/recipe.css">
	</head>
	<body>
		<form action="/recipe/register.kh" method="post">	
			<div id="recipeTitle">
				<input type="text" id="Titlearea" name="recipeName" placeholder="제목 입력" >		
			</div>
			
<!--  			<div id="recipeTitleImage"> 
				 <input type="button" value="클릭하여 사진추가"/> <br>
			</div>  -->
			
			<div id="descriptionarea">		
				<textarea rows="4" cols="50" name="recipeDetail" placeholder="음식설명 입력란"></textarea>			
				<div class="selectoption">			
					카테고리 : <select name="recipeCategory">
						<option value="한식">한식</option>
						<option value="양식">양식</option>
						<option value="일식">일식</option>
						<option value="중식">중식</option>
						<option value="분식">분식</option>
						<option value="퓨전">퓨전</option>
						<option value="간식">간식</option>
						<option value="안주">안주</option>
						<option value="반찬">반찬</option>
						<option value="기타">기타</option>
					</select>
				</div>		
			</div>	
				<div class="selectoption">		
					조리시간 : <select name="recipeTime">
						<option value="5분">5분</option>
						<option value="10분">10분</option>
						<option value="15분">15분</option>
						<option value="20분">20분</option>
						<option value="25분">25분</option>
						<option value="30분">30분</option>
					</select>
				</div>		
<!--  			</div>
				<h5>[재료]</h5> <br>
				<div id="box1">
 				<input type="text" placeholder="재료명 입력">
				<input type="text" placeholder="입력"> 
				<input type="button" value="클릭하여 재료 추가" onclick="add1()"><br>					
				</div>
		
				<h5>[양념]</h5> <br>
				<div id="box2">
 				<input type="text" placeholder="양념 입력">
				<input type="text" placeholder="입력"> 
				<input type="button" value="클릭하여 양념 추가" onclick="add2()"><br>
				</div>
			<div>
				<h3>조리순서</h3>
				<textarea rows="4" cols="50" name="recipeSoonser" placeholder="조리방법을 입력해주세요"></textarea>
				<input type="button" value="클릭하여 사진추가"/> <br>
			</div>  -->
				
			<div>
	                <input type="submit" value="등록">
	        </div>
		</form>
	</body>
 	<script type="text/javascript">
		function add1() {
 			  let tagArea1 = document.getElementById('box1');
			  let addInput1 = document.createElement('input');	  
			  addInput1.setAttribute('type', 'text');
			  addInput1.setAttribute('placeholder', '재료명 입력');
			  tagArea1.appendChild(addInput1);
 			  let tagArea2 = document.getElementById('box1');
			  let addInput2 = document.createElement('input');	  
			  addInput2.setAttribute('type', 'text');
			  addInput2.setAttribute('placeholder', '입력');
			  tagArea2.appendChild(addInput2);
		}
		function add2() {
			  let tagArea1 = document.getElementById('box2');
			  let addInput1 = document.createElement('input');	  
			  addInput1.setAttribute('type', 'text');
			  addInput1.setAttribute('placeholder', '양념 입력');
			  tagArea1.appendChild(addInput1);
 			  let tagArea2 = document.getElementById('box2');
			  let addInput2 = document.createElement('input');	  
			  addInput2.setAttribute('type', 'text');
			  addInput2.setAttribute('placeholder', '입력');
			  tagArea2.appendChild(addInput2);
		}
	</script> 
</html>