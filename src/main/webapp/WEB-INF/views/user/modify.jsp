<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원정보 수정</title>
			<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
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
						<!-- 로그인 상태에 따른 처리 -->
						<c:choose>
						    <c:when test="${loggedIn}">
						        <!-- 로그인 중인 경우에 보이는 내용 -->
						        <button id="headerBtn" type="button" class="btn me-2" onclick="window.location.href='/recipe/register.oc'">레시피 등록</button>
						        <button id="headerBtn" type="button" class="btn me-2" onclick="window.location.href='/user/logout.oc'">로그아웃</button>
						        <button id="headerBtn" type="button" class="btn me-2" onclick="window.location.href='/user/mypage.oc'">마이페이지</button>
						    </c:when>
						    <c:otherwise>
						        <!-- 로그인 중이 아닌 경우에 보이는 내용 -->
						        <button id="headerBtn" type="button" class="btn me-2" onclick="window.location.href='/user/login.oc'">로그인</button>
						    </c:otherwise>
						</c:choose>

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
		<!--마이페이지 LNB -->
		<ul class="my_lnb_ul">
		<li class="my_lnb_li1"><a href="/user/modify.oc?userId=${user.userId }">회원정보수정</a></li>
<!-- 			<li class="my_lnb_li3"><a href="/user/recipelist.oc">레시피</a></li>		 -->
			<li class="my_lnb_li4"><a href="/user/commentlist.oc">댓글관리</a></li>		
			<li class="my_lnb_li5"><a href="/cs/faqlist.oc">1:1문의관리</a></li>		
		
		</ul>
	<!--// LNB -->
	
	
	
		<div class="content">
		<form action="/user/modify.oc" method="POST">
			<input type="hidden" name="userId" 	     id="" value="${user.userId }">
			
					<h2>마이페이지</h2>
				<h4>회 원 정 보 수 정</h4>
				
				<table>
				<tr>
				<td><label for="">아이디 *</label></td>
				<td><span>${user.userId }</span></td>
				</tr>
				
				<tr>
				<td><label for="">비밀번호 *</label></td>
				<td><input type="password" name="userPw"  id="" value="${user.userPw }"></td>
				</tr>
				
				<tr>
				<td><label for="">비밀번호 재확인</label></td>
				<td><input type="password" name="userPwre" id=""></td>
				</tr>
				
				<tr>
				<td><label for="">이름 *</label></td>
				<td><span>${user.userName }</span></td>
				</tr>
				
				<tr>
				<td><label for="">닉네임 </label></td>
				<td><input type="text" name="userNick" id="" value="${user.userNick }"></td>
				</tr>
				
				<tr>
				<td><label for="">이메일</label></td>
				<td><input type="text" 		name="userEmail" 	 id="" value="${user.userEmail }"></td>
				</tr>
				<tr>
				<td><label for="">휴대폰번호</label></td>
				<td><input type="text" 		name="userPhone" 	 id="" value="${user.userPhone }"></td>
				</tr>
				<tr>
				<td><label for="">주소</label></td>
				<td><input type="text" 		name="userAddress" id="" value="${user.userAddress }"></td>
				</tr>
				</table>
				
			<div class="mdfbtn">
				<input type="reset" class="resetbtn" value="취소">
				<input type="submit" class="modifybtn" value="수정">
			</div>
			
			
					<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
			function execDaumPostcode() {
				new daum.Postcode({
			        oncomplete: function(data) {
			            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
			            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
			            console.log(data.autoJibunAddress + ", " + data.zonecode + ", " + data.buildingName);
			            document.querySelector("#memberAddr").value = data.address + ", " + data.zonecode + ", " + data.buildingName;
			        }
			    }).open();
			}
		</script>
		</form>
		</div>
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