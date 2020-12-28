<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <link href="resources/images/tugcat.png" rel="shortcut icon">
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
  
  
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a8e5007416460a5bee56aaba2bb1ea6d&libraries=services"></script>
  
  

<style>
   header {
      height: 180px;
   }
 
 .modify{
  background: #b78839;
  border: 0;
  padding: 10px 35px;
  color: #fff;
  transition: 0.4s;
  border-radius: 50px;	
 }
 .delete{
  background: #b78839;
  border: 0;
  padding: 10px 35px;
  color: #fff;
  transition: 0.4s;
  border-radius: 50px;	
 }
 .res{
  border-radius: 0;
  box-shadow: none;
  font-size: 14px;
  background: #0c0b09;
  border-color: #625b4b;
  color: white;
 }      
 
 input[type=password] {
        font-family: "나눔스퀘어 아닐때 쓸 글꼴";
        
        &::placeholder {
        	font-family: "NanumSquare";
        }
    }
 
     .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px; color:black; font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}


.resTable th {border-bottom: 0.01px solid dimgrey;width: 800px;padding: 10px;}
.resTable td {padding: 20px;width: 800px;}
.resTable {
    border-spacing: 10px;
    border-top: 0.6px solid #cda45e;
    border-bottom: 0.6px solid #cda45e;
    text-align: center;
}
#res:hover {
	background: #cda45e;
}

.detailTable th { width: 800px; padding: 10px; }

#detailTh{
border-bottom: 0.01px solid #cda45e; width: 800px; padding: 10px;
}
.detailTable td {
padding: 20px;
width: 800px;
}
.detailTable {
	border-spacing: 10px;
    border-top: 0.6px solid #cda45e;
    border-bottom: 0.6px solid #cda45e;
    text-align: center;
}

	.btnA{
	background: #b78839;
    border: 0;
    padding: 10px; 10px;
    color: #fff;
    transition: 0.4s;
    border-radius: 10px;
    }
    #modal-center{
    	padding-left: 30%;
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
          <li><a href="artistList.na">ARTIST</a></li>
          <li></li>
          <li></li>
          <li><a href="customDesignList.na" style="text-align: center">Customized<br>Tatto</a></li>
          <li></li>
          <li></li>
          <li><a href="notice.na">NOTICE</a></li>
          <li></li>
          <li></li>
          <li><a href="/qna.na">Q&A</a></li>
        </ul>
      </nav><!-- .nav-menu -->
    </div>
    	<!-- 고객 프로필 헤더! -->
       <div class="profile container d-flex align-items-center" style="float:left;">
       <div style="width:35%; float:left;"></div>
     <nav class="nav-menu d-none d-lg-block" data-aos="fade-in">
        <h2 class="text-light" style="margin-left:25px;">${ artistInfo.name }</h2>
         <button type="button" class="mobile-nav-toggle d-xl-none"><i class="icofont-navigation-menu"></i></button>    
          <!-- 고객 프로필 메뉴바 -->
        <ul style="list-style : none;">
             
        	<li><a href="#mypage" ><i class="icofont-page"></i><span>맨 위로</span></li>
          	<li><a href="#modifyInfo" ><i class="bx bx-user"></i><span>정보 수정</span></a></li>
          	<li><a href="#following"><i class="icofont-heart"></i><span>팔로잉</span></a></li>
          	<li><a href="#reservationTable"><i class="icofont-calendar"></i> 예약</a></li>
          	<li><a href="#review"><i class="bx bx-file-blank"></i><span>리뷰</span></a></li>
          	<li><a href="/chatting.na"><i class="bx bx-envelope"></i> 채팅</a></li>
          	<li><a href="" onclick="deleteCustomer()" data-toggle="modal"><i class="icofont-crying"></i> 탈퇴</a></li>    
        </ul>            
        </nav><!-- .nav-menu -->
      </div>      
  </div>
  
  <script>
  	function deleteCustomer(){
  		var yes = confirm("정말 탈퇴 하시겠습니까?");
  		if(yes == true){
  			var yes2 = confirm("정말요?");
	  			if(yes2 == true){
	  				alert("탈퇴가 완료되었습니다");
	  				location.href="/deleteCustomer.na?customerId=${loginCustomer.customerId}";
	  			}
  		}
  	}
  </script>
