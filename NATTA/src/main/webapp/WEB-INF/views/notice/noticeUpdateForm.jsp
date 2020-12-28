<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
<style>
.btnl {
	display: inline-block;
	font-weight: 400;
	color: #cda45e;
	text-align: center;
	vertical-align: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	background-color: transparent;
	border: 1px solid transparent;
	padding: 0.375rem 0.75rem;
	font-size: 1rem;
	line-height: 1.5;
	border-radius: 0.25rem;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}
</style>
<link href="resources/images/tugcat.png" rel="shortcut icon">
</head>
<body>
    <header>
		<jsp:include page="../common/headerNone.jsp"></jsp:include>
	</header>
	
	<section id="testimonials" class="about">
		<div class="container" data-aos="fade-up">
			<div class="section-title">
				<h2>Notice</h2>
				<p>공지사항 수정</p>
			</div>
					
		<div align="center">
				<div class="col-lg-16 mt-8 mt-lg-0">
					<form action="noticeUpdate.na" method="post">
					<input type="hidden" name="noticeCode" value="${Notice.noticeCode }">
						<div class="form-rrrow">
							<div class="col-md-11 form-group">
								<div style="width: 500px; float: left"></div>
								<div class="col-md-7 form-group">
									<div style="float: left">제목</div>
									<input class="form-control" type="text" name="noticeTitle" value="${Notice.noticeTitle }" required>
								</div>
							</div>

							<div class="col-md-11 form-group">
								<div style="width: 500px; float: left"></div>
								<div class="col-md-7 form-group">
									<div style="float: left">내용</div>
									<textarea cols="100" rows="10" class="form-control" 
										name="noticeContents" required>${Notice.noticeContents }</textarea>
								</div>
							</div>
							<div>
								<div colspan="2" align="center">
									<input type="submit" class="btnl" value="수정"> &nbsp;
									<c:url var="back" value="${header.referer }"></c:url>
		           <a href="${back }">취소</a> 
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
	</div>
	</section>
    <footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
</body>
</html>