<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
      integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
      crossorigin="anonymous"
    />
<title>자주묻는 질문</title>

</head>
<body>
	<body>
    <form action="/cs/qna.oc" method="get">
    <h1>자주 묻는 질문</h1>
    
    <!--고객센터 LNB -->
		<ul class="cs_lnb_ul">
			<li class="cs_lnb_li1"><a href="/notice/list.oc">공지사항</a></li>			
			<li class="cs_lnb_li2"><a href="/cs/qna.oc">자주묻는 질문</a></li>		
			<li class="cs_lnb_li3"><a href="/cs/faq.oc">1:1 문의</a></li>		
			
		</ul>
<!--// LNB -->
    
    
    
    
    <div class="faq-container">
      <div class="faq">
        <h3 class="faq-title">레시피 댓글, 후기에 노출되는 이름 변경 안 되나요?</h3>

        <p class="faq-text">App 하단 [마이페이지>좌측 상단 닉네임 터치>우측 수정 터치]에서 변경 가능합니다. 
        이후, 변경된 닉네임으로 노출됩니다.
</p>

        <button class="faq-toggle">
          <i class="fas fa-chevron-down"></i>
          <i class="fas fa-times"></i>
        </button>
      </div>
      <div class="faq">
        <h3 class="faq-title">리뷰 수정/삭제는 안 되나요?</h3>

        <p class="faq-text">리뷰 수정 및 삭제는 처리가 어려우며, 요청 시 숨김 처리만 가능합니다.
1:1 문의하기/ 카카오톡 채널/ 고객센터(1833-8307)로 문의 부탁드립니다.</p>

        <button class="faq-toggle">
          <i class="fas fa-chevron-down"></i>
          <i class="fas fa-times"></i>
        </button>
      </div>
      <div class="faq">
        <h3 class="faq-title">회원탈퇴는 어떻게 하나요?</h3>

        <p class="faq-text">회원 탈퇴는 우리의 식탁 App [마이페이지 > 우측 상단 설정(톱니바퀴) > 맨 아래 회원 탈퇴] 에서만 가능합니다.</p>

        <button class="faq-toggle">
          <i class="fas fa-chevron-down"></i>
          <i class="fas fa-times"></i>
        </button>
      </div>
      <div class="faq">
        <h3 class="faq-title">자주 묻는 질문 4</h3>

        <p class="faq-text">대답 4</p>

        <button class="faq-toggle">
          <i class="fas fa-chevron-down"></i>
          <i class="fas fa-times"></i>
        </button>
<script>const toggles = document.querySelectorAll(".faq-toggle");

toggles.forEach((toggle) => {
  toggle.addEventListener("click", () => {
    toggle.parentNode.classList.toggle("active");
  });
});
</script>	
  
      
      
      </div>
    </div>
   </form> 
</body>
</html>