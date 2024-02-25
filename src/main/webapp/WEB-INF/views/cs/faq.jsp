<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의</title>
<link rel="stylesheet" href="../resources/css/mycs.css">

</head>
<body>
		<!----------------- 헤더, 네브바 start ---------------->
		<header class="p-3 text-bg-dark">
		    <div class="container-fluid">
		      	<div class="d-flex flex-wrap align-items-center justify-content-between mt-4">
		      	
					<!-- 로고 넣을공간 -->
<!-- 		          	<svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg> -->
		          	<img src="https://via.placeholder.com/100x100" alt="임시 이미지">
			
			        <form class="col-12 col-lg-6" role="search">
			          	<input type="search" class="form-control form-control-dark text-bg-dark" placeholder="레시피 검색..." aria-label="Search">
			        </form>
			
			        <div class="text-end">

			          	<button type="button" class="btn btn-secondary me-2" onclick="window.location.href='/recipe/register.kh'">레시피 등록</button>
			          	<button type="button" class="btn btn-warning me-2" onclick="window.location.href='/user/login.oc'">로그인</button>
			        </div>

		      	</div>
		    </div>
		</header>
		 
		<div>
			<nav>
                <div>
                    <ul class="nav nav-pills ">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/">추천</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link bg-white text-dark " href="/ranking/ranking.oc">랭킹</a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link bg-white text-dark" href="noticelist">고객센터</a>
                        </li>
                    </ul>
                </div>
            </nav>
		</div>
		<!----------------- 헤더, 네브바 end ---------------->

<!--고객센터 LNB -->
		<ul class="cs_lnb_ul">
			<li class="cs_lnb_li1"><a href="/notice/list.oc">공지사항</a></li>		
			<li class="cs_lnb_li2"><a href="/cs/qna.oc">자주묻는 질문</a></li>		
			<li class="cs_lnb_li3"><a href="/cs/faq.oc">1:1 문의</a></li>		
		</ul>
<!--// LNB -->



	<form action="/cs/faq.oc" method="POST">

	<input type="hidden" name="questionCategory" value="Q"/>
	<input type="hidden" name="questionStatus" value="new"/>
	<input type="hidden" name="userId" value="${userId }"/>
	<input type="hidden" name="questionWriter" value="${userName}"/>

	
		<h3>1:1문의</h3>
		
		제목 : <input type="text" size="50" name="questionTitle"><br>
		휴대폰번호 : <input type="text" name="questionPhone" ><input type="checkbox">답변을 휴대폰 메시지로 받기<br>
		이메일주소 : <input type="text" name="questionEmail"><input type="checkbox">답변을 이메일로 받기<br>
		내용 : <textarea rows="15" cols="50" name="questionContent"></textarea>
		<br><br>
		<input type="submit" value="입력완료">
	</form>
	
	
	
	
	
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