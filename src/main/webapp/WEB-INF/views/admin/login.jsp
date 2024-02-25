<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

<style>


* {
  font-family: "Nanum Myeongjo", serif; "Nanum Gothic", sans-serif;
  font-weight: 500;
  font-style: normal;
  margin:0 auto;
	
  
}
body{
  background-color:#fff;
  border:40px solid #F6E7CF;
  width:95%;
  height:680px;
  float:left;}


.all_cont{
position:absolute;
left:45%;
top:90px;

}




input{
padding:7px;
background-color:#F6E7CF;
border:0px;
margin:8px;

	}

input::placeholder {color:#AB6840;
font-size:0.8em;
font-family:"Nanum Gothic", sans-serif;}
input::-webkit-input-placeholder {olor:#AB6840;
font-size:0.8em;
font-family:"Nanum Gothic", sans-serif;}
input:-ms-input-placeholder {olor:#AB6840;
font-size:0.8em;
font-family:"Nanum Gothic", sans-serif;}


h1{
margin-top:20%;
font-weight:600;	
color:#333;
margin-left:-5%;
}

.find_a{text-decoration:none;
color:#AB6840;	 
margin-top:130px;
font-size:0.7em;
}

.login_id{margin-top:80px; margin-left:-40px}
.login_pw{margin-left:-55px;}
.login_cont{
font-size:0.70em;
margin-left:-40px;}


.redirect{font-size:0.7em;
margin-left:-100px;
margin-top:-10px;}

.redirecturl{text-decoration:none;
color:#AB6840;	 
font-size:0.4em;
font-weight:500;
}

.bottom{padding-left:20px;}

.btn{color:#AB6840;
padding:7px 10px;
cursor:pointer;
font-weight:500;
margin-left:130px;
margin-top:20px;
}


</style>


</head>
<body>
	<!-- 로그인하면 바로 관리자 영역으로 넘어갈 예정 -->
	
	   <div class="all_cont">
	   	<div class="whtbox">
      <h1>원쿡 관리자 로그인</h1>
   	
      <form action="/admin/login.oc" method="post">
      	<div class="box">
         <p class="login_id">아이디 : <input type="text" name="userId" placeholder="아이디를 입력하세요"><br></p>	
         <p class="login_pw">비밀번호 : <input type="password" name="userPw"
            placeholder="비밀번호를 입력하세요"><br></p>
            <div class="bottom">
         <br> <a href="/user/findacnt.oc" class="find_a">아이디/비밀번호찾기</a><br>
         <p class="login_cont">이 페이지는 원쿡 관리자를 위한 페이지 입니다.<br><br></p>
         <p class="redirect">원쿡 사이트 이용 고객님께서는 <a href="#" class="redirecturl"> www.onecook.co.kr</a> 로 진입해 주세요<br>
         <br> <input type="submit" class="btn" value="로그인">
         </div>
         </div>
      </form>
      </div>
      </div>

</body>
</html>
