<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
   <script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>

<body>
				            <div class="col-lg-4 col-md-6 form-group">
				              Customer Address<button type="button" id="postcodify_search_button">검색</button>
				              <input type="text" name="post" class="form-control postcodify_postcode5" id="address" placeholder="Your WorkAddress" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
				              <input type="text" name="address1" class="postcodify_address">
				              <input type="text" name="address2" class="postcodify_extra_info">
				              <div class="validate"></div>
				            </div>
				            <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
								<script>
									$(function() {
										$("#postcodify_search_button").postcodifyPopUp();
									})
								</script>

</body>

</html>