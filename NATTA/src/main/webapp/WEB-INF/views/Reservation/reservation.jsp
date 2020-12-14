<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 페이지2</title>
<link rel="stylesheet" href="resources/css/menubar-style.css" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a8e5007416460a5bee56aaba2bb1ea6d&libraries=services"></script>
<style>
	#preview  img{
	width : 350px; 
	height: 350px;
	}
	
#btnr {
   height: 55px;
   width: 972px;
   text-align: center;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="../common/headerNone.jsp"></jsp:include>
	</header>
	<section>
	<br><br><br><br><br><br><br><br>
		<article>
		<h1 align="center">예약 페이지</h1>
		<br><br><br><br>
			<form action="reservation.na" method="post">
				<input type="text" name="customerId" value="${loginCustomer.customerId }">
				<input type="text" name="address" placeholder="주소">
				<input type="text" id="artistId" name="artistId" placeholder="아티스트아이디">
				<input type="text" id="artistName" name="artistName" placeholder="아티스트이름">
				<input type="text" id="tatooStyle" name="style" placeholder="타투스타일">
				<br><br><br>
				
				
				<span><input type="radio" name="part" value="팔">팔
					<img height=150px; width="150px" src="../resources/images/reservationImages/arm.jpg">
				</span>
				<span><input type="radio" name="part" value="등">등
					<img height=150px; width="150px" src="../resources/images/reservationImages/back.jpg">
				</span>
				<span><input type="radio" name="part" value="다리">다리
					<img height=150px; width="150px" src="../resources/images/reservationImages/leg.jpg">
				</span>
				<br><br><br>
				
				<select name="tattooSize">
					<option value="A4 1/8">A4 1/8</option>
					<option value="A4 1/4">A4 1/4</option>
					<option value="A4 1/2">A4 1/2</option>
					<option value="A4">A4</option>
				</select>
				
				<input type="date" name="reservationDate">
				<br><br><br><br><br><br>
				<div id="map" style="width: 350px; height: 350px; margin-top: 10px; float: left;">
				</div>
				
				<div id="preview" style="margin-top: 10px; float: left;">
				<!-- 미리보기 공간 -->
				</div>
				<br>
				<input type="button" id="upfile" value="도안업로드">
				<input type="file" id="upload" name="upload" style="display:none">
				
						
				
				
				<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
				<input id="btnr" type="submit" value="예약하기">
			</form>
		</article>
		<script>
			$("#upfile").click(function(){
				$("#upload").trigger('click');
			});
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
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center; color:black;padding:6px 0;">타투샵이름:${artistInfo.name}</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});
	</script>
	<!-- <script>
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
	</script> -->
</body>
</html>