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
  <title>Sharehouse</title>

   <link rel="shortcut icon" sizes="32x32" type="image/x-icon"
  href="/img/favicon_io/favicon-32x32.png">
  <link rel="stylesheet" href="/css/test.css">

  <link rel="stylesheet" href="/css/qna.css"/>
  <link rel="stylesheet" href="/css/animation.css">
  <link rel="stylesheet" href="/css/searchProduct.css">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
   
  <!-- 달력  -->

  <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
  <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>

  <!-- price 범위 -->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
 

</head>
<body>
  <header>
	<%@ include file="../layout/header.jsp" %>
  </header>

  <section id="main">

  


  <div onclick="searchBack()">
    <section id="search2">
      <div class="search2_info">
        <div class="destination">
          <spna class="search2_info_main">여행지</spna><br><input type="text" id="destination" placeholder="여행지 검색">
        </div>

        <div class="checkIn">
          <button id="checkIn"><spna class="search2_info_main">체크인&emsp;&emsp;&emsp;&emsp;체크아웃</spna><br></button>
            <span class="search2_info_sub">

	        <div id="calinder">
	          <div class="container_1 px-1 px-sm-5 mx-auto">
	            <form autocomplete="off">
	              <div class="flex-row d-flex justify-content-center">
	                <div class="col-xl-5 col-lg-6 col-11 px-1">
	                  <div class="input-group input-daterange">
	                    <label class=""></label>
	                    <input type="text" name="daterange" class="input" readonly />
	                  </div>
	                </div>
	              </div>
	            </form>
	          </div>
	        </div>
            </span>

        </div>

        <div class="person">
          <button id="checkOut"><spna class="search2_info_main">여행자</spna><br><span class="search2_info_sub">게스트추가</span></button>
        </div>
        <div id="searchExecution">
        <button type="submit">검색</button>
         
        </div>
      </div>
    </section>
  </div>

  <div id="container">

    <section id="filter">
       <form action="" id="filter_info">
        필터링 기준

        <div id="home_type">
          <h4>숙소 유형</h4>
          <input type="checkbox" name="hometype" id="hometypeentire"value="entire"><label for="hometypeentire">공간전체</label><br>
          <input type="checkbox" name="hometype" id="hometypeasingle"value="privateRoom"><label for="hometypeasingle">개인실</label><br>
          <input type="checkbox" name="hometype" id="hometypeshared"value="publicRoom"><label for="hometypeshared">다인실</label>
        </div>  
      
        <div id="home_bad">
          <h4>침실 수</h4>
          <input type="checkbox" name="homeBed" id="homeBad1"value="1"><label for="homeBad1">1</label><br>
          <input type="checkbox" name="homeBed" id="homeBad2"value="2"><label for="homeBad2">2</label><br>
          <input type="checkbox" name="homeBed" id="homeBad3"value="3"><label for="homeBad3">3</label><br>
          <input type="checkbox" name="homeBed" id="homeBad4"value="4"><label for="homeBad4">4+</label>
        </div>  
		
        <div id="home_type2">
          <h4>건물 유형</h4>
         <label> <input type="checkbox" name="homeType2" value="housing"> 단독 또는 다세대 주택</label><br>
          <label><input type="checkbox" name="homeType2" value="apartment"> 아파트</label><br>
          <label><input type="checkbox" name="homeType2" value="hotel"> 호텔</label><br>
          <label><input type="checkbox" name="homeType2" value="separate"> 게스트용 별채</label>
        </div>

        <div id="home_Facilities">
          <h4>편의 시설</h4>
         <label><input type="checkbox" name="homeFacilities"value="wifi,"> 무선 인터넷</label><br>
          <label><input type="checkbox" name="homeFacilities"value="kitchen,"> 주방</label><br>
          <label><input type="checkbox" name="homeFacilities"value="washer,"> 세탁기 및 건조기</label><br>
          <label><input type="checkbox" name="homeFacilities"value="free-p,"> 무료 주차 공간</label><br>
          <label><input type="checkbox" name="homeFacilities"value="a/c,"> 에어컨</label><br>
          <label><input type="checkbox" name="homeFacilities"value="pool"> 수영장</label><br>
        </div>

        <div id="home_grade">
	      <a href="" id="productfilter">검색</a><br>
       	
        </div>
        
      </form>
      <a id="filterreset" href="/product/main">모두보기</a>
      
    </section>


    <section id="house">

      <div class="home__box">

        
          <!--<div class="home__img"><img src="img/ex.jpg" width="330px" height="280px"></div>
          -->
          
          <!-- home시작 
          <div class="home">
            
          <div id="slideShow">
            <ul class="slides">
			  <li><img src="/image/ex6.jpg" alt=""></li>
              <li><img src="/image/ex7.jpg" alt=""></li>
              <li><img src="/image/ex8.jpg" alt=""></li>
              <li><img src="/image/ex6.jpg" alt=""></li>
            </ul>  
            <p class="controller">
               &lang: 왼쪽 방향 화살표
              &rang: 오른쪽 방향 화살표 
              <span class="prev">&lang;</span>  
              <span class="next">&rang;</span>
            </p>
          </div>


          <div class="home__info">
            <div class="info1">Busan 
            
            	<img src="/image/heart_before.png">
            
            </div>
            <div class="info2">해운대</div>
            <div class="info3">
              <span class="star">★★★★★</span>
              <span class="count">185</span>
              <span class="type">슈퍼호스트</span>
            </div>
            <div calss="info4" style="font-size: 15px; margin-top: 3px; font-weight: bold;">￦140,000/박</div>

          </div>
        </div>
        home 끝 -->
        <!-- foreach 시작 -->
        
        <c:forEach var="house" items="${houses.content}">
         <!-- home시작 -->
         
          <div class="home">
            
          <div id="slideShow">
            <ul class="slides">
			  <li><img src="/auth/img?imgPath=${house.img1}" alt=""></li>
         
            </ul>  
         
          </div>


          <div class="home__info">
            <div class="info1">${house.addr }
            
            <c:choose>
            	<c:when test="${principal eq null }">
	             	<img src="/image/heart_before.png" onclick="loginproc()">
	             	
            	</c:when>
            	<c:otherwise>
            		<c:set value="unlike" var="likebtn"/> 
            		
            		<c:forEach var="like" items="${houselike}">
            			<c:if test="${like.houseid ==house.id }">
            				<c:set value="like" var="likebtn"/> 
            			</c:if>	
            		</c:forEach>
            	 		<c:if test="${likebtn =='like' }">
            	 			<img src="/image/heart_after.png" onclick="unlike(${house.id})">
            	 			
            	 		</c:if>
            	 		<c:if test="${likebtn =='unlike' }">
            	 			<img src="/image/heart_before.png" onclick="like(${house.id})">
            	 			
            	 		</c:if>
            	</c:otherwise>
            </c:choose>
             </div>
            <div class="info2"><a href="/detail/${house.id }">${house.title }</a></div>
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
      </div>
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
  	<c:when test="${houses.first}">
  		<li class="page-item active"><span class="page-link">1<span class="sr-only">(current)</span>
      	</span></li>
    	<li class="page-item">
      	<a class="page-link" href="?page=1">2</a>
    	</li>
    	<li class="page-item"><a class="page-link" href="?page=2">3</a></li>	
  	</c:when>
  	<c:when test="${houses.number==1 }">
  		<li class="page-item "><a class="page-link" href="?page=0">1</a></li>
    	<li class="page-item active">
    	<span class="page-link">2<span class="sr-only">(current)</span>
      	</span>
    	</li>
    	<li class="page-item"><a class="page-link" href="?page=2">3</a></li>	
  	</c:when>
  	<c:when test="${houses.last}">
  		<li class="page-item">
  		<a class="page-link" href="?page=${houses.number-2 }">${houses.number-1 }</a>
  		</li>
    	<li class="page-item">
      	<a class="page-link" href="?page=${houses.number-1 }">${houses.number }</a>
    	</li>
    	<li class="page-item active"><span class="page-link">${houses.number+1 }<span class="sr-only">(current)</span>
      	</span></li>	
  	</c:when>
  	<c:otherwise>
  		 <li class="page-item"><a class="page-link" href="?page=${houses.number }">${houses.number }</a></li>
    	<li class="page-item active">
      	<span class="page-link">
       	 ${houses.number+1 }
        <span class="sr-only">(current)</span>
     	 </span>
    	</li>
    	<li class="page-item"><a class="page-link" href="?page=${houses.number+2 }">${houses.number+2 }</a></li>
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
      
    </section>
    <c:choose>
        	<c:when test="${principal.user.roles == 'guest' }">	
		     	<div class="upload-btn">   
		     	 <a  onclick="guestclick()" id="upload-btn-tag" title="상품 등록"></a>
		     
		    	</div>
        	</c:when>
        	<c:when test="${principal.user.roles == 'host' }">
        		<div class="upload-btn">   
		     	 <a  href="/auth/bcah" id="upload-btn-tag" title="상품 등록"></a>
	
		    	</div>
        	</c:when>
 	</c:choose>
	
  </div>
</section>
<footer>
<%@ include file="../layout/footer.jsp" %>

</footer>

  





  
  <script src="/js/search.js"></script>
  <script src="/js/productfilter.js"></script>
  <script src="/js/authchecking.js"></script>
  <script src="/js/like.js"></script>
</body>
</html>