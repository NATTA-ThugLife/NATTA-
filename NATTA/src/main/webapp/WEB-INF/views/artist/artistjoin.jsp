<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>회원가입</title>
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

</style>
</head>
<body>
	<header>

		<jsp:include page="../common/header.jsp"></jsp:include>
	</header>
	<section>
	<h1 align="center">회원가입</h1>
	<div class="centerText">
		<form action="artistRegister.na" method="post">
			<table width="650" cellspacing="5">
				<tr>
					<td>* 아이디</td>
					<td><input type="text" name="artistId" id="artistId">
						<span class="guide ok">이 아이디는 사용 가능합니다.</span> <span
						class="guide error">이 아이디는 사용할 수 없습니다.</span> <input type="hidden"
						id="idDuplicateCheck" value="0"></td>
				</tr>
				<tr>
					<td>* 비밀번호</td>
					<td><input type="password" name="password"></td>
				</tr>
				<tr>
					<td>* 이름</td>
					<td><input type="text" name="userName"></td>
				</tr>
				<tr>
					<td>* 나이</td>
					<td><input type="number" min="20" max="100" name="age"></td>
				</tr>
				<tr>
					<td>* 성별</td>
					<td><input type="radio" name="gender" value="M">남 <input
						type="radio" name="gender" value="F">여</td>
				</tr>
				<tr>
					<td>* 전화번호</td>
					<td><input type="text" name="phone"></td>
				</tr>
				<tr>
					<td>* 이메일</td>
					<td><input type="email" name="email"></td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td><input type="text" name="post"
						class="postcodify_postcode5" size="6">
						<button type="button" id="postcodify_search_button">검색</button></td>
				</tr>
				<tr>
					<td>자택 주소</td>
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
					<td>우편번호</td>
					<td><input type="text" name="post"
						class="postcodify_postcode5" size="6">
						<button type="button" id="postcodify_search_button">검색</button></td>
				</tr>
				<tr>
					<td>근무지 주소</td>
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
					<td>자격증</td>
					<td><input type="text" name="license"></td>
				</tr>
				<tr>
				<tr>
					<td>사업자 등록증</td>
					<td><input type="text" name="businessNo"></td>
				</tr>
				<tr>
				<tr>
					<td colspan="2" align="center">
						<button onclick="return validate();">가입하기</button>
						<button type="button" onclick="location.href='home.na';">홈으로</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<script>
		// 사용할 수 있는 아이디인지 체크해서 가입하기 버튼이 동작하도록 함.
		function validate() {
			//return false; // 가입하기 아무리 눌러도 절대넘어가지 않음
			//return true; 가입하기 버튼이 동작
			//input[type=hidden], id="idDuplicateCheck" 태그를 사용함
			// 이 태그의 value값이 0이면 가입X, 1이면 가입0
			if($("#idDuplicateCheck").val() == 0){
				alert("사용 가능한 아이디를 입력해주세요.")
				$("#artistId").focus();
				return false;
			}else {
				return true;
			}
		}	
	
		//아이디 중복 검사(Ajax)
		$("#artistId").on("blur",function(){
			// this는  <input type="text" name="userId" id="userId" value="admin">를 의미함
			var artistId = $(this).val();
			
			// 아이디가 4글자 미만인 경우
			if(userId.length < 4){
				$(".guide").hide();
				$("#idDuplicateCheck").val(0);
				alert("4글자 미만입니다.");
				return;
			}
			$.ajax({
				url : "dupId.kh",
				data : {"artistId" : artistId},
				success : function(result) {
					// result가 true이면 사용할 수 있습니다.
					// result가 false이면 사용할 수 없습니다.
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
	</section>
	<footer>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
</body>
</html>