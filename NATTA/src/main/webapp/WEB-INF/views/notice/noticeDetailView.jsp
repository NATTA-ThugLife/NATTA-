<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>
		 div.replyModal { position:relative; z-index:1; display:none;}
		 div.modalBackground { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.8); z-index:-1; }
		 div.modalContent { position:fixed; top:20%; left:calc(50% - 250px); width:500px; height:400px; padding:20px 10px; background:#fff; border:2px solid #666; }
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
			.customDesign th {border-bottom: 0.01px solid dimgrey;width: 800px;padding: 10px;}
			.customDesign td {padding: 20px;width: 800px;}
			.customDesign {border-spacing: 10px;border-top: 0.6px solid #cda45e;border-bottom: 0.6px solid #cda45e;text-align: center;}
		</style>
</head>
<body>
    <header>
		<jsp:include page="../common/headerNone.jsp"></jsp:include>
	</header>
	
	<section>
		<section id="testimonials" class="testimonials section-bg">
		<div class="container" data-aos="fade-up">
			<div class="section-title">
				<h2>Notice</h2>
				<p>공지사항</p>
			</div>
		</div>
	    </section>

	<table class="customDesign" align="center" width="450" border="1" cellspacing="0">
		<thead>
		<tr>
			<td width="80">번호</td>
			<td>${notice.noticeCode }</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${notice.noticeTitle }</td>
		</tr>
		<tr>
			<td>작성날짜</td>
			<td>${notice.noticeCreateDate }</td>
		</tr>
		</thead>
		
		<tbody align="left">
		<tr height="300">
			<td>내용</td>
			<td>${notice.noticeContents }</td>
		</tr>
		</tbody>
		
		<tfoot>
		<c:if test="${loginCustomer.customerId eq notice.noticeWriter }">
		<tr>
			<td colspan="2" align="center">
				<c:url var="nUpdate" value="noticeUpdateForm.na">
					<c:param name="noticeCode" value="${notice.noticeCode }"></c:param>
				</c:url>
				<c:url var="nDelete" value="noticeDelete.na">
					<c:param name="noticeCode" value="${notice.noticeCode } "></c:param>
				</c:url>
				<c:url var="nList" value="notice.na"></c:url>
				<a href="${nUpdate }">수정</a>
				<a href="${nDelete}"onclick="return deleteNotice();">삭제</a>
				<a href="${nList }">목록</a>
			</td>
		</tr>
		</c:if>
		</tfoot>
	</table>
			<script>
			function deleteNotice() {
				return confirm("게시글을 삭제하시겠습니까?");
			}
		</script>
	</section>
        
	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
	
</body>
</html>