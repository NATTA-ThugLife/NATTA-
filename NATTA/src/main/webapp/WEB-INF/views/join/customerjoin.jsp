<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>회원 가입</title>
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

   .form-control2 {
    box-shadow: none;
    background: #0c0b09;
    color: white;
    font-size: 14px;
    border: 1px solid #454035;
    height: calc(1.5em + .75rem + 2px);
    border-radius: .25rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}
input[type=password] {
        font-family: "나눔스퀘어 아닐때 쓸 글꼴";
        
        &::placeholder {
        	font-family: "NanumSquare";
        }
        
input[type=button] {

        }
        
 }

.hemnmo{
line-height:300%;
}

</style>
</head>
<body>
	<header>
		<jsp:include page="../common/headerNone.jsp"></jsp:include>
	</header>

	<section id="modifyInfo" class="about" style="line-height:300%">
		<div class="container" data-aos="fade-up" style="width: 100%; margin: 0 auto;">
			<div class="section-title">
				<h2>Join</h2>
				<p>회원가입</p>
			</div>

			<table align="center">
				<tr>
					<td><input type="radio" name="join" id="customerJoin" onchange="setDisplay()" checked>일반 회원</td>
					<td><input type="radio" name="join" onchange="setDisplay()">아티스트</td>
                 
				<form action="customerRegister.na" method="post">
					<table align="center" id="customerRegister">
						<tr>
							<td>아이디</td>
							<td><input type="text" name="customerId" id="customerId" required class="form-control2" style="border-color: #625b4b;">
						        <input type="button" style="line-height:165%;" value="중복 확인" onclick="checkDuplicate();">
						        <input type="hidden" id="idDuplicateCheck" value="0">
						    </td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="password" id="pwd1" class="form-control2" style="box-shadow: none; background: #0c0b09; border-color: #625b4b; color: white; font-size: 14px;"></td>

						</tr>
						<tr>
							<td>비밀번호 확인</td>
							<td><input type="password" name="password2" id="pwd2" required class="form-control2" style="box-shadow: none; background: #0c0b09; border-color: #625b4b; color: white; font-size: 14px;">
								<span id="success" style="color:green;">비밀번호가 일치합니다.</span>
								<span id="fail" style="color:red;">비밀번호가 일치하지 않습니다.</span></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="customerName" required class="form-control2" style="border-color: #625b4b;"></td>
						</tr>
						<tr>
							<td>나이</td>
							<td><input type="number" min="20" max="100" name="age" required class="form-control2" style="border-color: #625b4b;"></td>
						</tr>
						<tr>
							<td>성별</td>
							<td><input type="radio" name="gender" value="M" required>남
							<input type="radio" name="gender" value="F">여</td>
						</tr>
						<tr>
							<td>휴대폰 번호</td>
							<td><input type="text" name="phone" required class="form-control2" style="border-color: #625b4b;"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="email" name="email" id="email" required class="form-control2" style="border-color: #625b4b;">
							    <input type="button" style="line-height:165%;" value="중복 확인" onclick="checkEmail();">
							    <input type="hidden" id="emailDuplicateCheck" value="0">
							</td>
						</tr>
						<tr>
							<td>우편번호</td>
							<td><input type="text" name="post" class="postcodify_postcode5 form-control2" size="6" readonly style="border-color: #625b4b;">
								<button type="button" style="line-height:165%;" id="postcodify_search_button">검색</button>
							</td>
						</tr>
						<tr>
							<td>도로명 주소</td>
							<td><input type="text" name="address" id="address" class="postcodify_address form-control2" style="border-color: #625b4b;"></td>
						</tr>
						<tr>
							<td>상세 주소</td>
							<td><input type="text" name="address2" class="postcodify_extra_info form-control2" style="border-color: #625b4b;"></td>
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
								<button id="join" class="btn btn-login" onclick="return validate();">가입하기</button>
							</td>
						</tr>
					</table>
				</form>
			</table>
			
					<table align="center" id="artistRegister" style="display:none;">
					<form action="artistRegister.na" method="post" id="artistRegister" enctype="multipart/form-data">
						<tr>
							<td>아이디</td>
							<td><input type="text" name="artistId" id="artistId" required class="form-control2" style="border-color: #625b4b;">
								<input type="button" style="line-height:165%;" value="중복 확인" onclick="checkDuplicate2();">
								<input type="hidden" id="idDuplicateCheck2" value="0">
						    </td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="password" id="pwd3" required class="form-control2" style="border-color: #625b4b;"></td>

						</tr>
						<tr>
							<td>비밀번호 확인</td>
							<td><input type="password" name="password2" id="pwd4" required class="form-control2" style="border-color: #625b4b;">
								<span id="success2" style="color:green;">비밀번호가 일치합니다.</span>
								<span id="fail2" style="color:red;">비밀번호가 일치하지 않습니다.</span></td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="artistName" required class="form-control2" style="border-color: #625b4b;"></td>
						</tr>
						<tr>
							<td>나이</td>
							<td><input type="number" min="20" max="100" name="age" required class="form-control2" style="border-color: #625b4b;"></td">
						</tr>
						<tr>
							<td>성별</td>
							<td><input type="radio" name="gender" value="M" required>남
							    <input type="radio" name="gender" value="F">여</td>
						</tr>
						<tr>
							<td>휴대폰 번호</td>
							<td><input type="text" name="phone" required class="form-control2" style="border-color: #625b4b;"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="email" name="email2" id="email2" required class="form-control2" style="border-color: #625b4b;">
							    <input type="button" style="line-height:165%;" value="중복 확인" onclick="checkEmail2();">
							    <input type="hidden" id="emailDuplicateCheck2" value="0">
							</td>
						</tr>

						<tr>
							<td>우편번호</td>
							<td><input type="text" name="post" class="postcodify_postcode5 form-control2" size="6" readonly style="border-color: #625b4b;">
								<button type="button" style="line-height:165%;" id="postcodify_search_button2">검색</button>
							</td>
						</tr>
						<tr>
							<td>도로명 주소</td>
							<td><input type="text" name="workAddress" id="workAddress" class="postcodify_address form-control2" readonly style="border-color: #625b4b;"></td>
						</tr>
						<tr>
							<td>상세 주소</td>
							<td><input type="text" name="address2" class="postcodify_extra_info form-control2" style="border-color: #625b4b;"></td>
						</tr>

						<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
						<script>
					$(function() {
						$("#postcodify_search_button2").postcodifyPopUp();
					})
				       </script>

						<tr>
							<td>사업자 등록증</td>
							<td>
							    <input type="file" style="line-height:165%;" name="uploadFile" id="businessNo" style="float: left">  
							</td>
						</tr><tr><td><hr></td></tr>
						<tr>
							<td colspan="2" align="center">
								<button id="join" class="btn btn-login" onclick="return validate2();">가입하기</button>
							</td>
						</tr>
						</form>
					</table>
				
			</div>		
			<	
	</section>

	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>

	<script>
	
	//회원/아티스트 선택
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

	//가입버튼 누를때 빈칸 체크 (회원)
 	    function validate() {
			if($("#idDuplicateCheck").val() == 0){
				alert("아이디 중복 확인을 해주세요.")
				$("#customerId").focus();
				return false;
			} 
			if($("#pwd1").val() != $("#pwd2").val()){
				alert('비밀번호를 동일하게 입력해주세요.');
				return false;
			 }
			if($("#emailDuplicateCheck").val() == 0){
				alert("이메일 중복 확인을 해주세요.");
				return false;
			} 	
			if($("#address").val() == ""){
				alert("주소를 검색해주세요.");
				return false;
			} 			
			else {
				return true;
			}
		}
 	    
	
 	   //가입버튼 누를때 빈칸 체크 (아티스트)
  	   function validate2() {
 		  if($("#idDuplicateCheck2").val() == 0){
				alert("아이디 중복 확인을 해주세요.")
				$("#artistId").focus();
				return false;
			} if($("#pwd3").val() != $("#pwd4").val()){
				alert('비밀번호를 동일하게 입력해주세요.');
				return false;
			}if($("#emailDuplicateCheck2").val() == 0){
				alert("이메일 중복 확인을 해주세요.");
				return false;				
			}if($("#workAddress").val() == ""){
				alert('주소를 검색해주세요.');
				return false;
			}if($("#businessNo").val() == ""){
				alert('사업자등록증을 등록해주세요.');
				return false;
			}
			else {
				return true;
			}
		} 

		
	
		//아이디 중복 검사 -회원
		function checkDuplicate() {
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
						alert("사용 가능한 ID입니다");
						$("#idDuplicateCheck").val(1);
					}else if (result == "false"){
						alert("중복된 ID입니다");
						$("#idDuplicateCheck").val(0);
					}
				} 
			});
		}; 
		
 		//아이디 중복 검사 -아티스트
 		function checkDuplicate2() {			
			var artistId = $("#artistId").val();			
			if(artistId.length < 4){
				$(".guide").hide();
				$("#idDuplicateCheck2").val(0);
				alert("4글자 미만입니다.");
				return;
			}
			$.ajax({
				url : "artistdupId.na",
				data : {"artistId" : artistId},
				success : function(result) {
					if(result == "true"){
						alert("사용 가능한 ID입니다");
						$("#idDuplicateCheck2").val(1);
					}else if (result == "false"){
						alert("중복된 ID입니다");
						$("#idDuplicateCheck2").val(0);
					}
				}
			});
		};  
		
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
 		
 		//이메일 중복 검사 -회원
 		function checkEmail() {
			var email = $("#email").val();	
			if(email == ""){
				$(".guide").hide();
				$("#emailDuplicateCheck").val(0);
				return;
			}
			$.ajax({
				url : "dupEmail.na",
				data : {"email" : email},
				success : function(result) {
					if(result == "true"){
						alert("사용 가능한 Email입니다");
						$("#emailDuplicateCheck").val(1);
					}else if (result == "false"){
						alert("중복된 Email입니다");
						$("#emailDuplicateCheck").val(0);
					}
				} 
			});
		};   
		
 		//이메일 중복 검사 -아티스트
		function checkEmail2() {
			var email2 = $("#email2").val();			
			if(email2 == ""){
				$(".guide").hide();
				$("#emailDuplicateCheck2").val(0);
				return;
			}
			$.ajax({
				url : "artistdupEmail.na",
				data : {"email2" : email2},
				success : function(result) {
					if(result == "true"){
						alert("사용 가능한 email입니다");
						$("#emailDuplicateCheck2").val(1);
					}else if (result == "false"){
						alert("중복된 email입니다");
						$("#emailDuplicateCheck2").val(0);
					}
				} 
			});
		};  
		
	</script>

</body>
</html>