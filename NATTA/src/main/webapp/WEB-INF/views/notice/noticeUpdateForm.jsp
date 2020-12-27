<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
<style>
.btnl {
	display: inline-block;
	font-weight: 400;
	color: #cda45e;
	text-align: center;
	vertical-align: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	background-color: transparent;
	border: 1px solid transparent;
	padding: 0.375rem 0.75rem;
	font-size: 1rem;
	line-height: 1.5;
	border-radius: 0.25rem;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}
</style>
</head>
<body>
    <header>
		<jsp:include page="../common/headerNone.jsp"></jsp:include>
	</header>
	
	<section>
	<section id="book-a-table" class="book-a-table">
		<div class="container" data-aos="fade-up">
			<div class="section-title">
				<h2>Notice</h2>
				<p>공지사항 수정</p>
			</div>
		</div>
	    </section>

	<br><br>
	
		<form action="noticeUpdate.na" method="post">
			<input type="hidden" name="noticeCode" value="${Notice.noticeCode }">
			<table align="center" border="1" cellspacing="0">
			<tr>
				<td>제목</td>
				<td><input type="text" size="50" name="noticeTitle" value="${Notice.noticeTitle }"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="7" cols="50" name="noticeContents">${Notice.noticeContents }</textarea></td>
			</tr>			
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정">
				   <c:url var="back" value="${header.referer }"></c:url>
		           <a href="${back }">취소</a> 
				</td>
			</tr>
			</table>
		</form>	
	
<%-- 	<p align="center">
		<c:url var="back" value="${header.referer }"></c:url>
		<a href="${back }">이전</a>
	</p> --%>
	
	</section>
        
	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
</body>
</html>