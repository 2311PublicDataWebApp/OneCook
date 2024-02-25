<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<link rel="stylesheet" href="../../../resources/css/header.css">
<link rel="stylesheet" href="/../resources/css/mycs.css">
<link rel="stylesheet" href="../../../resources/css/footer.css">
<style>
h1{margin-left:700px;}
form{margin-left:400px;}
h3{margin-left:300px;}
form ul li{
margin-left:150px;
}
input{padding:5px 7px;
margin-top:5px;}
.restrbtn{margin-left:300px}
a{text-decoration: none;
	color: #AB6840;
	font-size: 0.8em;
	cursor:pointer;}
	
	a:hover {
	text-decoration:line;
	color: #AB6840;
	font-size: 0.9em;
}
	
</style>
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
				

			        </div>
		      	</div>
		    </div>
		</header>	  
		<div class="sunkite">
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
		



<content>
<h1>회원가입</h1>

		<form action="/user/register.oc" method="POST">
			
				<h3>원쿡 회원가입</h3>
				<ul>
					<li>
						<label for="">아이디 *</label>
						<input type="text" name="userId" id="">
						<button><a href="#">중복확인</a></button>
					</li>
					<li>
						<label for="">비밀번호 *</label>
						<input type="password" name="userPw" id="">
					</li>
					<li>
						<label for="">비밀번호 확인 *</label>
						<input type="password" name="userPwre" id="">
						<button><a href="#">중복확인</a></button>
					</li>
					<li>
						<label for="">이름 *</label>
						<input type="text" name="userName" id="">
					</li>
					<li>
						<label for="">닉네임</label>
						<input type="text" name="userNick" id="">
					</li>

					<li>
						<label for="">이메일</label>
						<input type="text" name="userEmail" id="">
					</li>
					<li>
						<label for="">휴대폰번호</label>
						<input type="text" name="userPhone" id="">
					</li>
					<li>
						<label for="">주소</label>
						<input type="text" name="userAddress" id="userAddr" size="30">
						<input type="button" onclick="execDaumPostcode();" value="우편번호 찾기">
					</li>
	
				</ul>

			


		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
			function execDaumPostcode() {
				new daum.Postcode({
			        oncomplete: function(data) {
			            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
			            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
			            console.log(data.autoJibunAddress + ", " + data.zonecode + ", " + data.buildingName);
			            document.querySelector("#userAddr").value = data.address + ", " + data.zonecode + ", " + data.buildingName;
			        }
			    }).open();
			}
		</script>
		<div class="restrbtn">
   <input type="reset" value="이전으로">
   <input type="submit" value="가입하기">
            </div>
            
 </form>           
 </content>
 
 	<!----------------- 푸터 start ---------------->
		<footer class="py-3 my-4">	
			<ul class="nav justify-content-center border-bottom pb-3 mb-3 mx-auto bg-light">
			      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary mx-5">사이트 이용약관</a></li>
			      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary mx-5">개인정보 처리방침</a></li>
			      <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary mx-5">고객센터</a></li>
			</ul>
			
			<p class="text-center text-body-secondary">회사 주소 :</p>
			<p class="text-center text-body-secondary">회사 전화번호 :</p>
			<p class="text-center text-body-secondary">회사 대표 :</p>
			<p class="text-center text-body-secondary">사업자번호 :</p>
			<p class="text-center text-body-secondary">© All Right reserved OneCook</p>
        </footer>
		<!----------------- 푸터 end ---------------->
</body>
</html>