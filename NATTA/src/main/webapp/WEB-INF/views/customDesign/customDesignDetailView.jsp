<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>맞춤도안 게시판 디테일</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <!-- Make sure the path to CKEditor is correct. -->
        <script src="/resources/ckeditor/ckeditor.js"></script>
        <style>
		 div.replyModal { position:relative; z-index:1; display:none;}
		 div.modalBackground { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.8); z-index:-1; }
		 div.modalContent { position:fixed; top:20%; left:calc(50% - 250px); width:500px; height:400px; padding:20px 10px; background:#fff; border:2px solid #666; }
		 div.modalContent button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
		 div.modalContent button.modal_cancel { margin-left:20px; }
		</style>
		
    </head>
    <body>
    <header>
    	<jsp:include page="../common/headerNone.jsp"></jsp:include>
    </header>
    <section>
        <table align="center" cellpadding="10"  width="1000">
        	<tr>
        		<td>작성자</td>
        		<td>${customDesign.customerId }</td>
        	</tr>
        	<tr>
        		<td>제목</td>
        		<td>${customDesign.customTitle }</td>
        	</tr>
        	<tr>
        		<td>타투스타일</td>
        		<td>${customDesign.tattooType }</td>
        	</tr>
        	<tr>
        	<td>내용</td>
        	<td>${customDesign.contents }</td>
        	</tr>
        	<tr>
        	</tr>
            <tr>
            	<td colspan="2" align="center">
				<a href="#">목록으로</a>
				
				<c:if test="${customDesign.customerId eq loginCustomer.customerId}">
				<c:url var="cModify" value="customDesignModifyView.na">
					<c:param name="customCode" value="${customDesign.customCode }"></c:param>
				</c:url>
				<a href="${cModify }">수정하기</a>
				</c:if>
            	</td>
            </tr>
		</table>
    </section>
    <section class="replyList">
    	<!-- 댓글 목록 -->
	<table align="center" cellpadding="10"  width="1000" id="ctb">
		<thead>
			<tr>
				<td colspan="2"><b id="cCount"></b></td>
			</tr>
		</thead>
		<tbody></tbody>
	</table>
	
    </section>
    <section>
   		<!-- 댓글 등록 -->
    	<table align="center" cellpadding="10"  width="1000">
		<tr>
     	 	<td><textarea id = "cContents" name = "cContents"></textarea><td>
			<script>CKEDITOR.replace('cContents',{filebrowserUploadUrl:'/mine/imageUpload.na'});</script>
		</tr>
		<tr>
			<td><button id="cSubmit">댓글 등록</button></td>
		</tr>
	</table>
	<input type="hidden" id="sessionArtist" value="${loginArtist.artistId}">
	
	<div class="replyModal">
	
		<div class="modalContent">
		 
		<div>
		 <textarea class="modal_repCon" name="cContentsModify"></textarea>
		 <script>CKEDITOR.replace('cContentsModify',{filebrowserUploadUrl:'/mine/imageUpload.na'});</script>
		</div>
		
		<div>
		 <button type="button" class="modal_modify_btn">수정</button>
		 <button type="button" class="modal_cancel">취소</button>
		</div>
		 
		</div>
		
		<div class="modalBackground"></div>
	 
	</div>
	<script>
		
		
		
		$(function() {
			getCommentList();
			/* getReplyList(); */
			// ajax polling
			// 타 회원이 댓글들을 작성했을 수도 있으므로 지속적으로 댓글 불러오기
			setInterval(function(){
				getCommentList();
			}, 50000);
			
			$("#cSubmit").on("click",function(){
				// 댓글 등록 ajax
				var cContents = CKEDITOR.instances.cContents.getData();
				var customCode = ${customDesign.customCode};
				
				$.ajax({
					url : "addComment.na",
					type :"post",
					data : {"cContents" : cContents, "customCode" : customCode },
					success : function(data) {
						if ( data == "success") {
							getCommentList() 
							CKEDITOR.instances.cContents.setData("");
						}else{
							alert("댓글 등록 실패..");
						}
					}
				});
			});
		});
		
		// 댓글 리스트를 불러오는 ajax Function
		function getCommentList() {
			var customCode = ${customDesign.customCode };
			$.ajax({
				url : "commentList.na",
				type : "get",
				data : {"customCode" : customCode},
				dataType:"json",
				success : function(data) {
					// db에 있는 데이터를 json형태로 가져와서
					// 댓글 목록 테이블의 tbody에 넣어주어야 함.
					
					var $tableBody = $("#ctb tbody");
					$tableBody.html(""); // tbody에 존재하는 값을 초기화
					var $tr;
					var $artistId;
					var $cContents;
					var $ccCreateDate;
					var $modify;
					var sessionArtist = $("#sessionArtist").val();
					
					 
					 
					  
					  
					  
					
					$("#cCount").text("댓글 (" + data.length + ")"); // 댓글의 갯수 표시
					if (data.length > 0) {
						for ( var i in data ) {
							$tr = $("<tr>");
							$artistId = $("<td> width='100'>").text(data[i].artistId);
							
							$cContents = $("<td class='replyContent'>").html(decodeURIComponent(data[i].cContents.replace(/\+/g," "))); 
							
							$ccCreateDate = $("<td> width='150'>").text(data[i].ccCreateDate);
						
							$modify = $("<td><button class='modify' data-customCCode='"+data[i].customCCode+"'>수정</button> <button class='delete' data-customCCode='"+data[i].customCCode+"'>삭제</button>");
							$tr.append($artistId);
							$tr.append($cContents);
							$tr.append($ccCreateDate);
							if(sessionArtist == data[i].artistId){
								$tr.append($modify);
							}
							$tableBody.append($tr);
						}
					}else{
						$tr = $("<tr>");
								// <tr></tr>
						$cContents = $("<td colspan='3'>").text("등록된 댓글이 없습니다."); 
									//<td colspan='3'>no reply</td> 
						$tr.append($cContents); // <tr><td colspan='3'>등록된 댓글이 없습니다.</td></tr>
						$tableBody.append($tr);
					}
				}
			});			
		}
		// 댓글 수정 뷰
		$(document).on("click",".modify",function(){
			$(".replyModal").fadeIn(1000);
			
			var customCCode = $(this).attr("data-customCCode");
			var repCon = $(this).parent().parent().children(".replyContent").html();
			
			
			CKEDITOR.instances.cContentsModify.setData(repCon);
			$(".modal_modify_btn").attr("customCCode", customCCode);
		});
		
		// 댓글 삭제
		$(document).on("click",".delete",function(){
			var deleteConfirm = confirm("댓글을 삭제하겠습니까?");
			
			if(deleteConfirm){
			var customCCode = $(this).attr("data-customCCode");
			
			$.ajax({
				url : "customCommentDelete.na",
				type : "post",
				data : {"customCCode" : customCCode},
				success : function(data){
					
					if(data == "success"){
						getCommentList()
					}
				}
			});
			}
		});
		
		// 댓글 수정
		$(".modal_modify_btn").click(function(){
			var modifyConfirm = confirm("댓글을 수정하겠습니까?");
			
			if(modifyConfirm) {
				var cContents = CKEDITOR.instances.cContentsModify.getData();
				var customCCode = $(this).attr("customCCode");
				
			$.ajax({
				url : "customCommentModify.na",
				type : "post",
				data : {"cContents" : cContents, "customCCode" : customCCode },
				success : function(data){
					
					if ( data == "success") {
						getCommentList() 
						$(".replyModal").fadeOut(1000);
					}
				}
			});
			}
			
		});
			
		// 댓글 수정 취소
		$(".modal_cancel").click(function(){
		 $(".replyModal").fadeOut(1000);
		});
		
			
		
	</script>
    </section>
    </body>
</html>