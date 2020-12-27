<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.customDesign th {
   border-bottom: 0.01px solid dimgrey;
   width: 800px;
   padding: 10px;
}

.customDesign td {
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

 .res{
  border-radius: 0;
  box-shadow: none;
  font-size: 14px;
  background: #0c0b09;
  border-color: #625b4b;
  color: white;
 }   
 
 .btn-new {
  font-weight: 600;
  font-size: 13px;
  letter-spacing: 0.5px;
  text-transform: uppercase;
  display: inline-block;
  padding: 12px 30px;
  border-radius: 50px;
  transition: 0.3s;
  line-height: 1;
  color: #fff;
  border: 2px solid #cda45e;
  background: #cda45e;
}
 .btn-new:hover {
  background: #cda45e;
  color: white;
} 
</style>
<title>게시글 목록</title>
</head>
<body>
    <header>
      <jsp:include page="../common/headerNone.jsp"></jsp:include>
   </header>
   
   <section id="testimonials" class="about">
      <div class="container" data-aos="fade-up">
         <div class="section-title">
            <h2>QnA</h2>
            <p>질문 게시판</p>
         </div>       
   <div class="customDesign">   
   <table>
   <thead>
      <tr>
         <th>번호</th>
         <th width="300">제목</th>
         <th>작성자</th>
         <th>날짜</th>
         <th>조회수</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach items="${qList }" var="qna">
      
         
         <%-- <!--로그인 상태에서만 상세보기 가능. 로그인 상태가 아닌 경우 제목만 출력 -->
         <c:if test="${!empty loginCustomer && !empty loginArtist }"> --%>
            <c:url var="qDetail" value="qnaDetailView.na">
               <c:param name="qnaCode" value="${qna.qnaCode }"></c:param>
               <c:param name="page" value="${pi.currentPage }"></c:param>
            </c:url> 
            <tr id="custom" onclick="location.href='${qDetail}'">
         <%-- </c:if>         
         <c:if test="${empty loginCustomer && !empty loginArtist}">
            <tr id="custom" onclick="warning();">
         </c:if>    --%>
         <td align="center">${qna.qnaCode }</td>
         <td align="center">${qna.qnaTitle }</td>
         <td align="center">${qna.qnaWriter }</td>
         <td align="center">${qna.qnaCreateDate }</td>
         <td align="center">${qna.qnaHits }</td>
      </tr>
      </c:forEach>
        </table>
   </div>
   <tr><td><br></td></tr>
   
   <div style="float: right">
               <button onclick="location.href='qnaWriteForm.na'" class="btn-new">새글 작성</button>
            </div>
            
      <!-- 페이징 처리 -->
      <div align="center" height="20">
         <td colspan="6">
            <!-- 이전 -->
            <c:if test="${pi.currentPage <= 1 }">
               [이전]&nbsp;
            </c:if>
            <c:if test="${pi.currentPage >1 }">
               <c:url var="before" value="qna.na">
                  <c:param name="page" value="${pi.currentPage -1 }"></c:param>
               </c:url>
               <a href="${before }">[이전]</a>
            </c:if>
            <!-- 페이지 -->
            <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
               <c:url var="Paging" value="qna.na">
                  <c:param name="page" value="${p }"></c:param>
               </c:url>
               <c:if test="${p eq pi.currentPage }">
                  <font color="white" size="4">[${p }]</font>
               </c:if>
               <c:if test="${p ne pi.currentPage }">
                  <a href="${Paging }">${p }</a>
               </c:if>
            </c:forEach>
            <!-- 다음 -->
            <c:if test="${pi.currentPage >= pi.maxPage }">
               [다음]&nbsp;
            </c:if>
            <c:if test="${pi.currentPage < pi.maxPage }">
               <c:url var="after" value="qna.na">
                  <c:param name="page" value="${pi.currentPage + 1 }"></c:param>
               </c:url>
               <a href="${after }">[다음]</a>&nbsp;
            </c:if>
            </tbody>
         </td>      
      </div>
 
   </section>
   <br><br>
        
   <footer>
      <jsp:include page="../common/footer.jsp"></jsp:include>
   </footer>
   
   <script>
   function warning(){
      alert("로그인 후에 이용 가능합니다.");
   }
   </script>
   
</body>
</html>