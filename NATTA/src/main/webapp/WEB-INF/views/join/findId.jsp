<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>

#button {
	background: #cda45e;
	border: 0;
	padding: 10px 35px;
	color: #fff;
	transition: 0.4s;
	border-radius: 70px;
	top: 50%;
	left: 50%;
}

#button:hover {
	background: #E0B94F;
}
</style>
<title>ID 찾기</title>
</head>
<body>
	<header>
		<jsp:include page="../common/headerNone.jsp"></jsp:include>
	</header>

	<section class="about">
		<div class="container" data-aos="fade-up" style="width: 100%; margin: 0 auto;">
			<div class="section-title">
				<h2>Find ID</h2>
				<p>아이디 찾기</p>
			</div>

				<table align="center">
					<tr>
						<td><input type="radio" name="checkOption" id="checkEmail" onchange="setDisplay()" checked>&nbsp;이메일&nbsp;&nbsp;</td>
						<td><input type="radio" name="checkOption" onchange="setDisplay()" >&nbsp;휴대폰</td>
					</tr><tr><td><br></td></tr>
										
						<table align="center">
							<tr>
								<td>이름</td>
								<td><input type="text" placeholder="이름을 입력하세요" name="customerName" id="customerName" class="form-control" style="box-shadow: none; background: #0c0b09; border-color: #625b4b; color: white; font-size: 14px;">
								</td>
							</tr><tr><td><br></td></tr>
							<tr id="emailForm">
								<td id="changeText">이메일</td>
								<td><input type="text" placeholder="이메일을 입력하세요" name="email" id="chageInput" class="form-control" style="box-shadow: none; background: #0c0b09; border-color: #625b4b; color: white; font-size: 14px;"></td>
							</tr></tr><tr><td><br></td></tr>							
							<tr>
								<td colspan="2" align="center">
									<button id="button"><a href="#modalArtistPrice" data-toggle="modal" id="findEmail" onclick="emailCheck()" style="color: white;">확인</button>
								</td>
							</tr>
						</table>
				</table>
			</div>
	</section>
	
	<script>
		function setDisplay(){
		    if($('#checkEmail').is(':checked')){
		        $('#findPhone').attr("onclick","emailCheck()")	
		        $('#findPhone').attr("id","findEmail")	
		        $('#changeText').text("이메일")	
		        $('#chageInput').attr("name","email")	

		    }else{
		    	$('#findEmail').attr("onclick","phoneCheck()")	
		    	$('#findEmail').attr("id","findPhone")
		    	$('#changeText').text("휴대폰")	
		    	$('#chageInput').attr("name","phone")
		    	
		    }
		}                    
        </script>

	<div class="modal fade" id="modalArtistPrice" tabindex="-1" role="dialog" aria-labelledby="ARTIST_TITLE" aria-hidden="true"
		style="">
		<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-middle" role="document">
			<!-- 센터모달창 추가  modal-dialog-centered -->
			<div class="modal-content"
				style="background-color: rgba(255, 255, 255, 0.4);">
				<div class="modal-header">
					<h5 class="modal-title" id="TEST">
						<b>ID 조회 결과</b>
					</h5>
				</div>
				<div class="modal-body book-a-table">
					<form role="form" class="php-email-form priceActionCheck" data-aos="fade-up"
						data-aos-delay="100" enctype="multipart/form-data">
						<div class="container" data-aos="fade-up">
							<div class="section-title">
								<!-- <h2>Find ID</h2>
								<p>아이디 찾기</p> -->
								<span id="msg"></span><br><br>
								<input type="button" onClick="location.href='login.na'" value="로그인">
								<input type="button" onClick="location.href='findPwd.na'" value="비밀번호 찾기">
							</div>
						</div>
						<div class="mb-3">
							<div class="loading">Loading</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">CLOSE</button>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	 function emailCheck() {
			console.log("이메 동작");
			var customerName = $("#customerName").val();
			var email = $("#chageInput").val();
			console.log(email);
			$.ajax({
				url : "findIdEmail.na",
				type : "post",
				data : {
					"customerName" : customerName,
					"email" : email
				},
				success : function(data) {
					if (data == "fail") {
						$("#msg").text("");
						$("#msg").append("<b>아이디 찾기 실패! <b>");
					} else {
						$("#msg").text("");
						$("#msg").append("<b>회원님의 아이디는  " + data + "입니다 <b>");
					}
				}
			});
		};
		
		function phoneCheck() {
			console.log("핸드폰 동작");
			var customerName = $("#customerName").val();
			var phone = $("#chageInput").val();
			$.ajax({
				url : "findIdPhone.na",
				type : "post",
				data : {
					"customerName" : customerName,
					"phone" : phone
				},
				success : function(data) {
					if (data == "fail") {
						$("#msg").text("");
						$("#msg").append("<b>아이디 찾기 실패! <b>");
					} else {
						$("#msg").text("");
						$("#msg").append("<b>회원님의 아이디는  " + data + "입니다 <b>");
					}
				}
			});
		};  
	</script>
	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
</body>
</html>