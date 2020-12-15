<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
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
				<p>공지사항 작성</p>
			</div>
		</div>
	 </section>
	
	<form action="noticeWrite.na" method="post" enctype="multipart/form-data">
		<table align="center" border="1" cellspacing="0">
			<tr>
				<td>제목</td>
				<td><input type="text" size="50" name="noticeTitle" required></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="7" cols="50" name="noticeContents" required></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="등록">&nbsp;&nbsp;
					<input type="reset" value=취소>
				</td>
			</tr>
		</table>
	</form>
	</section>
        
	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
</body>
</html>