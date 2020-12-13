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
  <link href="resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
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
  
  
    
  
  
  <script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

<style>
   header {
      height: 180px;
   }	
 </style>
</head>

<body>
<header>
	<div id="header" class="fixed-top">
  <!-- ======= Top Bar ======= topBar 원래 header였음 fixed고정이라 영역 변경 12.10 0141AM--> 
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
  	<nav class="nav-menu d-none d-lg-block" data-aos="fade-in">
        <h2 class="text-light" style="margin-left:25px;">${ artistInfo.name }</h2>
  	    <button type="button" class="mobile-nav-toggle d-xl-none"><i class="icofont-navigation-menu"></i></button>    
       	<!-- 아티스트 프로필 메뉴바 -->
        <ul style="list-style : none;">
          	<li><a href="#modifyInfo" ><i class="bx bx-user"></i><span>INFO MODIFY</span></a></li>
          	<script>
          		
          	</script>
          	<li><a href="#"><i class="icofont-heart"></i><span>Following</span></a></li>
          	<li><a href="#resume"><i class="bx bx-file-blank"></i><span>Review</span></a></li>
          	<li><a href="#services"><i class="icofont-calendar"></i> Reservation</a></li>
          	<li><a href="/chatting.na"><i class="bx bx-envelope"></i> Chatting</a></li>
          	<li><a href="#modalWork" data-toggle="modal"><i class="icofont-crying"></i> Good-Bye</a></li>    
        </ul>            
        </nav><!-- .nav-menu -->
      </div>      
  </div>
</header>  
												<!--=========== 헤더 끝  ============-->   
												<!--=============섹션 시작=============  -->
    
    <!--============ 아티스트 소개 섹션 ==========  -->
     <section class="about">
      <div class="container" data-aos="fade-up">

        <div class="row">
          <div class="col-lg-6 order-1 order-lg-2" data-aos="zoom-in" data-aos-delay="100">
            <div class="about-img">
              <img src="resources/customerProfile/${loginCustomer.customerId }/${ loginCustomer.customerProfile }" alt="">
            </div>
          </div>
          <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content">
            <h3>Customer Info </h3>
            <p class="font-italic">
				<i class="icofont-ui-user"> Name : ${ loginCustomer.customerName }</i> <br>
				<i class="icofont-id"> Id   : ${ loginCustomer.customerId }</i><br>
				<i class="icofont-smart-phone"> Phone : ${ loginCustomer.phone }</i> <br>
				<i class="icofont-email"> Email : ${loginCustomer.email }</i> <br>
				<i class="icofont-wall-clock"> Enroll-Date : ${loginCustomer.enrollDate }</i>
            </p>
          </div>
        </div>
      </div>
    </section> 
    <!--============ 아티스트 소개 섹션 끝 ==========  -->

     <section id="modifyInfo" class="about">
				<div class="container">
					<div class="modal-header">
						<h5 class="modal-title" >
							<b>Customer INFO</b>
						</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">							<span aria-hidden="true">&times;</span>
						</button>

					</div>
					<div class="modal-body book-a-table" >
						<form action="/modifyCustomerInfo.na" 
						method="post" role="form" class="php-email-form"  enctype="multipart/form-data" onsubmit="return dup();">
				          <div style="margin-left: 330px;">
				         	<!-- 이름 -->
				            <div class="col-lg-7 col-md-6 form-group">
				              Customer Name : 
