<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/images/tugcat.png" rel="shortcut icon">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<style>

.button{
	background: #cda45e;
	border: 0;
	padding: 10px 35px;
	color: #fff;
	transition: 0.4s;
	border-radius: 50px;
	top: 50%;
	left: 50%;
}

.button:hover {
	background: #F2CB61;
}
</style>
<title>비번 찾기</title>
</head>
<body>
	<header>
		<jsp:include page="../common/headerNone.jsp"></jsp:include>
	</header>

	<section class="about">
		<div class="container" data-aos="fade-up">
			<div class="section-title">
				<h2>Find PWD</h2>
				<p>비밀번호 찾기</p>
			</div>
			
				<table align="center">
					<tr>
						<td><input type="radio" name="checkOption" id="checkEmail" onchange="setDisplay()" checked>&nbsp;이메일&nbsp;&nbsp;&nbsp;</td>
						<td><input type="radio" name="checkOption" onchange="setDisplay()" >&nbsp;휴대폰</td>
					</tr></tr><tr><td><br></td></tr>
					<form action="mailSending.na" method="post" id="formId">
						<table align="center">
							<tr>
								<td>ID</td>
								<td><input type="text" placeholder="아이디를 입력하세요" name="customerId" class="form-control" style="box-shadow: none; background: #0c0b09; border-color: #625b4b; color: white; font-size: 14px;"></td>
							</tr></tr><tr><td><br></td></tr>
							<tr>
								<td>이름</td>
								<td><input type="text" placeholder="이름을 입력하세요" name="customerName" class="form-control" style="box-shadow: none; background: #0c0b09; border-color: #625b4b; color: white; font-size: 14px;"></td>
							</tr></tr><tr><td><br></td></tr>
							<tr id="email">
								<td>이메일&nbsp;&nbsp;</td>
								<td><input type="text" placeholder="이메일을 입력하세요" name="email" class="form-control" style="box-shadow: none; background: #0c0b09; border-color: #625b4b; color: white; font-size: 14px;"></td>
							</tr>
							<tr id="phone" style="display:none;">
								<td>휴대폰</td>
								<td><input type="text" name="phone" placeholder="휴대폰 번호를 입력하세요"  class="form-control" style="box-shadow: none; background: #0c0b09; border-color: #625b4b; color: white; font-size: 14px;"></td>
							</tr></tr><tr><td><br></td></tr>
							<tr>
								<td colspan="2" align="center">
									<button type="submit" id="findBtn" class="button">확인</button>
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
		        $('#formId').attr("action","findPwd.na")	
		        $("#email").show();
				$("#phone").hide();
		    }else{
		    	$('#formId').attr("action","findPwd.na")
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