</header>  
												<!--=========== 헤더 끝  ============-->   
												<!--=============섹션 시작=============  -->
    
    <!--============ 아티스트 소개 섹션 ==========  -->
     <section class="about">
      <div class="container" data-aos="fade-up" id="mypage">

        <div class="row">
          <div class="col-lg-6 order-1 order-lg-2" data-aos="zoom-in" data-aos-delay="100">
            <div class="about-img">
            	<c:if test="${ loginCustomer.customerProfile ne null}">
              <img src="resources/customerProfile/${loginCustomer.customerId }/${ loginCustomer.customerProfile }" alt="" alt="" style="width: 600px; height:500px;">
              </c:if>
              <c:if test="${ loginCustomer.customerProfile eq null}">
              <img src="resources/artistInfoFile/Profile/NATTAprofile.png" alt="" style="width: 540px; height:403px;">    
              </c:if>
            </div>
          </div>
          <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content">
            <h3>Customer Info </h3>
            <p class="font-italic">
            <i class="icofont-ui-user"> 이름 : ${ loginCustomer.customerName }</i> <br>
            <i class="icofont-id"> 아이디   : ${ loginCustomer.customerId }</i><br>
            <i class="icofont-smart-phone"> 핸드폰 : ${ loginCustomer.phone }</i> <br>
            <i class="icofont-email"> 이메일 : ${loginCustomer.email }</i> <br>
            <i class="icofont-wall-clock"> 가입날짜 : ${loginCustomer.enrollDate }</i><br>
            <i class="icofont-ui-home"> 주소 : 
            
               <c:forTokens items="${loginCustomer.address }" var="addr" delims="," varStatus="status">
               <c:if test="${status.index eq 1}">
                  ${addr }
               </c:if>
               <c:if test="${status.index eq 2}">
                  ${addr }
               </c:if>      
               </c:forTokens>
            </i>
            
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
            
               <div class="modal-body book-a-table" >
               <div class="container">
                  <div class="section-title">
                      <h2>Modify</h2>
         			   <p>Info</p>
                    </div>
                   <form action="/modifyCustomerInfo.na" 
                  method="post" role="form" class="php-email-form"  enctype="multipart/form-data" onsubmit="return dup();">
                      <div style="margin-left: 330px;">
                      <!-- 아이디 -->
                        <div class="col-lg-7 col-md-6 form-group">
                             아이디
                          <input type="text" value="${ loginCustomer.customerId }" name="customerId" class="form-control"  placeholder="Your Name" readonly>
                          <div class="validate"></div>
                        </div>
                        <!-- 이름 -->
                        <div class="col-lg-7 col-md-6 form-group">
                             이름  
                          <input type="text" value="${ loginCustomer.customerName }" name="customerName" class="form-control"  placeholder="Your Name" readonly>

                          <div class="validate"></div>
                        </div>                      
                                                  
                        <!-- 비밀번호 확인  -->
                        <div class="col-lg-7 col-md-6 form-group">
                             현재 비밀번호 
                          <input type="password"  name="dupPwd" class="form-control" id="dupPwd" placeholder="Password">
                          <div class="validate"></div>
                        </div>
                           
                        <!-- 비밀번호 입력 -->
                        <div class="col-lg-7 col-md-6 form-group">
                             수정할 비밀번호
                         <input type="password" name="password" class="form-control" id="password" placeholder="Enter Password" >
                         <input type="password" name="confirmPassowrd" class="form-control" id="confirmPassowrd" placeholder="Confirm Password">
                          <div class="validate"></div>
                        </div>
                        <!-- 프로필사진 업로드-->
                        <div class="col-lg-7 col-md-3 form-group">
                             프로필 사진 변경 
                          <input type="file" class="form-control" name="uploadFile" style="float: left">  
                          <div class="validate"></div>
                        </div><br>
                         <!-- 핸드폰  -->
                        <div class="col-lg-7 col-md-6 form-group">
                              휴대폰
                           <input type="text" name="phone" value="${ loginCustomer.phone }"class="form-control" id="phone" placeholder="Your Phone" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
                        </div>   
                        <!-- 이메일  -->
                        <div class="col-lg-7 col-md-6 form-group">
                              이메일
                           <input type="email" name="email" value="${ loginCustomer.email }"class="form-control" id="email" placeholder="Your Phone" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
                        </div> 
                        <!-- 근무지주소 -->
                        <div class="col-lg-7 col-md-6 form-group">
                           주소<br>                           
                        <c:forTokens items="${loginCustomer.address }" var="addr" delims="," varStatus="status">
                              <c:if test="${status.index eq 0}">
                               <input type="text" name="post" value="${addr }" class=" postcodify_postcode5 address" id="address" placeholder="Your WorkAddress">
                              </c:if>
                              <c:if test="${status.index eq 1}">
                              <input type="text" name="address1" value="${addr }" class="form-control postcodify_address address">
                              </c:if>
                              <c:if test="${status.index eq 2}">
                              <input type="text" name="address2" value="${addr }" class="form-control postcodify_extra_info">
                              </c:if>      
                           </c:forTokens>

                          <div class="validate"></div>
                        </div>                                                                                                                 
                      </div>
                      <input type="hidden" name="orginalFileName" value="${ loginCustomer.customerProfile }">
                      <div class="mb-3">
                        <div class="loading">Loading</div>
                      </div>
                      <div class="text-center"><button type="submit" >수정하기</button></div>
                    </form>
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
              	<img src="resources/artistInfoFile/Profile/${follow.myReprofile }" class="img-fluid" alt="" style="width:400px; height:350px;">
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
	
	
  <section id="reservationTable" class="specials">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>My</h2>
          <p>Reservation</p>
        </div>
        <div class="row" data-aos="fade-up" data-aos-delay="100">
        	<table class="resTable" style="color : white;">
			 <thead>
			   <tr style="text-align: center;">
			      <th>아티스트 샵</th>
			      <th>아티스트 명</th>
			      <th>예약 스타일</th>
			      <th>예약 날짜</th>
			      <th>예약 상태</th>
			      <th>상세보기</th>
			   </tr>
			 </thead>
			 <tbody>
			<c:forEach items="${resList }" var="res" >
				<tr style="text-align: center;" id="res">
			      <td id="shopName${res.reservationCode }">${res.shopName }</td>
			      <td id="artistName${res.reservationCode }">${res.artistName }</td>
			      <td id="style${res.reservationCode }">${res.style }</td>
			      <td id="reservationDate${res.reservationCode }">${res.reservationDate }</td>
			      <input type="hidden" value="${res.originalFilename }" id="originalImg${res.reservationCode }">
			      <input type="hidden" value="${res.renameFilename }" id="resImg${res.reservationCode }">
			      <input type="hidden" value="${res.tattooSize }" id="tattooSize${res.reservationCode }">
			      <input type="hidden" value="${res.price }" id="price${res.reservationCode }">
			      <input type="hidden" value="${res.part }" id="part${res.reservationCode }">
			      <input type="hidden" value="${res.status}" id="status${res.reservationCode }">
			      <input type="hidden" value="${res.artistId}" id="artistId${res.reservationCode }">
			      <input type="hidden" value="${res.reservationTime}" id="reservationTime${res.reservationCode }">
				 <input type="text" value="${res.address }" id="addr${res.reservationCode }">
			 	 <input type="hidden" value="${res.artistProfile }" id="artistProfile${res.reservationCode }">
			      <c:if test="${res.status eq 0}"><td >예약 대기</td></c:if>
			      <c:if test="${res.status eq 1}"><td>예약 확정</td></c:if>			      
			      <c:if test="${res.status eq 2}"><td>타투 완료</td></c:if>			      
			      <td><button value="${res.reservationCode }" class="detail btnA">상세보기</button></td>
			   </tr>
			</c:forEach>
			 </tbody> 
			</table>
       </div>
      </div>
																																																																														
    </section>
    <!-- ======= 리뷰 ======= -->
    <section id="review" class="specials">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>My</h2>
          <p>Review</p>
        </div>
        <c:if test="${empty rList }">
            등록된 리뷰가 없습니다.
        </c:if>
      <c:if test="${!empty rList }">
        <div class="row" data-aos="fade-up" data-aos-delay="100">
          <div class="col-lg-3">
            <ul class="nav nav-tabs flex-column">
               <c:forEach items="${rList }" var="review" varStatus="status">
                   <c:if test="${status.index eq 0 }">
                   <li class="nav-item" id="item${review.reviewCode }">
                      <a class="nav-link active show" data-toggle="tab" href="#tab-${review.reviewCode }">${status.index + 1 }번째 리뷰 <span>&nbsp;&nbsp;&nbsp;&nbsp;<button class="modify active btn-sm" value="tab-${review.reviewCode }" data-toggle="modal" data-target="#modifyReview">수정</button> &nbsp;&nbsp;&nbsp;<button value="${review.reviewCode }" class="delete active btn-sm">삭제</button></span></a> 
                   </li>
                   </c:if>
                  <c:if test="${status.index ne 0 }">
                  <li class="nav-item" id="item${review.reviewCode }">
                      <a class="nav-link" data-toggle="tab" href="#tab-${review.reviewCode }">${status.index + 1 }번째 리뷰 <span>&nbsp;&nbsp;&nbsp;&nbsp;<button class="modify btn-sm" data-toggle="modal" value="tab-${review.reviewCode }" data-target="#modifyReview">수정</button> &nbsp;&nbsp;&nbsp;<button value="${review.reviewCode }" class="delete btn-sm">삭제</button></span></a>
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
		                  		<span style="color:#cda45e" id="grade1"><i class="far fa-star fa-2x"></i></span>
			                  	<span style="color:#cda45e" id="grade2"><i class="far fa-star fa-2x"></i></span>
			                  	<span style="color:#cda45e" id="grade3"><i class="far fa-star fa-2x"></i></span>
			                  	<span style="color:#cda45e" id="grade4"><i class="far fa-star fa-2x"></i></span>
			                  	<span style="color:#cda45e" id="grade5"><i class="far fa-star fa-2x"></i></span>
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
		                  	<input type="hidden" value="${review.artistId }" class="artistId">
		                    <input type="hidden" value="${review.reviewStar }" class="reviewStar">
		                    <input type="hidden" value="${review.reviewCode }" class="reviewCode">
		                    <input type="hidden" value="${review.reviewContents }" class="reviewContents">
		                  	<c:if test="${review.reviewPhoto ne null}">
		                  	  <img src="resources/review/${review.reviewCode}/${review.reviewPhoto }" alt="" class="img-fluid">
		                  	  <input type="hidden" value="${review.reviewPhoto }" class="reviewPhoto" id="reviewPhoto${review.reviewCode }">
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
		                  		<span style="color:#cda45e" id="grade1"><i class="far fa-star fa-2x"></i></span>
			                  	<span style="color:#cda45e" id="grade2"><i class="far fa-star fa-2x"></i></span>
			                  	<span style="color:#cda45e" id="grade3"><i class="far fa-star fa-2x"></i></span>
			                  	<span style="color:#cda45e" id="grade4"><i class="far fa-star fa-2x"></i></span>
			                  	<span style="color:#cda45e" id="grade5"><i class="far fa-star fa-2x"></i></span>
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
		                  	<c:if test="${review.reviewPhoto ne null}">
		                  	  <img src="resources/review/${review.reviewCode}/${review.reviewPhoto }" alt="" class="img-fluid">
		                  	  <input type="hidden" value="${review.reviewPhoto }" class="reviewPhoto" id="reviewPhoto${review.reviewCode }">
		                    </c:if>
		                    <input type="hidden" value="${review.artistId }" class="artistId">
		                    <input type="hidden" value="${review.reviewStar }" class="reviewStar">
		                    <input type="hidden" value="${review.reviewCode }" class="reviewCode">
		                    <input type="hidden" value="${review.reviewContents }" class="reviewContents">
		                  </div>
		                </div>
		              </div>
	              </c:if>
              </c:forEach>
              
           </div>
       </div>
       </div>
       </c:if>
       </div>

      <script>
      $(function(){
             $(".modify").hide();
             $(".delete").hide();
             $(".active").show();
            })
                  
         $(".nav-item").on("click",function(){
            $(".modify").hide();
            $(".delete").hide();
            $(this).find("span").children().show();
         });
      </script>                                                                                                                                                                                                                                             
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
					<div class="modal-body book-a-table" >
						<form action="/modifyReview.na" 
						method="post" role="form" class="php-email-form modalActionCheck" data-aos="fade-up" data-aos-delay="100" enctype="multipart/form-data">
				          <div style="width: 50%; float: left; padding-left: 50px;">
				         	<!-- 타투샵이름 -->
				            <div class="col-lg-8 col-md-8 form-group">
				              	타투샵 명
				              <input type="text" value="" name="artistId" class="form-control artistShopName" id="artistId" readonly>
				              <input type="hidden" value="" name="reviewCode" id="reviewCode">
				              <div class="validate"></div>
				            </div>
				            <!-- 리뷰사진 업로드-->
				            <div class="col-lg-8 col-md-8 form-group">
				              	리뷰 사진 
				              <input type="file" class="form-control artistmodalProfileName" name="uploadFile" id="reviewModifyUplodFile"> 
				              <input type="hidden" name="originFile" id="originFile" value="">
				            </div>
				            <!-- 리뷰 내용  -->
				            <div class="form-group" style="padding-left: 10px;">
				            <div id="star">
		                  		<span style="color:#cda45e"><i class="far fa-star fa-2x grade" id="1"></i></span>
			                  	<span style="color:#cda45e"><i class="far fa-star fa-2x grade" id="2"></i></span>
			                  	<span style="color:#cda45e"><i class="far fa-star fa-2x grade" id="3"></i></span>
			                  	<span style="color:#cda45e"><i class="far fa-star fa-2x grade" id="4"></i></span>
			                  	<span style="color:#cda45e"><i class="far fa-star fa-2x grade" id="5"></i></span>
			                  	<input type="hidden" name="reviewStar" id="reviewStar" value="">
		                  	</div>
				               	리뷰 내용 
				               <textarea class="form-control artistmodalInfo" id="reviewContents" name="reviewContents" cols="10" rows="5" style="resize: none; width: 400px;"></textarea>
				               <div class="validate"></div>
				            </div>			
				            
				            <div class="text-right"><button type="submit">리뷰 수정</button></div>	            				            
				          </div>
				          <div class="mb-3">
				            <div class="loading">Loading</div>
				          </div>
				          
				        </form>
				        <div style="float: left; width: 50%;">
							<img src="" id="modifyReviewPhoto" style="width : 500px; height: 380px;">
				        </div>
					</div>
					
						
				</div>
			</div>
		</div> 
		<!-- 리뷰 수정 모달 끝-->
		

		
		
						<!-- 리뷰 작성 -->
		<div class="modal fade" id="insertReviewModal" tabindex="-1" role="dialog"
			aria-labelledby="ARTIST_TITLE" aria-hidden="true" style="">
			<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl" role="document" >
			
			
				<!-- 센터모달창 추가  modal-dialog-centered -->
				<div class="modal-content" style="background-color: rgba(255, 255, 255, 0.4);">
					<div class="modal-header">
						<h5 class="modal-title" id="TEST" >
							<b>리뷰 정보</b>
						</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body book-a-table">
						<form action="/insertReview.na" 
						method="post" role="form" class="php-email-form modalActionCheck" data-aos="fade-up" data-aos-delay="100" enctype="multipart/form-data">
				          <div style="width: 50%; float: left; padding-left: 50px;">
				         	<!-- 타투샵이름 -->
				            <div class="col-lg-8 col-md-8 form-group">
				              	타투샵 명 
				              <input type="text" value="" name="shopName" class="form-control artistShopName" id="insertShopName" readonly>
				              <input type="hidden" value="" name="reservationCode" id="insertReservationCode">
				              <input type="hidden" value="" name="artistId" id="insertArtistId">
				              <div class="validate"></div>
				            </div>
				            <!-- 리뷰사진 업로드-->
				            <div class="col-lg-8 col-md-8 form-group">
				              	리뷰 사진 
				              <input type="file" class="form-control artistmodalProfileName" name="uploadFile" id="insertReviewFile"> 
				            </div>
				            <!-- 리뷰 내용  -->
				            <div class="form-group" style="padding-left: 10px;">
				            <div id="star">
		                  		<span style="color:#cda45e" id="istar1"><i class="far fa-star fa-2x igrade 1" id="1"></i></span>
			                  	<span style="color:#cda45e" id="istar2"><i class="far fa-star fa-2x igrade 2" id="2"></i></span>
			                  	<span style="color:#cda45e" id="istar3"><i class="far fa-star fa-2x igrade 3" id="3"></i></span>
			                  	<span style="color:#cda45e" id="istar4"><i class="far fa-star fa-2x igrade 4" id="4"></i></span>
			                  	<span style="color:#cda45e" id="istar5"><i class="far fa-star fa-2x igrade 5" id="5"></i></span>
			                  	<input type="hidden" name="reviewStar" id="ireviewStar" value="">
		                  	</div>
				               	리뷰 내용 
				               <textarea class="form-control artistmodalInfo" id="insertReviewContents" name="reviewContents" cols="600" rows="5" style="resize: none; width: 400px;"></textarea>
				               <div class="validate"></div>
				            </div>	
				            <div class="text-right"><button type="submit">리뷰 작성</button></div>			            				            
				          </div>

				          <div class="mb-3">
				            <div class="loading">Loading</div>
				          </div>

				        </form>
				        
				        <div id="insertImg" style="float: left; width: 50%;">
					    </div>
					</div>
				</div>
			</div>
		</div> 
		<!--  -->
		
 
    
    
      
    	<!-- 예약 디테일 뷰-->
    	<form action="/deleteResvertion.na" method="post" role="form" class="php-email-form modalActionCheck" enctype="multipart/form-data" onsubmit="return checkDelete();">
		<div class="modal fade" id="detailReservation" tabindex="-1" role="dialog"
			aria-labelledby="ARTIST_TITLE" aria-hidden="true" style="">
			
			<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl" role="document">
				<!-- 센터모달창 추가  modal-dialog-centered -->
				<div class="modal-content" style="background-color: rgba(0, 0, 0, 0.8)">
					<div class="modal-header">
						<h5 class="modal-title" id="TEST">
							<b>예약 정보</b>
						</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					
					<div class="modal-body book-a-table">
					
					<div style="margin: 0 auto;">
						<input type="hidden" id="reservationCode" name="reservationCode">
				          <div>
				            <table class="detailTable">
				            <thead>
				            	<tr id="detailTh"><th colspan="2">고객님의 예약 정보입니다.</th></tr>
				            </thead>
				            	<tr>
				            		<th>타투샵 명</th>
				            		<td id="shopName"></td>
				            	</tr>
				            	<tr>
				            		<th>아티스트 명</th>
				            		<td id="artistName"></td>
				            	</tr>
				            	<tr>
				            		<th>예약 날짜/시간</th>
				            		<td id="reservationDate"></td>
				            	</tr>
				            	<tr>
				            		<th>부위</th>
				            		<td id="part"></td>
				            	</tr>
				            	<tr>
				            		<th>스타일</th>
				            		<td id="style"></td>
				            	</tr>
				            	<tr>
				            		<th>타투 사이즈</th>
				            		<td id="tattooSize"></td>
				            	</tr>
				            	<tr>
				            		<th>가격</th>
				            		<td id="price"></td>
				            	</tr>
				            </table>
				             
							
				            <div class="col form-group" style="margin-top:10px;">
				                   	디자인 사진
				                   	<span style="padding-left: 450px;">주소</span><br>
				            <div style="width: 1070px; height: 400px;">       	
				             <div style="float: left; width : 530px; height:400px;">
								<img src="" id="resImg" style="width: 530px; height:400px; float: left;">   
						    </div>
							<div id="map" style=" width: 530px; height: 400px; float: left; ">
							</div>
							</div>	           
				             </div>
				                        				            
				         
				          </div>
				           
				          
				          
				          </div>
				          
				          
				          </div>
					<div class="text-center">
				         <button type="button" id="resButton" class="resButton btnA"  style="margin-top:25px;">닫기</button>
				     </div>
				          
					</div>
				</div>
			
		</div> 
	</form>
  	<footer>
		 <jsp:include page="../common/footer.jsp"/>  	 
  	</footer>
