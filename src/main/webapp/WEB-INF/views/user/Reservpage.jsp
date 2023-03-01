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
		<div class="reserv-contents">
			<table>
				<tr>
					<th>
					
					</th>
					<th>
						하우스
					</th>
					<th> 
						예약기간
					</th>
					<th>
						경과
					</th>
				</tr>
				<c:forEach var="reserv" items="${ reservs.content}">
					<tr>
						<td>
						</td>
						<td>${reserv.house.title }
						</td>
						<td>${reserv.checkIn }~${reserv.checkOut }
						</td>
						<td>${reserv.reservtype }
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
    </div>

  </div>

  
</body>
</html>