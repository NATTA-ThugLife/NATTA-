<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 찾기</title>
</head>
<body>
	<header>
		<jsp:include page="../common/headerNone.jsp"></jsp:include>
	</header>

	<section class="about">
		<div class="container" data-aos="fade-up">
			<div class="section-title">
				<h2>Find ID</h2>
				<p>아이디 찾기</p>
			</div>

				<table align="center">
					<tr>
						<td><input type="radio" name="checkOption" id="checkEmail" onchange="setDisplay()" checked>이메일</td>
						<td><input type="radio" name="checkOption" onchange="setDisplay()" >휴대폰</td>
					</tr>
					
						<table align="center">
							<tr>
								<td>이름</td>
								<td><input type="text" name="customerName" id="customerName">
								</td>
							</tr>
							<tr>
								<td>이메일</td>
								<td><input type="text" name="email" id="email"></td>
							</tr>
							<tr id="phone" style="display:none;">
								<td>폰</td>
								<td><input type="text" name="phone"></td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<button id="next"><a href="#modalArtistPrice" data-toggle="modal" id="artistInfoPrice">확인</button>
								</td>
							</tr>
						</table>
					
				</table>
			</div>
	</section>
	

	<script>
		function setDisplay(){
		    if($('#checkEmail').is(':checked')){
		        $('#formId').attr("action","findId.na")	
		        $("#email").show();
				$("#phone").hide();
		    }else{
		    	$('#formId').attr("action","findId.na")
		    	$("#email").hide();
				$("#phone").show();
		    }
		}                    
        </script>



	<div class="modal fade" id="modalArtistPrice" tabindex="-1"
		role="dialog" aria-labelledby="ARTIST_TITLE" aria-hidden="true"
		style="">
		<div
			class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-middle" role="document">
			<!-- 센터모달창 추가  modal-dialog-centered -->
			<div class="modal-content"
				style="background-color: rgba(255, 255, 255, 0.4);">
				<div class="modal-header">
					<h5 class="modal-title" id="TEST">
						<b>찾았따 ID!!</b>
					</h5>
				</div>
				<div class="modal-body book-a-table">
					<form action="findCustomerId.na" method="post" role="form"
						class="php-email-form priceActionCheck" data-aos="fade-up"
						data-aos-delay="100" enctype="multipart/form-data">

						<div class="container" data-aos="fade-up">
							<div class="section-title">
								<h2>Find ID</h2>
								<p>아이디 찾기</p>
								<span id="msg"></span><br><br>
								<input type="button" onClick="location.href='login.na'" value="로그인">
								<input type="button" onClick="location.href='findPwd.na'" value="비밀번호 찾기">
							</div>
						</div>
						<div class="mb-3">
							<div class="loading">Loading</div>
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
	<script>
		$("#artistInfoPrice").on("click", function() {
			var customerName = $("#customerName").val();
			var email = $("#email").val();
			$.ajax({
				url : "findCustomerId.na",
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
						$("#msg").append("<b>회원님의 아이디는 : " + data + "입니다 <b>");
					}
				}
			});

		});
	</script>
	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
</body>
</html>