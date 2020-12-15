<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>일반 회원 가입</title>
<style type="text/css">
#success {
	color: green;
}

#fail {
	color: red;
}

.centerText table {
	margin: auto;
}

span.guide {
	display: none; /* 
		font-size : 12px;
		top : 12px;
		right : 10px; */
}

span.ok {
	color: green
}

span.error {
	color: red
}

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
		<div class="container" data-aos="fade-up" style="width: 100%; margin: 0 auto;">
			<div class="section-title">
				<h2>Join</h2>
				<p>회원가입</p>
			</div>

			<table align="center">
				<tr>
					<td><input type="radio" name="join" id="customerJoin" onchange="setDisplay()" checked>일반 회원</td>
					<td><input type="radio" name="join" onchange="setDisplay()">아티스트</td>
				</tr><tr><td><hr></td></tr>

				<form action="customerRegister.na" method="post">
					<table align="center" id="customerRegister">
						<tr>
							<td>아이디</td>
							<td><input type="text" name="customerId" id="customerId">
						        <input type="button" value="중복 확인" onclick="checkDuplicate();">
						    </td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="password" id="pwd1"></td>

						</tr>
						<tr>
							<td>비밀번호 확인</td>
							<td><input type="password" name="password2" id="pwd2">
								<span id="success" style="color:green;">비밀번호가 일치합니다.</span>
								<span id="fail" style="color:red;">비밀번호가 일치하지 않습니다.</span></td>
						</tr>
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
							<td><input type="radio" name="gender" value="M">남
							<input type="radio" name="gender" value="F">여</td>
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
							<td><input type="text" name="post" class="postcodify_postcode5" size="6">
								<button type="button" id="postcodify_search_button">검색</button>
							</td>
						</tr>
						<tr>
							<td>도로명 주소</td>
							<td><input type="text" name="address"
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
								$("#postcodify_search_button")
												.postcodifyPopUp();
									})
						</script>
						<tr><td><hr></td></tr>
						<tr>
							<td colspan="2" align="center">
								<button id="join" onclick="return validate();">가입하기</button>
							</td>
						</tr>
					</table>
				</form>
			</table>
			
					<table align="center" id="artistRegister" style="display:none;">
					<form action="artistRegister.na" method="post" id="artistRegister">
						<tr>
							<td>아이디</td>
							<td><input type="text" name="artistId" id="artistId">
								<input type="button" value="중복 확인" onclick="checkDuplicate();">
						    </td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="password" id="pwd3"></td>

						</tr>
						<tr>
							<td>비밀번호 확인</td>
							<td><input type="password" name="password2" id="pwd4">
								<span id="success2" style="color:green;">비밀번호가 일치합니다.</span>
								<span id="fail2" style="color:red;">비밀번호가 일치하지 않습니다.</span></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="artistName"></td>
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
								<button type="button" id="postcodify_search_button2">검색</button>
							</td>
						</tr>
						<tr>
							<td>도로명 주소</td>
							<td><input type="text" name="workAddress"
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
						$("#postcodify_search_button2").postcodifyPopUp();
					})
				</script>

						<tr>
							<td>사업자 등록증</td>
							<td><input type="text" name="businessNo"></td>
						</tr><tr><td><hr></td></tr>
						<tr>
							<td colspan="2" align="center">
								<button id="join" onclick="return validate();">가입하기</button>
							</td>
						</tr>
						</form>
					</table>
				
			</div>				
	</section>

	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>

	<script>
	
	//회원/아티스트 체크
	    function setDisplay(){
	    if($('#customerJoin').is(':checked')){
	        $('#customerRegister').attr("action","customerRegister.na")	
	        $("#customerRegister").show();
			$("#artistRegister").hide();
	    }else{
	    	$('#customerRegister').attr("action","artistRegister.na")
	    	$("#customerRegister").hide();
			$("#artistRegister").show();
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
		
	
		//아이디 중복 검사 -회원
		/* $("#customerId").on("click",function(){	 */
		function checkDuplicate() {
			/* var customerId = $(this).val();		 */	
			var customerId = $("#customerId").val();			
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
						/* $(".guide.error").hide();
						$(".guide.ok").show();
						$("#idDuplicateCheck").val(1); */
						alert("사용 가능한 ID입니다");
					}else if (result == "false"){
						/* $(".guide.error").show();
						$(".guide.ok").hide();
						$("#idDuplicateCheck").val(0); */
						alert("중복된 ID입니다");
					}
				} 
			});
		}; 
		
 		//아이디 중복 검사 -아티스트
		$("#artistId").on("blur",function(){			
			var artistId = $(this).val();
			
			if(artistId.length < 4){
				$(".guide").hide();
				$("#idDuplicateCheck").val(0);
				alert("4글자 미만입니다.");
				return;
			}
			$.ajax({
				url : "artistdupId.na",
				data : {"artistId" : artistId},
				success : function(result) {
					if(result == "true"){
						/* $(".guide.error").hide();
						$(".guide.ok").show();
						$("#idDuplicateCheck").val(1); */
						alert("사용 가능한 ID입니다");
					}else if (result == "false"){
						/* $(".guide.error").show();
						$(".guide.ok").hide();
						$("#idDuplicateCheck").val(0); */
						alert("중복된 ID입니다");
					}
				}
			});
		}); 
		
		//비밀번호 확인 -회원
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
		
 		//비밀번호 확인 -아티스트
		$(function(){
			$("#success2").hide();
			$("#fail2").hide();
			$("input").keyup(function(){
				var pwd1=$("#pwd3").val();
				var pwd2=$("#pwd4").val();
				if(pwd1 != "" || pwd2 != ""){
					if(pwd1 == pwd2){ 
						$("#success2").show();
					    $("#fail2").hide();
					    $("#submit").removeAttr("disabled");
					}else{
						$("#success2").hide();
						$("#fail2").show();
						$("#submit").attr("disabled", "disabled"); 
						} 
					}
			});
		}); 
		
		
	</script>

</body>
</html>