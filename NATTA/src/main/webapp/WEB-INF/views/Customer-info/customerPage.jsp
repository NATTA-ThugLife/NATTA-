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
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->

  <!-- Template Main CSS File -->
  <link href="resources/assets/css/style.css" rel="stylesheet">
  
  
    
  
  

<style>
   header {
      height: 180px;
   }
 
 .modify{
  background: green;
  border: 0;
  padding: 10px 35px;
  color: #fff;
  transition: 0.4s;
  border-radius: 50px;	
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
        	<li><a href="#mypage" ><i class="icofont-page"></i><span>My page</span></li>
          	<li><a href="#modifyInfo" ><i class="bx bx-user"></i><span>INFO MODIFY</span></a></li>
          	<li><a href="#following"><i class="icofont-heart"></i><span>Following</span></a></li>
          	<li><a href="#review"><i class="bx bx-file-blank"></i><span>Review</span></a></li>
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
      <div class="container" data-aos="fade-up" id="mypage">

        <div class="row">
          <div class="col-lg-6 order-1 order-lg-2" data-aos="zoom-in" data-aos-delay="100">
            <div class="about-img">
              <img src="resources/customerProfile/${loginCustomer.customerId }/${ loginCustomer.customerProfile }" alt="" alt="" style="width: 600px; height:500px;">
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
z				              <input type="text" value="${ loginCustomer.customerName }" name="customerName" class="form-control" id="name" placeholder="Your Name" readonly>
				              <input type="text" value="${ loginCustomer.customerId }" name="customerId" class="form-control" id="name" placeholder="Your Name" readonly>
				              <div class="validate"></div>
				            </div>
				            <!-- 비밀번호 확인  -->
				            <div class="col-lg-7 col-md-6 form-group">
				              	현재 비밀번호를 입력해주세요 : 
				              <input type="text"  name="dupPwd" class="form-control" id="dupPwd" placeholder="Password">
				              <div class="validate"></div>
				            </div>
				            	
				            <!-- 비밀번호 입력 -->
				            <div class="col-lg-7 col-md-6 form-group">
				              Modify Password : 
				             <input type="password" name="password" class="form-control" id="password" placeholder="Enter Password" >
				             <input type="password" name="confirmPassowrd" class="form-control" id="confirmPassowrd" placeholder="Confirm Password">
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
				            	
				            	<c:if test="${loginCustomer.address eq null}">
						            <input type="text" name="post" value="${addr }" class="form-control postcodify_postcode5 address" id="address" placeholder="Your WorkAddress">
						            <input type="text" name="address1" value="${addr }" class="postcodify_address address">
						            <input type="text" name="address2" value="${addr }" class="postcodify_extra_info">
				            	</c:if>
				            	
								<c:forTokens items="${loginCustomer.address }" var="addr" delims="," varStatus="status">
						            <c:if test="${status.index eq 0}">
						             <input type="text" name="post" value="${addr }" class="form-control postcodify_postcode5 address" id="address" placeholder="Your WorkAddress">
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
< <script>
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
 
    
    
          <!-- ======= 팔로잉 섹션 ======= -->
     <section id="following" class="events">
   <div id="chefs" class="chefs">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>My</h2>
          <p>Following</p>
        </div>

        <div class="row">
		<c:if test="${empty fList}">
		  <div class="testimonial-item">
 				&nbsp;&nbsp;&nbsp; 팔로잉한 사람이 없습니다.
          </div>
		</c:if>
		<c:if test="${!empty fList }">
		<c:forEach items="${fList }" var="follow">

					<div class="col-lg-4 col-md-6" id="form${follow.artistId }">
            <div class="member" data-aos="zoom-in" data-aos-delay="100">
              <c:if test="${follow.myReprofile ne null }">
              	<img src="resources/artistProfile/${follow.myReprofile }" class="img-fluid" alt="" style="width:400px; height:350px;">
              </c:if>
              <c:if test="${follow.myReprofile eq null }">
              	<img src="resources/artistProfile/20201213015554.png" class="img-fluid" alt="" style="width:400px; height:350px;">
              </c:if>
              <div class="member-info">
                <div class="member-info-content">
                  <h4>${follow.artistId }</h4>
                  <span>${follow.name }</span>
                </div>
                <div class="social">
                  <a href="artistInfoPage.na?artistId=${follow.artistId }"><i class="icofont-page"><br>페이지 가기</i></a>
                  <a href=""><i class="icofont-instagram"><br>Instagram</i></a>
                  <a class="deleteFollow" id="${follow.artistId }"><i class="icofont-heart-beat"></i><br>팔로우 취소 </a>
                  <a href="resources/assets/img/chefs/chefs-1.jpg" class="venobox" data-gall="gallery-item"><br></a>
                </div>
              </div>
            </div>
          </div>
		</c:forEach>
		</c:if>
        <script>
		        $('.deleteFollow').click(function(){
		        	var customerId = "${loginCustomer.customerId}";
		            var artistId = $(this).attr("id");
		            console.log(customerId);
		            console.log(artistId);
		            var con = confirm(artistId + "의 팔로우를 취소하시겠습니까?");
		            if(con == true){
		            $.ajax({
	    				type: "post",
	    				url: "/deletefollow.na",
	    				data: {
	    					"customerId" : customerId,
	    					"artistId" : artistId
	    				},
	    				success: function (res) {
	    					if(res.length>0){
	    						$("#form"+artistId).remove();
	    						alert(res + "의 팔로잉가 삭제 되었습니다.");
	    						console.log("#form"+artistId);
	    						
	    					}
	    				}
	    			})
		           }else{
		        	   return false;
		           }
		        });
        	
        	
        </script>

        </div>

      </div>
      </div>
	</section> 
	<!-- ======= 팔로잉 끝 ======= -->

    <!-- ======= 리뷰 ======= -->
    <section id="review" class="specials">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>My</h2>
          <p>Review</p>
        </div>

				
        <div class="row" data-aos="fade-up" data-aos-delay="100">
          <div class="col-lg-3">
            <ul class="nav nav-tabs flex-column">
            	<c:forEach items="${rList }" var="review" varStatus="status">
            	 	<c:if test="${status.index eq 0 }">
            	 	<li class="nav-item">
            	 		<a class="nav-link active show" data-toggle="tab" href="#tab-${review.reviewCode }">${status.index + 1 }번째 리뷰 <span>&nbsp;&nbsp;&nbsp;&nbsp;<button class="modify active btn-sm" data-toggle="modal" data-target="#modifyReview">수정</button> &nbsp;&nbsp;&nbsp;<button class="modify active btn-sm">삭제</button></span></a> 
            	 	</li>
            	 	</c:if>
            		<c:if test="${status.index ne 0 }">
            		<li class="nav-item">
            	 		<a class="nav-link" data-toggle="tab" href="#tab-${review.reviewCode }">${status.index + 1 }번째 리뷰 <span>&nbsp;&nbsp;&nbsp;&nbsp;<button class="modify btn-sm" data-toggle="modal" data-target="#modifyReview">수정</button> &nbsp;&nbsp;&nbsp;<button class="modify btn-sm">삭제</button></span></a>
            	 	</li>
            	 	</c:if>
            	</c:forEach>
            </ul>
          </div>

          <div class="col-lg-9 mt-4 mt-lg-0">
            <div class="tab-content">
              <c:forEach items="${rList }" var="review" varStatus="status">
	              <c:if test="${status.index eq 0 }">
		              <div class="tab-pane active show" id="tab-${review.reviewCode }">
		                <div class="row">
		                  <div class="col-lg-8 details order-2 order-lg-1">
		                  	<div id="star${review.reviewCode }">
		                  		<span style="color:yellow" id="grade1"><i class="far fa-star fa-2x"></i></span>
			                  	<span style="color:yellow" id="grade2"><i class="far fa-star fa-2x"></i></span>
			                  	<span style="color:yellow" id="grade3"><i class="far fa-star fa-2x"></i></span>
			                  	<span style="color:yellow" id="grade4"><i class="far fa-star fa-2x"></i></span>
			                  	<span style="color:yellow" id="grade5"><i class="far fa-star fa-2x"></i></span>
		                  	</div>
		                  	<script>
								 $(function(){
									 $("#star${review.reviewCode }").children("#grade${review.reviewStar}").prevAll().children().attr("class","fas fa-star fa-2x");
									 $("#star${review.reviewCode }").children("#grade${review.reviewStar}").children().attr("class","fas fa-star fa-2x");
								 }) 
							 </script>
		                  	<br>
		                    <h5>${review.reviewContents }</h5>
		                  </div>
		                  <div class="col-lg-4 text-center order-1 order-lg-2">
		                  	<!-- 경로 나중에 바꿔주기 -->
		                  	<c:if test="${review.reviewPhoto ne null}">
		                  	  <img src="resources/artistProfile/${review.reviewPhoto }" alt="" class="img-fluid">
		                    </c:if>
		                  </div>
		                </div>
		              </div>
	              </c:if>
	              <c:if test="${status.index ne 0 }">
	              	  <div class="tab-pane" id="tab-${review.reviewCode }">
		                <div class="row">
		                  <div class="col-lg-8 details order-2 order-lg-1">
		                  	<div id="star${review.reviewCode }">
		                  		<span style="color:yellow" id="grade1"><i class="far fa-star fa-2x"></i></span>
			                  	<span style="color:yellow" id="grade2"><i class="far fa-star fa-2x"></i></span>
			                  	<span style="color:yellow" id="grade3"><i class="far fa-star fa-2x"></i></span>
			                  	<span style="color:yellow" id="grade4"><i class="far fa-star fa-2x"></i></span>
			                  	<span style="color:yellow" id="grade5"><i class="far fa-star fa-2x"></i></span>
		                  	</div>
							 <script>
								 $(function(){
									 $("#star${review.reviewCode }").children("#grade${review.reviewStar}").prevAll().children().attr("class","fas fa-star fa-2x");
									 $("#star${review.reviewCode }").children("#grade${review.reviewStar}").children().attr("class","fas fa-star fa-2x");
								 }) 
							 </script>
		                  	<br>
		                    <h5>${review.reviewContents }</h5>
		                  </div>
		                  <div class="col-lg-4 text-center order-1 order-lg-2">
		                  	<!-- 경로 나중에 바꿔주기 -->
		                  	<c:if test="${review.reviewPhoto ne null}">
		                  	  <img src="resources/artistProfile/${review.reviewPhoto }" alt="" class="img-fluid">
		                    </c:if>
		                  </div>
		                </div>
		              </div>
	              </c:if>
              </c:forEach>
           </div>
		 </div>
       </div>
		<script>
		$(function(){
				 $(".modify").hide();
				 $(".active").show();
				})
						
			$(".nav-item").on("click",function(){
				$(".modify").hide();
				$(this).find("span").children().show();
			});
		</script>																																																																																		/div>
    </section>
    <!-- 리뷰 끝 -->

 

		<!-- 리뷰 수정 모달 -->
		<div class="modal fade" id="modifyReview" tabindex="-1" role="dialog"
			aria-labelledby="ARTIST_TITLE" aria-hidden="true" style="">
			<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl" role="document" >
				<!-- 센터모달창 추가  modal-dialog-centered -->
				<div class="modal-content" style="background-color: rgba(255, 255, 255, 0.4);">
					<div class="modal-header">
						<h5 class="modal-title" id="TEST">
							<b>리뷰 정보</b>
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
				              MY PROFILE 
				              <input type="file" class="form-control artistmodalProfileName" name="uploadFile"> 
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
				        </form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">CLOSE</button>
					</div>
				</div>
			</div>
		</div> 
		<!-- 리뷰 수정 모달 끝-->
  	<footer>
		 <jsp:include page="../common/footer.jsp"/>  	 
  	</footer>
</body>

			<script>
			$(function() {
					$(".address").postcodifyPopUp();
				})
		</script>
</html>


 
<!--      ======= Specials Section =======
    <section id="specials" class="specials">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Specials</h2>
          <p>Check Our Specials</p>
        </div>

        <div class="row" data-aos="fade-up" data-aos-delay="100">
          <div class="col-lg-3">
            <ul class="nav nav-tabs flex-column">
              <li class="nav-item">
                <a class="nav-link active show" data-toggle="tab" href="#tab-1">Modi sit est</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#tab-2">Unde praesentium sed</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#tab-3">Pariatur explicabo vel</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#tab-4">Nostrum qui quasi</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#tab-5">Iusto ut expedita aut</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#tab-6">Iusto ut expedita aut</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#tab-7">Iusto ut expedita aut</a>
              </li>

            </ul>
          </div>
          <div class="col-lg-9 mt-4 mt-lg-0">
            <div class="tab-content">
              <div class="tab-pane active show" id="tab-1">
                <div class="row">
                  <div class="col-lg-8 details order-2 order-lg-1">
                    <h3>Architecto ut aperiam autem id</h3>
                    <p class="font-italic">Qui laudantium consequatur laborum sit qui ad sapiente dila parde sonata raqer a videna mareta paulona marka</p>
                    <p>Et nobis maiores eius. Voluptatibus ut enim blanditiis atque harum sint. Laborum eos ipsum ipsa odit magni. Incidunt hic ut molestiae aut qui. Est repellat minima eveniet eius et quis magni nihil. Consequatur dolorem quaerat quos qui similique accusamus nostrum rem vero</p>
                  </div>
                  <div class="col-lg-4 text-center order-1 order-lg-2">
                    <img src="resources/assets/img/specials-1.png" alt="" class="img-fluid">
                  </div>
                </div>
              </div>
              <div class="tab-pane" id="tab-2">
                <div class="row">
                  <div class="col-lg-8 details order-2 order-lg-1">
                    <h3>Et blanditiis nemo veritatis excepturi</h3>
                    <p class="font-italic">Qui laudantium consequatur laborum sit qui ad sapiente dila parde sonata raqer a videna mareta paulona marka</p>
                    <p>Ea ipsum voluptatem consequatur quis est. Illum error ullam omnis quia et reiciendis sunt sunt est. Non aliquid repellendus itaque accusamus eius et velit ipsa voluptates. Optio nesciunt eaque beatae accusamus lerode pakto madirna desera vafle de nideran pal</p>
                  </div>
                  <div class="col-lg-4 text-center order-1 order-lg-2">
                    <img src="resources/assets/img/specials-2.png" alt="" class="img-fluid">
                  </div>
                </div>
              </div>
              <div class="tab-pane" id="tab-3">
                <div class="row">
                  <div class="col-lg-8 details order-2 order-lg-1">
                    <h3>Impedit facilis occaecati odio neque aperiam sit</h3>
                    <p class="font-italic">Eos voluptatibus quo. Odio similique illum id quidem non enim fuga. Qui natus non sunt dicta dolor et. In asperiores velit quaerat perferendis aut</p>
                    <p>Iure officiis odit rerum. Harum sequi eum illum corrupti culpa veritatis quisquam. Neque necessitatibus illo rerum eum ut. Commodi ipsam minima molestiae sed laboriosam a iste odio. Earum odit nesciunt fugiat sit ullam. Soluta et harum voluptatem optio quae</p>
                  </div>
                  <div class="col-lg-4 text-center order-1 order-lg-2">
                    <img src="resources/assets/img/specials-3.png" alt="" class="img-fluid">
                  </div>
                </div>
              </div>
              <div class="tab-pane" id="tab-4">
                <div class="row">
                  <div class="col-lg-8 details order-2 order-lg-1">
                    <h3>Fuga dolores inventore laboriosam ut est accusamus laboriosam dolore</h3>
                    <p class="font-italic">Totam aperiam accusamus. Repellat consequuntur iure voluptas iure porro quis delectus</p>
                    <p>Eaque consequuntur consequuntur libero expedita in voluptas. Nostrum ipsam necessitatibus aliquam fugiat debitis quis velit. Eum ex maxime error in consequatur corporis atque. Eligendi asperiores sed qui veritatis aperiam quia a laborum inventore</p>
                  </div>
                  <div class="col-lg-4 text-center order-1 order-lg-2">
                    <img src="resources/assets/img/specials-4.png" alt="" class="img-fluid">
                  </div>
                </div>
              </div>
              <div class="tab-pane" id="tab-5">
                <div class="row">
                  <div class="col-lg-8 details order-2 order-lg-1">
                    <h3>Est eveniet ipsam sindera pad rone matrelat sando reda</h3>
                    <p class="font-italic">Omnis blanditiis saepe eos autem qui sunt debitis porro quia.</p>
                    <p>Exercitationem nostrum omnis. Ut reiciendis repudiandae minus. Omnis recusandae ut non quam ut quod eius qui. Ipsum quia odit vero atque qui quibusdam amet. Occaecati sed est sint aut vitae molestiae voluptate vel</p>
                  </div>
                  <div class="col-lg-4 text-center order-1 order-lg-2">
                    <img src="resources/assets/img/specials-5.png" alt="" class="img-fluid">
                  </div>
                </div>
              </div>
              
              <div class="tab-pane" id="tab-6">
                <div class="row">
                  <div class="col-lg-8 details order-2 order-lg-1">
                    <h3>Fuga dolores inventore laboriosam ut est accusamus laboriosam dolore</h3>
                    <p class="font-italic">Totam aperiam accusamus. Repellat consequuntur iure voluptas iure porro quis delectus</p>
                    <p>Eaque consequuntur consequuntur libero expedita in voluptas. Nostrum ipsam necessitatibus aliquam fugiat debitis quis velit. Eum ex maxime error in consequatur corporis atque. Eligendi asperiores sed qui veritatis aperiam quia a laborum inventore</p>
                  </div>
                  <div class="col-lg-4 text-center order-1 order-lg-2">
                    <img src="resources/assets/img/specials-4.png" alt="" class="img-fluid">
                  </div>
                </div>
              </div>
              
              <div class="tab-pane" id="tab-7">
                <div class="row">
                  <div class="col-lg-8 details order-2 order-lg-1">
                    <h3>Fuga dolores inventore laboriosam ut est accusamus laboriosam dolore</h3>
                    <p class="font-italic">Totam aperiam accusamus. Repellat consequuntur iure voluptas iure porro quis delectus</p>
                    <p>Eaque consequuntur consequuntur libero expedita in voluptas. Nostrum ipsam necessitatibus aliquam fugiat debitis quis velit. Eum ex maxime error in consequatur corporis atque. Eligendi asperiores sed qui veritatis aperiam quia a laborum inventore</p>
                  </div>
                  <div class="col-lg-4 text-center order-1 order-lg-2">
                    <img src="resources/assets/img/specials-4.png" alt="" class="img-fluid">
                  </div>
                </div>
              </div>
              
            </div>
          </div>
        </div>

      </div>
    </section>End Specials Section -->
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