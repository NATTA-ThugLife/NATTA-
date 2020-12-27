<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<link href="resources/images/tugcat.png" rel="shortcut icon">
<meta charset="UTF-8">
<title>NATTA ArtistList</title>
<style>
	.Fabout {
	  background: url("resources/assets/img/nattaBack/infoPage.jpg") center center;
	  background-size: cover;
	  position: relative;
	  padding: 80px 0;
	}
 	.Fabout:before {
	  content: "";
	  background: rgba(0, 0, 0, 0.8);
	  position: absolute;
	  bottom: 0;
	  top: 0;
	  left: 0;
	  right: 0;
	}
.workhover { color : white; }
.workhover:hover { color : #cda45e; }
</style>
</head>
<body>
	<header>
		<jsp:include page="../common/headerNone.jsp"/>
	</header>

	<br><br>

	<section id="testimonials" class="Fabout testimonials section-bg">
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
	          <div class="testimonial-item" style="display:inline-block;">
	            <p style="width:300px;">Artist Shop<br>
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
	          	  Follow : ${ artist.count }
	          	  <!-- 팔로우 일단은 .. 있어보이기 위해 강제로 + 해드렸음  -->
	            </c:if>
	          </div>
		</c:forEach>
	</c:if>
	<c:if test="${ empty aList }">
		<h1 style="color:white;">등록된 아티스트가 없습니다.</h1>
	</c:if>
        </div>
       <!-- 페이징 시작 -->
		<div data-aos="fade-up" style="text-align: center; font-size: 25px;">
								<!-- 이전 --> 
					<c:if test="${pi.currentPage <= 1 }">
						< &nbsp;
					</c:if> 
					<c:if test="${pi.currentPage >1 }">
						<c:url var="before" value="artistList.na">
							<c:param name="page" value="${pi.currentPage -1 }"></c:param>
						</c:url>
						<a class="workhover" href="${before }"> < &nbsp; </a>
						</c:if>
						 <!-- 페이지 --> 
						<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
							<c:url var="pagination" value="artistList.na">
								<c:param name="page" value="${p }"/>
							</c:url>
							<c:if test="${p eq pi.currentPage }">
								<font color="#cda45e" style="text-decoration:underline;">${ p }</font>
							</c:if>
							<c:if test="${p ne pi.currentPage }">
								<a class="workhover" href="${ pagination }">${ p }</a>
							</c:if>
						</c:forEach> 
						<!-- 다음 --> 
						<c:if test="${pi.currentPage >= pi.maxPage }">
							&nbsp; > 
						</c:if>
						 <c:if test="${pi.currentPage < pi.maxPage }">
							<c:url var="after" value="artistList.na">
								<c:param name="page" value="${pi.currentPage + 1 }"/>
							</c:url>
							<a class="workhover" href="${after }"> &nbsp; > </a>&nbsp;
						 </c:if>
			
		</div>	        
    </section>
	<footer>
		 <jsp:include page="../common/InfoFooter.jsp"/>  	 
  	</footer>
</body>
</html>