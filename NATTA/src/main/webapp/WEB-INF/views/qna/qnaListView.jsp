<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.customDesign th {
	border-bottom: 0.01px solid dimgrey;
	width: 800px;
	padding: 10px;
}

.customDesign td {
	padding: 20px;
	width: 800px;
}

.customDesign {
	border-spacing: 10px;
	border-top: 0.6px solid #cda45e;
	border-bottom: 0.6px solid #cda45e;
	text-align: center;
}

#custom:hover {
	background: #cda45e;
}
</style>
<title>게시글 목록</title>
</head>
<body>
    <header>
		<jsp:include page="../common/headerNone.jsp"></jsp:include>
	</header>
	
	<section id="testimonials" class="about">
		<div class="container" data-aos="fade-up">
			<div class="section-title">
				<h2>QnA</h2>
				<p>질문 게시판</p>
			</div>	    
	<div class="customDesign">	
	<table>
	<thead>
		<tr>
			<th>번호</th>
			<th width="300">제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${qList }" var="qna">
		<tr id="custom" onclick="location.href='${qDetail}'">
			<td align="center">${qna.qnaCode }</td>
				<c:url var="qDetail" value="qnaDetailView.na">
					<c:param name="qnaCode" value="${qna.qnaCode }"></c:param>
					<c:param name="page" value="${pi.currentPage }"></c:param>
				</c:url>				
			<td align="center">${qna.qnaTitle }</td>
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
					<c:url var="before" value="qna.na">
						<c:param name="page" value="${pi.currentPage -1 }"></c:param>
					</c:url>
					<a href="${before }">[이전]</a>
				</c:if>
				<!-- 페이지 -->
				<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
					<c:url var="Paging" value="qna.na">
						<c:param name="page" value="${p }"></c:param>
					</c:url>
					<c:if test="${p eq pi.currentPage }">
						<font color="white" size="4">[${p }]</font>
					</c:if>
					<c:if test="${p ne pi.currentPage }">
						<a href="${Paging }">${p }</a>
					</c:if>
				</c:forEach>
				<!-- 다음 -->
				<c:if test="${pi.currentPage >= pi.maxPage }">
					[다음]&nbsp;
				</c:if>
				<c:if test="${pi.currentPage < pi.maxPage }">
					<c:url var="after" value="qna.na">
						<c:param name="page" value="${pi.currentPage + 1 }"></c:param>
					</c:url>
					<a href="${after }">[다음]</a>&nbsp;
				</c:if>
				<div align="right">
					<button onclick="location.href='qnaWriteForm.na'">새글 작성</button>
				</div>
				</tbody>
			</td>		
		</tr>
	</table>
	</div>
	</section>
	<br><br>
        
	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
	
</body>
</html>