<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<jsp:include page="../common/header2.jsp"></jsp:include>
	</header>
	<section>
	<div class="login-area">
			<table align="center">
				<tr>
					<td><button onClick="location.href='customereJoinView.na'">일반 회원</button></td>
					<td><button onClick="location.href='artistJoinView.na'">타투이스트</button></td>
				</tr>
			</table>
	</div>
		</section>

	<footer>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
</body>
</html>