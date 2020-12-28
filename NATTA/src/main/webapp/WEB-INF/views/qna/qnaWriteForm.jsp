<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 작성</title>
<style>
.customDesign th {
	border-bottom: 0.01px solid dimgrey;
	width: 800px;
	padding: 10px;
}

.customDesign div {
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
				<h2>QnA</h2>
				<p>자주하는 질문</p>
			</div>
 
			<div align="center">
				<div class="col-lg-16 mt-8 mt-lg-0">
					<form action="qnaInsert.na" method="post">
						<div class="form-rrrow">

							<div class="col-md-7 form-group">
								<div style="width: 200px; float: left"></div>
								<div class="col-md-7 form-group">
									<div style="float: left">제목</div>
									<input class="form-control" type="text" name="qnaTitle" required>
								</div>
							</div>
							<div class="col-md-7 form-group">
								<div style="width: 200px; float: left"></div>
								<div class="col-md-7 form-group">
									<div style="float: left">작성자</div>
									<c:if test="${loginCustomer ne null }">
									<input class="form-control" type="text" name="qnaWriter" value="${loginCustomer.customerId }"
										readonly>
									</c:if>
									<c:if test="${loginArtist ne null }">
									<input class="form-control" type="text" name="qnaWriter" value="${loginArtist.artistId }"
										readonly>
									</c:if>
								</div>
							</div>
							<div class="col-md-7 form-group">
								<div style="width: 500px; float: left"></div>
								<div class="col-md-7 form-group">
									<div style="float: left">내용</div>
									<textarea cols="50" rows="7" class="form-control" type="text"
										id="contents" name="qnaContents" required></textarea>
								</div>
							</div>
							<div>
								<div colspan="2" align="center">
									<input type="submit" class="btnl" value="등록"> &nbsp; <a
										href="qna.na">목록</a>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<br>
	<br>
	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>

</body>
</html>