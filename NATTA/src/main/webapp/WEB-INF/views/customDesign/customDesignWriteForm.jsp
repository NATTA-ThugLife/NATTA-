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
        		<td><input type="text" id="customTitle" name="customTitle"></td>
        	</tr>
        	<tr>
        		<td>타투스타일</td>
        		<td>
        		<select name="tattooType">
        		<option value="올드스쿨">올드스쿨</option>
        		<option value="이레즈미">이레즈미</option>
        		</select>
        		</td>
        	</tr>
        	<tr>
        		
        		
        	</tr>
        	<tr>
        		<td align="center" >	
        			<input type="radio" name="onOff" value="0" checked><span>공개</span>
        			<br><br>
        			<input type="radio" name="onOff" value="1"><span>비공개</span>
        		</td>
       	 		<td><textarea id = "contents" name = "contents"></textarea>
				<script>
							CKEDITOR.replace('contents',{filebrowserUploadUrl:'/mine/imageUpload.na'});
				</script>
				<td>
        	</tr>
            <tr>
            	<td colspan="2" align="center">
            	<input type="submit" onclick="return validate();" value="등록하기"> &nbsp;
				<a href="#">목록으로</a>
            	</td>
            </tr>
		</table>
        </form>
    </section>
    <script>
    	function validate(){
    		if($("#customTitle").val() == ""){
    			alert("제목을 입력해주세요.")
    			$("#customTitle").focus();
    			return false;
    		}
    		if(CKEDITOR.instances.contents.getData() == ""){
    			alert("내용을 입력해주세요.")
    			return false;
    		}else{
    			return true;
    		}
    	}
    </script>
    </body>
</html>