<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 찾았다</title>
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
				<span id="msg"><b>회원님의 아이디는 ${findCustomer.customerId } 입니다..</b></span>
				<input type="button" onClick="location.href='login.na'" value="로그인">
				<input type="button" onClick="location.href='findPwd.na'" value="비밀번호 찾기">
			</div>
		</div>
	</section>
	
  	<footer>
		 <jsp:include page="../common/footer.jsp"/>  	 
  	</footer>
</body>
</html>