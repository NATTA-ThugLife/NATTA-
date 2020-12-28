<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>NATTA!</title>
  
  <meta content="" name="descriptison">
  <meta content="" name="keywords">
	<!-- 고양이 아이콘   -->
  <link href="resources/images/tugcat.png" rel="shortcut icon">

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
        <i class="icofont-phone"></i> +82 010 1234 5678
        <span class="d-none d-lg-inline-block"><i class="icofont-clock-time icofont-rotate-180"></i> Mon-Sun: 24-hour clock</span> 
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
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li class="active"> <a href="/main.na">Home</a></li>
          <li></li>
          <li></li>
          <li><a href="#artistRank">ARTIST</a></li>
          <li></li>
          <li></li>
          <li><a href="customDesignList.na" style="text-align: center">Customized<br>Tattoo</a></li>
          <li></li>
          <li></li>
          <li><a href="notice.na">NOTICE</a></li>
          <li></li>
          <li></li>
          <li><a href="/qna.na">Q&A</a></li>
        </ul>
      </nav><!-- .nav-menu -->

    </div>
  </header><!-- End Header -->

  <!-- ======= 메인 이미지  ======= -->
  <section id="hero" class="d-flex align-items-center">
    <div class="container position-relative text-center text-lg-left" data-aos="zoom-in" data-aos-delay="100">
      <div class="row">
        <div class="col-lg-8">
          <h1><span>NATTA ! </span></h1>
          <h2>다양한 아티스트들을 만나보세요.</h2>
		<div class="btns">
            <a href="artistList.na" class="btn-menu animated fadeInUp scrollto">아티스트 목록보기</a>
            <!-- <a href="#book-a-table" class="btn-book animated fadeInUp scrollto">Book a Table</a> -->
          </div>
          
        </div>
        <div class="col-lg-4 d-flex align-items-center justify-content-center" data-aos="zoom-in" data-aos-delay="200">
          <a href="https://www.youtube.com/watch?v=0k1VPlOZoSM" class="venobox play-btn" data-vbtype="video" data-autoplay="true"></a>
        </div>

      </div>
    </div>
  </section><!-- End Hero -->


    <!-- ======= 타투란? ======= -->
    <section id="about" class="mainAbout">
      <div class="container" data-aos="fade-up">
	 <div class="row" style="margin-left:250px;">      
          <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content" style="margin-right:50px;">
          <!-- <img src="resources/assets/img/nattaBack/info.jpg" width="500px;" height="300px;"> -->
            <h3>타투란? </h3>
            <p style="width:800px;">
				타투의 의미는 각 나라마다 다르긴 하지만 <br>
				우리나라에서의 타투는 과거 조직폭력의 상징으로 여겨지면서 그동안 타투에 대한 부정적 편견으로 인하여 대중적인 호응을 많이 받지 못하였지만 
				<br>요즈음은 보통 사람들도 다양한 동기와 개성의 표현으로 몸에 문신을 새기고 있고,<br>이제는 시대가 바뀌었습니다.
            </p>
            <p style="width:800px;">
				최근 10여 년간 타투기술과 장비의 급속한 발전으로 국내에서도
				 타투를 하는 사람들이 크게 증가하여 이제는 우리나라에서도 인정하지 않을 수 없는 또 하나의 “토착문화”로 이미 정착되었으며<br> 
				 전 세계적으로 고부가가치의 문화예술 산업으로도 자리매김하여 급속도의 성장을 하고 있습니다.
            </p>
          </div>
        </div>

      </div>
    </section><!-- End About Section -->
    <script src="resources/assets/vendor/jquery/jquery.min.js"></script>
	<script type="text/javascript">
        $(document).ready(function() {
 	       $("#workList").trigger("click");
        });
    </script>
    <!-- ======= Menu Section ======= -->
	<section id="artistRank" class="menu section-bg">
		<div class="container" data-aos="fade-up">
			<div class="section-title">
				<h2>Rank</h2>
				<p>아티스트 랭킹</p>
			</div>

			<div class="row" data-aos="fade-up" data-aos-delay="100">
				<div class="col-lg-12 d-flex justify-content-center">
					<ul id="menu-flters">
						<li id="workList" data-filter=".filter-work" class="filter-active">작품</li>
						<li data-filter=".filter-review">리뷰</li>
						<li data-filter=".filter-follow">팔로우</li>
						<li><a href="artistList.na">리스트</a></li>
					</ul>
				</div>
			</div>

			<div class="row menu-container" data-aos="fade-up"
				data-aos-delay="200">

				<c:forEach items="${artistInfo }" var="artList">
					<div class="col-lg-6 menu-item filter-work">
						<img style="width: 70px; height: 70.27px;"
							src="resources/artistInfoFile/Profile/${ artList.myReProfile }"
							class="menu-img" alt="">
						<div class="menu-contents">
							<a href="artistInfoPage.na?artistId=${artList.artistId }">&nbsp;&nbsp;&nbsp;${artList.name }</a><span></span>
						</div>
						<div class="menu-ingredients">${artList.myInfo }</div>
					</div>
				</c:forEach>

				<c:forEach items="${reviewInfo }" var="artList">
					<div class="col-lg-6 menu-item filter-review">
						<img style="width: 70px; height: 70.27px;"
							src="resources/artistInfoFile/Profile/${ artList.myReProfile }"
							class="menu-img" alt="">
						<div class="menu-contents">
							<a href="artistInfoPage.na?artistId=${artList.artistId }">&nbsp;&nbsp;&nbsp;${artList.name }</a><span></span>
						</div>
						<div class="menu-ingredients">${artList.myInfo }</div>
					</div>
				</c:forEach>

				<c:forEach items="${followInfo }" var="artList">
					<div class="col-lg-6 menu-item filter-follow">
						<img style="width: 70px; height: 70.27px;"
							src="resources/artistInfoFile/Profile/${ artList.myReProfile }"
							class="menu-img" alt="">
						<div class="menu-contents">
							<a href="artistInfoPage.na?artistId=${artList.artistId }">&nbsp;&nbsp;&nbsp;${artList.name }</a><span></span>
						</div>
						<div class="menu-ingredients">${artList.myInfo }</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<!-- End Menu Section -->
    
    

 

  
  	<!-- 최신 작품  -->
    <section id="gallery" class="gallery">
      <div class="container" data-aos="fade-up">
        <div class="section-title">
          <h2>Recently Added</h2>
          <p>최근 등록된 작품</p>
        </div>
      </div>

      <div style="width:70%;" class="container-fluid" data-aos="fade-up" data-aos-delay="100">
        <div class="row no-gutters">
			<c:forEach items="${latelyWork }" var="artList">
			<div class="col-lg-3 col-md-4">
		         <div class="gallery-item">
		             <a href="artistInfoPage.na?artistId=${ artList.artistId }">
		               <img style="width:500px; height:500px;" src="resources/artistInfoFile/WorkFile/${ artList.workReImgPath }" alt="" class="img-fluid">
		             </a>
		           </div>
		     </div>
		     </c:forEach>
        </div>
      </div>
    </section><!-- End Gallery Section -->



 









  <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6">
            <div class="footer-info">
              <h3>NATTA</h3>
              <p>
              	서울 중구 남대문로 120 <br>
				대일빌딩 2층,서울<br><br>
                <strong>Phone:</strong> +82 1544-9970<br>
                <strong>Email:</strong> thugkinghansol@gmail.com<br>
              </p>
              <div class="social-links mt-3">
                <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
              </div>
            </div>
          </div>

          <div class="col-lg-2 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="/main.na">Home</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#artistRank">ARTIST</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="customDesignList.na" style="text-align: center">Customized Tattoo</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="notice.na">NOTICE</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="/qna.na">Q&A</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Our Services</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Web Design</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Web Development</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Product Management</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Graphic Design</a></li>
            </ul>
          </div>

         <div class="col-lg-4 col-md-6 footer-newsletter">
            <h4>Our Newsletter</h4>
            <p>Email About Turgraf  NATTA!</p>
            <form action="mainMail.na" method="post">
              <input type="email" name="email"><input type="submit" value="Subscribe">
            </form>

          </div>

        </div>
      </div>
    </div>

    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong><span>Restaurantly</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/restaurantly-restaurant-template/ -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>
  </footer><!-- End Footer -->

  <div id="preloader"></div>
  <a href="#" class="back-to-top"><i class="bx bx-up-arrow-alt"></i></a>
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