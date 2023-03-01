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
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="/css/index.css">
    <link rel="stylesheet" href="/css/footer.css">
    <link rel="shortcut icon" sizes="32x32" type="image/x-icon"
  href="/img/favicon_io/favicon-32x32.png">
    
    <title>title</title>
    
  </head>
  <body>
   <header>
	<%@ include file="layout/header.jsp" %>
  </header>
    
    <div class="index-wrapper">
      <div class="index_page">
        <p class="index_pagetext">새로운 환경<br>&nbsp&nbsp새로운 시작
        
        </p>
        
        
      </div>
      <div class="index_page">
        <p class="index_pagetext">여행은 정신을<br>&nbsp&nbsp 다시 젊어지게 하는 샘이다 <br> <i style="font-size:medium;">- 안데르센 -</i>  </p>
      </div>
      <div class="index_page">
        <p class="index_pagetext">낯선 땅이란 없다.<br>&nbsp&nbsp 단지, 그 여행자만 낯설 뿐이다. <br><i style="font-size:medium;">- 로버트 루이스 스티븐슨 -</i> </p>
      </div>
      <div class="index_page">
        <p class="index_pagetext" style="color:gray;">여행은 사람을 순수하게 <br>그러나 강하게 만든다.</p>
      </div>
      <div class="index_page">
        <div class="index_page_btn">
          <div class="index_page_btn_a"><a href="/product/main">상품보러가기</a></div>
          <c:choose>
	        	<c:when test="${principal.user.roles == 'guest' }">	
			     	<div class="index_page_btn_a">   
			     	 <a  onclick="guestclick()" id="upload-btn-tag">상품등록하기</a>
			    	</div>
	        	</c:when>
	        	<c:when test="${principal.user.roles == 'host' }">
	        		<div class="index_page_btn_a">   
			     	 <a  href="/auth/bcah" id="upload-btn-tag">상품등록하기</a>
		
			    	</div>
	        	</c:when>
				<c:otherwise>
					<div class="index_page_btn_a">
						<a href="/auth/loginForm">상품등록하기</a>
					</div>
				</c:otherwise>
	 		</c:choose>
          <div class="index_page_btn_a"><a href="">이용안내</a></div>

        </div>
      </div>
    </div>
    <%@ include file="layout/footer.jsp" %>
    <script>
      let opt = new IntersectionObserver((e)=>{
        e.forEach((박스)=>{
          if(박스.isIntersecting){
             박스.target.style.opacity=1;
             박스.target.style.animation='up 1s';
          }else{
            박스.target.style.opacity=0;
            박스.target.style.animation='none';
          }
        })
      })
      let p = document.querySelectorAll(".index_pagetext");
      opt.observe(p[0])
      opt.observe(p[1])
      opt.observe(p[2])
      opt.observe(p[3])
    </script>
    <script type="text/javascript" src="/js/authchecking.js"></script>
  </body>
</html>
