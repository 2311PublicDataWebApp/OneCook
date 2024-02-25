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
			font-weight: 500;
			border: 1px solid black;
			cursor: pointer;
			display: flex;
			align-items: center;
			justify-content: center; &: hover { background : black;
			color: #fff;
			}
		
		}
		#file {
			background: pink;
			display: none;
		}
		
		#recipeSoonserbox {
		    display: flex; /* 부모 요소를 Flexbox로 설정하여 자식 요소를 정렬 */
		    justify-content: space-between; /* 자식 요소 사이의 간격을 최대한으로 넓힘 */
		    align-items: flex-start; /* 자식 요소를 위쪽으로 정렬 */
	        width: 70%;
	        display: flex;
    		justify-content: center;
		}

#inputContainer {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    gap: 20px;
}

#inputContainer textarea {
    height: 150px;
    width: 65%;
    float: left; /* 왼쪽으로 정렬 */
}

.imagePreview {
    max-width: 200px; /* 미리보기 이미지 컨테이너의 최대 너비를 200px로 설정 */
}

    /* 테두리 없애고 밑에 검은선 추가 */
    input[type="text"] {
        border: none;
        border-bottom: 1px solid black;
        outline: none; /* 선택 시 테두리 제거 */
        margin-right: 20px; 
    }
    
    .photobox {
	    gap: 10px;
	    display: flex;
	    flex-direction: column;
	    align-items: center;
    }
    
    .inputGroup {
    	display: flex;
	    align-items: center;
	    gap: 10px;
    }
    
    form {
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    flex-direction: column;
        gap: 30px;
    }
    
    .selectoptionBox {
        display: flex;
	    justify-content: center;
	    align-items: center;
	    flex-direction: column;
	    gap: 10px;
    }
    
    .igrdboxSubtitle {
    	display: flex;
	    justify-content: center;
	    align-items: center;
	    flex-direction: column;
        margin-bottom: 20px;
    }
    
    #igrdUnit {
    	margin-right: 0px !important;
    }
    
    #box1sub, #box2sub {
		margin: auto;
	    text-align: center;
    }
    
    .soonserDivider {
    	border-top: 1px solid gray;
	    width: 70%;
	    text-align: center;
	    padding-top: 30px;
    }
    textarea {
		resize: none !important;
	}
	</style>
		<link rel="stylesheet" href="../../../resources/css/recipe.css">
		<link rel="stylesheet" href="../../../resources/css/index.css">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
		<link rel="stylesheet" href="../../../resources/css/header.css">
		<link rel="stylesheet" href="../../../resources/css/footer.css">
	</head>
	<body>
		<header class="top-top p-3 text-bg-dark">
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
		<form action="/recipe/register.oc" method="post" enctype="multipart/form-data">
			<div id="recipeTitle">
				<input type="text" id="Titlearea" name="recipeName" placeholder="레시피 제목을 입력해주세요" style="width: 700px; height: 45px; text-align: center;">
			</div>
			
			<div class="photobox">
				<input type="file" name="hong" id="file" onchange="readURL(this);">
				<img id="preview" style="width: 650px; height: 400px"/> 
				<label for="file">
					<div class="btn-upload">대표 사진</div>
				</label>
			</div>
	
			<div id="descriptionarea" style="border-bottom: 1px solid gray; border-top: 1px solid gray; width: 70%;">		
			
				<textarea rows="5" cols="80" name="recipeDetail" placeholder="음식설명 입력란" style="width: 60%; height: 150px; "></textarea>
				<div class="selectoptionBox">
					<div class="selectoption" style="float: left;">
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
					
					<div class="selectoption" style="float: left;">
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
			</div>
	
		<div id="igrdbox" style="width: 70%; display: flex;">
		    <div id="box1" style="width: 50%;">
		    	<div class="igrdboxSubtitle">
			        <h5>[재료]</h5>
			        <input type="button" value="클릭하여 재료 추가" onclick="add1()" style="background-color: white; color: black; width: 200px;">
		        </div>
		        <div id="box1sub" style="max-width: 500px;"></div>
		    </div>
		    <div id="box2" style="width: 50%;">
		    	<div class="igrdboxSubtitle">
			        <h5>[양념]</h5>
			        <input type="button" value="클릭하여 양념 추가" onclick="add2()" style="background-color: white; color: black; width: 200px;">
		    	</div>
		    	<div id="box2sub" style="max-width: 500px;"></div>
		    </div>        
		</div>
		<div class="soonserDivider">
			<h3>조리순서</h3>
		</div>
		<div id="recipeSoonserbox">
		    <div id="inputContainer"></div>
		    <div style="clear:both;"></div> <!-- 조리순서 입력란 아래로 버튼이 내려가도록 clear 설정 -->
		    <div id="imagePreview"></div> <!-- 이미지 미리보기를 위한 영역 -->
		</div>
    	<input type="button" value="조리순서 및 사진 추가" onclick="addBoth()">
		<input type="submit" value="등록">
		</form>
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
			let tagArea1 = document.getElementById('box1sub');
			let addInput1 = document.createElement('input');
			addInput1.setAttribute('type', 'text');
			addInput1.setAttribute('name', 'igrdName');
			addInput1.setAttribute('id', 'igrdName');
			addInput1.setAttribute('placeholder', '재료명 입력');
			tagArea1.appendChild(addInput1);
			
			// --------------------------------------------재료량 input 추가 생성--------------------------------------------			  
			let tagArea2 = document.getElementById('box1sub');
			let addInput2 = document.createElement('input'); // <input>	  
			addInput2.setAttribute('type', 'text'); // <input type="text">
			addInput2.setAttribute('name', 'igrdUnit'); // <input type="text" name="igrdUnit">
			addInput2.setAttribute('id', 'igrdUnit'); // <input type="text" name="igrdUnit">
			addInput2.setAttribute('placeholder', '입력'); // <input type="text" name="igrdUnit" placeholder="입력">
			tagArea2.appendChild(addInput2); // id가 box1인 곳에 자식요소로 삽입
		}
		function add2() {
	
			// --------------------------------------------양념명 input 추가 생성--------------------------------------------
			let tagArea1 = document.getElementById('box2sub');
			let addInput1 = document.createElement('input');
			addInput1.setAttribute('type', 'text');
			addInput1.setAttribute('name', 'sauseName');
			addInput1.setAttribute('id', 'sauseName');
			addInput1.setAttribute('placeholder', '양념 입력');
			tagArea1.appendChild(addInput1);
	
			// --------------------------------------------양념량 input 추가 생성--------------------------------------------			  
			let tagArea2 = document.getElementById('box2sub');
			let addInput2 = document.createElement('input');
			addInput2.setAttribute('type', 'text');
			addInput2.setAttribute('name', 'sauseUnit');
			addInput2.setAttribute('id', 'sauseUnit');
			addInput2.setAttribute('placeholder', '입력');
			tagArea2.appendChild(addInput2);
		}
		let imagePreviews = {}; // 각 입력란에 대한 이미지 미리보기를 저장하는 객체

		function addBoth() {
		    let div = document.createElement('div'); // 새로운 div 요소 생성
		    div.classList.add('inputGroup'); // 스타일을 적용하기 위해 inputGroup 클래스 추가

		    // TEST6_PRCDIMAG.NEXTVAL 값을 캡처하여 add3와 add4 함수에 전달
		    let prcdImageId = 'TEST6_PRCDIMAG.NEXTVAL';
		    add3(div, prcdImageId); // add3에 prcdImageId 전달
		    add4(div, prcdImageId); // add4에 prcdImageId 전달

		    let container = document.getElementById('inputContainer');
		    container.appendChild(div); // 새로운 div를 inputContainer에 추가
		}

		function add3(container, prcdImageId) {
		    let addInput = document.createElement('textarea');
		    addInput.setAttribute('rows', '4');
		    addInput.setAttribute('cols', '20');
		    addInput.setAttribute('name', 'cookDetail');
		    addInput.setAttribute('placeholder', '조리순서를 입력해주세요');
		    // prcdImageId를 추가하여 캡처된 값을 설정
		    addInput.setAttribute('data-prcd-image-id', prcdImageId);
		    container.appendChild(addInput);
		    container.appendChild(document.createElement('br')); // <br> 추가
		}

		function add4(container, prcdImageId) {
		    let addInput = document.createElement('input');
		    addInput.setAttribute('type', 'file');
		    addInput.setAttribute('name', 'cookDetailImage');
		    addInput.setAttribute('multiple', '');
		    // prcdImageId를 추가하여 캡처된 값을 설정
		    addInput.setAttribute('data-prcd-image-id', prcdImageId);
		    addInput.addEventListener('change', function() {
		        previewImages(this);
		    });
		    container.appendChild(addInput);
		}

		function previewImages(input) {
		    // 부모 요소인 div.inputGroup 찾기
		    let parentDiv = input.parentNode;
		    while (!parentDiv.classList.contains('inputGroup')) {
		        parentDiv = parentDiv.parentNode;
		    }

		    // 부모 요소에서 이미지 미리보기를 담은 div.imagePreview 찾기
		    let imagePreviewDiv = parentDiv.querySelector('.imagePreview');
		    if (!imagePreviewDiv) {
		        // div.imagePreview가 없는 경우 새로 생성하여 부모 요소에 추가
		        imagePreviewDiv = document.createElement('div');
		        imagePreviewDiv.classList.add('imagePreview');
		        parentDiv.appendChild(imagePreviewDiv);
		    }

		    // 이미지 미리보기를 업데이트
		    imagePreviewDiv.innerHTML = ''; // 이전의 내용을 지우고 새로 추가
		    if (input.files) {
		        // 선택된 파일들에 대해 반복
		        for (let file of input.files) {
		            let reader = new FileReader();
		            reader.onload = function(e) {
		                let img = document.createElement('img');
		                img.src = e.target.result;
		                img.style.width = '200px'; // 이미지의 너비를 100%로 설정
		                img.style.height = '200px'; // 이미지의 높이를 300px로 고정
		                img.style.display = 'block'; // 블록 요소로 설정하여 줄 바꿈 발생
		                img.style.marginBottom = '10px'; // 이미지 아래쪽 여백 추가
		                imagePreviewDiv.appendChild(img);
		            };
		            reader.readAsDataURL(file);
		        }
		    }
		}

	</script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</html>