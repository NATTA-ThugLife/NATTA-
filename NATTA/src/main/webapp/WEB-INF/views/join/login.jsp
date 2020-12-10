<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	border-radius: 50px;
	top: 50%;
	left: 50%;
}

#button:hover {
	background: #d3af71;
} 


/*
.contact .php-email-form input::placeholder, .contact .php-email-form textarea::placeholder {
  color: #a49b89;
}

.contact .php-email-form input:focus, .contact .php-email-form textarea:focus {
  border-color: #cda45e;
} */

@-webkit-keyframes animate-loading {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}

@keyframes animate-loading {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}

</style>

<title>Insert title here</title>
</head>
<body>
	<header>
		<jsp:include page="../common/headerNone.jsp"></jsp:include>
	</header>

	<section>

		<div class="container" data-aos="fade-up" style="width: 100%; margin: 0 auto;">
			<div class="section-title">
				<h2>Log In</h2>
				<p>로그인</p>
		</div>

			<table align="center">
				<tr>
					<td><input type="radio" id="customer" name="loginOption"
						value="A" onchange="setDisplay()" checked>일반 회원&nbsp;&nbsp;</td>
					<td><input type="radio" id="artist" name="loginOption"
						value="B" onchange="setDisplay()">아티스트</td>
				</tr>

				<form action="customerLogin.na" method="post" id="formId">
					<table align="center">
						<tr>
							<!-- <td>아이디 :</td> -->
							<td><input type="text" name="customerId" id="id" class="form-control"
							            placeholder="아이디를 입력하세요" data-rule="minlen:4"
										data-msg="올바른 아이디를 입력하세요"
										style="height: 44px; border-radius: 0; box-shadow: none; font-size: 14px; background: #0c0b09; border-color: #625b4b; color: white;">
							</td>
							<br>
							<td rowspan="2">
								<button id="button" class="btn btn-login" style="margin-right: 30px;">로그인</button>
							</td>
						</tr>
						<tr>
							<!-- <td>비밀번호 :</td> -->
							<td><input type="password" name="password" class="form-control"
							           placeholder="비밀번호를 입력하세요" data-rule="minlen:4"
										data-msg="올바른 비밀번호를 입력하세요"
										style="height: 44px; border-radius: 0; box-shadow: none; font-size: 14px; background: #0c0b09; border-color: #625b4b; color: white;"></td>
						</tr>
						<!-- <tr>
							<td colspan="3"><a href="/joinOption.na">회원가입</a>&nbsp; <a
								href="/find.na">아이디/비밀번호 찾기</a></td>
						</tr> -->		
						<tr>
						<td style="text-align: center;">
								<!-- <form action="/login.na" method="post" role="form"
									class="php-email-form" data-aos="fade-up" data-aos-delay="100"> -->
									<br> 
									<input id="button" type="button"
										onClick="location.href='joinOption.na'" value="회원가입"
										style="margin-right: 30px;"> 
									<input id="button"
										type="button" onClick="location.href='find.na'"
										value="ID & PW 찾기" style="margin-left: 30px">
								<!-- </form> -->
							</td>
							</tr>
					</table>
				</form>

			</table>
			</div>
	</section>

	<script>
		function setDisplay(){
		    if($('#customer').is(':checked')){
		        $('#formId').attr("action","customerLogin.na")
		        $('#id').attr("name","custoemrId")		        
		    }else{
		    	$('#formId').attr("action","artistLogin.na")
		    	$('#id').attr("name","artistId")
		    }
		}                    
        </script>
        
        
        
        <section id="book-a-table" class="book-a-table">
					<div class="container" data-aos="fade-up">
						<form action="/login.na" method="post" role="form"
							class="php-email-form" data-aos="fade-up" data-aos-delay="100">

							<div class="form-row">
								<div class="col-lg-4 col-md-6 form-group">
									<input type="text" name="customerId" class="form-control"
										id="customerId" placeholder="아이디를 입력하세요" data-rule="minlen:4"
										data-msg="올바른 아이디를 입력하세요">
									<div class="validate"></div>
								</div><br>

								<div class="col-lg-4 col-md-6 form-group">
									<input type="password" name="password" class="form-control"
										id="password" placeholder="비밀번호를 입력하세요" data-rule="minlen:4"
										data-msg="올바른 비밀번호를 입력하세요">
									<div class="validate"></div>
								</div>
							</div>
						</form>
					</div>
				</section>
        

	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
</body>
</html>