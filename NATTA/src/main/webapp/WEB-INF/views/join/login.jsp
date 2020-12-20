<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>

div.modal{ 
position:relative; z-index:1; display:none;
}
div.modalBackground { 
position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.8); z-index:-1; 
}


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
@
-webkit-keyframes animate-loading { 0% {
	transform: rotate(0deg);
}

100
%
{
transform
:
rotate(
360deg
);
}
}
@
keyframes animate-loading { 0% {
	transform: rotate(0deg);
}
100
%
{
transform
:
rotate(
360deg
);
}
}
</style>

<title>로그인</title>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
	<header>
		<jsp:include page="../common/headerNone.jsp"></jsp:include>
	</header>

	<section class="about">

		<div class="container" data-aos="fade-up"
			style="width: 100%; margin: 0 auto;">
			<div class="section-title">
				<h2>Log In</h2>
				<p>로그인</p>
			</div>

			<table align="center">
				<tr>
					<td><input type="radio" id="customer" name="loginOption"
						onchange="setDisplay()" checked>일반 회원&nbsp;&nbsp;</td>
					<td><input type="radio" id="artist" name="loginOption"
						onchange="setDisplay()">아티스트</td>
				</tr>

				<form action="customerLogin.na" method="post" id="formId">
					<table align="center">
						<tr>
							<td><input type="text" name="customerId" id="id"
								class="form-control" placeholder="아이디를 입력하세요"
								data-rule="minlen:4" data-msg="올바른 아이디를 입력하세요"
								style="height: 44px; border-radius: 0; box-shadow: none; font-size: 14px; background: #0c0b09; border-color: #625b4b; color: white;">
							</td>
							<br>
							<td>
								<button id="button" class="btn btn-login" style="margin-right: 30px;">로그인</button>
							</td>

						</tr>
						<tr>
							<td><input type="password" name="password"
								class="form-control" placeholder="비밀번호를 입력하세요"
								data-rule="minlen:4" data-msg="올바른 비밀번호를 입력하세요"
								style="height: 44px; border-radius: 0; box-shadow: none; font-size: 14px; background: #0c0b09; border-color: #625b4b; color: white;"></td>

							<td><input id="button" type="button"
								onClick="location.href='customerJoinView.na'" value="회원가입"
								style="margin-right: 30px;"></td>
						</tr>
						<!-- <tr>
							<td colspan="3"><a href="/joinOption.na">회원가입</a>&nbsp; <a
								href="/find.na">아이디/비밀번호 찾기</a></td>
						</tr> -->
						<tr>
							<td style="text-align: center;">
								<!-- <form action="/login.na" method="post" role="form"
									class="php-email-form" data-aos="fade-up" data-aos-delay="100"> -->
								<br> <!-- <input id="button" type="button" onClick="location.href='joinOption.na'" value="회원가입"
										style="margin-right: 30px;">  --> 
								<input data-target=".modal" data-toggle="modal" class="find1" id="button" type="button" onClick="location.href='findId.na'" value="ID 찾기" style="margin-left: 30px"> 
								<input class="find2" id="button" type="button" onClick="location.href='findPwd.na'" value="PW 찾기" style="margin-left: 30px"> <!-- </form> -->
								<!-- <br><br><a id="kakao-login-btn"></a>
							<a href="http://developers.kakao.com/logout"></a> -->
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
		
/* 		Kakao.init('8dffdaf5568eceb8d7c16e4a8cd5eb67');
		Kakao.Auth.createLoginButton({ 
		   container: '#kakao-login-btn',
		   success: function(authObj) {
		      alert(JSON.stringify(authObj));
		      },
		      fail: function(err) {
		         alert(JSON.stringify(err));
		         }
		      });
 */
        </script>



	<!--         <section id="book-a-table" class="book-a-table">
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
				</section> -->


	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>




<!-- 	<div class="modal">
		<form action="findCustomerId.na" method="post" id="formId">
			<table align="center">
				<tr>
					<td>이름</td>
					<td><input type="text" name="customerName"></td>
				</tr>
				<tr id="email">
					<td>이메일</td>
					<td><input type="text" name="email"></td>
				</tr>
				<tr id="phone" style="display: none;">
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
		<div class="modalBackground"></div>
		
	</div>

	<script>
					   $(document).on("click",".find1",function(){
						   $(.modal).show();
					   });
					</script> -->
</body>
</html>