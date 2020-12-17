<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맞춤도안 게시글 리스트</title>
<style>
#custom:hover {
	background: blue;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="../common/headerNone.jsp"></jsp:include>
	</header>
	<section>
		<table align="center" width="1000" border="1" cellspacing="0">
			<tr>
				<!-- <th>번호</th> -->
				<th>제목</th>
				<th>타투스타일</th>
				<th>작성자</th>
				<th>올린날짜</th>
				<th>조회수</th>
			</tr>
			<c:forEach items="${cList }" var="cList" varStatus="status">
				<c:if test="${empty cList }">
					<button onclick="location.href='customDesignWriteView.na'">게시글작성</button>
				</c:if>
				<c:url var="cDetail" value="customDesignDetail.na">
					<c:param name="customCode" value="${cList.customCode}"></c:param>
					<c:param name="page" value="${pi.currentPage }"></c:param>
				</c:url>
				<c:choose>
				<c:when test="${(cList.onOff eq 1 && ((cList.customerId eq loginCustomer.customerId)) ||(loginArtist ne null)) || (cList.onOff eq 0) }">
				<tr id="custom" onclick="location.href='${cDetail}'">

					<%-- <td align="center">${cList.customCode }</td> --%>

					<td align="center">${cList.customTitle }</td>

					<td align="center">${cList.tattooType }</td>

					<td align="center">${cList.customerId }</td>

					<td align="center">${cList.cCreateDate }</td>

					<td align="center">${cList.customHits }</td>

				</tr>
				</c:when>
				<c:otherwise><tr>
				<td colspan="5" align="center">
				비밀글 입니다.</td></tr></c:otherwise>
				</c:choose>
			</c:forEach>
			<!-- 페이징 처리 -->
			<tr align="center" height="20">
				<td colspan="5">
					<!-- 이전 --> 
					<c:if test="${pi.currentPage <= 1 }">
					[이전]&nbsp;
					</c:if> 
					<c:if test="${pi.currentPage >1 }">
						<c:url var="before" value="customDesignList.na">
							<c:param name="page" value="${pi.currentPage -1 }"></c:param>
						</c:url>
						<a href="${before }">[이전]</a>
					</c:if> 
					<!-- 페이지 --> 
					<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
						<c:url var="pagination" value="customDesignList.na">
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
						<c:url var="after" value="customDesignList.na">
							<c:param name="page" value="${pi.currentPage + 1 }"></c:param>
						</c:url>
						<a href="${after }">[다음]</a>&nbsp;
					</c:if>
				</td>
			</tr>

			<tr>
				<td colspan="5" align="right"><c:if
						test="${!empty loginCustomer }">
						<button onclick="location.href='customDesignWriteView.na'">게시글작성</button>
					</c:if></td>
			</tr>
		</table>
	</section>
	<section>
		<!-- 게시물 검색하기 -->
		<div id="searchArea" align="center">
			<form action="customSearch.na" method="get">
				<select id="searchCondition" name="searchCondition">
					<option value="all"
						<c:if test="${search.searchCondition == 'all'}">selected</c:if>>전체</option>
					<option value="customTitle"
						<c:if test="${search.searchCondition == 'customTitle'}">selected</c:if>>제목</option>
					<option value="tattooType"
						<c:if test="${search.searchCondition == 'tattooType'}">selected</c:if>>타투종류</option>
					<option value="contents"
						<c:if test="${search.searchCondition == 'contents'}">selected</c:if>>내용</option>
				</select> <input type="text" name="searchValue"
					value="${search.searchValue }"> <input type="submit"
					value="검색">
			</form>
		</div>
	</section>

</body>
</html>