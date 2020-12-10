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
	
	<form action="boardUpdate.kh" method="post" enctype="multipart/form-data">
		<input type="hidden" name="page" value="${currentPage }">
		<input type="hidden" name="bId" value="${board.bId }">
		<input type="hidden" name="originalFilename" value="${board.originalFilename }">
		
		<table align="center" id="tb" border="1" cellspacing="0">
			<tr>
				<td>제목</td>
				<td><input type="text" name="bTitle" value="${board.bTitle }"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" readonly name="bWriter" value="${board.bWriter }"></td>
			</tr>		
			<tr>
				<td>내용</td>
				<td><textarea cols="50" rows="7" name="bContent">${board.bContent }</textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					<input type="file" name="reloadFile">
						<c:if test="${ !empty board.originalFilename }">
							<br>현재 업로드한 파일 : 
							<a href="/resources/buploadFiles/${board.originalFilename }" download>${board.originalFilename }</a>
						</c:if>
						
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정"> &nbsp;
					<c:url var="bList" value="boardList.kh">
						<c:param name="page" value="${currentPage }"></c:param>
					</c:url>
					<a href="${bList }">목록으로</a>
					<a href="javascript:history.go(-1);">이전페이지로</a>
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