<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="login-area">
		<c:if test="${ empty sessionScope.loginUser }">
		<form action="/login.na" method="post">
			<table align="center">
				<tr>
					<td>아이디 : </td>
					<td><input type="text" name="userId"></td>
					<td rowspan="2">
						<button id="login-btn" class="btn btn-login">로그인</button>
					</td>
				</tr>
				<tr>
					<td>비밀번호 : </td>
					<td><input type="password" name="password"></td>
				</tr>
				<tr>
					<td colspan="3">
						<a href="/joinOption.na">회원가입</a>&nbsp;
						<a href="/find.na">아이디/비밀번호 찾기</a>
					</td>
				</tr>
			</table>
		</form>
		</c:if>
		<c:if test="${!empty sessionScope.loginUser }">
			<table align="right">
				<tr>
					<td colspan="2"><h3>${loginUser.userName } 님 환영합니다.</h3></td>
				</tr>
				<tr>
					<td><button onclick="location.href='#'">정보수정</button></td>
					<td><button onclick="location.href='customereLogout.na'">로그아웃</button></td>
				</tr>
			</table>
		</c:if>
	</div>

</body>
</html>