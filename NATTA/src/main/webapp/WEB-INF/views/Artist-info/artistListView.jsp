<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NATTA @ ArtistList</title>
</head>
<body>
	<header>
		<jsp:include page="../common/headerNone.jsp"/>
	</header>
	<br><br><br><br><br><br>
<!-- 	    <section id="about" class="about">
      <div class="container" data-aos="fade-up">  css 파일 about section-bg-->
	<section id="testimonials" class="about testimonials section-bg">
      <div class="container" data-aos="fade-up">
        <div class="section-title">
          <h2>All</h2>
          <p>Artist List</p>
        </div>
	<c:if test="${ !empty aList }">
		<c:forEach items="${ aList }" var="artist">
			   <c:url var="artistInfoPage" value="artistInfoPage.na">
			   		<c:param name="artistId" value="${ artist.artistId }"/>
			   </c:url>
	          <div class="testimonial-item" style="float:left;">
	            <p style="width:300px;">Artist Name<br>
	              <i class="bx bxs-quote-alt-left quote-icon-left"></i>
	             	 <a href="${ artistInfoPage }">${ artist.name }</a>
	             	 
	              <i class="bx bxs-quote-alt-right quote-icon-right"></i>
	            </p>
	            <c:if test="${ artist.myReProfile eq null }">
	              <img src="resources/artistInfoFile/Profile/NATTAprofile.png" style="width:80px; height:80px;" class="testimonial-img" alt="">
	              Follow : ${ artist.count }  
	            </c:if>
	            <c:if test="${ artist.myReProfile ne null }">
	          	  <img src="resources/artistInfoFile/Profile/${ artist.myReProfile }" style="width:80px; height:80px;" class="testimonial-img" alt="">
	          	  Follow : ${ artist.count+9291 }
	            </c:if>
	          </div>
		</c:forEach>
	</c:if>
	<c:if test="${ empty aList }">
		<h1 style="color:white;">등록된 아티스트가 없습니다.</h1>
	</c:if>
        </div>

    </section><!-- End Testimonials Section -->
	
<%-- 	<c:forEach items="${ aList }" var="artist">
		   <c:url var="artistInfoPage" value="artistInfoPage.na">
		   		<c:param name="artistId" value="${ artist.artistId }"/>
		   </c:url>
		<div class="col-lg-6 menu-item filter-starters">
		   <img src="resources/artistProfile/${ artist.myReProfile }" class="menu-img" alt=""> 
		   <div class="menu-content">
		     <a href="${ artistInfoPage }">${ artist.name }</a>
		   </div>
		   <div class="menu-ingredients">
		       Tatto Artist
		   </div>
		 </div>	
	</c:forEach> --%>
	<footer>
		 <jsp:include page="../common/footer.jsp"/>  	 
  	</footer>
</body>
</html>