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
		 div.modalContent { position:fixed; top:20%; left:calc(50% - 250px); width:700px; height:480px; padding:20px 10px; border:2px solid #666; }
		 div.modalContent button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
		 div.modalContent button.modal_cancel { margin-left:20px; }
		</style>
		<style>
		 #iii:hover {
		 color:#cda45e;
		 }
		</style>
		<style>
		  table {
		    width: 70%;
		  }
		  .datgle{
		  	 border-bottom: 1px solid #cda45e;
		  }
		</style>
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
		  transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
		}
		</style>
		<style>
			.customDesign th {border-bottom: 0.01px solid dimgrey;width: 800px;padding: 10px;}
			.customDesign td {padding: 20px;width: 800px;}
			.customDesign {border-spacing: 10px;border-top: 0.6px solid #cda45e;border-bottom: 0.6px solid #cda45e;text-align: center;}
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
				<p>맞춤 도안 게시판 게시글</p>
			</div>
			<div class="customDesign" align="center">
				<table style="width:1100px;">
					<thead style="text-align:left;">
						<tr>
							<th style="width:1100px;">
							제목 : ${customDesign.customTitle }
						<br>작성자 : ${customDesign.customerId }
						<br>타투스타일 : ${customDesign.tattooType }</th>
						</tr>
					</thead>
					<tbody align="left">
						<tr>
							<td colspan="3">${customDesign.contents }</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2" align="center"><c:url var="cList"
									value="customDesignList.na">
									<c:param name="page" value="${currentPage }"></c:param>
									</c:url> 
									 <c:if
									test="${customDesign.customerId eq loginCustomer.customerId}">
									<c:url var="cModify" value="customDesignModifyView.na">
										<c:param name="customCode" value="${customDesign.customCode }"></c:param>
										<c:param name="page" value="${currentPage }"></c:param>
									</c:url>
									<c:url var="cDelete" value="customDesignDelete.na">
										<c:param name="customCode" value="${customDesign.customCode }"></c:param>
									</c:url>
									<a href="${cModify }">수정</a>
									<a href="${cDelete }" onclick="return deleteCustom();">삭제</a>
									<a href="${cList }">목록</a>
								</c:if></td>
						</tr>
					</tfoot>
					</table>
			</div>
		</div>
				
		<script>
			function deleteCustom() {
				return confirm("게시글을 삭제하시겠습니까?");
			}
		</script>
	</section>
	<section id="testimonials" class="testimonials section-bg" class="replyList">
    	<!-- 댓글 목록 -->
	<table align="center" style="width:1100px;" id="ctb">
		<thead>
			<tr>
				<td colspan="2"><b id="cCount"></b></td>
			</tr>
		</thead>
		<tbody></tbody>
		<!-- 페이징 처리 -->
		<tfoot></tfoot>
	</table>
    </section>
    <section id="testimonials" class="testimonials section-bg">
    	<c:if test="${loginArtist ne null }">
  		<!-- 댓글 등록 -->

		<table align="center" style="width:1100px;">
			
			
			<tr>
				<td width="90px;">
					<input type="radio" name="cOnOff" value="0" checked><span>공개</span>
					<input type="radio" name="cOnOff" value="1"><span>비공개</span>
				</td>
			</tr>
			<tr>
				
				<td><textarea id="cContents" name="cContents"></textarea>
			<script>
					CKEDITOR.replace('cContents', {
						filebrowserUploadUrl : '/mine/imageUpload.na'
					});
			</script>
			
			<tr>
				<td colspan="2" align="right">
					<input type="button" class="btnl btn-default" value="댓글등록" id="cSubmit">
				</td>
			</tr>
		</table>

	</c:if>
	<input type="hidden" id="sessionArtist" value="${loginArtist.artistId}">
	<input type="hidden" id="sessionCustomer" value="${loginCustomer.customerId }">
	<input type="hidden" id="Writer" value="${customDesign.customerId }">
	<input type="hidden" id=Code value="${customDesign.customCode }">
	
	<!-- 댓글수정 모달창 -->
	<div class="replyModal" style="background-color: rgba(255, 255, 255, 0.4);">
	
		<div class="modalContent">
		<div>
			<h5 class="modal-title" id="TEST">
				<b>댓글 수정</b>
				<br><br>
			</h5>
		</div>
		<div>
			<input type="radio" name="cOnOffModify" value="0" checked><span style="color:white;'">공개</span>
			<input type="radio" name="cOnOffModify" value="1"><span style="color:white;'">비공개</span>
		</div>
		<div>
		 <textarea class="modal_repCon" name="cContentsModify"></textarea>
		 <script>CKEDITOR.replace('cContentsModify',{filebrowserUploadUrl:'/mine/imageUpload.na'});</script>
		</div>
		
		<div align="right">
		 <button type="button" class="modal_modify_btn btnl">수정</button>
		 <button type="button" class="modal_cancel btnl">취소</button>
		</div>
		 
		</div>
		
		<div class="modalBackground"></div>
	</div>
	<script>
		
		
		
		$(function() {
			getCommentList(1);
			/* getReplyList(); */
			// ajax polling
			// 타 회원이 댓글들을 작성했을 수도 있으므로 지속적으로 댓글 불러오기
			setInterval(function(){
				getCommentList();
			}, 50000);
			
			$("#cSubmit").on("click",function(){
				// 댓글 등록 ajax
				var cContents = CKEDITOR.instances.cContents.getData();
				if(cContents == ""){
					alert("댓글을 입력해주세요.")
					return false;
				}
				var customCode = ${customDesign.customCode};
				var cOnOff = $('input:radio[name=cOnOff]:checked').val();
				
				$.ajax({
					url : "addComment.na",
					type :"post",
					data : {"cContents" : cContents, "customCode" : customCode, "cOnOff" : cOnOff },
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
		function getCommentList(page) {
			var customCode = ${customDesign.customCode };
			console.log("현재페이지" + page);
			$.ajax({
				url : "commentList.na",
				type : "get",
				data : {"customCode" : customCode,"page" : page},
				dataType:"json",
				success : function(data) {
					console.log("실행후" + data.pi.currentPage)
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
					var sessionCustomer = $("#sessionCustomer").val();
					var Writer = $("#Writer").val();
					var secret;
					var $br;
					var customCode = $("#Code").val();
					// 댓글 페이징
					var $tableFoot = $("#ctb tfoot");
					$tableFoot.html("");
					var $td;
					var $br;
					
					$("#cCount").text("─────────────────────── 총  " + data.pi.listCount + " 개의 댓글  ─────────────────────── ");  /* 댓글의 갯수 표시 */
					if (data.ccList.length > 0) {
						console.log(data.pi)
						for ( var i in data.ccList ) {
							$tr = $("<tr>");
							$tr2 = $("<tr>");
							$tr3 = $("<tr class='datgle'>");
							$artistId = $("<td float='left'><a href='artistInfoPage.na?artistId="+(data.ccList[i].artistId)+"'>"+data.ccList[i].artistId+"="+data.ccList[i].artistName+"</td>");
							
							$cContents = $("<td float='left' colspan='3' class='replyContent'>").html(decodeURIComponent(data.ccList[i].cContents.replace(/\+/g," "))); 
							
							$ccCreateDate = $("<td>").text('작성일 : '+data.ccList[i].ccCreateDate);
						
							//$modify = $("<td><button class='modify' data-customCCode='"+data.ccList[i].customCCode+"'>수정</button> <button class='delete' data-customCCode='"+data.ccList[i].customCCode+"'>삭제</button>");
							$modify = $("<td><input type='button' class='modify btnl btn-default' data-customCCode='"+data.ccList[i].customCCode+"' value='수정'> <input type='button' class='delete btnl btn-default' data-customCCode='"+data.ccList[i].customCCode+"' value='삭제'>");
							
							$secret = $("<td align='center' colspan='4'>").html('비밀글입니다.');
							
							$br = $("<tr><td>").html('<br><br><br>');
							
							
							if((data.ccList[i].cOnOff == 1 && ((sessionArtist == data.ccList[i].artistId) || (Writer == sessionCustomer))) || (data.ccList[i].cOnOff == 0)){
							$tr.append($artistId,$ccCreateDate);
							$tr2.append($cContents);
							if(sessionArtist == data.ccList[i].artistId){
								$tr.append($modify);
							}
							$tr3.append($tr,$tr2,$br);
							$tableBody.append($tr3);
							}else{
								$tr.append($artistId,$ccCreateDate);
								$tr2.append($secret);
								$tr3.append($tr,$tr2,$br);
							$tableBody.append($tr3);
							}
						}
					}else{
						$tr = $("<tr>");
								// <tr></tr>
						$cContents = $("<td colspan='3'>").text("등록된 댓글이 없습니다."); 
									//<td colspan='3'>no reply</td> 
						$tr.append($cContents); // <tr><td colspan='3'>등록된 댓글이 없습니다.</td></tr>
						$tableBody.append($tr);
					}
					$tr = $("<tr align='center' height='20'>");
					$td = $("<td colspan='3'>");
					var $1 = '[이전]';
					var $2 = $("<a style='color: #cda45e' id='iii' onclick='getCommentList("+parseInt(data.pi.currentPage-1)+")';>").text('[이전]');
					var $3 = $("<font color='#cda45e' size='4'>");
					var $4 = '[다음]';
					var $5 = $("<a style='color: #cda45e' id='iii'  onclick='getCommentList("+parseInt(data.pi.currentPage+1)+")';>").text('[다음]');
					var $6;
					if(data.pi.currentPage<=1){
						$td.append($1);
					}
					if(data.pi.currentPage>1){
						$td.append($2);
					}
					for(var i = data.pi.startPage; i < data.pi.endPage+1; i++ ){
						if(i == parseInt(data.pi.currentPage)){
						$6 = $("<a style='color: #cda45e' onclick='getCommentList("+i+")';>").text('['+i+']');
						$td.append($6);
						}
						else{
						$6 = $("<a onclick='getCommentList("+i+")';>").text(i);
						$td.append($6);
						}
						
					}
					if(data.pi.currentPage >= data.pi.maxPage){
						$td.append($4);
					}
					if(data.pi.currentPage < data.pi.maxPage){
						$td.append($5);
					}
					$tr.append($td);
					$tableBody.append($tr);
					
				}
			});
		}
		
		// 댓글 수정 뷰
		$(document).on("click",".modify",function(){
			$(".replyModal").fadeIn(1000);
			
			var customCCode = $(this).attr("data-customCCode");
			var repCon = $(this).parent().parent().parent().children().children(".replyContent").html();
			
			
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
				var cOnOffModify = $('input:radio[name=cOnOffModify]:checked').val( );
			$.ajax({
				url : "customCommentModify.na",
				type : "post",
				data : {"cContents" : cContents, "customCCode" : customCCode,"cOnOff" : cOnOffModify},
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
    <footer>
    	<jsp:include page="../common/footer.jsp"></jsp:include>
    </footer>
    </body>
</html>