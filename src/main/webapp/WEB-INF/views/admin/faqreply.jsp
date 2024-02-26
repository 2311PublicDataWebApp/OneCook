<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>1:1문의</title>
		  <link rel="stylesheet" href="../resources/css/mycs.css">
		  <link rel="stylesheet" href="../resources/css/userlist.css">
		<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<link rel="stylesheet" href="../../../resources/css/header.css">
<link rel="stylesheet" href="/../resources/css/mycs.css">
<link rel="stylesheet" href="../../../resources/css/footer.css">
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



		<!--어드민 LNB -->
<content>
		<ul class="my_lnb_ul">
			<li class="my_lnb_li1"><a href="/user/list.oc">회원조회</a></li>		
		<li class="my_lnb_li4"><a href="/admin/faqlist.oc">1:1문의</a></li>
		
		</ul>
<!--// LNB -->	
	<div class="content">
		<h2 class="csh1">관리자</h2>

	<h3 class="faqttl">1:1문의 답변</h3>
	
	
		
		<form action="/user/faqreply.oc" method="post">
			<input type="hidden" name="userId" id="" value="${user.userId }">
			
				<ul>
					<li>
						<label for="">작성자 : </label>
						<span>${user.userNick }</span>
					</li>
					<li>
						<label for="">제목 : </label>
						<input type="text" name="questionTitle" id="" value="${cs.questionTitle }">
					</li>
						<li>
						<label for="">휴대폰번호 : </label>
						<input type="text" name="questionPhone" id="" value="${cs.questionPhone }">
						<input type="checkbox">답변을 휴대폰 메시지로 받기<br>
					</li>
					<li>
						<label for="">이메일주소 : </label>
						<input type="text" name="questionEmail" id="" value="${cs.questionEmail }">
						<input type="checkbox">답변을 이메일로 받기<br>						
					</li>
					<li>
						<label for="">문의내용 : </label>
						<textarea rows="15" cols="50" name="questionContent">${cs.questionContent }</textarea>
<%-- 						<input type="text" name="questionContent" id="" value="${cs.questionContent }"> --%>
					</li>
					
				</ul>
		
			<div>
				<input type="submit" value="수정">
			</div>
		<script>
			
		</script>
		</form>
		</div>
		</content>
	</body>
</html>