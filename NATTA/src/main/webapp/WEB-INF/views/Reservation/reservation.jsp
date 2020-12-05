<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 페이지</title>
<link rel="stylesheet" href="resources/css/menubar-style.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a8e5007416460a5bee56aaba2bb1ea6d&libraries=services"></script>
</head>
<body>
	<header></header>
	<section>
		<article  id="article0">
		
			<img align="center" height=150px; width="150px" src="../resources/reservationImages/ttugccat.png">
			
			<img align="center" height=150px; width="150px" src="../resources/reservationImages/tugcat.png">
		</article>
		<article>
		<h1 align="center">예약 페이지</h1>
			<form action="reservation.na" method="post">
				<input type="text" id="artistId" name="artistId">
				<input type="text" id="tatooStyle" name="tatooStyle">
				<br><br><br>
				
				
				
				<span><input type="radio" name="part" value="팔">
					<img height=150px; width="150px" src="../resources/reservationImages/arm.jpg">
				</span>
				<span><input type="radio" name="part" value="등">
					<img height=150px; width="150px" src="../resources/reservationImages/back.jpg">
				</span>
				<span><input type="radio" name="part" value="다리">
					<img height=150px; width="150px" src="../resources/reservationImages/leg.jpg">
				</span>
				<br><br><br>
				
				<select>
					<option>A4 1/8</option>
					<option>A4 1/4</option>
					<option>A4 1/2</option>
					<option>A4</option>
				</select>
				
				
				<input type="date">
				<br><br><br><br><br><br>
				<div id="map" style="width: 350px; height: 350px; margin-top: 10px; float: left;"></div>
				
				<input type="file" id="upload" name="upload"/>
				<div id="preview">
				<!-- 미리보기 공간 -->
				</div>
						
				
				
				
				<input type="submit" value="예약하기">
			</form>
		</article>
		<script>
		    var upload = document.querySelector('#upload');
		    var upload2 = document.querySelector('#upload2');
		 
		     /* FileReader 객체 생성 */
		    var reader = new FileReader();
		 
		        /* reader 시작시 함수 구현 */
		    reader.onload = (function () {
		 
		        this.image = document.createElement('img');
		        var vm = this;
		        
		        return function (e) {
		            /* base64 인코딩 된 스트링 데이터 */
		            vm.image.src = e.target.result
		        }
		    })()
		 
		    upload.addEventListener('change',function (e) {
		        var get_file = e.target.files;
		 
		        if(get_file){
		            reader.readAsDataURL(get_file[0]);
		        }
		 
		        preview.appendChild(image);
		    })
		</script>

		
	</section>
	
	
	<footer></footer>
	<script>
		var mapContainer = document.getElementById('map'), //지도를 표시할 div
		mapOption = {
		   center : new daum.maps.LatLng('37.4781726','127.044983'), // 지도의 중심좌표
		   level : 5
		// 지도의 확대 레벨
		};
		//지도를 미리 생성
		var map = new daum.maps.Map(mapContainer, mapOption);
		//주소-좌표 변환 객체를 생성
		var geocoder = new daum.maps.services.Geocoder();
		//마커를 미리 생성
		var marker = new daum.maps.Marker({
		   position : new daum.maps.LatLng('37.4781726','127.044983'),
		   map : map
		});
		var infowindow = new kakao.maps.InfoWindow(
		      {
		         content : '<div style="width:150px;text-align:center;padding:6px 0;">타투샵 : 서이석의타투샵</div>'
		      });
		infowindow.open(map, marker);
	</script>
</body>
</html>