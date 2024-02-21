<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>레시피 등록</title>
		<style>
		.btn-upload {
			width: 100px;
			height: 30px;
			background: #fff;
			margin-bottom: 50px;
			font-weight: 500;
			border: 1px solid black;
			cursor: pointer;
			display: flex;
			align-items: center;
			justify-content: center; &: hover { background : pink;
			color: #fff;
			}
		
		}
		#file {
			background: pink;
			display: none;
		}
		</style>
		<link rel="stylesheet" href="../../../resources/css/recipe.css">
	</head>
	<body>
		<form action="/recipe/register.kh" method="post" enctype="multipart/form-data">
		
			<div id="recipeTitle">
				<input type="text" id="Titlearea" name="recipeName" placeholder="제목 입력">
			</div>
	
			<input type="file" name="hong" id="file" onchange="readURL(this);">
			<img id="preview" /> <label for="file">
				<div class="btn-upload">대표 사진</div>
			</label>
	
			<div id="descriptionarea" style="margin: 0 auto; width: 1000px; height: 200px; border-bottom: 1px solid gray; margin-bottom: 30px; border-top: 1px solid gray; margin-top: 30px;">		
			
				<textarea rows="4" cols="50" name="recipeDetail" placeholder="음식설명 입력란" style="float: left; margin-left: 200px; margin-top: 30px;"></textarea>
								
				<div class="selectoption" style="float: left; margin-top: 30px;">
					카테고리 : 
					<select name="recipeCategory" id="recipeCategory">
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
				
				<div class="selectoption" style="float: left; margin-top: 30px;">
					조리시간 : <select name="recipeTime">
						<option value="5분">5분</option>
						<option value="10분">10분</option>
						<option value="15분">15분</option>
						<option value="20분">20분</option>
						<option value="25분">25분</option>
						<option value="30분">30분</option>
					</select>
				</div>
			</div>
	
			<div id="igrdbox" style="width: 1000px; height: 350px; background-color: pink; margin-bottom: 30px; margin-top: 30px;">		
				<div id="box1" style="width: 45%; float: left; margin-left: 50px;"> 
					<h5>[재료]</h5>
					<input type="text" name="igrdName" id="igrdName" placeholder="재료명">
					<input type="text" name="igrdUnit" id="igrdUnit" placeholder="입력">
					<input type="button" value="재료+" onclick="add1()"><br>
				</div>

				<div id="box2" style="width: 45%; float: right; margin-right: 50px;">
					<h5>[양념]</h5>
					<input type="text" name="sauseName" id="sauseName" placeholder="양념명">
					<input type="text" name="sauseUnit" id="sauseUnit" placeholder="입력">
					<input type="button" value="양념+" onclick="add2()"><br>
				</div>			
			</div>
	
			<div id="recipeSoonserbox" style="width: 1000px; margin-bottom: 50px; border-top: 50px;">
				<h3>조리순서</h3>
				<div id="box3">
					<input type="button" value="조리순서 추가" onclick="add3()"><br>
				</div>
	
	 	 		<div id="box4">
					<input type="button" value="사진 추가" onclick="add4()"><br>
				</div>
			</div>
			<div>
				<input type="submit" value="등록">
			</div>
		</form>
	</body>
	<script type="text/javascript">
	
			// --------------------------------------------이미지 미리보기-------------------------------------------------- -
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					document.getElementById('preview').src = e.target.result;
				};
				reader.readAsDataURL(input.files[0]);
			} else {
				document.getElementById('preview').src = "";
			}
		}
	
		function add1() {
			
			// --------------------------------------------재료명 input 추가 생성--------------------------------------------
			let tagArea1 = document.getElementById('box1');
			let addInput1 = document.createElement('input');
			addInput1.setAttribute('type', 'text');
			addInput1.setAttribute('name', 'igrdName');
			addInput1.setAttribute('id', 'igrdName');
			addInput1.setAttribute('placeholder', '재료명 입력');
			tagArea1.appendChild(addInput1);
			
			// --------------------------------------------재료량 input 추가 생성--------------------------------------------			  
			let tagArea2 = document.getElementById('box1');
			let addInput2 = document.createElement('input'); // <input>	  
			addInput2.setAttribute('type', 'text'); // <input type="text">
			addInput2.setAttribute('name', 'igrdUnit'); // <input type="text" name="igrdUnit">
			addInput2.setAttribute('id', 'igrdUnit'); // <input type="text" name="igrdUnit">
			addInput2.setAttribute('placeholder', '입력'); // <input type="text" name="igrdUnit" placeholder="입력">
			tagArea2.appendChild(addInput2); // id가 box1인 곳에 자식요소로 삽입
		}
		function add2() {
	
			// --------------------------------------------양념명 input 추가 생성--------------------------------------------
			let tagArea1 = document.getElementById('box2');
			let addInput1 = document.createElement('input');
			addInput1.setAttribute('type', 'text');
			addInput1.setAttribute('name', 'sauseName');
			addInput1.setAttribute('id', 'sauseName');
			addInput1.setAttribute('placeholder', '양념 입력');
			tagArea1.appendChild(addInput1);
	
			// --------------------------------------------양념량 input 추가 생성--------------------------------------------			  
			let tagArea2 = document.getElementById('box2');
			let addInput2 = document.createElement('input');
			addInput2.setAttribute('type', 'text');
			addInput2.setAttribute('name', 'sauseUnit');
			addInput2.setAttribute('id', 'sauseUnit');
			addInput2.setAttribute('placeholder', '입력');
			tagArea2.appendChild(addInput2);
		}
		function add3() {
			// --------------------------------------------조리법 input 추가 생성--------------------------------------------
			let tagArea = document.getElementById('box3');
			let addInput = document.createElement('textarea');
			addInput.setAttribute('rows', '5');
			addInput.setAttribute('cols', '70');
			addInput.setAttribute('name', 'cookDetail');
			addInput.setAttribute('id', 'cookDetail');
			addInput.setAttribute('placeholder', '조리법을 입력해주세요');
			tagArea.appendChild(addInput);
		}
		function add4() {
	/* 		<input type="file" name="hong" id="file" onchange="readURL(this);">
			<img id="preview" /> <label for="file">
				<div class="btn-upload">대표 사진</div>
			</label> */
			let tagArea = document.getElementById('box4');
			let addInput = document.createElement('input');
			addInput.setAttribute('type', 'file');
			addInput.setAttribute('name', 'cookDetailImage');
			addInput.setAttribute('id', 'cookDetailImage');
			tagArea.appendChild(addInput);
		}
	</script>
</html>