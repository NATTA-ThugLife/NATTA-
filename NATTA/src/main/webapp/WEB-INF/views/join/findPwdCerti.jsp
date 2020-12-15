<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비번 찾기 본인 인증</title>
</head>
<body>
	<header>
		<jsp:include page="../common/headerNone.jsp"></jsp:include>
	</header>

	<section class="about">
		<div class="container" data-aos="fade-up">
			<div class="section-title">
				<h2>Find PWD</h2>
				<p>본인 확인 인증</p>
			</div>
			
				<table align="center">
					<tr>
						<td><input type="radio" name="checkOption" id="checkEmail" onchange="setDisplay()" checked>이메일</td>
						<td><input type="radio" name="checkOption" onchange="setDisplay()" >휴대폰</td>
					</tr>
					<form action="changePwd.na" method="post" id="formId">
						<table align="center">
							<tr id="email">
								<td>이메일</td>
								<td> ${findCustomerPwd.email }</td>
								<td><input type="button" name="certi" value="인증번호 받기"></td>
							</tr>
							<tr id="phone" style="display:none;">
								<td>폰</td>
								<td><input type="text" name="phone"></td>
							</tr>
							<tr>
								<td>인증 번호</td>
								<td><input type="text" name="certiNum" id="certiNum"></td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<button id="next">다음</button>
								</td>
							</tr>
						</table>
					</form>
				</table>
			</div>
	</section>
	
	<script>
		function setDisplay(){
		    if($('#checkEmail').is(':checked')){
		        $('#formId').attr("action","findPwdCerti.na")	
		        $("#email").show();
				$("#phone").hide();
		    }else{
		    	$('#formId').attr("action","findPwdCerti.na")
		    	$("#email").hide();
				$("#phone").show();
		    }
		}                    
    </script>

	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>

</body>
</html>