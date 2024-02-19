<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>Login</title>
      <link rel="stylesheet" href="../resources/css/mycs.css">
   </head>
   <body>
      <h1>원쿡 로그인</h1>
   
      <form action="/login" method="post">
         아이디 : <input type="text" name="userId" placeholder="아이디를 입력해주세요"><br>
         비밀번호 : <input type="password" name="userPw"
            placeholder="비밀번호를 입력해주세요"><br>
         <br> <a href="/find">아이디/비밀번호찾기</a><br>
         <p>아직 회원이 아니신가요?</p>
         <a href="/register">회원가입</a><br>
         <br> <input type="submit" value="로그인">
      </form>
   </body>
</html>