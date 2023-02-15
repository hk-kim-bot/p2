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
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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
		<div class="likelist-container">
		<h1>찜 리스트</h1>
		<hr>
		<div class="likelist-page">
		
		<c:forEach var="house" items="${houses.content}">
         <!-- home시작 -->
         
          <div class="likehouse">
	          <div id="likehouse-img">
				 <img src="/image/ex6.jpg" alt="">
	          </div>


	          <div class="home__info">
	            <div class="info1"><span>${house.addr }</span>
	            	 			<img src="/image/heart_after.png" onclick="unlike(${house.id})">
	             </div>
	            <div class="info2"><a href="">${house.title }</a></div>
	            <div class="info3">
	              <span class="star">☆☆☆☆☆</span>
	              <span class="count">${house.reviewcount }</span>
	              <span class="type">호스트</span>
	            </div>
	            <div class="info4" style="font-size: 15px; margin-top: 3px; font-weight: bold;">${house.fare}/박</div>
	
	          </div>
        </div>
        
        <!-- home 끝 -->
        </c:forEach>
           <nav aria-label="Page navigation example" style=" position: absolute; bottom: 0; left: 35%;">
  <ul class="pagination">
  <c:choose>
	<c:when test="${houses.first}">
		<li class="page-item disabled">
	      <a class="page-link" href="?page=${houses.number-1}" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	        <span class="sr-only">Previous</span>
	      </a>
    	</li>
	</c:when>
	<c:otherwise>
	    <li class="page-item">
	      <a class="page-link" href="?page=${houses.number-1}" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	        <span class="sr-only">Previous</span>
	        
	      </a>
	      
	    </li>
	</c:otherwise>
  </c:choose>
<c:choose>
	<c:when test="${houses.last}">
		 <li class="page-item disabled">
      <a class="page-link" href="?page=${houses.number+1}" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
        <span class="sr-only">Next</span>
      </a>
    </li>
	</c:when>
	<c:otherwise>
	     <li class="page-item">
      <a class="page-link" href="?page=${houses.number+1}" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
        <span class="sr-only">Next</span>
      </a>
    </li>
	</c:otherwise>
  </c:choose>
   
  </ul>
</nav>
		</div>
		
		</div>
    </div>

  </div>
 <script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
  <script src="/js/like.js"></script>
</body>
</html>