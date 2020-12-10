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

${loginUser }님<br>

상세페이지에서 문의하기 버튼 클릭시 채팅방 있는지 체크 후 채팅방 생성후 채팅방으로
<c:forEach items="${artist }" var="artist">
<c:url value="/chatting.na" var="catting">
	<c:param name="artistId" value="${artist }"></c:param>
</c:url>
<br>
<a href="${catting }">${artist }</a>
</c:forEach>




</body>
</html>