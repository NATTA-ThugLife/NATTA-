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

현재 있는 채팅방
<c:forEach items="${roomList }" var="room">
<c:url value="/chatting.na" var="catting">
	<c:param name="artistId" value="${room.sender }"></c:param>
</c:url>
<br>
<a href="${catting }">${room.sender }</a>
</c:forEach>
</body>
</html>