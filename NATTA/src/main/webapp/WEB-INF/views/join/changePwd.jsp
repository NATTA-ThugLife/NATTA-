<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비번 재설정</title>
</head>
<body>
	<header>
		<jsp:include page="../common/headerNone.jsp"></jsp:include>
	</header>

	<section id="book-a-table" class="book-a-table">
		<div class="container" data-aos="fade-up">
			<div class="section-title">
				<h2>Change PWD</h2>
				<p>비밀번호 재설정</p>
			</div>
			
				<table align="center">
					<form action="findPwdCerti.na" method="post" id="formId">
						<table align="center">
							<tr>
								<td>ID</td>
								<td>${findCustomerPwd.customerId }</td>
							</tr>
							<tr>
								<td>새 비밀번호</td>
								<td><input type="password" name="customerName" id="customerName">
								</td>
							</tr>							
							<tr>
								<td>새 비밀번호 확인</td>
								<td>
								<input type="password" name="certiNum" id="certiNum">
								<span id="success" style="color:green;">비밀번호가 일치합니다.</span>
								<span id="fail" style="color:red;">비밀번호가 일치하지 않습니다.</span>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<button id="next">비밀번호 변경</button>
								</td>
							</tr>
						</table>
					</form>
				</table>
			</div>
	</section>
	
	<script>
	$(function(){
		$("#success").hide();
		$("#fail").hide();
		$("input").keyup(function(){
			var pwd1=$("#pwd1").val();
			var pwd2=$("#pwd2").val();
			if(pwd1 != "" || pwd2 != ""){
				if(pwd1 == pwd2){ 
					$("#success").show();
				    $("#fail").hide();
				    $("#submit").removeAttr("disabled");
				}else{
					$("#success").hide();
					$("#fail").show();
					$("#submit").attr("disabled", "disabled"); 
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