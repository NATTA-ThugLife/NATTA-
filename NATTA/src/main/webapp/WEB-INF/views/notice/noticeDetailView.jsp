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
	
	<section>
		<section id="book-a-table" class="book-a-table">
		<div class="container" data-aos="fade-up">
			<div class="section-title">
				<h2>Notice</h2>
				<p>공지사항</p>
			</div>
		</div>
	    </section>

	<table align="center" width="450" border="1" cellspacing="0">
		<tr>
			<td width="80">번호</td>
			<td>${notice.noticeCode }</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${notice.noticeTitle }</td>
		</tr>
		<tr>
			<td>작성날짜</td>
			<td>${notice.noticeCreateDate }</td>
		</tr>
		<tr height="300">
			<td>내용</td>
			<td>${notice.noticeContents }</td>
		</tr>
		
		<c:if test="${loginUser.customerId eq notice.noticeWriter }">
		<tr>
			<td colspan="2" align="center">
				<c:url var="nUpdate" value="noticeUpdateView.na">
					<c:param name="noticeCode" value="${notice.noticeCode }"></c:param>
				</c:url>
				<c:url var="nDelete" value="noticeDelete.na">
					<c:param name="noticeCode" value="${notice.noticeCode } "></c:param>
				</c:url>
				<a href="${nUpdate }">수정</a>
				<a href="${nDelete}">삭제</a>
			</td>
		</tr>
		</c:if>
	</table>
	
	<p align="center">
		<c:url var="home" value="main.na"></c:url>
		<c:url var="nList" value="noticeList.na"></c:url>
		<a href="${home }">시작페이지로 이동</a>
		<a href="${nList }">목록 전체보기</a>
	</p>
	
	</section>
        
	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
	
</body>
</html>