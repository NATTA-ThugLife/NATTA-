<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
																	<!-- 헤더밑에 배경없는 JSP !!   -->
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>NATTA!</title>
  <meta content="" name="descriptison">
  <meta content="" name="keywords">
  

  <link href="resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

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
  <style>
     header {
        height: 70px;
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
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">
      <h1 class="logo mr-auto"><a href="main.na">NATTA!</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li class="active"> <a href="main.na">Home</a></li>
          <li></li>
          <li></li>
          <li><a href="#menu">ARTIST</a></li>
          <li></li>
          <li></li>
          <li><a href="customDesignList.na" style="text-align: center">Customized<br>Tatto</a></li>
          <li></li>
          <li></li>
          <li><a href="#">NOTICE</a></li>
          <li></li>
          <li></li>
          <li><a href="#">QnA</a></li>
          <li></li>
<!--           <li></li>
          <li class="book-a-table text-center"><a href="#book-a-table">LOGIN / SIGNUP</a></li> -->
        </ul>
      </nav><!-- .nav-menu -->
    </div>
  </header><!-- End Header -->

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
</body>
</html>