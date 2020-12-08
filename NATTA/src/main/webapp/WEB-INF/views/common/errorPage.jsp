<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#button{
  background: #cda45e;
  border: 0;
  padding: 10px 35px;
  color: #fff;
  transition: 0.4s;
  border-radius: 50px;
  top : 50%;
  left : 50%;
}

#button:hover {
  background: #d3af71;
}
</style>
<title>에러 페이지</title>
</head>
<body>
	<header>
		<jsp:include page="../common/headerNone.jsp"></jsp:include>
	</header>

<%-- 	<section>
	<div style="text-align:center;">
		<h1>로그인 실패</h1>
		<h2 style="color:red;">${msg }</h2>
		<a href="main.na">메인으로 이동</a>
	</div>	
	</section> --%>
	
	    <section id="book-a-table" class="book-a-table">
      <div class="container" data-aos="fade-up" style="width: 100%; margin: 0 auto;">
        <div class="section-title">
          <h2>Log In Error</h2>
          <p>로그인 실패</p>
        </div>
        <div style="text-align: center;">
        <form action="resources/forms/book-a-table.php" method="post" role="form" class="php-email-form" data-aos="fade-up" data-aos-delay="100"><br>
        <input id="button" type="button" onClick="location.href='login.na'" value="되돌아가기" style="margin-right: 30px;">
        <input id="button" type="button" onClick="location.href='main.na'" value="메인 화면으로" style="margin-left: 30px">
        </form>
        </div>
      </div>
      </section>

	<footer>
		<jsp:include page="../common/footer.jsp"></jsp:include>
	</footer>
</body>
</html>