</body>

        
         
         
			<script>
			$(function() {
					$(".address").postcodifyPopUp();
				})
		</script>
		
		
		<script>
			$(".detail").on("click",function(){
				
				var reservationCode = $(this).val();
				console.log(reservationCode)
				var shopName = $("#shopName"+reservationCode).text();
				var artistName = $("#artistName"+reservationCode).text();
				var style = $("#style"+reservationCode).text();
				var reservationDate = $("#reservationDate"+reservationCode).text();
				var reservationTime = $("#reservationTime"+reservationCode).val();
				var originalImg = $("#originalImg"+reservationCode).val();
				var resImg = $("#resImg"+reservationCode).val();
				var tattooSize = $("#tattooSize"+reservationCode).val();
				var price = $("#price"+reservationCode).val();
				var part = $("#part"+reservationCode).val();
				var status = $("#status"+reservationCode).val();
				var artistId = $("#artistId"+reservationCode).val();
				var addr =  $("#addr"+reservationCode).val();
				var artistProfile = $("#artistProfile"+reservationCode).val();
				console.log(addr);
				$("#shopName").text(shopName);
				$("#style").text(style);
				$("#artistName").text(artistName);
				$("#reservationDate").text(reservationDate +" " + reservationTime);
				$("#price").text(price);
				$("#tattooSize").text(tattooSize);
				$("#part").text(part);
				if(originalImg =='아티스트작품' ){
				$("#resImg").attr("src","resources/artistInfoFile/WorkFile/" + resImg);
				}else{
				$("#resImg").attr("src","/resources/images/ruploadFiles/" + resImg);
				}
				
				$("#reservationCode").val(reservationCode);
				if(status == 0){
					$(".resButton").text("예약 취소");
					$(".resButton").attr("value",reservationCode);
					$(".resButton").attr("id","deleteResvertion");
					$(".resButton").attr("data-dismiss","");
					$(".resButton").attr("aria-label","");
					$(".resButton").attr("type","submit");
					$(".resButton").attr("class","resButton btnA");
				}else if(status == 2){
					$(".resButton").empty();
					$(".resButton").text("리뷰 쓰기");
					$(".resButton").attr("value",reservationCode);
					$(".resButton").attr("id","insertReview");
					$(".resButton").attr("data-dismiss","");
					$(".resButton").attr("aria-label","");
					$(".resButton").attr("type","button");
					$(".resButton").attr("class","resButton btnA");
				}else{
					$(".resButton").empty();
					$(".resButton").text("닫기");
					$(".resButton").attr("value",reservationCode);
					$(".resButton").attr("data-dismiss","modal");
					$(".resButton").attr("aria-label","Close");
					$(".resButton").attr("type","button");
					$(".resButton").attr("class","resButton btnA");
				}
				
				$("#detailReservation").modal("show");
				
				mapRead(addr,artistProfile,shopName); 
				
				function checkDelete(){
					return confirm("예약을 취소하시겠습니까?");
				}
				/* 리뷰 추가 */
				$("#insertReview").on("click",function(){
					var reservation = $(this).val();
					$("#reservationCode").val(reservation);
					console.log(reservation);
					$("#detailReservation").modal("hide");
					$.ajax({
						type: "post",
						url: "/dupReview.na",
						data: {
							"reservationCode" : reservation
						},
						success: function (data) {
							if(data == "success"){
								$("#insertShopName").val(shopName);
								$("#insertArtistId").val(artistId);
								$("#insertReservationCode").val(reservation);
								$("#insertReviewModal").modal("show");
							}else{
								alert('이미 등록된 리뷰가 있습니다.');
							}
						}
					})
					
					
					$(".igrade").on("click", function(){
					var grade = $(this).attr("id");
					$(".igrade").attr("class","far fa-star fa-2x igrade");
					$("#ireviewStar").val(grade);
					$("#istar"+grade).prevAll().children().attr("class","fas fa-star fa-2x igrade");
					$(this).attr("class","fas fa-star fa-2x igrade");
					
				})
					
					
				});
			});
			
			

     
		</script>
		
		       <script>
		       
				 $(function(){
					 $("#star${review.reviewCode }").children("#grade${review.reviewStar}").prevAll().children().attr("class","fas fa-star fa-2x");
					 $("#star${review.reviewCode }").children("#grade${review.reviewStar}").children().attr("class","fas fa-star fa-2x");
				 }) 
				  /* 모달에 데이터 입력 바꾸기  */
				$(".modify").on("click",function(){
					var review = $(this).val();
					var artist = $("#"+review).find(".artistId").val();
					var reviewStar = $("#"+review).find(".reviewStar").val();
					var reviewCode = $("#"+review).find(".reviewCode").val();
					var reviewContents = $("#"+review).find(".reviewContents").val();
					var reviewPhoto = $("#"+review).find(".reviewPhoto").val();
					var path = "resources/review/"+reviewCode+ "/" + reviewPhoto;
					
					/* modifyReviewPhoto */
					/* resources/review/test1/3/20201217165410.jpg */
				
					$("#artistId").val(artist);
					$("#originFile").val(reviewPhoto);
					$("#reviewCode").val(reviewCode);
					$("#reviewContents").val(reviewContents);
					$("#"+reviewStar).parent().prevAll().children().attr("class","fas fa-star fa-2x grade");
					$("#"+reviewStar).attr("class","fas fa-star fa-2x grade");
					$("#reviewStar").val(reviewStar);
				    $("#modifyReviewPhoto").attr("src",path);
				})
				
				/* 별점 바꾸기  */
				$(".grade").on("click", function(){
					var grade = $(this).attr("id");
					$(".grade").attr("class","far fa-star fa-2x grade")
					$("#reviewStar").val(grade);
					$("#"+grade).parent().prevAll().children().attr("class","fas fa-star fa-2x grade");
					$(this).attr("class","fas fa-star fa-2x grade");
				})
				
				
				$(".delete").on("click",function(){
					 var con = confirm("리뷰를 삭제 하시겠습니까?");
					var reviewCode = $(this).val();
					var reviewPhoto = $("#reviewPhoto"+reviewCode).val();
					var customerId = "${loginCustomer.customerId}";
					
					
					if(con == true){
 					$.ajax({
						type: "post",
						url: "/deleteReview.na",
						data: {
							"reviewCode" : reviewCode,
							"reviewPhoto" : reviewPhoto,
							"customerId" : customerId
						},
						success: function (data) {
							if(data>0){
							$("#item"+data).remove();
							$("#tab-"+data).remove();
							alert("리뷰 삭제가 완료되었습니다.")
							}
						}
					})
					}
					
					


				})
				
					$(function() {
			            $("#reviewModifyUplodFile").on('change', function(){
			                readURL(this,"modify");
			            });
			            
			            $("#insertReviewFile").on('change', function(){
			            	$("#insertImg").empty();
			            	$("#insertImg").append('<img src="" id="insertReviewPhoto" style="width : 500px; height: 380px;">');
			            	readURL(this,"insert");
			            });
			            
			        });
			        function readURL(input,location) {
			            if (input.files && input.files[0]) {
			            var reader = new FileReader();
			            reader.onload = function (e) {
			                    $('#'+location+'ReviewPhoto').attr('src', e.target.result);
			                }
			              reader.readAsDataURL(input.files[0]);
			            }
     				  }
			</script>
			
	<script>
  	function mapRead(addr,artistProfile,shopName){
		
		$("#detailReservation").on("shown.bs.modal", function() {
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
			    };  
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			
			
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(addr, function(result, status) {
			
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });


                            
                          var    content='<div class="wrap">' + 
                             '    <div class="info">' + 
                             '        <div class="title">' + 
                             '            타투샵 : '+shopName+ 
                             '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
                             '        </div>' + 
                             '        <div class="body">' + 
                             '            <div class="img">' +
                             '                <img src="resources/artistInfoFile/Profile/'+artistProfile+'" width="100" height="100">' +
                             '           </div>' + 
                             '            <div class="desc">' + 
                             '                <div class="ellipsis">'+addr+'</div>' + 
                             '            </div>' + 
                             '        </div>' + 
                             '    </div>' +    
                             '</div>';
                        
                 var overlay = new kakao.maps.CustomOverlay({
                     content: content,
                     map: map,
                     position: marker.getPosition()       
                 });
                 // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                 map.setCenter(coords);
             } 
         });   
      
      
      })      
      
 
   } 

     
    var upload = document.querySelector('#reviewModifyUplodFile');
 
     /* FileReader 객체 생성 */
    var reader = new FileReader();
 
        /* reader 시작시 함수 구현 */
    reader.onload = (function () {
 
        this.image = document.createElement('img');
        var vm = this;
        
        return function (e) {
            /* base64 인코딩 된 스트링 데이터 */
            vm.image.src = e.target.result
        }
    })()
 
    upload.addEventListener('change',function (e) {
        var get_file = e.target.files;
 
        if(get_file){
            reader.readAsDataURL(get_file[0]);
        }
 
        preview.appendChild(image);
    })
   </script>
         
</html>