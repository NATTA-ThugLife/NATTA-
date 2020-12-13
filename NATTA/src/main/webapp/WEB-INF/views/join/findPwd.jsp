<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비번 찾기</title>
</head>
<body>
	<header>
		<jsp:include page="../common/headerNone.jsp"></jsp:include>
	</header>

	<section id="book-a-table" class="book-a-table">
		<div class="container" data-aos="fade-up">
			<div class="section-title">
				<h2>Find PWD</h2>
				<p>비밀번호 찾기</p>
			</div>
			
				<table align="center">
					<tr>
						<td><input type="radio" id="email" name="checkOption" onchange="setDisplay()" checked>이메일</td>
						<td><input type="radio" id="phone" name="checkOption" onchange="setDisplay()" >휴대폰</td>
					</tr>
					<form action="findPwd.na" method="post" id="formId">
						<table align="center">
							<tr>
								<td>ID</td>
								<td><input type="text" name="customerId" id="customerId">
								</td>
							</tr>
							<tr>
								<td>이름</td>
								<td><input type="text" name="customerName" id="customerName">
								</td>
							</tr>
							<tr>
								<td>이메일</td>
								<td><input type="text" name="email" id="email"></td>
							</tr>
							<tr style="display:none;">
								<td>폰</td>
								<td><input type="text" name="phone" id="phone"></td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<button id="next" onclick="return validate();">다음</button>
								</td>
							</tr>

						</table>
					</form>

				</table>
			</div>
	</section>

	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
</body>
</html>