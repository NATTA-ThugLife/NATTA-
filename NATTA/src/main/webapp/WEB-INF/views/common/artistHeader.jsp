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
	        <li><a href="/login.na">LOGIN</a></li>
	        <li><a href="/joinOption.na">SIGNUP</a></li>
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
    
    	<!-- 아티스트 헤더! -->
       <div class="profile container d-flex align-items-center" style="float:left;">
       <div style="width:380px; float:left;"></div>
        <img 
        src="resources/assets/img/artistPage/profile-img.jpg" alt="" class="img-fluid rounded-circle" 
        style="margin-left: 15px auto; display: block; width: 120px; border: 8px solid #2c2f3f;">
  	<nav class="nav-menu d-none d-lg-block" data-aos="fade-in">
        <h2 class="text-light" style="margin-left:25px;">Artist Info Page</h2>
  	    <button type="button" class="mobile-nav-toggle d-xl-none"><i class="icofont-navigation-menu"></i></button>    
       	
        <ul style="list-style : none;">
          	<li class="active"><a href="index.html"><i class="bx bx-home"></i> <span>Home</span></a></li>
          	<li><a href="#about"><i class="bx bx-user"></i><span>About</span></a></li>
          	<li><a href="#resume"><i class="bx bx-file-blank"></i> <span>Resume</span></a></li>
          	<li><a href="#portfolio"><i class="bx bx-book-content"></i> Portfolio</a></li>
          	<li><a href="#services"><i class="bx bx-server"></i> Services</a></li>
          	<li><a href="#contact"><i class="bx bx-envelope"></i> Contact</a></li>
        </ul>            
        </nav><!-- .nav-menu -->
      </div>      
  </header>
  <!-- End Header -->