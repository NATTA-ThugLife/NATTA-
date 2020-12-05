<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/menubar-style.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<h1 align="center">NATTA!</h1>
	<br>
	<div class="login-area">
		<c:if test="${ empty sessionScope.loginUser }">
		<form action="login.kh" method="post">
			<table align="right">
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
						<a href="/enrollView.kh">회원가입</a>&nbsp;
						<a href="#">아이디/비밀번호 찾기</a>
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
					<td><button onclick="location.href='myInfo.kh'">정보수정</button></td>
					<td><button onclick="location.href='logout.kh'">로그아웃</button></td>
				</tr>
			</table>
		</c:if>
	</div>
	<div class="nav-area">
		<div class="menu" onclick="location.href='home.kh'">HOME</div>
		<div class="menu" onclick="nWriteView();">아티스트소개</div>
		<div class="menu" onclick="boardListView();">공지사항</div>
		<div class="menu" onclick="">QnA</div>
	</div>
	<script>
		function nWriteView() {
			location.href='noticeList.kh';
		}
		function boardListView() {
			location.href='boardList.kh'
		}
	</script>
</body>
</html>