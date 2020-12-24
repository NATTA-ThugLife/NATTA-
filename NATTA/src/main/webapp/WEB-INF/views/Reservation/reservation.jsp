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
   
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


 
<style>
	#preview  img{
	width : 400px; 
	height: 350px;
	}
	
#btnr {
   height: 55px;
   width: 972px;
   text-align: center;
}
.form-rrrow {
  display: -ms-flexbox;
  display: inline-flex;
  -ms-flex-wrap: wrap;
  flex-wrap: wrap;
  margin-right: -5px;
  margin-left: -5px;
}
.form-rrrow > .col,
.form-rrrow > [class*="col-"] {
  padding-right: 5px;
  padding-left: 5px;
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
	[type=radio] { 
  position: absolute;
  opacity: 0;
  width: 0;
  height: 0;
}
[type=radio] + img {
  cursor: pointer;
}
[type=radio]:checked + img {
  outline: 2px solid #cda45e;
}
</style>
</head>
<body>
	<header>
		<jsp:include page="../common/headerNone.jsp"></jsp:include>
	</header>
	<section id="modifyInfo" class="about">
		<div class="container">
			<div class="modal-header">
				<h5 class="modal-title">
					<b>예약 페이지</b>
					</h5>
			</div>
			<div align="center">
			<div class="col-lg-8 mt-14 mt-lg-0">
			
					<form name="sub" action="reservation.na" method="post" enctype="multipart/form-data">
					<div class="form-rrrow">
							<input type="hidden" id="customerId" name="customerId"
								value="${loginCustomer.customerId }">
							<c:forTokens items="${artist.workAddress }" var="addr" delims=","
								varStatus="status">
								<c:if test="${status.index eq 1 }">
									<input type="hidden" id="address" name="address"
										placeholder="주소" value="${addr}">
								</c:if>
							</c:forTokens>
	
							<input type="hidden" name="shopName" value="${artistInfo.name}" placeholder="샵이름"> 
							<input type="hidden" id="artistId" name="artistId" placeholder="아티스트아이디" value="${artistInfo.artistId }"> 
							
							<div class="col-md-6 form-group">
							<div style="float:left">아티스트 이름 :</div>
							<input class="form-control" type="text" id="artistName" name="artistName" placeholder="아티스트이름" value=${artist.artistName } readonly> 
							</div>
							<div class="col-md-6 form-group">
							<div style="float:left">타투 스타일 :</div>
							<select class="form-control" id="style" name="style">
								<option value="base">스타일을 선택해주세요</option>
								<c:forEach items="${priceList }" var="style">
									<option value="${style.pStyle }">${style.pStyle }</option>
								</c:forEach>
							</select> 
							</div>
							<br><br><br><br>
							
							<div class="col-md-6 form-group">
							<div style="float:left">
							타투 사이즈 : 
							</div>
							<select class="form-control" id="tattooSize" name="tattooSize">
								<option value="base">사이즈를 선택해주세요</option>
								<option value="38mmx38mm">38mmx38mm</option>
								<option value="38mmx64mm">38mmx64mm</option>
								<option value="65mmx76mm">65mmx76mm</option>
								<option value="102mmx127mm">102mmx127mm</option>
								<option value="152mmx152mm">152mmx152mm</option>
								<option value="203mmx152mm">203mmx152mm</option>
								<option value="210mmx297mm">210mmx297mm</option>
							</select>
							</div>
							<div class="col-md-6 form-group">
							<div style="float:left">
							가격  :
							</div>
							<input class="form-control" type="text" id="price" name="price"placeholder="가격" readonly> <br>
							</div>
							<br><br><br><br>
							<div class="col-md-6 form-group">
							<div style="float:left">
							타투 부위: 
							</div>
							</div>
							<br>
							<div style="width:1000px;">
								<label>
									<input type="radio" id="part" name="part" value="팔">
									<img style="width:225px; height: 225px;" src="../resources/images/reservationImages/arm.jpg">
								</label>
								<label>
									<input type="radio" id="part" name="part" value="어깨">
									<img style="width:225px; height: 225px;" src="../resources/images/reservationImages/sholder.jpg">
								</label>
								<label>
									<input type="radio" id="part" name="part" value="등">
									<img style="width:225px; height: 225px;" src="../resources/images/reservationImages/back.jpg">
								</label>
								<label>
									<input type="radio" id="part" name="part" value="다리">
									<img style="width:225px; height: 225px;" src="../resources/images/reservationImages/leg1.jpg">
								</label>
							</div>
							</div>
	
							<div class="form-rrrow">
							<div class="col-md-6 form-group">
							<div style="float:left">
							예약일 : 
							</div>
							<input class="form-control" type="text" name="reservationDate" id="datepicker" placeholder="예약일을 선택해주세요" readonly>
							
							</div>
							<div class="col-md-6 form-group">
							<div style="float:left">
							예약 시간 :
							</div>
							<select class="form-control" id="reservationTime"
								name="reservationTime">
								<option value="base">예약시간을 선택해주세요</option>
								<option value="09:00 ~ 11:00">09:00 ~ 11:00</option>
								<option value="11:00 ~ 13:00">11:00 ~ 13:00</option>
								<option value="14:00 ~ 16:00">14:00 ~ 16:00</option>
								<option value="16:00 ~ 18:00">16:00 ~ 18:00</option>
							</select>
							</div>

							<div style="width: 1000px;">
							<div style="width: 500px; float:left">타투샵 위치 : </div>
							<div style="width: 500px; float:left">도안 미리보기 : </div>
							</div>
							<div style="width: 1000px;">
								<div>
									<div style="width: 500px; height: 400px; float: left">
									<div id="preview"
										style="width: 400x; height: 350px; float: center">
										<!-- 미리보기 공간 -->
									</div>
									</div>
									<div id="map" style="width: 400px; height: 350px; float: center"></div>
									
									
								</div>
							</div>

							<div class="col-md-6 form-group">
							<input class="form-control" type="button" id="upfile" value="도안업로드"> 
							<input type="file" id="upload" name="upload" style="display: none">
						</div>
						<div class="col-md-6 form-group">
							<c:forEach items="${reservationDate }" var="reservation">
								<input type="hidden" class="rDate" value="${reservation}">
							</c:forEach>
						</div>
							
						
						<div style="float:left">
						요구 사항 :
						</div>
							<textarea class="form-control" rows="10" cols="10000" id="request" name="request"></textarea>
						</div>
							<br>
							<br>
							<br>
							<br>
							<br>
						<div>
							<button class="form-control" id="btnr" type="button" onclick="return validate();" >예약하기</button>
						</div>
						
						</div>
					</form>
					</div>
				</div>
			</div>
			
	</section>
	<section>
	

	</section>
	<script>
		function validate(){
			if($("#style").val() == "base"){
				alert("타투 스타일을 선택해주세요")
				$("#style").focus();
				return false;
			}
			else if($("#tattooSize").val() == "base"){
				alert("타투 사이즈를 선택해주세요")
				$("#tattooSize").focus();
				return false;
			}
			else if($(':radio[name="part"]:checked').length<1){
				alert("타투 부위를 선택해주세요")
				$("#part").focus();
				return false;
			}
			else if($("#datepicker").val() == ""){
				alert("예약일을 선택해주세요")
				$("#datepicker").focus();
				return false;
			}
			else if($("#reservationTime").val() == "base"){
				alert("예약시간을 선택해주세요")
				$("#reservationTime").focus();
				return false;
			}
			else if($("#upload").val() == ""){
				alert("도안을 업로드해주세요")
				$("#upfile").focus();
				return false;
			}
			else if($("#request").val() == ""){
				alert("요구사항을 입력해주세요")
				$("#request").focus();
				return false;
			}
			var IMP = window.IMP;
			var customerId = $("#customerId").val();
			IMP.init('imp79373058');
			
			IMP.request_pay({
			    pg : 'inicis',
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:결제테스트',
			    amount : 100,
			    buyer_email : 'iamport@siot.do',
			    buyer_name : customerId,
			    buyer_tel : '010-1234-5678',
			    buyer_addr : '서울특별시 강남구 삼성동',
			    buyer_postcode : '123-456'
			}, function(rsp) {
				debugger;
			    if ( rsp.success ) {
			    	var msg = '결제가 완료되었습니다.';
					msg += '\n고유ID : ' + rsp.imp_uid;
					msg += '\n상점 거래ID : ' + rsp.merchant_uid;
					msg += '\결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;

					alert(msg);
					document.sub.submit();
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			        alert(msg);
			    }
			});
			
		}
	</script>
	
	<script>
			//도안 미리보기
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
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script>
		// 데이트피커
		var reservationDate = new Array();
		$(".rDate").each(function(index,item){
			reservationDate.push($(item).val());
		 });
		
		
		jQuery(function($){	
		$("#datepicker").datepicker({
			changeMonth:true,
			changeYear:true,
			/* showOn:"both",
			buttonImage:"resources/images/reservationImages/clock.jpg",
			buttonImageOnly:true, */
			dateFormat: 'yy-mm-dd',
			showOtherMonths: true,
			selectOtherMonths: true,
			showMonthAfterYear: true,
			dayNamesMin: ['일','월', '화', '수', '목', '금', '토'],
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			monthNames: ['년 1월','년 2월','년 3월','년 4월','년 5월','년 6월','년 7월','년 8월','년 9월','년 10월','년 11월','년 12월'],
			nextText: '다음 달',
			prevText: '이전 달',
			minDate: 7,
			beforeShowDay: disableAllTheseDays
				});
				 
			});
			
			// 특정날짜들 배열
			var disabledDays = reservationDate;
			/* var disabledDays = ["2020-12-9","2020-12-24","2020-12-26"];
			console.log(disabledDays) */
		
			
			// 특정일 선택막기
			function disableAllTheseDays(date) {
				var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
				for (i = 0; i < disabledDays.length; i++) {
					if($.inArray(y + '-' +(m+1) + '-' + d,disabledDays) != -1) {
						return [false];
					}
				}
				return [true];
			}		

			$(function() {
				$("#datepicker").datepicker({minDate : 0});
			});
		</script>
		<script>
			// 스타일별 사이즈 리스트생성
			$(function(){
				$("#style").change(function(){
					$("#price").attr("value","");
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
							$select.append("<option value='base'>사이즈를 선택해주세요</option>"+
											"<option value='"+sizeList[i].pSize1+",38mmx38mm'>38mmx38mm</option>"+
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
		// 날자별 예약 가능시간
		$("#tattooSize").change(function() {
			var price = $("#tattooSize").val();
			var i = price.indexOf(",");
			var a = price.substr(0,i);
			var b = price.substr(i+1,price.length);
			
			$("#price").attr("value",a);

		});
		
		$("#datepicker").change(function() {
			var reservationDate = $("#datepicker").val();
			var artistId = '${artistInfo.artistId}';
			var $select = $("select[name='reservationTime']");
			$select.html("");
			$.ajax({
				url : "reservationTime.na",
				type : "post",
				data : {"reservationDate" : reservationDate,"artistId" : artistId},
				dataType:"json",
				success : function(tList){
					$select.append("<option value='base'>예약시간을 선택해주세요</option>"+
								"<option value='09:00 ~ 11:00'>09:00 ~ 11:00</option>"+
								"<option value='11:00 ~ 13:00'>11:00 ~ 13:00</option>"+
								"<option value='14:00 ~ 16:00'>14:00 ~ 16:00</option>"+
								"<option value='16:00 ~ 18:00'>16:00 ~ 18:00</option>");
					for(var i in tList){
						
						console.log(tList[i].reservationTime)
						
						$("#reservationTime option[value*='"+tList[i].reservationTime+"']").remove();
					}
				}
			});
		});
		</script>
		<script>
		// 지도
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
		     // 커스텀 오버레이에 표시할 컨텐츠 입니다
		    	// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
		    	// 별도의 이벤트 메소드를 제공하지 않습니다 
		        var    content='<div class="wrap">' + 
		                    '    <div class="info">' + 
		                    '        <div class="title">' + 
		                    '            타투샵 : ${artistInfo.name}' + 
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
		            	
		        // 마커 위에 커스텀오버레이를 표시합니다
		        // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
		        var overlay = new kakao.maps.CustomOverlay({
		            content: content,
		            map: map,
		            position: marker.getPosition()       
		        });
		   		// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
			
		    	 // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
		        kakao.maps.event.addListener(marker, 'click', function() {
		            overlay.setMap(map);
		        });
		     // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
		        function closeOverlay() {
		            overlay.setMap(null);     
		        }
			}
		});
		
	</script>
	
	<footer></footer>
	
</body>
</html>