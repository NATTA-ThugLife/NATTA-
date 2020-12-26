<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>맞춤도안 게시판 등록</title>
        <!-- Make sure the path to CKEditor is correct. -->
        <script src="/resources/ckeditor/ckeditor.js"></script>
        <style>
        .form-rrrow {
  display: -ms-flexbox;
  display: flex;
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
	<section id="modifyInfo">
		<div class="container">
			<div class="modal-header">
				<h5 class="modal-title">
					<b style="color:white">맞춤도안 작성</b>
				</h5>
			</div>
			<div align="center">
				<div class="col-lg-16 mt-8 mt-lg-0">
					<form action="customDesignInsert.na" method="post" enctype="multipart/form-data">
						<div class="form-rrrow">
							<div class="col-md-6 form-group">
								<div style="float: left">작성자 :</div>
								<input class="form-control" type="text" name="customerId"
										value="${loginCustomer.customerId }" readonly>
							</div>
							
							<div class="col-md-6 form-group">
								<div style="float: left">제목 : </div>
								<input class="form-control" type="text" id="customTitle"name="customTitle">
							</div>
							
							<div class="col-md-6 form-group">
								<div style="float: left">타투스타일 : </div>
								<select class="form-control" name="tattooType">
									<option value="올드스쿨">올드스쿨</option>
									<option value="이레즈미">이레즈미</option>
									<option value="트라이벌">트라이벌</option>
									<option value="리얼리스틱">리얼리스틱</option>
									<option value="레터링">레터링</option>
									<option value="치카노">치카노</option>
								</select>
							</div>
							<div style="width: 1000px;">
								<div style="width: 200px; float:left">
									<input type="radio" name="onOff" value="0" checked><span>공개</span>
									<input type="radio" name="onOff" value="1"><span>비공개</span>
								</div>
								<div style="width: 800px; float:left">

									<textarea class="form-control" id="contents" name="contents"></textarea>
								</div>
							</div>
							<script>
									CKEDITOR.replace('contents',{
									filebrowserUploadUrl : '/mine/imageUpload.na'});
							</script>
							<div>
								<input class="form-control" id="btnr" type="submit" onclick="return validate();" value="게시글 작성" >
							</div>
							<a href="#">목록으로</a>
							</div>
						</form>
						</div>
				</div>
			</div>
	</section>
	<script>
		function validate() {
			if ($("#customTitle").val() == "") {
				alert("제목을 입력해주세요.")
				$("#customTitle").focus();
				return false;
			}
			if (CKEDITOR.instances.contents.getData() == "") {
				alert("내용을 입력해주세요.")
				return false;
			} else {
				return true;
			}
		}
	</script>
    </body>
</html>