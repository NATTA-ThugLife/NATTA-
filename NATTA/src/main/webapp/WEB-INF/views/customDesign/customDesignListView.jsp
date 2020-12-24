<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맞춤도안 게시글 리스트</title>
<style>
.customDesign th {border-bottom: 0.01px solid dimgrey;width: 800px;padding: 10px;}
.customDesign td {padding: 20px;width: 800px;}
.customDesign {border-spacing: 10px;border-top: 0.6px solid #cda45e;border-bottom: 0.6px solid #cda45e;text-align: center;}
#custom:hover {
	background: #cda45e;
}
.form-rrrow {
  display: -ms-flexbox;
  display: inline-flex;
  -ms-flex-wrap: wrap;
  flex-wrap: wrap;
  margin-right: -5px;
  margin-left: -5px;
}
.form-rrrow > .col,
.form-rrrow > [class*="col-"] {
  padding-right: 5px;
  padding-left: 5px;
}

</style>
</head>
<body>
	<header>
		<jsp:include page="../common/headerNone.jsp"></jsp:include>
	</header>
	<section id="testimonials" class="testimonials section-bg">
		<div class="container" data-aos="fade-up">
			<div class="section-title">
				<h2>CustomDesign</h2>
				<p>맞춤 도안 게시판 리스트</p>
			</div>
			<div class="customDesign">
				<table>
					<thead>
						<tr>
							<!-- <th>번호</th> -->
							<th>타투스타일</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성날짜</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${cList }" var="cList" varStatus="status">
							<c:if test="${empty cList }">
								<button onclick="location.href='customDesignWriteView.na'">게시글작성</button>
							</c:if>
							<c:url var="cDetail" value="customDesignDetail.na">
								<c:param name="customCode" value="${cList.customCode}"></c:param>
								<c:param name="page" value="${pi.currentPage }"></c:param>
							</c:url>
							<c:choose>
								<c:when
									test="${(cList.onOff eq 1 && ((cList.customerId eq loginCustomer.customerId)) ||(loginArtist ne null)) || (cList.onOff eq 0) }">
									<tr id="custom" onclick="location.href='${cDetail}'">

										<%-- <td align="center">${cList.customCode }</td> --%>

										<td align="center">${cList.tattooType }</td>

										<td align="center">${cList.customTitle }</td>

										<td align="center">${cList.customerId }</td>

										<td align="center">${cList.cCreateDate }</td>

										<td align="center">${cList.customHits }</td>

									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5" align="center">비밀글 입니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<!-- 페이징 처리 -->
						<tr align="center" height="20">
							<td colspan="5">
								<!-- 이전 --> <c:if test="${pi.currentPage <= 1 }">
					[이전]&nbsp;
					</c:if> <c:if test="${pi.currentPage >1 }">
									<c:url var="before" value="customDesignList.na">
										<c:param name="page" value="${pi.currentPage -1 }"></c:param>
									</c:url>
									<a href="${before }">[이전]</a>
								</c:if> <!-- 페이지 --> <c:forEach var="p" begin="${pi.startPage }"
									end="${pi.endPage }">
									<c:url var="pagination" value="customDesignList.na">
										<c:param name="page" value="${p }"></c:param>
									</c:url>
									<c:if test="${p eq pi.currentPage }">
										<font color="#cda45e" size="4">[${p }]</font>
									</c:if>
									<c:if test="${p ne pi.currentPage }">
										<a href="${pagination }">${p }</a>
									</c:if>
								</c:forEach> <!-- 다음 --> <c:if test="${pi.currentPage >= pi.maxPage }">
					[다음]&nbsp;
					</c:if> <c:if test="${pi.currentPage < pi.maxPage }">
									<c:url var="after" value="customDesignList.na">
										<c:param name="page" value="${pi.currentPage + 1 }"></c:param>
									</c:url>
									<a href="${after }">[다음]</a>&nbsp;
					</c:if>
							</td>
						</tr>


					</tbody>
					
				</table>
			</div>
			<c:if test="${!empty loginCustomer }">
			<div style="float:right" class="btns">
				<a href="customDesignWriteView.na" class="btn-book animated fadeInUp scrollto">게시글작성</a>
			</div>
			</c:if>
		</div>
	</section>
	<section class="testimonials section-bg">
		<!-- 게시물 검색하기 -->
		<div align="center">
		<div class="col-lg-8 mt-5 mt-lg-0">
		<form action="customSearch.na" method="get">
			<div class="form-rrrow">
				<div class="col-md-1.5 form-group">
					<select class="form-control" id="name" id="searchCondition" name="searchCondition">
						<option value="all"
							<c:if test="${search.searchCondition == 'all'}">selected</c:if>>전체</option>
						<option value="customTitle"
							<c:if test="${search.searchCondition == 'customTitle'}">selected</c:if>>제목</option>
						<option value="tattooType"
							<c:if test="${search.searchCondition == 'tattooType'}">selected</c:if>>타투종류</option>
						<option value="contents"
							<c:if test="${search.searchCondition == 'contents'}">selected</c:if>>내용</option>
					</select> 
				</div>
				<div class="col-md-6 form-group">
					<input class="form-control" id="name" type="text" name="searchValue" value="${search.searchValue }"
					placeholder="검색내용을 입력해주세요"> 
				</div>
				<div class="col-md-2.5 form-group">
					<input class="form-control" id="name" type="submit" value="검색">
				</div>
			</div>
		</form>
		</div>
		</div>
	</section>

</body>
</html>