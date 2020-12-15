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
					
					<form action="findCustomerId.na" method="post" id="formId">
						<table align="center">
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

	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
</body>
</html>