z				              <input type="text" value="${ loginCustomer.customerName }" name="customerName" class="form-control" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" readonly>
				              <input type="text" value="${ loginCustomer.customerId }" name="customerId" class="form-control" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars" readonly>
				              <div class="validate"></div>
				            </div>
				            <!-- 비밀번호 확인  -->
				            <div class="col-lg-7 col-md-6 form-group">
				              	현재 비밀번호를 입력해주세요 : 
				              <input type="text"  name="dupPwd" class="form-control" id="dupPwd" placeholder="Password" data-rule="minlen:4" data-msg="Please enter at least 4 chars" >
				              <div class="validate"></div>
				            </div>
				            	
				            <!-- 비밀번호 입력 -->
				            <div class="col-lg-7 col-md-6 form-group">
				              Modify Password : 
				             <input type="password" name="password" class="form-control" id="password" placeholder="Enter Password" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
				             <input type="password" name="confirmPassowrd" class="form-control" id="confirmPassowrd" placeholder="Confirm Password" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
				              <div class="validate"></div>
				            </div>
				            <!-- 프로필사진 업로드-->
				            <div class="col-lg-7 col-md-3 form-group">
				              MY PROFILE 
				              <input type="file" class="form-control" name="uploadFile" style="float: left">  
				              <div class="validate"></div>
				            </div>
				            <!-- 근무지주소 -->
				            <div class="col-lg-7 col-md-6 form-group">
				            	ADDRESS
				            	
								<c:forTokens items="${loginCustomer.address }" var="addr" delims="," varStatus="status">
						            <c:if test="${status.index eq 0}">
						             <input type="text" name="post" value="${addr }" class="form-control postcodify_postcode5 address" id="address" placeholder="Your WorkAddress" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
						            </c:if>
						            <c:if test="${status.index eq 1}">
						            <input type="text" name="address1" value="${addr }" class="postcodify_address address">
						            </c:if>
						            <c:if test="${status.index eq 2}">
						            <input type="text" name="address2" value="${addr }" class="postcodify_extra_info">
						            </c:if>      
					            </c:forTokens>

				              <div class="validate"></div>
				            </div>

 				            <!-- 핸드폰  -->
				            <div class="col-lg-7 col-md-6 form-group">
				               Phone
				               <input type="text" name="phone" value="${ loginCustomer.phone }"class="form-control" id="phone" placeholder="Your Phone" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
				            </div>	
				            <!-- 이메일  -->
				            <div class="col-lg-7 col-md-6 form-group">
				               Email
				               <input type="email" name="email" value="${ loginCustomer.email }"class="form-control" id="email" placeholder="Your Phone" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
				            </div>			            			            				            				            
				          </div>
				          <input type="hidden" name="orginalFileName" value="${ loginCustomer.customerProfile }">
				          <div class="mb-3">
				            <div class="loading">Loading</div>
				          </div>
				          <div class="text-center"><button type="submit" >INFO UPDATE</button></div>
				        </form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">CLOSE</button>
					</div>
				</div>

  </section>
<script>
		function dup(){
			var flag = false;
			var dupPwd = $("#dupPwd").val();
			var customerId = "${loginCustomer.customerId}";
 			$.ajax({
				type: "post",
				url: "/dupPwd.na",
				data: {
					"dupPwd" : dupPwd,
					"customerId" : customerId
				},
				async: false,
				success: function (res) {
					console.log(res)
					if(res == "success"){
						alert("정보수정 완료");
						flag = true;
					}else{
						alert("현재 비밀번호가 틀렸습니다. 다시 입력해주세요");
						$("#dupPwd").focus();
						flag = false; 
					}

				},
				error: function(){
					flag = false;
				}
			}) 
			return flag;
		}
</script>

    
    
  

    <!-- ======= 아티스트 작품 섹션 ======= -->
<!--     <section id="events" class="events">
   <div id="chefs" class="chefs">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Work</h2>
          <p>Artist Work Area</p>
        </div>

        <div class="row">

          <div class="col-lg-4 col-md-6">
            <div class="member" data-aos="zoom-in" data-aos-delay="100">
              <img src="resources/assets/img/chefs/chefs-1.jpg" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>Walter White</h4>
                  <span>Master Chef</span>
                </div>
                <div class="social">
                  <a href=""><i class="icofont-twitter"></i></a>
                  <a href=""><i class="icofont-facebook"></i></a>
                  <a href=""><i class="icofont-instagram"></i></a>
                  <a href=""><i class="icofont-linkedin"></i></a>
                  <a href="resources/assets/img/chefs/chefs-1.jpg" class="venobox" data-gall="gallery-item">g</a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6">
            <div class="member" data-aos="zoom-in" data-aos-delay="200">
              <img src="resources/assets/img/chefs/chefs-2.jpg" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>Sarah Jhonson</h4>
                  <span>Patissier</span>
                </div>
                <div class="social">
                  <a href=""><i class="icofont-twitter"></i></a>
                  <a href=""><i class="icofont-facebook"></i></a>
                  <a href=""><i class="icofont-instagram"></i></a>
                  <a href=""><i class="icofont-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6">
            <div class="member" data-aos="zoom-in" data-aos-delay="300">
              <img src="resources/assets/img/chefs/chefs-3.jpg" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>William Anderson</h4>
                  <span>Cook</span>
                </div>
                <div class="social">
                  <a href=""><i class="icofont-twitter"></i></a>
                  <a href=""><i class="icofont-facebook"></i></a>
                  <a href=""><i class="icofont-instagram"></i></a>
                  <a href=""><i class="icofont-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>

        </div>

      </div>
      </div>
	</section> -->
	<!-- ======= 아티스트 작품 섹션 끝 ======= -->
	
	
  <!-- ======= 후기 댓글정도? ======= -->
