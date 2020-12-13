<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
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
	<form action="qnaInsert.na" method="post">
		<table align="center" id="tb">
			<tr>
				<td>제목</td>
				<td><input type="text" name="qnaTitle"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="qnaWriter" value="${loginCustomer.customerId }" readonly></td>
			</tr>		
			<tr>
				<td>내용</td>
				<td><textarea cols="50" rows="7" name="qnaContents"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="등록"> &nbsp;
					<a href="qna.na">목록</a>
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