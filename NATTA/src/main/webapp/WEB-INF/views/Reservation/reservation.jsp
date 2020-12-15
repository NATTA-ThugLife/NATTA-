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
 <style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px; color:black; font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>
</head>
<body>
	<header>
		<jsp:include page="../common/headerNone.jsp"></jsp:include>
	</header>
	<section align="center">
	<br><br><br><br><br><br><br><br>
		<article>
		<h1 align="center">예약 페이지</h1>
		<br><br><br><br>
			<form text-align="center"  action="reservation.na" method="post" enctype="multipart/form-data">
				<input type="hidden" name="customerId" value="${loginCustomer.customerId }">
				
				<c:forTokens items="${artist.workAddress }" var="addr" delims="," varStatus="status">
				<c:if test="${status.index eq 1 }">
				<input type="hidden" id="address" name="address" placeholder="주소" value="${addr}">
				</c:if>
				</c:forTokens>
				
				<input type="hidden" name="shopName" value="${artistInfo.name}" placeholder="샵이름">
				<input type="hidden" id="artistId" name="artistId" placeholder="아티스트아이디" value="${artistInfo.artistId }">
				<input type="text" id="artistName" name="artistName" placeholder="아티스트이름" value=${artist.artistName }>
				
				
				<select id="style" name="style">
					<option>사이즈를 선택해주세요</option>
					<c:forEach items="${priceList }" var="style">
						<option value="${style.pStyle }">${style.pStyle }</option>
					</c:forEach>
				</select>
				
				<select id="tattooSize" name="tattooSize">
					
				</select>
				
				<input type="text" id="price" name="price" placeholder="가격">
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
				
				
				
				<input type="date" name="reservationDate">
				<br><br><br><br><br><br>
				<div align="center">
				<div id="map" style=" width: 350px; height: 350px; margin-top: 10px;">
				</div>
				<div id="preview" style=" margin-top: 10px;">
				<!-- 미리보기 공간 -->
				</div>
				</div>
				
				
				<br>
				<input type="button" id="upfile" value="도안업로드">
				<input type="file" id="upload" name="upload" style="display:none">
				
						
				
				
				<br><br><br><br><br><br><br><br><br><br><br><br><br>
				<textarea rows="7" cols="30" name="request"></textarea>
				<br><br><br><br><br><br><br><br><br><br><br><br>
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
		<script>
		
			$(function(){
				$("#style").change(function(){
					var $select = $("select[name='tattooSize']");
					$select.html("");
					var style = $("#style").val();
					var artistId = '${artistInfo.artistId}';
					$.ajax({
						url : "reservationSizeList.na",
						type : "post",
						data : {"artistId" : artistId, "pStyle" : style},
						dataType:"json",
						success : function(sizeList) {
							for(var i in sizeList){
							$select.append("<option value='"+sizeList[i].pSize1+",38mmx38mm'>38mmx38mm</option>"+
											"<option value='"+sizeList[i].pSize2+",38mmx64mm'>38mmx64mm</option>"+
											"<option value='"+sizeList[i].pSize3+",65mmx76mm'>65mmx76mm</option>"+
											"<option value='"+sizeList[i].pSize4+",102mmx127mm'>102mmx127mm</option>"+
											"<option value='"+sizeList[i].pSize5+",152mmx152mm'>152mmx152mm</option>"+
											"<option value='"+sizeList[i].pSize6+",203mmx152mm'>203mmx152mm</option>"+
											"<option value='"+sizeList[i].pSize7+",210mmx297mm'>210mmx297mm</option>");
							$("#tattooSize option[value*='undefined']").remove();
						}
					}
					})
				});
			});
			
		</script>
		<script>
		$("#tattooSize").change(function() {
			var price = $("#tattooSize").val();
			console.log(price)
			var i = price.indexOf(",");
			console.log(i)
			var a = price.substr(0,i);
			console.log(a)
			var b = price.substr(i+1,price.length);
			console.log(b)
		
			$("#price").attr("value",a);

		});
		</script>

		
	</section>
	
	
	<footer></footer>
	<script>

	var workAddress = document.getElementById('address').value;
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
	geocoder.addressSearch(workAddress, function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        /* var infowindow = new kakao.maps.InfoWindow({ */
	        var    content='<div class="wrap">' + 
		                '    <div class="info">' + 
		                '        <div class="title">' + 
		                '            ${artistInfo.name}' + 
		                '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
		                '        </div>' + 
		                '        <div class="body">' + 
		                '            <div class="img">' +
		                '                <img src="resources/artistInfoFile/Profile/${ artistInfo.myReProfile }" width="73" height="70">' +
		                '           </div>' + 
		                '            <div class="desc">' + 
		                '                <div class="ellipsis">'+workAddress+'</div>' + 
		                '            </div>' + 
		                '        </div>' + 
		                '    </div>' +    
		                '</div>';
	            	
	        /* });
	        infowindow.open(map, marker); */
	        var overlay = new kakao.maps.CustomOverlay({
	            content: content,
	            map: map,
	            position: marker.getPosition()       
	        });
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});
	</script>
</body>
</html>