<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>게시글 목록</title>
</head>
<body>
    <header>
		<jsp:include page="../common/headerNone.jsp"></jsp:include>
	</header>
	
	<section>
	    <section id="book-a-table" class="book-a-table">
		<div class="container" data-aos="fade-up">
			<div class="section-title">
				<h2>QnA ? FAQ ?</h2>
				<p>자주하는 질문</p>
			</div>
		</div>
	    </section>
	
	<h5 align="center">
		<button onclick="location.href='qnaWriteForm.na'">새글 작성</button>
	</h5>
	
	<table align="center" border="1" cellspacing="0" width="800">
		<tr>
			<th>번호</th>
			<th width="300">제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${qList }" var="qna">
		<tr>
			<td align="center">${qna.qnaCode }</td>
			<td align="center">
				<c:url var="qDetail" value="qnaDetailView.na">
					<c:param name="qnaCode" value="${qna.qnaCode }"></c:param>
					<c:param name="page" value="${pi.currentPage }"></c:param>
				</c:url>
				<a href="${ qDetail}">${qna.qnaTitle }</a>
			</td>
			<td align="center">${qna.qnaWriter }</td>
			<td align="center">${qna.qnaCreateDate }</td>
			<td align="center">${qna.qnaHits }</td>
		</tr>
		</c:forEach>
		
		<!-- 페이징 처리 -->
		<tr align="center" height="20">
			<td colspan="6">
				<!-- 이전 -->
				<c:if test="${pi.currentPage <= 1 }">
					[이전]&nbsp;
				</c:if>
				<c:if test="${pi.currentPage >1 }">
					<c:url var="before" value="qnaList.na">
						<c:param name="page" value="${pi.currentPage -1 }"></c:param>
					</c:url>
					<a href="${before }">[이전]</a>
				</c:if>
				<!-- 페이지 -->
				<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
					<c:url var="pagination" value="qnaList.na">
						<c:param name="page" value="${p }"></c:param>
					</c:url>
					<c:if test="${p eq pi.currentPage }">
						<font color="red" size="4">[${p }]</font>
					</c:if>
					<c:if test="${p ne pi.currentPage }">
						<a href="${pagination }">${p }</a>
					</c:if>
				</c:forEach>
				<!-- 다음 -->
				<c:if test="${pi.currentPage >= pi.maxPage }">
					[다음]&nbsp;
				</c:if>
				<c:if test="${pi.currentPage < pi.maxPage }">
					<c:url var="after" value="qnaList.na">
						<c:param name="page" value="${pi.currentPage + 1 }"></c:param>
					</c:url>
					<a href="${after }">[다음]</a>&nbsp;
				</c:if>
			</td>
		</tr>
	</table>
	
	</section>
	<br><br>
        
	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
	
</body>
</html>