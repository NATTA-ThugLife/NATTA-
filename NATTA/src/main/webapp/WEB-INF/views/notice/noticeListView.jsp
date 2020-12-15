<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
    <header>
		<jsp:include page="../common/headerNone.jsp"></jsp:include>
	</header>
	
	<section> <!--  class="events" -->
		<section >
		<div class="container" data-aos="fade-up">
			<div class="section-title">
				<h2>Notice</h2>
				<p>공지사항</p>
			</div>
		</div>
	    </section>

	<c:if test="${loginCustomer.customerId eq 'admin' }">
		<div align="center">
			<button onclick="location.href='noticeWriteForm.na'">글쓰기</button>
		</div>
	</c:if>
	<br style="clear:both">
	<table align="center" width="800" border="1" cellspacing="0" >
		<tr>
			<th>번호</th>
			<th width="300">제목</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${nList }" var="notice">
		<tr>
			<td align="center">${notice.noticeCode }</td>
			<!-- 
			로그인 상태에서만 상세보기 가능
			로그인 상태가 아닌 경우 공지사항 제목만 출력
			 -->
			<td>
				<c:if test="${!empty loginCustomer }">
					<c:url var="noticeDetail" value="noticeDetailView.na">
						<c:param name="noticeCode" value="${notice.noticeCode }"></c:param>
					</c:url>
					<a href="${noticeDetail }">${notice.noticeTitle }</a>
				</c:if>
				<c:if test="${empty loginCustomer }">
					${notice.noticeTitle }
				</c:if>
			</td>
			<td align="center">${notice.noticeCreateDate }</td>
			<td align="center">${notice.noticeHits }</td>
		</tr>
		</c:forEach>
	</table>
	
	<!-- 게시물 검색 -->	
	<div id="searchArea" align="center">
		<form action="noticeSearch.na" method="get">
			<select id="searchCondition" name="searchCondition">
				<option value="all" <c:if test="${search.searchCondition == 'all'}">selected</c:if>>전체</option>
				<option value="writer" <c:if test="${search.searchCondition == 'writer'}">selected</c:if>>작성자</option>
				<option value="title" <c:if test="${search.searchCondition == 'title'}">selected</c:if>>제목</option>
				<option value="content" <c:if test="${search.searchCondition == 'content'}">selected</c:if>>내용</option>
			</select>
			<input type="text" name="searchValue" value="${search.searchValue }">
			<input type="submit" value="검색">
		</form>
	</div>
	
	</section>
        
	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>

</body>
</html>