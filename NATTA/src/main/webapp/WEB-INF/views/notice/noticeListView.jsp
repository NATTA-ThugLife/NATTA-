<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
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

 .btn-new {
  font-weight: 600;
  font-size: 13px;
  letter-spacing: 0.5px;
  text-transform: uppercase;
  display: inline-block;
  padding: 12px 30px;
  border-radius: 50px;
  transition: 0.3s;
  line-height: 1;
  color: #fff;
  border: 2px solid #cda45e;
  background: #cda45e;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="../common/headerNone.jsp"></jsp:include>
	</header>

	<section id="testimonials" class="about">
		<div class="container" data-aos="fade-up">
			<div class="section-title">
				<h2>Notice</h2>
				<p>공지사항</p>
			</div>

			<div class="customDesign">
				<table>
					<thead>
						<tr>
							<th>번호</th>
							<th width="300">제목</th>
							<th>날짜</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${nList }" var="notice">
							<tr id="custom" onclick="location.href='${noticeDetail}'">
								<td align="center">${notice.noticeCode }</td>
										<c:url var="noticeDetail" value="noticeDetailView.na">
											<c:param name="noticeCode" value="${notice.noticeCode }"></c:param>
										</c:url>																
								<td align="center">${notice.noticeTitle }</td>								
								<td align="center">${notice.noticeCreateDate }</td>
								<td align="center">${notice.noticeHits }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</div>
				<tr><td><br></td></tr>
				
				<c:if test="${loginCustomer.customerId eq 'admin' }">
						<div style="float: right">
							<button onclick="location.href='noticeWriteForm.na'" class="btn-new">새글 작성</button>
						</div>
				</c:if>
				
				<!-- 게시물 검색 -->
				<div id="searchArea" align="center">
					<form action="noticeSearch.na" method="get">
						<select id="searchCondition" name="searchCondition">
							<option value="all"
								<c:if test="${search.searchCondition == 'all'}">selected</c:if>>전체</option>
							<option value="noticeTitle"
								<c:if test="${search.searchCondition == 'noticeTitle'}">selected</c:if>>제목</option>
							<option value="noticeContents"
								<c:if test="${search.searchCondition == 'noticeContents'}">selected</c:if>>내용</option>
						</select> 
						<input type="text" name="searchValue" value="${search.searchValue }"> 
							<input type="submit" value="검색">
					</form>					
				</div>
				<tr><td><br></td></tr>
			</section>

	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>

</body>
</html>