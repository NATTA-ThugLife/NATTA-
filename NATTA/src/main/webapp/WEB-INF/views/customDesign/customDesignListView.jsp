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
	background : blue;
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
				<th>번호</th>
				<th>제목</th>
				<th>타투스타일</th>
				<th>작성자</th>
				<th>올린날짜</th>
			</tr>
			<c:forEach items="${cList }" var="cList">
				<c:if test="${empty cList }">
					<button onclick="location.href='customDesignWriteView.na'">게시글작성</button>
				</c:if>
			<tr id="custom" onclick="location.href='customDesignDetail.na?customCode=${cList.customCode}'">
				
				<td align="center">${cList.customCode }</td>
			
				<td align="center">${cList.customTitle }</td>
			
				<td align="center">${cList.tattooType }</td>
			
				<td align="center">${cList.customerId }</td>
			
				<td align="center">${cList.cCreateDate }</td>
				
			</tr>
			</c:forEach>
			<tr>
			<td colspan="5" align="right">
			<c:if test="${!empty loginCustomer }">
			<button onclick="location.href='customDesignWriteView.na'">게시글작성</button>
			</c:if>
			</td>
			</tr>
		</table>
		
	</section>
</body>
</html>