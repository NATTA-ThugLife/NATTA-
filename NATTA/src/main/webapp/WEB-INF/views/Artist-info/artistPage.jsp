<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>NATTA!</title>
  <meta content="" name="descriptison">
  <meta content="" name="keywords">
  <link href="resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
  <script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
<style>
	header { height: 215px; }	
	#header { height: 175px; }
	.artistPriceTable th { border-bottom : 0.01px solid dimgrey; width:800px; padding: 10px; }
	.artistPriceTable td { padding: 20px; width:800px;  }
	.artistPriceTable {border-spacing:10px; border-top : 0.6px solid #cda45e; border-bottom : 0.6px solid #cda45e; text-align : center;}
	.artistPriceTable td:hover { color : #cda45e; }
 </style>
</head>
<body>
<header>
	<div id="header" class="fixed-top">
  <!-- ======= Top Bar ======= topBar 원래 header였음 fixed고정이라 영역 변경 12.10 0141AM--> 
  <div id="topbar" class="d-flex align-items-center fixed-top">
    <div class="container d-flex">
      <div class="contact-info mr-auto">
        <i class="icofont-phone"></i> ${ artist.phone }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <span class="d-none d-lg-inline-block"><i class="icofont-clock-time icofont-rotate-180"></i> Mon-Sat: 11:00 AM - 23:00 PM</span>
      </div>
      <div class="languages">
        <ul>
	        <!--로그인 세션 비어있을 때 -->
			<c:if test="${empty sessionScope.loginCustomer && empty sessionScope.loginArtist  }">
				<li><a href="/login.na">LOGIN</a></li>
				<li><a href="/joinOption.na">SIGNUP</a></li>
			</c:if>
			<!-- 회원 로그인시 -->
			<c:if test="${!empty sessionScope.loginCustomer }">
				<li>${loginCustomer.customerName }님 환영합니다.</li>
				<li><a href="#">MyPage&nbsp;&nbsp;</a></li>
				<li><a href="/customerLogout.na">LogOut</a></li>
			</c:if>
			<!-- 아티스트 로그인시 -->
			<c:if test="${!empty sessionScope.loginArtist }">
			<c:url var="artistInfoPage" value="artistInfoPage.na">
			 	 <c:param name="artistId" value="${ loginArtist.artistId }"/>
			</c:url>			
				<li>${loginArtist.artistName }님 환영합니다.</li>
				<li><a href="${ artistInfoPage }">ArtistMyPage&nbsp;&nbsp;</a></li>
				<li><a href="artistLogout.na">LogOut</a></li>						
			</c:if>
        </ul>
      </div>
    </div>
  </div>

  <!-- ======= Header ======= -->
    <div class="container d-flex align-items-center">
      <h1 class="logo mr-auto"><a href="main.na">NATTA!</a></h1>
      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li class="active"> <a href="main.na">Home</a></li>
          <li></li>
          <li></li>
          <li><a href="#menu">ARTIST</a></li>
          <li></li>
          <li></li>
          <li><a href="#" style="text-align: center">Customized<br>Tatto</a></li>
          <li></li>
          <li></li>
          <li><a href="#">NOTICE</a></li>
          <li></li>
          <li></li>
          <li><a href="#">Q&A</a></li>
        </ul>
      </nav><!-- .nav-menu -->
    </div>
    	<!-- 아티스트 프로필 헤더! -->
       <div class="profile container d-flex align-items-center" style="margin-top:10px;">
       
       <c:if test="${ artistInfo.myReProfile eq null }">
		<img src="resources/artistInfoFile/Profile/NATTAprofile.png" alt="" class="img-fluid rounded-circle" 
	     style="margin-left: 15px auto; display: block; width: 100px; height:100px; border: 8px solid #2c2f3f;">  
	  	<nav class="nav-menu d-none d-lg-block" data-aos="fade-in">
	        <h4 class="text-light" style="margin-left:25px;">타투숍 이름이 없습니다.</h4>
	  	    <button type="button" class="mobile-nav-toggle d-xl-none"><i class="icofont-navigation-menu"></i></button>    
	       	<!-- 아티스트 프로필 메뉴바 -->
	       	
	        <ul style="list-style : none;">
	        <c:if test="${ artistPageId eq loginArtist.artistId }">
	          	<li class="active"><a href="#" data-toggle="modal" id="insertInfo"><i class="bx bx-home"></i><span> 타투숍 소개</span></a></li>
	          	<li><a href="javascript:void(0);" data-toggle="modal" id="artistInfoWork"><i class="bx bx-book-content"></i> 내 작품등록하기</a></li>
	          	<li><a href="#modalArtistPrice" data-toggle="modal" id="artistInfoPrice"><i class="bx bx-file-blank"></i><span> 스타일별 가격</span></a></li>
			</c:if>     	
	        	<li><a href="reservation.na?artistId=${ artistInfo.artistId }"><i class="icofont-calendar"></i> Reservation</a></li>
	          	<li><a href="#resume"><i class="bx bx-user"></i><span>Resume</span></a></li>
	          	<li><a href="#contact"><i class="bx bx-envelope"></i> Contact</a></li>
	        </ul>            
        </nav><!-- .nav-menu -->	      		       
       </c:if>
       
       <c:if test="${ artistInfo.myReProfile ne null }">
	   <img src="resources/artistInfoFile/Profile/${ artistInfo.myReProfile }" alt="" class="img-fluid rounded-circle" 
	       style="margin-left: 15px auto; display: block; width: 100px; height:100px; border: 8px solid #2c2f3f;">
		<nav class="nav-menu d-none d-lg-block" data-aos="fade-in">
	      <h4 class="text-light" style="margin-left:25px;">${ artistInfo.name }</h4>
		  <button type="button" class="mobile-nav-toggle d-xl-none"><i class="icofont-navigation-menu"></i></button>    
       	<!-- 아티스트 프로필 메뉴바 -->
        <ul style="list-style : none;">
        <c:if test="${ artistPageId eq loginArtist.artistId }">
          	<li class="active"><a href="#" data-toggle="modal" id="insertInfo"><i class="bx bx-home"></i><span> 타투숍 소개</span></a></li>
          	<li><a href="javascript:void(0);" data-toggle="modal" id="artistInfoWork"><i class="bx bx-book-content"></i> 내 작품등록하기</a></li>
          	<li><a href="#modalArtistPrice" data-toggle="modal" id="artistInfoPrice"><i class="bx bx-file-blank"></i><span> 스타일별 가격</span></a></li>
		</c:if>     	
        	<li><a href="reservation.na?artistId=${artistInfo.artistId }"><i class="icofont-calendar"></i> Reservation</a></li>
          	<li><a href="#resume"><i class="bx bx-user"></i><span>Resume</span></a></li>
          	<c:if test="${ artistPageId eq loginArtist.artistId }">
          	<li><a href="/chatting.na"><i class="bx bx-envelope"></i> My Message</a></li>
          	</c:if>
          	<c:if test="${ artistPageId ne loginArtist.artistId }">
          	<li><a href="/chatting.na?artistId=${artistPageId }"><i class="bx bx-envelope"></i> Contact</a></li>
          	</c:if>
          	
          	<!-- javascript:void(0); 꽉 찬 하트 fas-->
          	<c:if test="${follow ne null }">
          		<li id="sibar"><a href="#" onclick="deleteFollowing();" id="clickChange"><i class="fas fa-heart" id="followCheck"></i>Follow</a></li>
          	</c:if>
          	<c:if test="${follow eq null }">
          		<li id="sibar"><a href="#" onclick="insertFollowing();" id="clickChange"><i class="far fa-heart" id="followCheck"></i>Follow</a></li>
          	</c:if>
        </ul>            
        </nav><!-- .nav-menu -->
        </c:if>
      </div>      
  </div>
</header>  
												<!--=========== 헤더 끝  ============-->   
												<!--=============섹션 시작=============  -->
    
    <!--============ 아티스트 소개 섹션 ==========  -->
    <section id="about" class="about">
      <div class="container" data-aos="fade-up">

        <div class="row">
          <div class="col-lg-6 order-1 order-lg-2" data-aos="zoom-in" data-aos-delay="100">
            <div class="about-img">
              <c:if test="${ artistInfo.myReProfile eq null }">
	 	     	<img src="resources/artistInfoFile/Profile/NATTAprofile.png" alt="" style="width: 540px; height:403px;">              
              </c:if>
              <c:if test="${ artistInfo.myReProfile ne null }">
              	<img src="resources/artistInfoFile/Profile/${ artistInfo.myReProfile }" alt="" style="width: 540px; height:403px;">
              </c:if>
            </div>
          </div>
          <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content">
            <h3>Artist Self Introduction </h3>
            <p class="font-italic">
				name ${ artistInfo.name }
            </p>
            <ul>
              <li><i class="icofont-check-circled"></i> 아티스트의 작품을 보고, 마음에 드는 작품을 예약하세요 !  </li>
              <li><i class="icofont-check-circled"></i> 자신만의 원하는 도안을 아티스트에게 문의하세요 !</li>
              <li><i class="icofont-check-circled"></i> 아티스트에게 솔직한 후기를 남겨주세요 !</li>
            </ul>
            <p>
          		${ artistInfo.myInfo }
            </p>
          </div>
        </div>
      </div>
    </section>
    <!--============ 아티스트 소개 섹션 끝 ==========  -->
	
  


    
    
  

    <!-- ======= 아티스트 작품 섹션 ======= -->
    <section id="events" class="events">
	   <div id="chefs" class="chefs">
	      <div class="container" data-aos="fade-up">
	        <div class="section-title">
	          <h2>Work</h2>
	          <p>아티스트 포트폴리오</p>
	        </div>
			
	        <div class="row">
	        <c:if test="${ workList ne null }">
				<c:forEach items="${ workList }" var="aWork">
		          <div class="col-lg-4 col-md-6">
		            <div class="member" data-aos="zoom-in" data-aos-delay="100">
		              <img src="resources/artistInfoFile/WorkFile/${ aWork.workReImgPath }"
		               class="img-fluid" alt="잉? 왜없을까?" style="width:400px; height:350px;">
		              <div class="member-info">
		                <div class="member-info-content">
		                  <h5>${ aWork.workStyle }</h5>
		                  <span>${ artistInfo.name }</span>
		                </div>
		                <div class="social">
		                  <!-- <a href=""><i class="icofont-twitter"></i></a>
		                  <a href=""><i class="icofont-facebook"></i></a>
		                  <a href=""><i class="icofont-instagram"></i></a> -->
		                  <a href="#" onclick="return confirm('예약하시겠습니까 ?')"><i class="icofont-basket"></i></a>
		                  <a href="resources/artistInfoFile/WorkFile/${ aWork.workReImgPath }" class="venobox" data-gall="gallery-item"><i class="icofont-camera"></i></a>
		                  
		                  <c:url var="workDelete" value="deleteArtistWork.na">
							<c:param name="workCode" value="${ aWork.workCode }"/>
		                  	<c:param name="workImgPath" value="${ aWork.workImgPath }"/>
		                  	<c:param name="workReImgPath" value="${ aWork.workReImgPath }"/>
		                  	<c:param name="artistId" value="${ aWork.artistId }"/>
		                  </c:url>
		                  
		                  <c:if test="${ artistPageId eq loginArtist.artistId }">
		                 	<a href="#" data-toggle="modal"><i class="icofont-spanner updateWork" id="${ aWork.workCode }"></i></a>
		                  	<a href="${ workDelete }" onclick="return confirm('정말로 작품을 삭제하시겠습니까 ?');"><i class="icofont-bin"></i></a>
		                  	
		                  </c:if>
		                </div>
		              </div>
		            </div>
		          </div>
			   	</c:forEach>		
			   </c:if>
			   <c:if test="${ workList eq null }">
			  		<h3>등록된 작품이 없습니다.</h3>
			   </c:if>
	        </div>
	      </div>
	    </div>
	</section>
	<!-- ======= 아티스트 작품 섹션 끝 ======= -->
	<!-- 견적 표 -->
     <section id="testimonials" class="testimonials section-bg">
      <div class="container" data-aos="fade-up">
        <div class="section-title">
          <h2>Price</h2>
          <p>타투 견적</p>
        </div>
 		<div class="artistPriceTable">
			<table>
				<thead>
					<tr>
						<th>Style</th><th>38 x 38 </th>
						<th>38 x 64</th><th>65 x 76</th>
						<th>102 x 127 (A6)</th><th>152 x 152</th>
						<th>203 x 152 (A5)</th><th>210 x 297 (A4)</th>
						<td>mm/원</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ priceList }" var="pList">
						<tr>
							<td>${ pList.pStyle } </td>
							<td><fmt:formatNumber value="${ pList.pSize1 }"/></td>
							<td><fmt:formatNumber value="${ pList.pSize2 }"/></td>
							<td><fmt:formatNumber value="${ pList.pSize3 }"/></td>
							<td><fmt:formatNumber value="${ pList.pSize4 }"/></td>
							<td><fmt:formatNumber value="${ pList.pSize5 }"/></td>
							<td><fmt:formatNumber value="${ pList.pSize6 }"/></td>
							<td><fmt:formatNumber value="${ pList.pSize7 }"/></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>			
     </div>
     </section>	
	
	
	
	
	
	

  <!-- ======= 후기 섹션 ======= -->
     <section id="testimonials" class="testimonials section-bg">
     
      <div class="container" data-aos="fade-up">
        <div class="section-title">
          <h2>후 기</h2>
          <p>${ artistInfo.name } 님의 타투는 어땠나요 ?</p>
        </div>
		

          <div class="testimonial-item">
            <p>		
               <img src="resources/artistInfoFile/WorkFile/20201214184858.png" class="img-fluid" alt="잉? 왜없을까?" style="width:50px; height:50px;">
            <a href="resources/artistInfoFile/WorkFile/20201214184858.png" class="venobox" data-gall="gallery-item"><i class="icofont-linkedin"></i></a>
            <br>
              <i class="bx bxs-quote-alt-left quote-icon-left"></i>
             	와우와우와우와우와우와우와우와우와우와우와우와우와우와우와우와우와우와우와우와우와우와우와우와우와우와우와우와우와우와우와우와우와우와우와우와우와우와우와우와우와우와우와우와우와우와우와우와우와우와우
             	와우와우와우와우와우와우와우와우와우와우와우와우와우와우와우와우와우와우
              <i class="bx bxs-quote-alt-right quote-icon-right"></i>
            </p>
            <img src="resources/artistInfoFile/Profile/${ artistInfo.myReProfile }" class="testimonial-img" alt="">qweqweqwe
          </div>

          <div class="testimonial-item">
            <p>
              <i class="bx bxs-quote-alt-left quote-icon-left"></i>
              Export tempor illum tamen malis malis eram quae irure esse labore quem cillum quid cillum eram malis quorum velit fore eram velit sunt aliqua noster fugiat irure amet legam anim culpa.
              <i class="bx bxs-quote-alt-right quote-icon-right"></i>
            </p>
            <img src="resources/assets/img/testimonials/testimonials-2.jpg" class="testimonial-img" alt="">
            <h3>Sara Wilsson</h3>
            <h4>Designer</h4>
          </div>

        </div>

    </section><!-- End Testimonials Section -->


 
    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Contact</h2>
          <p>Contact Us</p>
        </div>
      </div>

      <div data-aos="fade-up">
        <iframe style="border:0; width: 100%; height: 350px;" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12097.433213460943!2d-74.0062269!3d40.7101282!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xb89d1fe6bc499443!2sDowntown+Conference+Center!5e0!3m2!1smk!2sbg!4v1539943755621" frameborder="0" allowfullscreen></iframe>
      </div>

      <div class="container" data-aos="fade-up">

        <div class="row mt-5">

          <div class="col-lg-4">
            <div class="info">
              <div class="address">
                <i class="icofont-google-map"></i>
                <h4>Location:</h4>
                <p>A108 Adam Street, New York, NY 535022</p>
              </div>

              <div class="open-hours">
                <i class="icofont-clock-time icofont-rotate-90"></i>
                <h4>Open Hours:</h4>
                <p>
                  Monday-Saturday:<br>
                  11:00 AM - 2300 PM
                </p>
              </div>

              <div class="email">
                <i class="icofont-envelope"></i>
                <h4>Email:</h4>
                <p>info@example.com</p>
              </div>

              <div class="phone">
                <i class="icofont-phone"></i>
                <h4>Call:</h4>
                <p>+1 5589 55488 55s</p>
              </div>

            </div>

          </div>

          <div class="col-lg-8 mt-5 mt-lg-0">

            <form action="resources/forms/contact.php" method="post" role="form" class="php-email-form">
              <div class="form-row">
                <div class="col-md-6 form-group">
                  <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" />
                  <div class="validate"></div>
                </div>
                <div class="col-md-6 form-group">
                  <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email" />
                  <div class="validate"></div>
                </div>
              </div>
              <div class="form-group">
                <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject" />
                <div class="validate"></div>
              </div>
              <div class="form-group">
                <textarea class="form-control" name="message" rows="8" data-rule="required" data-msg="Please write something for us" placeholder="Message"></textarea>
                <div class="validate"></div>
              </div>
              <div class="mb-3">
                <div class="loading">Loading</div>
                <div class="error-message"></div>
                <div class="sent-message">Your message has been sent. Thank you!</div>
              </div>
              <div class="text-center"><button type="submit">Send Message</button></div>
            </form>

          </div>

        </div>

      </div>
    </section><!-- End Contact Section -->

  
    <!-- Vendor JS Files -->
  <script src="resources/assets/vendor/jquery/jquery.min.js"></script>
  <script src="resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="resources/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="resources/assets/vendor/php-email-form/validate.js"></script>
  <script src="resources/assets/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="resources/assets/vendor/venobox/venobox.min.js"></script>
  <script src="resources/assets/vendor/aos/aos.js"></script>
  <!-- Template Main JS File -->
  <script src="resources/assets/js/main.js"></script>
  
 	<!-- 아티스트 모달 업데이트  -->
 	<div class="modal fade" id="modalUpdateWork" tabindex="-1" role="dialog"
			aria-labelledby="ARTIST_TITLE" aria-hidden="true" style="">
			<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl" role="document" >
				<!-- 센터모달창 추가  modal-dialog-centered -->
				<div class="modal-content" style="background-color: rgba(255, 255, 255, 0.4);">
					<div class="modal-header">
						<h5 class="modal-title" id="TEST">
							<b>내 작품 수정하기</b>
						</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body book-a-table">
						<form action="updateArtistWork.na" 
							method="post" role="form" class="php-email-form workForm" data-aos="fade-up" data-aos-delay="100" 
							enctype="multipart/form-data" onsubmit="return updateCheck();">
				          <div>
				            <!-- 작품 사진파일-->
				            <div class="col-lg-4 col-md-6 form-group">
				              	기존파일
				              <input type="text" class="form-control workImgPath" name="workImgPath" readonly>
				              	업데이트 파일
				              <input type="file" class="form-control" name="reloadFile">  
				            </div>
							
				         	<!-- 작품 스타일 -->
				            <div class="col-lg-4 col-md-6 form-group">
				              Update Tatto Style
				              <select name="workStyle" class="form-control updateStyle" id="name">
				              	<option value="pleaseSelect" id="selectOption" selected>수정 타투스타일</option>
				              </select>
				              <div class="validate"></div>
				            </div>
				         	
				            <!-- 작품소개  -->
				            <div class="form-group">
				               	소개 수정
				               <textarea class="form-control updateWorkArea" name="workInfo" cols="600" rows="5"  placeholder="작품 소개" style="resize: none;"></textarea>
				               <div class="validate"></div>
				            </div>			            			            				            				            
				          </div>
				          <div class="mb-3">
				            <div class="loading">Loading</div>
				          </div>
				          <div class="text-center"><button type="submit">Work Update</button></div>
 				          <input type="hidden" name="artistId" value="${ loginArtist.artistId }">
 				          <input type="hidden" id="workReImgPath" name="workReImgPath" value="">
 				          <input type="hidden" id="artistWorkCode" name="workCode" value="">
				        </form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">CLOSE</button>
					</div>
				</div>
			</div>
		</div> 		
  
  
  
  
  
  
  
  	<!-- 아티스트 모달페이지 출력  -->
  	<div class="modal fade" id="modalInfo" tabindex="-1" role="dialog"
			aria-labelledby="ARTIST_TITLE" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl" role="document" >
				<!-- 센터모달창 추가  modal-dialog-centered -->
				<div class="modal-content" style="background-color: rgba(255, 255, 255, 0.4);">
					<div class="modal-header">
						<h5 class="modal-title" id="TEST">
							<b>ARTIST INFO</b>
						</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body book-a-table">
						<form action="InsertArtistInfo.na" 
						method="post" role="form" class="php-email-form modalActionCheck" data-aos="fade-up" data-aos-delay="100" enctype="multipart/form-data">
				          <div>
				         	<!-- 타투샵이름 -->
				            <div class="col-lg-4 col-md-6 form-group">
				              ARTIST SHOP NAME 
				              <input type="text" value="" name="name" class="form-control artistShopName" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="1글자 이상 입력해주세요.">
				              <div class="validate"></div>
				            </div>
				            <!-- 프로필사진 업로드-->
				            <div class="col-lg-4 col-md-6 form-group">
				            <c:if test="${ empty artistInfo.myProfile }">
				                             프로필 사진 선택 
				              <input type="file" class="form-control artistmodalProfileName" name="reloadFile">
				            </c:if>
				              <c:if test="${ !empty artistInfo.myProfile }">
				              	기존 사진<input type="text" class="form-control" id="InfoProfile" name="myProfile" value="" readonly>
				              	수정할 사진<input type="file" class="form-control artistmodalProfileName" name="uploadFile">
				              </c:if>	
				            </div>
				            <!-- 자기소개  -->
				            <div class="form-group">
				               INFO 
				               <textarea class="form-control artistmodalInfo" name="myInfo" cols="600" rows="5"  placeholder="Your Info" style="resize: none;"></textarea>
				               <div class="validate"></div>
				            </div>				            				            
				          </div>
				          <div class="mb-3">
				            <div class="loading">Loading</div>
				          </div>
				          <div class="text-center"><button type="submit" class="artistInfoButton"></button></div>
				          <!-- 프로필사진은 변경하고싶지않을 때 그냥 등록해도됨 hidden으로 넘겨줌  -->
				          <input type="hidden" name="artistId" value="${ loginArtist.artistId }">
				          <input type="hidden" id="InfoReProfile" name="myReProfile" value="">
				        </form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">CLOSE</button>
					</div>
				</div>
			</div>
		</div> 
		
		
		
				
	<!-- 아티스트 작품 등록 -->
  	<div class="modal fade" id="modalArtistWork" tabindex="-1" role="dialog"
			aria-labelledby="ARTIST_TITLE" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl" role="document" >
				<!-- 센터모달창 추가  modal-dialog-centered -->
				<div class="modal-content" style="background-color: rgba(255, 255, 255, 0.4);">
					<div class="modal-header">
						<h5 class="modal-title" id="TEST">
							<b>내 작품 등록하기</b>
						</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body book-a-table">
						<form action="InsertArtistWork.na" 
							method="post" role="form" class="php-email-form workForm" data-aos="fade-up" data-aos-delay="100" 
							enctype="multipart/form-data" onsubmit="return optionCheck();">
				          <div>
				            <!-- 작품 사진파일-->
				            <div class="col-lg-4 col-md-6 form-group">
				              WorkFile
				              <input type="file" class="form-control fileCheck" name="uploadFile">  
				            </div>
							
				         	<!-- 작품 스타일 -->
				            <div class="col-lg-4 col-md-6 form-group">
				              Tatto Style
				              <select name="workStyle" class="form-control workStyle" id="name">
				              	<option value="pleaseSelect" id="optionKing" selected>등록할 타투스타일</option>
				              </select>
				              <div class="validate"></div>
				            </div>
				         	
				            <!-- 작품소개  -->
				            <div class="form-group">
				               	작품소개
				               <textarea class="form-control" name="workInfo" cols="600" rows="5"  placeholder="Your Info" style="resize: none;"></textarea>
				               <div class="validate"></div>
				            </div>			            			            				            				            
				          </div>
				          <div class="mb-3">
				            <div class="loading">Loading</div>
				          </div>
				          <div class="text-center"><button type="submit">Work Insert</button></div>
 				          <input type="hidden" name="artistId" value="${ loginArtist.artistId }">
				        </form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">CLOSE</button>
					</div>
				</div>
			</div>
		</div> 		
		<script>
		function optionCheck(){
 			var fileCheck = $(".fileCheck").val();
			var styleCheck = $(".workStyle").val();
			if( styleCheck == "pleaseSelect" || !fileCheck ){
				alert("작품의 사진 및 스타일을 선택해주세요.");
				return false;
			}
			return true;
		}		
		  function updateCheck(){
			var styleCheck = $(".updateStyle").val();
			if( styleCheck == "pleaseSelect" ){
				alert(" 스타일을 선택해주세요.");
				return false;
			}
			return true;
		} 
		
		$(document).ready(function(){
	 			$("#artistInfoWork").on("click", function(){
	 				$("option").remove(".styleDelete");
	 				var artistId = "${ loginArtist.artistId }";
	 				console.log(artistId)
	 				$.ajax({
	 					url : "artistStyle.na",
	 					type : "post",
	 					data : { "artistId" : artistId },
	 					dataType : "json",
	 					success : function(style) {
	 						for( var i in style ) {
	 							var aStyle = decodeURIComponent(style[i].pStyle.replace(/\+/g," "));
	 							var aOption = $("<option class='styleDelete' value='"+ aStyle +"'>"+ aStyle + "</option>");
	 							/* $("#optionKing").after("<option class='styleDelete' value='"+ aStyle + "'>" + aStyle + "</option>"); */
	 							$("#optionKing").after(aOption);
	 							
	 						}
	 					}
	 				});
	 			});
	 			
 			
 			$(".tattoStyle").on("change", function() {
				var artistId = "${ loginArtist.artistId }";
				var tattoStyleOptionValue = $(this).find(":selected").val();
				if( tattoStyleOptionValue == 'pleaseSelect' ) {
					$('.tattolayer').css("display","none");
				}else{
					$('.tattolayer').css("display","block");
						$.ajax({
							url : "artistPriceChecking.na",
							type : "post",
							data : { 
								"artistId" : artistId,
								"pStyle" : tattoStyleOptionValue 
								},
							dataType : "json",
							success : function(checkPrice) {
								if( checkPrice != null ){
									$("input[name=pSize1]").prop("value", checkPrice.pSize1);
									$("input[name=pSize2]").prop("value", checkPrice.pSize2);
									$("input[name=pSize3]").prop("value", checkPrice.pSize3);
									$("input[name=pSize4]").prop("value", checkPrice.pSize4);
									$("input[name=pSize5]").prop("value", checkPrice.pSize5);
									$("input[name=pSize6]").prop("value", checkPrice.pSize6);
									$("input[name=pSize7]").prop("value", checkPrice.pSize7);
									$(".priceActionCheck").prop("action", "updateArtistPrice.na");
									$(".artistPriceButton").html("Tatto Price Update");
								} else {
									alert("저장된 정보가 없습니다.");
									$("input[name=pSize1]").prop("value", "");
									$("input[name=pSize2]").prop("value", "");
									$("input[name=pSize3]").prop("value", "");
									$("input[name=pSize4]").prop("value", "");
									$("input[name=pSize5]").prop("value", "");
									$("input[name=pSize6]").prop("value", "");
									$("input[name=pSize7]").prop("value", "");									
									$(".priceActionCheck").prop("action", "insertArtistPrice.na");
									$(".artistPriceButton").html("Tatto Price Insert");
								}
							}
						});
					}
				});
			
				
			$("#insertInfo").on("click", function(){
				var artistId = "${ loginArtist.artistId }";
				$.ajax({
					url : "artistChecking.na",
					type : "post",
					data :{ "artistId" : artistId },
					dataType : "json",
					success : function(check) {
						console.log(check)
							if( check != null ){
								$(".artistShopName").prop("value", decodeURIComponent(check.name.replace(/\+/g," ")));
								$(".artistmodalProfileName").prop("name", "reloadFile");
								$(".artistmodalInfo").prop("value", decodeURIComponent(check.myInfo.replace(/\+/g," ")));
								$("#InfoProfile").prop("value", decodeURIComponent(check.myProfile.replace(/\+/g," ")));
								$("#InfoReProfile").prop("value", decodeURIComponent(check.myReProfile.replace(/\+/g," ")));
								$(".modalActionCheck").prop("action", "UpdateArtistInfo.na");
								$(".artistInfoButton").html("MyInfo Update");
								$("#modalInfo").modal();
							}else {
								$(".modalActionCheck").prop("action", "InsertArtistInfo.na");
								$(".artistmodalProfileName").prop("name", "uploadFile");
								$(".artistInfoButton").html("MyInfo Insert");
								$("#modalInfo").modal();
							}				
						}
					});
				});
	 		});
		
		
			/* 작품 수정버튼 클릭시 작품정보 및 스타일 출력  */
			$(".updateWork").on("click", function(){
				 $("option").remove(".styleDelete");
				 getTattoStyle();
				 var workCode = $(this).attr("id");
				 $.ajax({
				 	url : "selectArtistWork.na",
				 	type : "post",
				 	data :{ "workCode" : workCode },
				 	dataType : "json",
				 	success : function(workData) {
								$(".workImgPath").prop("value", decodeURIComponent(workData.workImgPath.replace(/\+/g," ")));
								$(".updateWorkArea").prop("value", decodeURIComponent(workData.workInfo.replace(/\+/g," ")));
								$("#workReImgPath").prop("value", decodeURIComponent(workData.workReImgPath.replace(/\+/g," ")));
								$("#artistWorkCode").prop("value", workCode);
								$("#modalUpdateWork").modal(); 				
					}
				});
			});
			/* 작품 수정시 에이젝스 메소드  */
			function getTattoStyle(){
				var artistId = "${ loginArtist.artistId }";
				$.ajax({
					url : "artistStyle.na",
					type : "post",
					data : { "artistId" : artistId },
					dataType : "json",
					success : function(style) {
						for( var i in style ) {
							var pStyle = decodeURIComponent(style[i].pStyle.replace(/\+/g," "));
							var wOption = $("<option class='styleDelete' value='"+ pStyle +"'>"+ pStyle + "</option>");
							$("#selectOption").after( wOption );
						}
					}
				});
			}		
		</script>
		
		
		
	<!-- 아티스트 가격등록 -->
  	<div class="modal fade" id="modalArtistPrice" tabindex="-1" role="dialog"
			aria-labelledby="ARTIST_TITLE" aria-hidden="true" style="">
			<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl" role="document" >
				<!-- 센터모달창 추가  modal-dialog-centered -->
				<div class="modal-content" style="background-color: rgba(255, 255, 255, 0.4);">
					<div class="modal-header">
						<h5 class="modal-title" id="TEST">
							<b>ARTIST WORK Price</b>
						</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body book-a-table">
						<form action="updateArtistPrice.na" 
						method="post" role="form" class="php-email-form priceActionCheck" data-aos="fade-up" data-aos-delay="100" enctype="multipart/form-data">
				          <div>
				            <!-- 스타일 -->
				            <div class="col-lg-4 col-md-6 form-group">
				              Tatto Style
				              <select name="pStyle" class="form-control tattoStyle" id="name">
				              	<option value="pleaseSelect" selected>작품 스타일</option>
				              	<option value="올드스쿨">올드스쿨</option>
				              	<option value="이레즈미">이레즈미</option>
				              	<option value="트라이벌">트라이벌</option>
				              	<option value="리얼리스틱">리얼리스틱</option>
				              	<option value="레터링">레터링</option>
				              	<option value="치카노">치카노</option>
				              </select>
				              <div class="validate"></div>
				            </div>

				         	<!-- 사이즈에 따른 가격 -->
				            <div class="col-lg-4 col-md-6 form-group tattolayer" style="display:none;">
				              38x38mm <input type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" name="pSize1" class="form-control" id="name" placeholder="가격을 정해주세요." data-rule="minlen:1" data-msg="가격을 정해주세요"><br>
				              38x64mm <input type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" name="pSize2" class="form-control" id="name" placeholder="가격을 정해주세요." data-rule="minlen:1" data-msg="가격을 정해주세요"><br>
				              65x76mm <input type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" name="pSize3" class="form-control" id="name" placeholder="가격을 정해주세요." data-rule="minlen:1" data-msg="가격을 정해주세요"><br>
				              102x127mm <input type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"name="pSize4" class="form-control" id="name" placeholder="가격을 정해주세요." data-rule="minlen:1" data-msg="가격을 정해주세요"><br>
				              152x152mm <input type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" name="pSize5" class="form-control" id="name" placeholder="가격을 정해주세요." data-rule="minlen:1" data-msg="가격을 정해주세요"><br>
				              203x152mm <input type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" name="pSize6" class="form-control" id="name" placeholder="가격을 정해주세요." data-rule="minlen:1" data-msg="가격을 정해주세요"><br>
				              210x297mm <input type="text" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" name="pSize7" class="form-control" id="name" placeholder="가격을 정해주세요." data-rule="minlen:1" data-msg="가격을 정해주세요"><br>
				              <div class="validate"></div>
				            </div>				            		            			            				            				            
				          </div>
				          <div class="mb-3">
				            <div class="loading">Loading</div>
				          </div>
				          <div class="text-center"><button type="submit" class="artistPriceButton"></button></div>
 				          <input type="hidden" name="artistId" value="${ loginArtist.artistId }">
				        </form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">CLOSE</button>
					</div>
				</div>
			</div>
		</div> 				

  	<footer>
		 <jsp:include page="../common/footer.jsp"/>  	 
  	</footer>
</body>
</html>