<%--      <section id="testimonials" class="testimonials section-bg">
     
      <div class="container" data-aos="fade-up">
        <div class="section-title">
          <h2>All</h2>
          <p>Artist List</p>
        </div>


          <div class="testimonial-item">
            <p style="width:150px;">ArtistName<br>
              <i class="bx bxs-quote-alt-left quote-icon-left"></i>
             	 ${ artistInfo.name }
              <i class="bx bxs-quote-alt-right quote-icon-right"></i>
            </p>
            <img src="resources/artistProfile/${ artistInfo.myReProfile }" class="testimonial-img" alt="">
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

    </section> --%><!-- End Testimonials Section -->


 
    <!-- ======= Contact Section ======= -->
 <!--    <section id="contact" class="contact">
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
    </section> --><!-- End Contact Section -->

  

  
  
  
  
  
  
  

				

		
		
	<!-- 아티스트 작품 등록 -->
 <%--  	<div class="modal fade" id="modalWork" tabindex="-1" role="dialog"
			aria-labelledby="ARTIST_TITLE" aria-hidden="true" style="">
			<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl" role="document" >
				<!-- 센터모달창 추가  modal-dialog-centered -->
				<div class="modal-content" style="background-color: rgba(255, 255, 255, 0.4);">
					<div class="modal-header">
						<h5 class="modal-title" id="TEST">
							<b>ARTIST WORK INSERT</b>
						</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body book-a-table">
						<form action="InsertArtistWork.na" 
						method="post" role="form" class="php-email-form" data-aos="fade-up" data-aos-delay="100" enctype="multipart/form-data">
				          <div>
				            <!-- 프로필사진 업로드-->
				            <div class="col-lg-4 col-md-6 form-group">
				              MY WORKFile
				              <input type="file" class="form-control" name="uploadFile">  
				            </div>
				            
				            <!-- 스타일 -->
				            <div class="col-lg-4 col-md-6 form-group">
				              Tatto Style
				              <select name="part" class="form-control" id="name">
				              	<option value="등부위">등</option>
				              	<option value="목부위">목</option>
				              	<option value="어깨부위">어깨</option>
				              	<option value="가슴부위">가슴</option>
				              	<option value="팔부위">팔</option>
				              	<option value="다리부위">다리</option>
				              </select>
				             <input type="text" name="style" class="form-control" id="name" placeholder="Tatto Style" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
				              <div class="validate"></div>
				            </div>

				         	<!-- 사이즈 -->
				            <div class="col-lg-4 col-md-6 form-group">
				              Tatto Size
				              <input type="text" name="size" class="form-control" id="name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
				              <div class="validate"></div>
				            </div>				            
				            
				            
				            <!-- 근무지주소 -->
				            <div class="col-lg-4 col-md-6 form-group">
				              WORK ADDRESS
				              <input type="text" name="workAddress" class="form-control" id="name" placeholder="Your WorkAddress" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
				              <div class="validate"></div>
				            </div>
				            <!-- 자기소개  -->
				            <div class="form-group">
				               WORKINFO
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
		</div> 		 --%>

  	<footer>
		 <jsp:include page="../common/footer.jsp"/>  	 
  	</footer>
</body>
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
	  
	  	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
			<script>
			$(function() {
					$(".address").postcodifyPopUp();
				})
		</script>
</html>