<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
																	<!-- 아티스트 상세페이지 헤더  --> 
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>NATTA ARTIST PAGE</title>
  <meta content="" name="descriptison">
  <meta content="" name="keywords">
  <link href="resources/images/tugcat.png" rel="shortcut icon">
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Playfair+Display:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
  <!-- Vendor CSS Files -->
  <link href="resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="resources/assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="resources/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="resources/assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="resources/assets/vendor/venobox/venobox.css" rel="stylesheet">
  <link href="resources/assets/vendor/aos/aos.css" rel="stylesheet">
  <!-- Template Main CSS File -->
  <link href="resources/assets/css/style.css" rel="stylesheet">
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
  <style>
     header {
        height: 180px;
     }
  </style>
</head>
<body>
  <!-- ======= Top Bar ======= -->
  <div id="topbar" class="d-flex align-items-center fixed-top">
    <div class="container d-flex">
      <div class="contact-info mr-auto">
        <i class="icofont-phone"></i> +1 5589 55488 55
        <span class="d-none d-lg-inline-block"><i class="icofont-clock-time icofont-rotate-180"></i> Mon-Sat: 11:00 AM - 23:00 PM</span>
      </div>
      <div class="languages">
        <ul>
	        <!--로그인 세션 비어있을 때 -->
			<c:if test="${empty sessionScope.loginCustomer && empty sessionScope.loginArtist  }">
				<li><a href="/login.na">LOGIN</a></li>
				<li><a href="/customerJoinView.na">SIGNUP</a></li>
			</c:if>
			<!-- 회원 로그인시 -->
			<c:if test="${!empty sessionScope.loginCustomer }">
				<li>${loginCustomer.customerName }님 환영합니다.</li>
				<li><a href="/customerInfo.na?customerId=${loginCustomer.customerId }">MyPage&nbsp;&nbsp;</a></li>
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
  <header id="header" class="fixed-top">
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
       <div class="profile container d-flex align-items-center" style="float:left;">
       <div style="width:380px; float:left;"></div>
        <img 
        src="resources/assets/img/artistPage/profile-img.jpg" alt="" class="img-fluid rounded-circle" 
        style="margin-left: 15px auto; display: block; width: 120px; border: 8px solid #2c2f3f;">
  	<nav class="nav-menu d-none d-lg-block" data-aos="fade-in">
        <h2 class="text-light" style="margin-left:25px;">흐에에에에에에엥</h2>
  	    <button type="button" class="mobile-nav-toggle d-xl-none"><i class="icofont-navigation-menu"></i></button>    
       	<!-- 아티스트 프로필 메뉴바 -->
        <ul style="list-style : none;">
        <c:if test="${ loginArtist.artistId eq loginArtist.artistId }">
          	<li class="active"><a href="#modalTest" data-toggle="modal"><i class="bx bx-user"></i><span>INFO INSERT</span></a></li>
		</c:if>          	
          	<!-- <script>
          	function artistIdCheck(){
          		$.ajax({ 하다말았다 현모야 나중에 해라
          		onclick="artistIdCheck();"
          			url : "InfoIdCheck.na",
          			type : "POST",
          			data :
          		});
          	}
          	</script> -->
          	<li><a href="#"><i class="bx bx-home"></i><span>About</span></a></li>
          	<li><a href="#resume"><i class="bx bx-file-blank"></i><span>Resume</span></a></li>
          	<li><a href="#portfolio"><i class="bx bx-book-content"></i> Portfolio</a></li>
          	<li><a href="#services"><i class="bx bx-server"></i> Services</a></li>
          	<li><a href="#contact"><i class="bx bx-envelope"></i> Contact</a></li>
        </ul>            
        </nav><!-- .nav-menu -->
      </div>      
  </header>

  
  
  
  
  <%-- <!-- End Header -->
  	<div class="modal fade" id="modalTest" tabindex="-1" role="dialog"
			aria-labelledby="ARTIST_TITLE" aria-hidden="true" style="">
			<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl" role="document" >
				<!-- 센터모달창 추가  modal-dialog-centered -->
				<div class="modal-content" style="background-color: rgba(255, 255, 255, 0.4);">
					<div class="modal-header">
						<h5 class="modal-title" id="TEST">
							<b>ARTIST INFO MODAL TEST</b>
						</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body book-a-table">
						<form action="InsertArtistInfo.na" 
						method="post" role="form" class="php-email-form" data-aos="fade-up" data-aos-delay="100" enctype="multipart/form-data">
				          <div>
				         	<!-- 이름 -->
				            <div class="col-lg-4 col-md-6 form-group">
				              ARTIST NAME 
				              <input type="text" value="${ loginArtist.artistName }" name="name" class="form-control" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
				              <div class="validate"></div>
				            </div>
				            <!-- 스타일 -->
				            <div class="col-lg-4 col-md-6 form-group">
				              ARTIST STYLE
				             <input type="text" name="style" class="form-control" id="name" placeholder="Tatto Style" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
				              <div class="validate"></div>
				            </div>
				            <!-- 프로필사진 업로드-->
				            <div class="col-lg-4 col-md-6 form-group">
				              MY PROFILE 
				              <input type="file" class="form-control" name="uploadFile">  
				            </div>
				            <!-- 근무지주소 -->
				            <div class="col-lg-4 col-md-6 form-group">
				              WORK ADDRESS
				              <input type="text" name="workAddress" class="form-control" id="name" placeholder="Your WorkAddress" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
				              <div class="validate"></div>
				            </div>
				            <!-- 자기소개  -->
				            <div class="form-group">
				               INFO 
				               <textarea class="form-control" name="myInfo" cols="600" rows="5"  placeholder="Your Info" style="resize: none;"></textarea>
				               <div class="validate"></div>
				            </div>			            			            				            				            
				          </div>
				          <div class="mb-3">
				            <div class="loading">Loading</div>
				          </div>
				          <div class="text-center"><button type="submit">INFO UPDATE</button></div>
 				          <input type="hidden" name="artistId" value="${ loginArtist.artistId }">
				        </form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">CLOSE</button>
					</div>
				</div>
			</div>
		</div>    --%>
  
		
  
  
  	
  	
  

  </body>
  </html>