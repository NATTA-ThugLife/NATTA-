<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
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
<head>
<meta charset="UTF-8">
<title>QnA 수정</title>
<link href="resources/images/tugcat.png" rel="shortcut icon">
</head>
<body>
    <header>
		<jsp:include page="../common/headerNone.jsp"></jsp:include>
	</header>
	
	<section>
	<section id="book-a-table" class="book-a-table">
		<div class="container" data-aos="fade-up">
			<div class="section-title">
				<h2>QnA</h2>
				<p>자주하는 질문</p>
			</div>
		</div>
	    </section>
	<br>	
	<form action="qnaUpdate.na" method="post">
		<input type="hidden" name="page" value="${currentPage }">
		<input type="hidden" name="qnaCode" value="${Qna.qnaCode }">				
		<table align="center" id="tb" border="1" cellspacing="0">
			<tr>
				<td>제목</td>
				<td><input type="text" name="qnaTitle" value="${Qna.qnaTitle }"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" readonly name="qnaWriter" value="${Qna.qnaWriter }"></td>
			</tr>		
			<tr>
				<td>내용</td>
				<td><textarea cols="50" rows="7" name="qnaContents">${Qna.qnaContents }</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정"> &nbsp;
					<%-- <c:url var="qnaList" value="qnaList.na">
						<c:param name="page" value="${currentPage }"></c:param>
					</c:url>
					<a href="${qnaList }">목록</a>
					<a href="javascript:history.go(-1);">이전페이지로</a> --%>
				</td>
			</tr>
		</table>
	</form>	
	</section>
	<br><br>
        
	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
	
</body>
</html>