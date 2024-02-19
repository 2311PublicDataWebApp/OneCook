<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="../resources/css/mycs.css">
</head>
<body>
<h1>회원가입</h1>

		<form action="/register" method="post">

				<h3>원쿡 회원가입</h3>
				<ul>
					<li>
						<label for="">아이디 *</label>
						<input type="text" name="userId" id="">
						<button>중복확인</button>
					</li>
					<li>
						<label for="">비밀번호 *</label>
						<input type="password" name="userPw" id="">
					</li>
					<li>
						<label for="">비밀번호 확인 *</label>
						<input type="password" name="userPwre" id="">
					</li>
						<button>중복확인</button>
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
						<input type="text" name="userAddress" id="userAddr" size="50">
						<input type="button" onclick="execDaumPostcode();" value="우편번호 찾기">
						<input type="text" name="userAddress2" id="userAddr2" size="100">					
					</li>
	
				</ul>

			
			<div>
				<input type="submit" value="가입">
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
   <input type="reset" value="이전으로">
   <input type="submit" value="가입하기">
            
            
 </form>           
</body>
</html>