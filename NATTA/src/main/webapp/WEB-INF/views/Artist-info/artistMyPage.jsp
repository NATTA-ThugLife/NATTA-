<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아티스트 정보 수정</title>
<link href="resources/images/tugcat.png" rel="shortcut icon">
</head>
<body>
<header>
		<jsp:include page="../common/headerNone.jsp"></jsp:include>
	</header>

	<section class="about">
		<div class="container" data-aos="fade-up"
			style="width: 100%; margin: 0 auto;">
			<div class="section-title">
				<h2>Artist My Info</h2>
				<p>아티스트 정보 수정</p>
				
				<div class="modal-body book-a-table" >
			 			<form action="/modifyArtistInfoPage.na" 
						method="post" role="form" class="php-email-form"  enctype="multipart/form-data" onsubmit="return dup();">
				          <div style="margin-left: 330px;">
				          
				         	<!-- 이름 -->
				            <div class="col-lg-7 col-md-6 form-group">
				                        아이디
				            <input type="text" value="${ loginArtist.artistId }" name="artistId" class="form-control"  placeholder="Your ID" readonly>
				                             이름
				              <input type="text" value="${ loginArtist.artistName }" name="artistName" class="form-control"  placeholder="Your Name" readonly>
				              <div class="validate"></div>
				            </div>
				            <!-- 비밀번호 확인  -->
				            <div class="col-lg-7 col-md-6 form-group">
				              	현재 비밀번호
				              <input type="text"  name="dupPwd2" class="form-control" id="dupPwd2" placeholder="Password">
				              <div class="validate"></div>
				            </div>
				            	
				            <!-- 비밀번호 입력 -->
				            <div class="col-lg-7 col-md-6 form-group">
				                            변경할 비밀번호 
				             <input type="password" name="password" class="form-control" id="password" placeholder="Enter Password" >
				             <input type="password" name="confirmPassowrd" class="form-control" id="confirmPassowrd" placeholder="Confirm Password">
				              <div class="validate"></div>
				            </div>
				            
				            <!-- 핸드폰  -->
				            <div class="col-lg-7 col-md-6 form-group">
				                              휴대폰
				               <input type="text" name="phone" value="${ loginArtist.phone }"class="form-control" id="phone" placeholder="Your Phone" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
				            </div>	
				            <!-- 이메일  -->
				            <div class="col-lg-7 col-md-6 form-group">
				                              이메일
				               <input type="email" name="email2" value="${ loginArtist.email2 }"class="form-control" id="email" placeholder="Your Phone" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
				            </div>	
				            
				            <!-- 근무지주소 -->
							<div class="col-lg-7 col-md-6 form-group">
								근무지 주소<br>
								<c:forTokens items="${loginArtist.workAddress }" var="addr" delims="," varStatus="status">
									<c:if test="${status.index eq 0}">
										<input type="text" name="post" value="${addr }"
											class=" postcodify_postcode5 address" id="address"
											placeholder="Your WorkAddress">
										<button type="button" id="postcodify_search_button2">검색</button>
									</c:if>
									<c:if test="${status.index eq 1}">
										<input type="text" name="address1" value="${addr }"
											class="form-control postcodify_address address">
									</c:if>
									<c:if test="${status.index eq 2}">
										<input type="text" name="address2" value="${addr }"
											class="form-control postcodify_extra_info">
									</c:if>
								</c:forTokens>
								<div class="validate"></div>
							</div>

							<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
							<script>
								$(function() {
									$("#postcodify_search_button2")
											.postcodifyPopUp();
								})
							</script>

							<!-- 사업자 등록증-->
							<!-- <div class="col-lg-7 col-md-3 form-group">
								사업자 등록증 <input type="file" class="form-control"
									name="uploadFile" style="float: left">
								<div class="validate"></div>
							</div> -->

						</div>
				          <div class="mb-3">
				            <div class="loading">Loading</div>
				          </div>
				          <div class="text-center"><button type="submit" >수정하기</button></div>
				        </form>
					</div>
			</div>
		</div>
		</section>
		 <script>
      function dup(){
         var flag = false;
         var dupPwd2 = $("#dupPwd2").val();
         var artistId = "${loginArtist.artistId}";
          $.ajax({
            type: "post",
            url: "/dupPwd2.na",
            data: {
               "dupPwd2" : dupPwd2,
               "artistId" : artistId
            },
            async: false,
            success: function (res) {
               console.log(res)
               if(res == "success"){
                  flag = true;
               }else{
                  alert("현재 비밀번호가 틀렸습니다. 다시 입력해주세요");
                  $("#dupPwd2").focus();
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
</body>
</html>