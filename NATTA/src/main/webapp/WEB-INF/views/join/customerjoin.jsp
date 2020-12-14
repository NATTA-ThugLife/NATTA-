<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>일반 회원 가입</title>
<style type="text/css">
	.centerText table{
	margin : auto;
	}
	span.guide{
		display : none;
		font-size : 12px;
		top : 12px;
		right : 10px;
	}
	span.ok{color:green}
	span.error{color:red}
	
	#join {
	background: #cda45e;
	border: 0;
	padding: 10px 35px;
	color: #fff;
	transition: 0.4s;
	border-radius: 50px;
	top: 50%;
	left: 50%;
	}

    #join:hover {
	background: #d3af71;
}

</style>
</head>
<body>
	<header>
		<jsp:include page="../common/headerNone.jsp"></jsp:include>
	</header>

	<section>
		<div class="container" data-aos="fade-up"
			style="width: 100%; margin: 0 auto;">
			<div class="section-title">
				<h2>Join</h2>
				<p>회원가입</p>
		</div>

			<table align="center">
				<tr>
					<td><input type="radio" name="join" id="customerJoin"
						onchange="setDisplay()" checked>일반 회원</td>
					<td><input type="radio" name="join"
						onchange="setDisplay()">아티스트</td>
				</tr>

				<!-- <div class="centerText"> -->
				<form action="customerRegister.na" method="post">
					<table align="center">
						<tr>
							<td>아이디</td>
							<td><input type="text" name="customerId" id="customerId">
						<span class="guide ok">이 아이디는 사용 가능합니다.</span>
						<span class="guide error">이 아이디는 사용할 수 없습니다.</span>
						<input type="hidden" id="idDuplicateCheck" value="0"> - 
						<!-- <input type="button" id="idDuplicateCheck" value="중복 확인"></td> -->
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="password"></td>
						</tr>
						<!-- <tr>
							<td>비밀번호 확인</td>
							<td><input type="password" name="password"></td>
						</tr> -->
						<tr>
							<td>이름</td>
							<td><input type="text" name="customerName"></td>
						</tr>
						<tr>
							<td>나이</td>
							<td><input type="number" min="20" max="100" name="age"></td>
						</tr>
						<tr>
							<td>성별</td>
							<td><input type="radio" name="gender" value="M">남 <input
								type="radio" name="gender" value="F">여</td>
						</tr>
						<tr>
							<td>휴대폰 번호</td>
							<td><input type="text" name="phone"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="email" name="email"></td>
						</tr>
						<tr>
							<td>우편번호</td>
							<td><input type="text" name="post"
								class="postcodify_postcode5" size="6">
								<button type="button" id="postcodify_search_button">검색</button>
							</td>
						</tr>
						<tr>
							<td>도로명 주소</td>
							<td><input type="text" name="address1"
								class="postcodify_address"></td>
						</tr>
						<tr>
							<td>상세 주소</td>
							<td><input type="text" name="address2"
								class="postcodify_extra_info"></td>
						</tr>

						<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
						<script>
					$(function() {
						$("#postcodify_search_button").postcodifyPopUp();
					})
				</script>
						<tr>
							<td colspan="2" align="center">
								<button id="join" onclick="return validate();">가입하기</button>
							</td>
						</tr>
					</table>
				</form>
				<!-- </div> -->
				</table>
	</section>

	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
	
	<script>
	
	    function setDisplay(){
	    if($('#customerJoin').is(':checked')){
	        $('#formId').attr("action","findId.na")	
	        $("#email").show();
			$("#phone").hide();
	    }else{
	    	$('#formId').attr("action","findId.na")
	    	$("#email").hide();
			$("#phone").show();
	    }
	}
	    
		function validate() {
			if($("#idDuplicateCheck").val() == 0){
				alert("사용 가능한 아이디를 입력해주세요.")
				$("#customerId").focus();
				return false;
			}else {
				return true;
			}
		}	
	
		//아이디 중복 검사(Ajax)
		$("#customerId").on("blur",function(){			
			var customerId = $(this).val();
			
			if(customerId.length < 4){
				$(".guide").hide();
				$("#idDuplicateCheck").val(0);
				alert("4글자 미만입니다.");
				return;
			}
			$.ajax({
				url : "dupId.na",
				data : {"customerId" : customerId},
				success : function(result) {
					if(result == "true"){
						$(".guide.error").hide();
						$(".guide.ok").show();
						$("#idDuplicateCheck").val(1);
					}else if (result == "false"){
						$(".guide.error").show();
						$(".guide.ok").hide();
						$("#idDuplicateCheck").val(0);
					}
				}
			});
		});
	</script>
	
</body>
</html>