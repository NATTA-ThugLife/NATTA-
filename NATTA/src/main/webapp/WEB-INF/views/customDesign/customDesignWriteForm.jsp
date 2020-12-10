<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>맞춤도안 게시판 등록</title>
        <!-- Make sure the path to CKEditor is correct. -->
        <script src="/resources/ckeditor/ckeditor.js"></script>
    </head>
    <body>
    <header>
    	<jsp:include page="../common/headerNone.jsp"></jsp:include>
    </header>
    <section>
        <form action="customDesignInsert.na" method="post" enctype="multipart/form-data">
        <table align="center" cellpadding="10"  width="1000">
        	<tr>
        		<td>작성자</td>
        		<td><input type="text" name="customerId" value="${loginCustomer.customerId }" readonly></td>
        	</tr>
        	<tr>
        		<td>제목</td>
        		<td><input type="text" name="customTitle"></td>
        	</tr>
        	<tr>
        		<td>타투스타일</td>
        		<td><input type="text" name="tattooType"></td>
        	</tr>
        	<tr>
        		<td>내용</td>
       	 		<td><textarea id = "contents" name = "contents"></textarea><td>
				<script>
							CKEDITOR.replace('contents',{filebrowserUploadUrl:'/mine/imageUpload.na'});
				</script>
        	</tr>
            <tr>
            	<td colspan="2" align="center">
            	<input type="submit" value="등록하기"> &nbsp;
				<a href="#">목록으로</a>
            	</td>
            </tr>
		</table>
        </form>
    </section>
    </body>
</html>