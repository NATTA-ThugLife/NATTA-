<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세조회</title>
</head>
<body>
    <header>
		<jsp:include page="../common/headerNone.jsp"></jsp:include>
	</header>
	
	<section>
	<section id="book-a-table" class="book-a-table">
		<div class="container" data-aos="fade-up">
			<div class="section-title">
				<h2>QnA</h2>
				<p>자주하는 질문</p>
			</div>
		</div>
	    </section>
	<br>
	<table align="center" cellpadding="10" cellspacing="0" border="1"
		width="500">

		<tr align="center" valign="middle">
			<th colspan="2">${board.bId }번글 상세보기</th>
		</tr>
		<tr>
			<td height="15" width="70">제목</td>
			<td>${board.bTitle }</td>
		</tr>
		<tr>
			<td height="15" width="70">작성자</td>
			<td>${board.bWriter }</td>
		</tr>
		<tr height="300">
			<td>내용</td>
			<td>${board.bContent }</td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td>         <c:if test="${!empty board.originalFilename }">
            	<a href="/resources/buploadFiles/${board.renameFilename }" download>${board.originalFilename }</a>
            	<!-- ctrl + l : 입력한 라인으로 이동시킴-->
        		 </c:if>
			</tr>
		<tr>
			<td>파일</td>
			<td>
				<c:if test="${ !empty board.originalFilename }">
					<img src="/resources/buploadFiles/${board.renameFilename }">
				</c:if></td>
			</tr>
		<tr>
			<td colspan="2" align="center">
				<c:url var="bUpView" value="boardUpdateView.kh">
					<c:param name="bId" value="${board.bId }"></c:param>
					<c:param name="page" value="${currentPage }"></c:param>
				</c:url>
				<c:url var="bDelete" value="boardDelete.kh">
					<c:param name="bId" value="${board.bId }"></c:param>
				</c:url>
				<c:url var="bList" value="boardList.kh">
					<c:param name="page" value="${currentPage }"></c:param>
				</c:url>
				<a href="${bUpView }">수정하기</a> 
				<a href="${bDelete }">삭제하기</a>
				<a href="#">목록으로</a>
			</td>
		</tr>
	</table>
	<br>
	<br>


	<!-- 댓글 등록 -->
	<table align="center" width="500" border="1" cellspacing="0">
		<tr>
			<td><textarea rows="3" cols="55" id="rContent"></textarea></td>
			<td>
				<button id="rSubmit">등록하기</button>
			</td>
		</tr>
	</table>

	<!-- 댓글 목록 -->
	<table align="center" width="500" border="1" cellspacing="0" id="rtb">
		<thead>
			<tr>
				<td colspan="2"><b id="rCount"></b></td>
			</tr>
		</thead>
		<tbody></tbody>
	</table>
	
	</section>
        
	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
	


	<script>
		$(function() {
			getReplyList();
			/* getReplyList(); */
			// ajax polling
			// 타 회원이 댓글들을 작성했을 수도 있으므로 지속적으로 댓글 불러오기
			setInterval(function(){
				getReplyList();
			}, 5000);
			
			$("#rSubmit").on("click",function(){
				// 댓글 등록 ajax
				var rContent = $("#rContent").val();
				var refBid = ${board.bId};
				
				$.ajax({
					url : "addReply.kh",
					type :"post",
					data : {"rContent" : rContent, "refBid" : refBid },
					success : function(data) {
						if ( data == "success") {
							getReplyList() // 댓글리스트를 불러오는 function 추가
							$("#rContent").val("");
						}else{
							alert("댓글 등록 실패..");
						}
					}
				});
			});
		});
		
		// 댓글 리스트를 불러오는 ajax Function
		function getReplyList() {
			var bId = ${board.bId };
			$.ajax({
				url : "replyList.kh",
				type : "get",
				data : {"bId" : bId},
				dataType:"json",
				success : function(data) {
					// db에 있는 데이터를 json형태로 가져와서
					// 댓글 목록 테이블의 tbody에 넣어주어야 함.
					var $tableBody = $("#rtb tbody");
					$tableBody.html(""); // tbody에 존재하는 값을 초기화
					
					var $tr;
					var $rWriter;
					var $rContent;
					var $rCreateDate;
					
					$("#rCount").text("댓글 (" + data.length + ")"); // 댓글의 갯수 표시
					if (data.length > 0) {
						for ( var i in data ) {
							$tr = $("<tr>");
							$rWriter = $("<td width='100'>").text(data[i].rWriter);
							$rContent = $("<td>").text(decodeURIComponent(data[i].rContent.replace(/\+/g," "))); //컨트롤러에서 인코딩을해줬기때문에 디코딩을함
							$rCreateDate = $("<td width='100'>").text(data[i].rCreateDate);
							
							$tr.append($rWriter);
							$tr.append($rContent);
							$tr.append($rCreateDate);
							$tableBody.append($tr);
						}
					}else{
						$tr = $("<tr>"); 
								// <tr></tr>
						$rContent = $("<td colspan='3'>").text("등록된 댓글이 없습니다."); 
									//<td colspan='3'>no reply</td> 
						$tr.append($rContent); // <tr><td colspan='3'>등록된 댓글이 없습니다.</td></tr>
						$tableBody.append($tr);
					}
				}
			});			
		}
	</script>

</body>
</html>