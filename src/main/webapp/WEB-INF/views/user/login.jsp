<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>Login</title>
   
      		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
		<link rel="stylesheet" href="../../../resources/css/header.css">
		<link rel="stylesheet" href="../../../resources/css/footer.css">
		   <link rel="stylesheet" href="../resources/css/mycs.css">
<style>
.admlg a{font-size:0.8;
color:#ccc}
.admlg{margin-left:800px;}

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


   
   <div class="all_cont">
      <h1>원쿡 로그인</h1>
   	
      <form action="/user/login.oc" method="post">
         <p class="login_id">아이디 : <input type="text" name="userId" placeholder="아이디를 입력해주세요"><br></p>	
         <p class="login_pw">비밀번호 : <input type="password" name="userPw"
            placeholder="비밀번호를 입력해주세요"><br></p>
            <div class="bottom">
<!--          <br> <a href="/user/findacnt.oc" class="find_a">아이디/비밀번호찾기</a><br> -->
         <p class="login_cont">아직 회원이 아니신가요?
<a href="/user/register.oc" class="register_a">회원가입</a><br></p>
         <br> <input type="submit" id="btn" value="로그인"></p>
         
         <div class="admlg">
         <a href="/admin/login.oc">관리자로그인</a><br>
         </div>
         </div>
      </form>
      </div>

      		<!----------------- 푸터 start ---------------->
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
		<!----------------- 푸터 end ---------------->
	
      

      
   </body>
</html>