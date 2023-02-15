<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
       <%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
  <sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />	
</sec:authorize>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="/css/mypage.css">
  <link rel="shortcut icon" sizes="32x32" type="image/x-icon"
  href="/img/favicon_io/favicon-32x32.png">
  
</head>
<body>
<header>
	<%@ include file="../layout/header.jsp" %>
  </header>
  <div class="mypage">
    <div class="mypage-nav">
      <%@ include file="mypagenav.jsp" %>
    </div>
    
    
    
    <div class="mypage-container">
		<div class="userout">
          <h1>회원탈퇴 </h1>
          <hr>
          <br><br><br><br> 
          <h4>회원 탈퇴 안내</h4>
          <div class="outmessagebox">
            <div class="outmessagebox_text">
              <p>*사용하고 계신 아이디 (${principal.user.username}) 는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</p>
              <hr>
				<p>탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.</p>
				<br>
				<p>탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</p>
				<p>회원정보 및 메일, 블로그, 주소록 등 개인형 서비스 이용기록은 모두 삭제되며, <br>삭제된 데이터는 복구되지 않습니다.</p>
				<p>삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.</p>
            </div>
            
            <div class="outcheck">
              <input type="checkbox" id="outcheck"><span>안내사항을 모두 확인하였으며, 이에 동의합니다.</span><br>
              <input type="hidden" value="${principal.user.id }" id="hiddenuserid">
              <button id="userout-btn">확인</button>
              
            </div>
          </div>
      </div>
    </div>

  </div>
  
    <script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
  <script src="/js/user.js">  </script>
  <script src="/js/signup.js">  </script>
 
</body>
</html>