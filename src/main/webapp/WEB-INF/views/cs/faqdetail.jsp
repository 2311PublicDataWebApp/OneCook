<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>1:1문의 상세</title>
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
		<h1>1:1문의 상세조회</h1>
		<ul>
			<li>
				<label>제목</label>
				<span>${cs.questionTitle }</span>
			</li>
			<li>
				<label>작성자</label>
				<span>${cs.questionWriter }</span>
			</li>
			<li>
				<label>내용</label>
				<span>${cs.questionContent }</span>
			</li>
		</ul>
		<br>
		<br>
		<div>
			<button type="button" onclick="goBack();">뒤로가기</button>
			<button type="button" onclick="showModifyPage();">수정하기</button>
<%-- 			<button type="button" onclick="deleteNotice(${notice.noticeNo });">삭제하기</button> --%>
		</div>
		<script>
// 			function deleteNotice(noticeNo) {
// 				if(confirm("삭제하시겠습니까?")) {
// 					location.href = "/notice/delete.kh?noticeNo="+noticeNo;
// 				}
// 			}
			function showModifyPage() {
				var questionNo = "${cs.questionNo }";
				location.href = "/cs/faqmodify.oc?questionNo="+questionNo;
			}
			function showNoticeList() {
				location.href = "/cs/faqlist.oc";
			}
			function goBack(){
				history.back();
			}
		</script></div></content>
	</body>
</html>