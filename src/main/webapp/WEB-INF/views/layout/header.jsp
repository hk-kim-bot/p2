<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
      <%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
   <sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />	
</sec:authorize>
<!DOCTYPE html>
<link rel="stylesheet" href="/css/header.css">

 <div class="header">
    <div class="header-logo">
      <img src="/img/logo-no-background.svg" alt="logo" onclick="javascript:location.href='/';"style="cursor:pointer">
     
    </div>
    <div class="header-nav">
      <li><a href="/">Home</a></li>
      <li><a href="/product/main">Service</a></li>
       <c:choose>
        	
        	<c:when test="${principal ne null}">
        				<li><a href="/user/mypage">Mypage</a></li>
        				<li><a href="/logout">Logout</a></li>
        			
        	</c:when>
        	
        	<c:otherwise>
 	 			 <li><a href="/auth/loginForm">Login</a></li>
        	</c:otherwise>
        </c:choose>
      
    </div>
   </div>