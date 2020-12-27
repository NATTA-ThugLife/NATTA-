<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세조회</title>
<style>
       div.replyModal { position:relative; z-index:1; display:none;}
       div.modalBackground { position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0, 0, 0, 0.8); z-index:-1; }
       div.modalContent { position:fixed; top:20%; left:calc(50% - 250px); width:500px; height:400px; padding:20px 10px; background:#fff; border:2px solid #666; }
       div.modalContent button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
       div.modalContent button.modal_cancel { margin-left:20px; }

       #iii:hover {
       color:#cda45e;
       }
   
        table {
          width: 70%;
        }
        .datgle{
            border-bottom: 1px solid #cda45e;
        }
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
            <h2>QnA</h2>
            <p>자주하는 질문</p>
         </div>
      
   <div class="customDesign" align="center">   
   <table align="center">
   <thead>      
      <tr>
         <th>제목 : ${Qna.qnaTitle }</th>
         <th>작성자 : ${Qna.qnaWriter }</th>
         <th>작성날짜 : ${Qna.qnaCreateDate }</th>
      </tr>
   </thead>

      <tbody align="left">
      <tr colspan="3">
         <td>내용</td>
         <td>${Qna.qnaContents }</td>
      </tr>
      </tbody>
      
      <c:if test="${loginCustomer.customerId eq Qna.qnaWriter }">
      <tr>
         <td colspan="4" align="center">
            <c:url var="bUpView" value="qnaUpdateForm.na">
               <c:param name="qnaCode" value="${Qna.qnaCode }"></c:param>
               <c:param name="page" value="${currentPage }"></c:param>
            </c:url>
            <c:url var="bDelete" value="qnaDelete.na">
               <c:param name="qnaCode" value="${Qna.qnaCode }"></c:param>
            </c:url>
            <c:url var="bList" value="qna.na">
               <c:param name="page" value="${currentPage }"></c:param>
            </c:url>
            <a href="${bUpView }">수정</a> 
            <a href="${bDelete }">삭제</a>
            <a href="${bList }">목록</a>
         </td>
      </tr>
      </c:if>
   </table>
   </div><br><br>
    
   <!-- 댓글 등록 -->
   <table align="center" width="250" >   
      <tr>
         <td><textarea rows="3" cols="55" id="qcContents" name="qcContents"></textarea></td>
         <td>
            <button id="qcSubmit">등록하기</button>
         </td>
      </tr>
   </table><br>   
   
   <!-- 댓글 목록 -->
   <table id="rtb" align="center" width="250">
      <thead>
         <tr>
            <td colspan="2"><b id="qcCount"></b></td>
         </tr>
      </thead>
      <tbody></tbody>
   </table>
   </div>
   
   </section>
        
   <footer>
      <jsp:include page="../common/footer.jsp"></jsp:include>
   </footer>   

   <script>
      $(function() {
         getQnaCommentList();
         setInterval(function(){
            getQnaCommentList();
         }, 5000); 
         
         $("#qcSubmit").on("click",function(){
            // 댓글 등록 
            var qcContents = $("#qcContents").val();
            var refBid = ${Qna.qnaCode};
            console.log(refBid)
            console.log(qcContents)
            
            $.ajax({
               url : "addQnaComment.na",
               type :"post",
               data : {"qcContents" : qcContents, "qnaCode" : refBid },
               success : function(data) {
                  if ( data == "success") {
                     getQnaCommentList() 
                     $("#qcContents").val("");
                  }else{
                     alert("댓글 등록 실패..");
                  }
               }
            });
         });
      });
      
      // 댓글 리스트
       function getQnaCommentList() {
         var qnaCode = ${Qna.qnaCode };
         $.ajax({
            url : "QnaCommentList.na",
            type : "get",
            data : {"qnaCode" : qnaCode},
            dataType:"json",
            success : function(data) {
               var $tableBody = $("#rtb tbody");
               $tableBody.html("");
               
               var $tr;
               var $qcWriter;
               var $qcContents;
               var $qcCreateDate;
               
               $("#qcCount").text("댓글 (" + data.length + ")"); // 댓글 갯수 표시
               if (data.length > 0) {
                  for ( var i in data ) {
                     $tr = $("<tr>");
                     $qcWriter = $("<td width='100'>").text(data[i].qcWriter);
                     $qcContents = $("<td>").text(decodeURIComponent(data[i].qcContents.replace(/\+/g," "))); //컨트롤러에서 인코딩을해줬기때문에 디코딩을함
                     $qcCreateDate = $("<td width='100'>").text(data[i].qcCreateDate);
                     
                     $tr.append($qcWriter);
                     $tr.append($qcContents);
                     $tr.append($qcCreateDate);
                     $tableBody.append($tr);
                  }
               }else{
                  $tr = $("<tr>"); 
                  $qcContents = $("<td colspan='3'>").text("등록된 댓글이 없습니다."); 
                  $tr.append($qcContents); 
                  $tableBody.append($tr);
               }
            }
         });         
      } 
   </script>
   <br><br>

</body>
</html>