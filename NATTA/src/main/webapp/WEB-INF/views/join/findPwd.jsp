<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		$("#findBtn").click(function(){
			$.ajax({
				url : "findPwd.na",
				type : "POST",
				data : {
					id : $("#customerId").val(),
					name : $("#customerName").val(),
					email : $("#email").val()
				},
				success : function(result) {
					alert(result);
				},
			})
		});
	})
</script>

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
						<td><input type="radio" name="checkOption" id="checkEmail" onchange="setDisplay()" checked>이메일</td>
						<td><input type="radio" name="checkOption" onchange="setDisplay()" >휴대폰</td>
					</tr>
					<form action="sendPwdEmail.na" method="post" id="formId">
						<table align="center">
							<tr>
								<td>ID</td>
								<td><input type="text" name="customerId">
								</td>
							</tr>
							<tr>
								<td>이름</td>
								<td><input type="text" name="customerName">
								</td>
							</tr>
							<tr id="email">
								<td>이메일</td>
								<td><input type="text" name="email"></td>
							</tr>
							<tr id="phone" style="display:none;">
								<td>폰</td>
								<td><input type="text" name="phone"></td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<button typd="submit" id="findBtn">확인</button>
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