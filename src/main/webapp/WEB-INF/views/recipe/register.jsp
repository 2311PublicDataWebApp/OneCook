<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>레시피 등록</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
		<link rel="stylesheet" href="../../../resources/css/recipe.css">
	</head>
	<body>
		<header class="p-3 text-bg-dark">
		    <div class="container">
		      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
		        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
		          <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
		        </a>
		
		        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
		          <li><a href="#" class="nav-link px-2 text-secondary">Home</a></li>
		          <li><a href="#" class="nav-link px-2 text-secondary">Features</a></li>
		          <li><a href="#" class="nav-link px-2 text-secondary">Pricing</a></li>
		          <li><a href="#" class="nav-link px-2 text-secondary">FAQs</a></li>
		          <li><a href="#" class="nav-link px-2 text-secondary">About</a></li>
		        </ul> 
		
		        <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
		          <input type="search" class="form-control form-control-dark text-bg-dark" placeholder="Search..." aria-label="Search">
		        </form>
		
		        <div class="text-end">
		          <button type="button" class="btn btn-outline-light me-2">Login</button>
		          <button type="button" class="btn btn-warning">Sign-up</button>
		        </div>
		      </div>
		    </div>
		  </header>
		<div>
			<nav class="navbar navbar-expand-lg bg-body-tertiary">
			  <div class="container-fluid">
			    <a class="navbar-brand" href="#">Navbar</a>
			    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
			      <span class="navbar-toggler-icon"></span>
			    </button>
			    <div class="collapse navbar-collapse" id="navbarNav">
			      <ul class="navbar-nav">
			        <li class="nav-item">
			          <a class="nav-link active" aria-current="page" href="#">Home</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link" href="#">Features</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link" href="#">Pricing</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link disabled" aria-disabled="true">Disabled</a>
			        </li>
			      </ul>
			    </div>
			  </div>
			</nav>
		</div>
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