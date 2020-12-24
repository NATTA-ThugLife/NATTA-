<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>NATTA!</title>
<meta content="" name="descriptison">
<meta content="" name="keywords">
<link href="resources/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<!--CDN 링크 -->
<style>
header {height: 215px;}
#header {height: 175px;}
.artistPriceTable th {border-bottom: 0.01px solid dimgrey;width: 800px;padding: 10px;}
.artistPriceTable td {padding: 20px;width: 800px;}
.artistPriceTable {border-spacing: 10px;border-top: 0.6px solid #cda45e;border-bottom: 0.6px solid #cda45e;text-align: center;}
.artistPriceTable td:hover {color: #cda45e;}
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
						<span class="d-none d-lg-inline-block"><i
							class="icofont-clock-time icofont-rotate-180"></i> Mon-Sat: 11:00
							AM - 23:00 PM</span>
					</div>
					<div class="languages">
						<ul>
							<!--로그인 세션 비어있을 때 -->
							<c:if
								test="${empty sessionScope.loginCustomer && empty sessionScope.loginArtist  }">
								<li><a href="/login.na">LOGIN</a></li>
								<li><a href="/customerJoinView.na">SIGNUP</a></li>
							</c:if>
							<!-- 회원 로그인시 -->
							<c:if test="${!empty sessionScope.loginCustomer }">
								<li>${loginCustomer.customerName }님환영합니다.</li>
								<li><a href="/customerInfo.na?customerId=${loginCustomer.customerId }">MyPage&nbsp;&nbsp;</a></li>
								<li><a href="/customerLogout.na">LogOut</a></li>
							</c:if>
							<!-- 아티스트 로그인시 -->
							<c:if test="${!empty sessionScope.loginArtist }">
								<c:url var="artistInfoPage" value="artistInfoPage.na">
									<c:param name="artistId" value="${ loginArtist.artistId }" />
								</c:url>
								<li>${loginArtist.artistName }님환영합니다.</li>
								<li><a href="${ artistInfoPage }">ArtistMyPage&nbsp;&nbsp;</a></li>
								<li><a href="artistLogout.na">LogOut</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>

			<!-- ======= Header ======= -->
			<div class="container d-flex align-items-center">
				<h1 class="logo mr-auto">
					<a href="main.na">NATTA!</a>
				</h1>
				<nav class="nav-menu d-none d-lg-block">
					<ul>
						<li class="active"><a href="main.na">Home</a></li>
						<li></li>
						<li></li>
						<li><a href="#menu">ARTIST</a></li>
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
				</nav>
				<!-- .nav-menu -->
			</div>
			<!-- 아티스트 프로필 헤더! -->
			<div class="profile container d-flex align-items-center"
				style="margin-top: 10px;">

				<c:if test="${ artistInfo.myReProfile eq null }">
					<img src="resources/artistInfoFile/Profile/NATTAprofile.png" alt=""
						class="img-fluid rounded-circle"
						style="margin-left: 15px auto; display: block; width: 100px; height: 100px; border: 8px solid #2c2f3f;">
					<nav class="nav-menu d-none d-lg-block" data-aos="fade-in">
						<h4 class="text-light" style="margin-left: 25px;">타투숍 이름이
							없습니다.</h4>
						<button type="button" class="mobile-nav-toggle d-xl-none">
							<i class="icofont-navigation-menu"></i>
						</button>
						<!-- 아티스트 프로필 메뉴바 -->
						<ul style="list-style: none;">
							<c:if test="${ artistPageId eq loginArtist.artistId }">
								<li class="active"><a href="javascript:void(0);"
									data-toggle="modal" id="insertInfo"><i class="bx bx-home"></i><span>
											타투숍 소개</span></a></li>
								<li><a href="javascript:void(0);" data-toggle="modal"
									id="artistInfoWork"><i class="bx bx-book-content"></i> 내
										작품등록하기</a></li>
								<li><a href="#modalArtistPrice" data-toggle="modal"
									id="artistInfoPrice"><i class="bx bx-file-blank"></i><span>
											스타일별 가격</span></a></li>
							</c:if>
							<li><a
								href="reservation.na?artistId=${ artistInfo.artistId }"><i
									class="icofont-calendar"></i> Reservation</a></li>
							<li><a href="#resume"><i class="bx bx-user"></i><span>Resume</span></a></li>
							<li><a href="#contact"><i class="bx bx-envelope"></i>
									Contact</a></li>
						</ul>
					</nav>
					<!-- .nav-menu -->
				</c:if>

				<c:if test="${ artistInfo.myReProfile ne null }">
					<img
						src="resources/artistInfoFile/Profile/${ artistInfo.myReProfile }"
						alt="" class="img-fluid rounded-circle"
						style="margin-left: 15px auto; display: block; width: 100px; height: 100px; border: 8px solid #2c2f3f;">
					<nav class="nav-menu d-none d-lg-block" data-aos="fade-in">
						<h4 class="text-light" style="margin-left: 25px;">${ artistInfo.name }</h4>
						<button type="button" class="mobile-nav-toggle d-xl-none">
							<i class="icofont-navigation-menu"></i>
						</button>
						<!-- 아티스트 프로필 메뉴바 -->
						<ul style="list-style: none;">
							<c:if test="${ artistPageId eq loginArtist.artistId }">
								<li class="active"><a href="javascript:void(0);"
									data-toggle="modal" id="insertInfo"><i class="bx bx-home"></i><span>
											타투숍 소개</span></a></li>
								<li><a href="javascript:void(0);" data-toggle="modal"
									id="artistInfoWork"><i class="fas fa-pencil-alt"></i> 내
										작품등록하기</a></li>
								<li><a href="#modalArtistPrice" data-toggle="modal"
									id="artistInfoPrice"><i class="fas fa-hand-holding-usd"></i><span>
											스타일별 가격</span></a></li>
							</c:if>
							<li><a
								href="reservation.na?artistId=${artistInfo.artistId }"><i
									class="icofont-calendar"></i> Reservation</a></li>
									
									
							<li><a href="javascript:void(0);" id="rListModal"
							 data-toggle="modal"><i class="fas fa-bell"></i> <span>예약내역</span></a></li>












							
							
							
							
							
							<c:if test="${ artistPageId eq loginArtist.artistId }">
								<li><a href="/chatting.na"><i class="bx bx-envelope"></i>
										My Message</a></li>
							</c:if>
							<c:if test="${ artistPageId ne loginArtist.artistId }">
								<li><a href="/chatting.na?artistId=${artistPageId }"><i
										class="bx bx-envelope"></i> Contact</a></li>
							</c:if>
							<!-- javascript:void(0); 꽉 찬 하트 fas-->
							<c:if test="${follow ne null && empty sessionScope.loginArtist }">
								<li><a href="javascript:void(0);"
									onclick="deleteFollowing();" id="clickChange"><i
										class="fas fa-heart" id="followCheck"></i>Follow</a></li>
							</c:if>
							<c:if test="${follow eq null && empty sessionScope.loginArtist }">
								<li><a href="javascript:void(0);"
									onclick="insertFollowing();" id="clickChange"><i
										class="far fa-heart" id="followCheck"></i>Follow</a></li>
							</c:if>
							<c:if test="${ artistPageId eq loginArtist.artistId }">
								<li><a href="#modalFollowList" data-toggle="modal"
									onclick="" id=""><i class="fas fa-fire-alt"
										id="followCheck"></i> 내 팔로우 목록</a></li>
							</c:if>



						</ul>
					</nav>
					<!-- .nav-menu -->
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
				<div class="col-lg-6 order-1 order-lg-2" data-aos="zoom-in"
					data-aos-delay="100">
					<div class="about-img">
						<c:if test="${ artistInfo.myReProfile eq null }">
							<img src="resources/artistInfoFile/Profile/NATTAprofile.png"
								alt="" style="width: 540px; height: 403px;">
						</c:if>
						<c:if test="${ artistInfo.myReProfile ne null }">
							<img
								src="resources/artistInfoFile/Profile/${ artistInfo.myReProfile }"
								alt="" style="width: 540px; height: 403px;">
						</c:if>
					</div>
				</div>
				<div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content">
					<h3>Artist Self Introduction</h3>
					<p class="font-italic">name ${ artistInfo.name }</p>
					<ul>
						<li><i class="icofont-check-circled"></i> 아티스트의 작품을 보고, 마음에
							드는 작품을 예약하세요 !</li>
						<li><i class="icofont-check-circled"></i> 자신만의 원하는 도안을 아티스트에게
							문의하세요 !</li>
						<li><i class="icofont-check-circled"></i> 아티스트에게 솔직한 후기를
							남겨주세요 !</li>
					</ul>
					<p>${ artistInfo.myInfo }</p>
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
									<img
										src="resources/artistInfoFile/WorkFile/${ aWork.workReImgPath }"
										class="img-fluid" alt="잉? 왜없을까?"
										style="width: 400px; height: 350px;">
									<div class="member-info">
										<div class="member-info-content">
											<h5>${ aWork.workStyle }</h5>
											<span>${ artistInfo.name }</span>
										</div>
										<div class="social">
											<!-- <a href=""><i class="icofont-twitter"></i></a>
		                  <a href=""><i class="icofont-facebook"></i></a>
		                  <a href=""><i class="icofont-instagram"></i></a> -->
											<a href="#" onclick="return confirm('예약하시겠습니까 ?')"><i
												class="icofont-basket"></i></a> 
												<a href="resources/artistInfoFile/WorkFile/${ aWork.workReImgPath }" class="venobox" data-gall="gallery-item">
												<i class="icofont-camera"></i></a>

											<c:url var="workDelete" value="deleteArtistWork.na">
												<c:param name="workCode" value="${ aWork.workCode }" />
												<c:param name="workImgPath" value="${ aWork.workImgPath }" />
												<c:param name="workReImgPath"
													value="${ aWork.workReImgPath }" />
												<c:param name="artistId" value="${ aWork.artistId }" />
											</c:url>

											<c:if test="${ artistPageId eq loginArtist.artistId }">
												<a href="#" data-toggle="modal"><i
													class="icofont-spanner updateWork" id="${ aWork.workCode }"></i></a>
												<a href="${ workDelete }"
													onclick="return confirm('정말로 작품을 삭제하시겠습니까 ?');"><i
													class="icofont-bin"></i></a>
											</c:if>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>
					<c:if test="${ empty workList  }">
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
							<th>Style</th>
							<th>38 x 38</th>
							<th>38 x 64</th>
							<th>65 x 76</th>
							<th>102 x 127 (A6)</th>
							<th>152 x 152</th>
							<th>203 x 152 (A5)</th>
							<th>210 x 297 (A4)</th>
							<td>mm/원</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ priceList }" var="pList">
							<tr>
								<td>${ pList.pStyle }</td>
								<td><fmt:formatNumber value="${ pList.pSize1 }" /></td>
								<td><fmt:formatNumber value="${ pList.pSize2 }" /></td>
								<td><fmt:formatNumber value="${ pList.pSize3 }" /></td>
								<td><fmt:formatNumber value="${ pList.pSize4 }" /></td>
								<td><fmt:formatNumber value="${ pList.pSize5 }" /></td>
								<td><fmt:formatNumber value="${ pList.pSize6 }" /></td>
								<td><fmt:formatNumber value="${ pList.pSize7 }" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</section>







	<!-- ======= 후기 섹션 ======= -->
	<section id="testimonials" class="testimonials section-bg">
		<div class="container" data-aos="fade-up" id="reviewArea">
			<div class="section-title">
				<h2>후 기</h2>
				<p>${ artistInfo.name }님의 타투는 어땠나요 ?</p>
			</div>
			
			<div class="testimonial-item" style="height:50px;" id="reviewAjax">
<%-- 			<c:forEach items="${ aReview }" var="aR">
				<p style=" margin : auto;">
					<!-- <img src="resources/artistInfoFile/WorkFile/20201214184858.png" class="img-fluid" alt="잉? 왜없을까?"
						style="width: 50px; height: 50px;">  -->
						<span>henmo8</span>
						<a href="resources/artistInfoFile/WorkFile/20201214184858.png" class="venobox" data-gall="gallery-item">
						<i class="icofont-linkedin"></i></a> 
						<br>
					<i class="bx bxs-quote-alt-left quote-icon-left"></i>
					${ aR.reviewContents }
					<i class="bx bxs-quote-alt-right quote-icon-right"></i>
				</p>
				</c:forEach> --%>
<%-- 				<img
					src="resources/artistInfoFile/Profile/${ artistInfo.myReProfile }"
					class="testimonial-img" alt="">${ aR.customerId } --%>
			</div>
       <!-- 페이징 시작 -->
			<div id="pageArea" data-aos="fade-up" style="text-align: center;">
			
			<!-- 이전 -->
			 <%-- <c:if test="${pi.currentPage <= 1 }">
				[이전]&nbsp;
			 </c:if>
			 		<c:if test="${pi.currentPage >1 }">
						<c:url var="before" value="artistInfoPage.na">
							<c:param name="page" value="${pi.currentPage -1 }"/>
							<c:param name="artistId" value="${ artistInfo.artistId }"/>
						</c:url>
					<a href="${before }">[이전]</a>
					</c:if>
		    			<!-- 페이지 -->
					<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
							<c:url var="pagination" value="artistInfoPage.na">
								<c:param name="page" value="${p }"/>
								<c:param name="artistId" value="${ artistInfo.artistId }"/>
							</c:url>
							<c:if test="${p eq pi.currentPage }">
								<font color="#cda45e" size="4">[${ p }]</font>
							</c:if>
							<c:if test="${p ne pi.currentPage }">
								<a href="${pagination }">${ p }</a>
							</c:if>
					</c:forEach> <!-- 다음 --> 
					<c:if test="${pi.currentPage >= pi.maxPage }">
						[다음]&nbsp;
					</c:if> 
					<c:if test="${pi.currentPage < pi.maxPage }">
						<c:url var="after" value="artistInfoPage.na">
							<c:param name="page" value="${pi.currentPage + 1 }"/>
							<c:param name="artistId" value="${ artistInfo.artistId }"/>
						</c:url>
						<a href="${after }">[다음]</a>&nbsp;
					</c:if> --%>
					
			</div>	        			
		</div>
	</section>
	<!-- End Testimonials Section -->

		
		
		
	<!-- End Contact Section -->


	<!-- Vendor JS Files -->
	<script src="resources/assets/vendor/jquery/jquery.min.js"></script>
	<script
		src="resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="resources/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
	<script src="resources/assets/vendor/php-email-form/validate.js"></script>
	<script src="resources/assets/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script
		src="resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="resources/assets/vendor/venobox/venobox.min.js"></script>
	<script src="resources/assets/vendor/aos/aos.js"></script>
	<!-- Template Main JS File -->
	<script src="resources/assets/js/main.js"></script>

	<!-- 아티스트 모달 업데이트  -->
	<div class="modal fade" id="modalUpdateWork" tabindex="-1"
		role="dialog" aria-labelledby="ARTIST_TITLE" aria-hidden="true"
		style="">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl"
			role="document">
			<!-- 센터모달창 추가  modal-dialog-centered -->
			<div class="modal-content"
				style="background-color: rgba(255, 255, 255, 0.4);">
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
					<form action="updateArtistWork.na" method="post" role="form"
						class="php-email-form workForm" data-aos="fade-up"
						data-aos-delay="100" enctype="multipart/form-data"
						onsubmit="return updateCheck();">
						<div>
							<!-- 작품 사진파일-->
							<div class="col-lg-4 col-md-6 form-group">
								기존파일 <input type="text" class="form-control workImgPath"
									name="workImgPath" readonly> 업데이트 파일 <input type="file"
									class="form-control" name="reloadFile">
							</div>

							<!-- 작품 스타일 -->
							<div class="col-lg-4 col-md-6 form-group">
								Update Tatto Style <select name="workStyle"
									class="form-control updateStyle" id="name">
									<option value="pleaseSelect" id="selectOption" selected>수정
										타투스타일</option>
								</select>
								<div class="validate"></div>
							</div>

							<!-- 작품소개  -->
							<div class="form-group">
								소개 수정
								<textarea class="form-control updateWorkArea" name="workInfo"
									cols="600" rows="5" placeholder="작품 소개" style="resize: none;"></textarea>
								<div class="validate"></div>
							</div>
						</div>
						<div class="mb-3">
							<div class="loading">Loading</div>
						</div>
						<div class="text-center">
							<button type="submit">Work Update</button>
						</div>
						<input type="hidden" name="artistId"
							value="${ loginArtist.artistId }"> <input type="hidden"
							id="workReImgPath" name="workReImgPath" value=""> <input
							type="hidden" id="artistWorkCode" name="workCode" value="">
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">CLOSE</button>
				</div>
			</div>
		</div>
	</div>







	<!-- 아티스트 모달페이지 출력  -->
	<div class="modal fade" id="modalInfo" tabindex="-1" role="dialog"
		aria-labelledby="ARTIST_TITLE" aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl"
			role="document">
			<!-- 센터모달창 추가  modal-dialog-centered -->
			<div class="modal-content"
				style="background-color: rgba(255, 255, 255, 0.4);">
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
					<form action="InsertArtistInfo.na" method="post" role="form"
						class="php-email-form modalActionCheck" data-aos="fade-up"
						data-aos-delay="100" enctype="multipart/form-data">
						<div>
							<!-- 타투샵이름 -->
							<div class="col-lg-4 col-md-6 form-group">
								ARTIST SHOP NAME <input type="text" value="" name="name"
									class="form-control artistShopName" id="name"
									placeholder="Your Name" data-rule="minlen:4"
									data-msg="1글자 이상 입력해주세요.">
								<div class="validate"></div>
							</div>
							<!-- 프로필사진 업로드-->
							<div class="col-lg-4 col-md-6 form-group">
								<c:if test="${ empty artistInfo.myProfile }">
				                             프로필 사진 선택 
				              <input type="file"
										class="form-control artistmodalProfileName" name="reloadFile">
								</c:if>
								<c:if test="${ !empty artistInfo.myProfile }">
				              	기존 사진<input type="text" class="form-control"
										id="InfoProfile" name="myProfile" value="" readonly>
				              	수정할 사진<input type="file"
										class="form-control artistmodalProfileName" name="uploadFile">
								</c:if>
							</div>
							<!-- 자기소개  -->
							<div class="form-group">
								INFO
								<textarea class="form-control artistmodalInfo" name="myInfo"
									cols="600" rows="5" placeholder="Your Info"
									style="resize: none;"></textarea>
								<div class="validate"></div>
							</div>
						</div>
						<div class="mb-3">
							<div class="loading">Loading</div>
						</div>
						<div class="text-center">
							<button type="submit" class="artistInfoButton"></button>
						</div>
						<!-- 프로필사진은 변경하고싶지않을 때 그냥 등록해도됨 hidden으로 넘겨줌  -->
						<input type="hidden" name="artistId"
							value="${ loginArtist.artistId }"> <input type="hidden"
							id="InfoReProfile" name="myReProfile" value="">
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">CLOSE</button>
				</div>
			</div>
		</div>
	</div>
	<!-- <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
		</div> ???-->



	<!-- 아티스트 작품 등록 -->
	<div class="modal fade" id="modalArtistWork" tabindex="-1"
		role="dialog" aria-labelledby="ARTIST_TITLE" aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl"
			role="document">
			<!-- 센터모달창 추가  modal-dialog-centered -->
			<div class="modal-content"
				style="background-color: rgba(255, 255, 255, 0.4);">
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
					<form action="InsertArtistWork.na" method="post" role="form"
						class="php-email-form workForm" data-aos="fade-up"
						data-aos-delay="100" enctype="multipart/form-data"
						onsubmit="return optionCheck();">
						<div>
							<!-- 작품 사진파일-->
							<div class="col-lg-4 col-md-6 form-group">
								WorkFile <input type="file" class="form-control fileCheck"
									name="uploadFile">
							</div>

							<!-- 작품 스타일 -->
							<div class="col-lg-4 col-md-6 form-group">
								Tatto Style <select name="workStyle"
									class="form-control workStyle" id="name">
									<option value="pleaseSelect" id="optionKing" selected>등록할
										타투스타일</option>
								</select>
								<div class="validate"></div>
							</div>

							<!-- 작품소개  -->
							<div class="form-group">
								작품소개
								<textarea class="form-control" name="workInfo" cols="600"
									rows="5" placeholder="Your Info" style="resize: none;"></textarea>
								<div class="validate"></div>
							</div>
						</div>
						<div class="mb-3">
							<div class="loading">Loading</div>
						</div>
						<div class="text-center">
							<button type="submit">Work Insert</button>
						</div>
						<input type="hidden" name="artistId"
							value="${ loginArtist.artistId }">
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">CLOSE</button>
				</div>
			</div>
		</div>
	</div>


	
	<div class="modal fade" id="modalFollowList" tabindex="-1"
		role="dialog" aria-labelledby="ARTIST_TITLE" aria-hidden="true">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg"
			role="document">
			<!-- 센터모달창 추가  modal-dialog-centered -->
			<div class="modal-content"
				style="background-color: rgba(255, 255, 255, 0.4);">
				<div class="modal-header">
					<h5 class="modal-title" id="TEST">
						<b>${ artistInfo.name } FollowList</b>
					</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body book-a-table">
					<c:forEach items="${ followList }" var="fList">
						<div class="profile container d-flex align-items-center"
							id="${ fList.customerId }" style="margin-top: 10px; width: 100%;">
							<c:if test="${ fList.customerProfile eq null }">
								<img src="resources/artistInfoFile/Profile/NATTAprofile.png"
									alt="" class="img-fluid rounded-circle"
									style="margin-left: 15px auto; display: block; width: 80px; height: 80px; border: 8px solid #2c2f3f;">
								<nav class="nav-menu d-none d-lg-block" data-aos="fade-in"
									style="width: 80%">
									<h3 style="float: left; margin-left: 25px;">${ fList.customerId }
									</h3>
								</nav>
								<div style="width: 20%; float: left;">
									<button type="button" class="close followDelete"
										value="${ fList.customerId }" aria-label="Close">
										<i class="fas fa-user-minus" style="color: black;"></i>
									</button>
								</div>
							</c:if>
							<c:if test="${ fList.customerProfile ne null }">
								<img
									src="resources/artistInfoFile/Profile/${ fList.customerProfile }"
									alt="" class="img-fluid rounded-circle"
									style="margin-left: 15px auto; width: 30px; height: 30px; border: 3px solid #2c2f3f;">
								<nav class="nav-menu d-none d-lg-block" data-aos="fade-in"
									style="width: 80%">
									<h3 style="float: left; margin-left: 25px;">${ fList.customerId }
									</h3>
								</nav>
								<div style="width: 20%; float: left;">
									<button type="button" class="close followDelete"
										value="${ fList.customerId }" aria-label="Close">
										<i class="fas fa-user-minus" style="color: black;"></i>
									</button>
								</div>
							</c:if>
						</div>
						<br>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<script>
			$(".followDelete").on("click", function(){
				var customerId = $(this).val();
				var artistId = "${ loginArtist.artistId }";
				$.ajax({
					url : "deleteFollowing.na",
					type : "post",
					data : { 
						"artistId" : artistId,
						"customerId" : customerId 
						},
					success : function(data) {					
						if( data == "fail" ) {
							alert("ㅅㅍ");			
						} else {
							alert("팔로우가 취소되었습니다.");
							$("#"+data).remove();
						}
					}
				});
			});
		</script>









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
	 						/*ㄹㄹㄹㄹㄹㄹㄹㄹ  */
	 						for( var i in style ) {
	 							var aStyle = decodeURIComponent(style[i].pStyle.replace(/\+/g," "));
	 							var aOption = $("<option class='styleDelete' value='"+ aStyle +"'>"+ aStyle + "</option>");
	 							/* $("#optionKing").after("<option class='styleDelete' value='"+ aStyle + "'>" + aStyle + "</option>"); */
	 							$("#optionKing").after(aOption);
	 							$("#modalArtistWork").modal();
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
	<div class="modal fade" id="modalArtistPrice" tabindex="-1" role="dialog" aria-labelledby="ARTIST_TITLE" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl" role="document">
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
					<form action="updateArtistPrice.na" method="post" role="form" class="php-email-form priceActionCheck" data-aos="fade-up"
						data-aos-delay="100" enctype="multipart/form-data">
						<div>
							<!-- 스타일 -->
							<div class="col-lg-4 col-md-6 form-group">
								Tatto Style <select name="pStyle"
									class="form-control tattoStyle" id="name">
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
							<div class="col-lg-4 col-md-6 form-group tattolayer"
								style="display: none;">
								38x38mm <input type="text"
									onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
									name="pSize1" class="form-control" id="name"
									placeholder="가격을 정해주세요." data-rule="minlen:1"
									data-msg="가격을 정해주세요"><br> 38x64mm <input
									type="text"
									onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
									name="pSize2" class="form-control" id="name"
									placeholder="가격을 정해주세요." data-rule="minlen:1"
									data-msg="가격을 정해주세요"><br> 65x76mm <input
									type="text"
									onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
									name="pSize3" class="form-control" id="name"
									placeholder="가격을 정해주세요." data-rule="minlen:1"
									data-msg="가격을 정해주세요"><br> 102x127mm <input
									type="text"
									onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
									name="pSize4" class="form-control" id="name"
									placeholder="가격을 정해주세요." data-rule="minlen:1"
									data-msg="가격을 정해주세요"><br> 152x152mm <input
									type="text"
									onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
									name="pSize5" class="form-control" id="name"
									placeholder="가격을 정해주세요." data-rule="minlen:1"
									data-msg="가격을 정해주세요"><br> 203x152mm <input
									type="text"
									onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
									name="pSize6" class="form-control" id="name"
									placeholder="가격을 정해주세요." data-rule="minlen:1"
									data-msg="가격을 정해주세요"><br> 210x297mm <input
									type="text"
									onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
									name="pSize7" class="form-control" id="name"
									placeholder="가격을 정해주세요." data-rule="minlen:1"
									data-msg="가격을 정해주세요"><br>
								<div class="validate"></div>
							</div>
						</div>
						<div class="mb-3">
							<div class="loading">Loading</div>
						</div>
						<div class="text-center">
							<button type="submit" class="artistPriceButton"></button>
						</div>
						<input type="hidden" name="artistId"
							value="${ loginArtist.artistId }">
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">CLOSE</button>
				</div>
			</div>
		</div>
	</div>

	<footer>
		<jsp:include page="../common/footer.jsp" />
	</footer>
	<script>
		function insertFollowing(){
			var artistId = "${ artistInfo.artistId }";
			var customerId = "${ loginCustomer.customerId }";
			console.log(customerId);
			console.log(artistId);
			if( customerId == "") {
				alert("로그인은 기본이다 씻팔");
			}else {
				$.ajax({
					url : "InsertArtistFollow.na",
					type : "post",
					data : { "artistId" : artistId,
							 "customerId" : customerId },		
					success : function(chk) {
						if( chk == "success") {
							$("#followCheck").attr("class","fas fa-heart");
							$("#clickChange").attr("onclick","deleteFollowing();");
						}else {
							alert("왜 실패냐");
						}
					}
				});
			}
		}
		
		function deleteFollowing(){
			var artistId2 = "${ artistInfo.artistId }";
			var customerId2 = "${ loginCustomer.customerId }";
			console.log("삭제"+customerId2);
			console.log("삭제"+ artistId2);
			if( customerId2 == "") {
				alert("로그인은 기본이다 씻팔");
			}else {
				$.ajax({
					url : "deleteArtistFollow.na",
					type : "post",
					data : { "artistId" : artistId2,
							 "customerId" : customerId2 },		
					success : function(dchk) {
						if( dchk == "success") {
							$("#clickChange").attr("onclick","insertFollowing();");
							$("#followCheck").attr("class","far fa-heart");
						}else {
							alert("실패했다");
						}
					}
				});
			}
		}  	
		
  	
  	</script>
  	
  	
  	
  	
  	
  	
	<div class="modal fade" id="modalrList" tabindex="-1" role="dialog" aria-labelledby="ARTIST_TITLE" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-xl" role="document">
			<div class="modal-content"><!-- style="background-color: rgba(255, 255, 255, 0.4);" -->
				<div class="modal-header">
					<h5 class="modal-title" id="TEST">
						<b style="color:black;">고객 예약목록</b>
					</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body book-a-table" style="font-size:13px;">
						<table class="table addRv">
						<thead>
							<tr>
								<th>ID</th>
								<th>Date</th>
								<th>Time</th>
								<th>Picture</th>
								<th>Size</th>
								<th>Style</th>
								<th>Part</th>
								<th>Price</th>
								<th>Request</th>
								<th>Check</th>
							</tr>
						</thead>
						<tbody></tbody>
						</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">CLOSE</button>
				</div>
			</div>
		</div>
	</div>							 							

	<!--ㅁㄴㅇㅁㄴㅇ  -->
	<script>
	
		$("#rListModal").on("click",function(){
			var artistId = "${ loginArtist.artistId }";
			console.log(artistId);
			$.ajax({
				url : "artistReservationList.na",
				type : "post",
				data : { "artistId" : artistId },
				dataType : "json",
				success : function(data){
					var $tBody = $(".addRv tbody");
					var $tr;
					$tBody.html("");
					if( data.length > 0 ){
						for( var r in data ){
							var $artistName = $("<td>").text(decodeURIComponent(data[r].artistName.replace(/\+/g," ")));
							var $renameFilename = $("<td>").text(decodeURIComponent(data[r].renameFilename.replace(/\+/g," ")));
							var $originalFilename = $("<td><a target='_blank' href='resources/images/ruploadFiles/"+decodeURIComponent(data[r].renameFilename.replace(/\+/g," "))+"'>도안보기</a>");
							 /* var $originalFilename = $("<td><img src='resources/images/ruploadFiles/"+decodeURIComponent(data[r].renameFilename.replace(/\+/g," "))+"' style='width:50px; height:50px;' class='imgBoom'>"); */
							var $request = $("<td width='200'>").text(decodeURIComponent(data[r].request.replace(/\+/g," ")));
							var $style = $("<td style='font-size:13px;'>").text(decodeURIComponent(data[r].style.replace(/\+/g," ")));
							var $part = $("<td>").text(decodeURIComponent(data[r].part.replace(/\+/g," ")));
							/* var $shopName = $("<td>").text(decodeURIComponent(data[r].shopName.replace(/\+/g," "))); */
							var $customerId = $("<td>").text(data[r].customerId);
							var $reservationDate = $("<td style='font-size:13px;'>").text(data[r].reservationDate);
							var $reservationTime = $("<td>").text(data[r].reservationTime);
							var $tattooSize = $("<td style='font-size:13px;'>").text(data[r].tattooSize);
							var $price = $("<td>").html(data[r].price+"<br>won");
							var $rCheck0 = $("<td>").html("<button value='"+data[r].reservationCode+"'  class='btn btn-outline-danger btn-sm' onclick='updateStatus(this,0);'>예약확정하기</button> <button value='"+data[r].reservationCode+"'  class='btn btn-outline-dark btn-sm rDelete' onclick='deleteStatus(this);'>예약취소</button>"); 
							var $rCheck1 = $("<td>").html("<button value='"+data[r].reservationCode+"'  class='btn btn-outline-info btn-sm' onclick='updateStatus(this,1);'>타투완료하기</button>");
							var $rCheck2 = $("<td>").html("<button value='"+data[r].reservationCode+"'  class='btn btn-success btn-sm' onclick='successStatus();'>타투완료</button>");
							/* var $dCheck = $("<td>").html("<button value='"+data[r].reservationCode+"'  class='btn btn-outline-dark btn-sm nonono' onclick='deleteStatus(this,0);'>취소</button>"); */
							$tr = $("<tr>");
							$tr.append($customerId);
							$tr.append($reservationDate);
							$tr.append($reservationTime);
							/* $tr.append($shopName); */
							$tr.append($originalFilename);
							$tr.append($tattooSize);
							$tr.append($price);
							$tr.append($style);
							$tr.append($part);
							$tr.append($price);
							$tr.append($request);
							if( data[r].status == 0){
								$tr.append($rCheck0);
								/* $tr.append($dCheck); */
							}else if(data[r].status == 1) {
								$tr.append($rCheck1);
							} else {
								$tr.append($rCheck2);
							}
							$tBody.append($tr);
						}
					} else {
						$tr = $("<tr>");
						var Message = $("<td colspan='10' style='text-align:center; font-size:15px;'>").text("예약한 고객이 없습니다.");
						$tr.append(Message);
						$tBody.append($tr);
					}
					$("#modalrList").modal();
				}
			});
		});
		/* 예약취소 */
		function deleteStatus(obj){
			var sDelete = confirm("예약을 취소하시겠습니까?");
			var dStat = status;
			if(sDelete) {
				var rCode = $(obj).val();
				$.ajax({
					url : "deleteStatus.na",
					type : "post",
					data : { "reservationCode" : rCode },
					success : function(data){
						if ( data == "success") {
							alert("예약이 취소되었습니다.");
							$(obj).parent().parent().remove();
						} else {
							alert("실패 ! ");
						} 
					}
				});						
			}
		}
		/* 예약확정 및 작업완료 */
 		function updateStatus(obj,status){
			var modify = confirm("예약 확정 및 작업 완료하시겠습니까?");
			var uStat = status;
			if(modify){
				var rCode = $(obj).val();
				$.ajax({
					url : "updateStatus.na",
					type : "post",
					data : { "reservationCode" : rCode, "status" : uStat },
					success : function(data){
						if ( data == "0") {
							alert("예약이 확정되었습니다.");
							$(obj).attr("class","btn btn-outline-info btn-sm");
							$(obj).attr("onclick","updateStatus(this,1)");
							$(obj).next().remove(".rDelete");
							$(obj).text("타투완료하기");
						} else {
								alert("도안 작업이 완료되었습니다.")
								$(obj).attr("class","btn btn-success btn-sm");
								$(obj).attr("onclick","successStatus();");
								$(obj).text("타투완료");
						} 
					}
				});		
			}
		}
		/* 완료 후, 버튼 클릭시  */
 		function successStatus(){
 			alert("작업이 끝난 고객입니다.")
 		}
	</script>  	
  		<!-- ㅂㅈㄷ -->
	<script>
		$(function(){
			getReviewList(1);
			setInterval(function(){
				getReviewList();
			}, 50000);
		});
		function getReviewList(page) {
			var artistId = "${ artistInfo.artistId }";
			console.log("리뷰의 현재페이지 " + page);
			console.log("아티스트 아이디 " + artistId);
			$.ajax({
				url : "ArtistReviewList.na",
				type : "post",
				data : { "artistId" : artistId, "page" : page },
				dataType : "json" ,
				success : function(data){
					console.log("실행후" + data.pi.currentPage);
					var $review = "";
					/* var $pageArea = $("#pageArea");
					$pageArea.html(""); */
					$("#pageArea").html("");
					console.log(data);
					if( data.aReview.length > 0 ){
						for(i = 0; i < data.aReview.length; i++ ) {
							$review += "<div id='pageArea' data-aos='fade-up' style='text-align: center;'>";
							$review += "<p><span>"+ decodeURIComponent(data.aReview[i].customerId.replace(/\+/g," "))+"</span>"
								     + "<a href='resources/artistInfoFile/WorkFile/20201214184858.png' class='venobox' data-gall='gallery-item'><i class='icofont-linkedin'></i></a>"
									 + "<br><i class='bx bxs-quote-alt-left quote-icon-left'></i>"
									 + decodeURIComponent(data.aReview[i].reviewContents.replace(/\+/g," "))
									 + "<i class='bx bxs-quote-alt-left quote-icon-right'></i></p>";
							$review += "</div>";									 
						}
					} else {
						$review = "<h3 style='text-align:center;'>등록된 리뷰가 없습니다.</h3>";
					}
					$("#testimonials #reviewAjax").append($review);
					
					var $span = $("<span>");
					var $1 = '[이전]';
					var $2 = $("<a id='rrr' onclick='getReviewList("+parseInt(data.pi.currentPage-1)+")';>").text('[이전]');
					var $3 = $("<font color='red' size='4'>");
					var $4 = '[다음]';
					var $5 = $("<a id='rrr' onclick='getReviewList("+parseInt(data.pi.currentPage+1)+")';>").text('[다음]');
					var $6;
				 	if(data.pi.currentPage <= 1 ) {
				 		$span.append($1);
					}
					if(data.pi.currentPage > 1 ) {
						$span.append($2);
					} 
					
					for( var i = data.pi.startPage; i < data.pi.endPage+1; i++) {
						if(i == parseInt(data.pi.currentPage)) {
							$6 = $("<a style='color: red' onclick='getReviewList("+i+")';>").text('['+i+']');
							$span.append($6);
							console.log("rwqqwqwrwqrqwrqwr"+ $6);
							
						}else {
							$6 = $("<a onclick='getReviewList("+i+")';>").text(i);
							$span.append($6);
							console.log("zzzzzzzzzzzzzzz"+$6);
						}
					}
					if(data.pi.currentPage >= data.pi.maxPage) {
						$span.append($4);
					}
					if(data.pi.currentPage < data.pi.maxPage){
						$span.append($5);
					}
					$("#pageArea").append($span);
				}
			});
		}
	</script>		
</body>
</html>