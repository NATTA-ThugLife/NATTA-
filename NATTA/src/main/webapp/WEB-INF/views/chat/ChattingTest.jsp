<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang= "ko">
<head>
<meta charset="utf-8">
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
  />
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<link href="resources/images/tugcat.png" rel="shortcut icon">
<title>제목</title>
    <style>
body {
/*    background-color: #74EBD5;
   background-image: linear-gradient(90deg, #74EBD5 0%, #9FACE6 100%);  */
  min-height: 100vh;
}

::-webkit-scrollbar {
  width: 5px;
}

::-webkit-scrollbar-track {
  width: 5px;
  background: #f5f5f5;
}

::-webkit-scrollbar-thumb {
  width: 1em;
  background-color: #ddd;
  outline: 1px solid slategrey;
  border-radius: 1rem;
}

.text-small {
  font-size: 0.9rem;
}

.messages-box,
.chat-box {
  height: 700px;
  overflow-y: scroll;
}

.rounded-lg {
  border-radius: 0.5rem;
}

input::placeholder {
  font-size: 0.9rem;
  color: #999;
}


    </style>
</head>
<body>
    <header>
    	<jsp:include page="../common/headerNone.jsp"></jsp:include>
    </header>
    <section id="testimonials" class="about testimonials section-bg">
<div class="container py-5 px-4">
  <!-- Start -->
	<!-- 아티스트가 채팅방 로그인시 jsp를 그대로 이용할 수 있도록 보내는사람과 받는 사람을 바꿔주는작업 -->
	<c:if test="${loginUser eq chatList[0].reciver}">
	<input type="hidden" id="reciver" value="${chatList[0].sender }">
	</c:if>
	<c:if test="${loginUser ne chatList[0].reciver}">
	<input type="hidden" id="reciver" value="${chatList[0].reciver }">
	</c:if>

  <div class="row rounded-lg overflow-hidden shadow" style="background-color: rgba( 255, 255, 255, 0.5 );">
    <!-- Users box-->
    <div class="col-5 px-0">
      <div class="bg-white" style="background-color: rgba( 255, 255, 255, 0.5 );">

        <div class="bg-gray px-4 py-2 bg-light">
        	<c:if test="${loginCustomer ne null }">
        	       <a href="javascript:history.back();" style="color:black;"><i class="fa fa-angle-double-left" aria-hidden="true"> 뒤로 가기  </i></a>
        	</c:if>
			<c:if test="${loginArtist ne null }">
        	       <a href="javascript:history.back();" style="color:black;"><i class="fa fa-angle-double-left" aria-hidden="true"> 뒤로 가기 </i></a> 
        	</c:if>
          <input type="hidden" id="loginUser" value="${loginUser }"  >

        </div>

        <div class="messages-box">
        
          <div class="list-group rounded-0" id="RoomBox">

          </div>
        </div>
      </div>
    </div>
    
    <!-- Chat Box-->
    <div style="height:740px;" class="col-7 px-0" id="chat">
      <div class="px-4 py-5 chat-box bg-white" id="chat-box">
		     <c:forEach items="${chatList }" var="chat" varStatus="status">
		     		<c:if test="${status.last}">
					<input type="hidden" id="lastChatTime" value="${chat.chatChatDateFormat }">
					<input type="hidden" id="roomCode" value="${chat.roomCode }">
					<input type="hidden" id="sender" value="${chat.sender }">
					<input type="hidden" id="reciver" value="${chat.reciver }">
					</c:if>
		    	<c:if test="${status.first }">
		    		<div class="bg-light rounded py-2 px-3 mb-2">
		    		 <p class="text-small mb-0 text-muted" style="text-align: center">${chat.chatContent }</p>
		    		</div>
		    	</c:if>
		    	<c:if test="${chat.sender eq loginUser &&  !status.first}">
			           <div class="media w-50 ml-auto mb-3">
					     <div class="media-body">
					       <div class="bg rounded py-2 px-3 mb-2" style="background-color:#ffd66b;">
					        	<c:if test="${chat.chatImgPath ne null }">
									 <p  class="text-small mb-0 text-muted"><img src='/resources/chat/${chat.roomCode }/${chat.chatImgPath}' style="width:250px;"></p>
								</c:if>
					            	<p " class="text-small mb-0 text-muted">${chat.chatContent }</p>
					       </div>
					            <p class="small text-muted">${chat.chatChatDateFormat }</p>
					     </div>
					   </div>
				</c:if>
				<c:if test="${chat.sender ne loginUser && !status.first}">
				        <div class="media w-50 mb-3">
				        
				        <c:if test="${imgArtist ne null }">
				        	<c:if test="${imgArtist.imgPath eq 'fail' }">
				        		<img src="https://res.cloudinary.com/mhmd/image/upload/v1564960395/avatar_usae7z.svg" alt="user" width="50" class="rounded-circle">
				        	</c:if>
				        	
				        	<c:if test="${imgArtist.imgPath ne 'fail' }">
				        		<img src="resources/artistInfoFile/Profile/${imgArtist.imgPath }" alt="user" width="50px" height="50px" class="rounded-circle">
				        	</c:if>
				        </c:if>
				        
				        <c:if test="${imgCustomer ne null }">
				        	<c:if test="${imgCustomer.imgPath eq 'fail' }">
				        		<img src="https://res.cloudinary.com/mhmd/image/upload/v1564960395/avatar_usae7z.svg" alt="user" width="50" class="rounded-circle">
				        	</c:if>
				        	
				        	<c:if test="${imgCustomer.imgPath ne 'fail' }">
				        		<img src="resources/customerProfile/${imgCustomer.id }/${imgCustomer.imgPath }" alt="user" width="50px" height="50px" class="rounded-circle">
				        	</c:if>
				        </c:if>
				        
				        
				        
				        
				        <!-- 받는 메세지 -->
				          <div class="media-body ml-3">
				            <div class="bg rounded py-2 px-3 mb-2" style="background-color:#F0CEA0; font:white;" >
				            	<c:if test="${chat.chatImgPath ne null }">
									 <p class="text-small mb-0 text-muted"><img src='/resources/chat/${chat.roomCode }/${chat.chatImgPath}' style="width:250px;"></p>
								</c:if>
				            		  <p class="text-small mb-0 text-muted">${chat.chatContent }</p>
				            </div>
				            <p class="small text-muted">${chat.chatChatDateFormat }</p>
				          </div>
				        </div>
				</c:if>
			</c:forEach>
      </div>

      <!-- Typing area -->
      <form id="uploadForm" class="bg-light">
        <div class="input-group">
          <input type="text" placeholder="Type a message" aria-describedby="button-addon2" class="form-control rounded-0 border-0 py-4 bg-light" id="chatContent">
          <div class="input-group-append">
             <button id="button-addon2" type="button" class="btn btn-link"> <i class="fa fa-file-image-o uploadimg uploadFile"></i>
            <input type="file"  name="uploadFile" id="uploadFile" style="display: none">  
            <button id="button-addon2" type="button" class="btn btn-link"> <i class="fa fa-paper-plane" id="send"></i>
          </div>
        </div>
      </form>
              
    </div>
  </div>
</div>
</section>
<!-- 채팅 ajax -->
<script>

		$(document).ready(function(){
			
			
			$("#chat-box").scrollTop($("#chat-box")[0].scrollHeight); 
			getChattingRoom();
			});
		

		
		/* <!-- 엔터키 전송 --> */
		$("#chatContent").keydown(function (key) {
			 
		    if(key.keyCode == 13){//엔터키 이벤트
		    	$("#send").trigger('click');
		    	return false;
		    }
		
		});
		
		/* <!-- img 아이콘 파일 업로딩 --> */		
	$(".uploadFile").click(function () {
	    $("input[type='file']").trigger('click');
	  });

	  $('input[type="file"]').on('change', function() {
	    var val = $(this).val();
	  })
	  
	$(document).ready(function() {
    	$("#uploadFile").on("change", handleImgFileSelect);
	});
	
	
    function handleImgFileSelect(e) {
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);
 
        var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
 
        filesArr.forEach(function(f) {
            if (!f.type.match(reg)) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                $("#uploadFile").val("");
                return;
            }
 
        });
    }
	
	// 1초마다 갱신
   		setInterval(function(){
				getChatList();
				getChattingRoom();
			},1000);   

	//dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
	function getChattingRoom(){
		var loginUser = "${loginUser}";
		
		$.ajax({
				url : "selectListChattingRoom.na",
				type : "get",
				data : {
					"loginUser" : loginUser
				},
				dataType : "json",
				success : function(data){
					$("#RoomBox").empty();
					if(data.length>0){
						for(var i in data ){
							var img = getImgRoom(data[i].reciver,data[i].sender);
				            var opponent;
				            if(data[i].sender == $("#loginUser").val()){
				            	opponent = data[i].reciver;
				            }else{
				            	opponent = data[i].sender;
				            }

				            if(data[i].roomCode == $("#roomCode").val()){
				            	$("#RoomBox").append('<a style="background:#ffd66b; border:#ffd66b;" class="list-group-item list-group-item-action active text-muted rounded-0"><div class="media"><img src="'+img+'" alt="user" width="50px" height="50px;" class="rounded-circle"><div class="media-body ml-4"><div class="d-flex align-items-center justify-content-between mb-1"><h6 class="mb-0">'+opponent+'</h6><small class="small font-weight-bold">'+data[i].chatChatDate+'</small></div><p class="font-italic mb-0 text-small">'+decodeURIComponent(data[i].chatContent.replace(/\+/g, " "))+'</p></div></div></a>');
				            }else{
				            	$("#RoomBox").append('<a href="chatting.na?artistId='+opponent+'" class="list-group-item list-group-item-action list-group-item-light rounded-0"><div class="media"><img src="'+img+'" alt="user" width="50px" height="50px" class="rounded-circle"><div class="media-body ml-4"><div class="d-flex align-items-center justify-content-between mb-1"><h6 class="mb-0">'+opponent+'</h6><small class="small font-weight-bold">'+data[i].chatChatDate+'</small></div><p class="font-italic text-muted mb-0 text-small">'+decodeURIComponent(data[i].chatContent.replace(/\+/g, " "))+'</p></div></div></a>');
				            }

						}
					}
				}
		})
		
	}
	
	$("#send").on("click",function(){
		

		
		var form = $("#uploadForm")[0];
		var formData = new FormData(form);

		var chatContent = $("#chatContent").val();
		if(chatContent == ""){
			alert("내용을 입력해주세요");
			return false;
		}
		if($("#roomCode").val() != null){
		var roomCode = $("#roomCode").val();
		}
		var reciver = $("#reciver").val();
		var sender = $("#loginUser").val();
		
 		formData.append("chatContent", chatContent);
		formData.append("roomCode", roomCode);
		formData.append("reciver", reciver);
		formData.append("sender", sender);
		
		
		$.ajax({
			contentType : false,
			processData : false,
			url:"insertChat.na",
			type:"post",
			data: formData,
			enctype: 'multipart/form-data',
			success:function(data){
				if(data == "success"){
					$("#chatContent").val("");
					getChatList(); 
				}else{
					alert("전송 실패");
				}
			}
		});
		});
	
	function getChatList(){

			if($("#roomCode").val() != null){
			var roomCode = $("#roomCode").val();

			// 마지막 시간보다 늦은것들을 가져옴
			var lastChatTime = $("#lastChatTime").val();
			$.ajax({
				url : "chatList.na",
				type : "get",
				data : {
					"roomCode" : roomCode,
					"lastChatTime" : lastChatTime
				},
				dataType : "json",
				success : function(data){
					// db에 있는 데이터를 json 형태로 가져와서
					// 댓글 목록 테이블의 tbodt에 넣어주어야 함.
					if(data == "nodata"){
						
					}else{
						var img = getimg();
					if(data.length > 0){
						
						for( var i in data){
							
							if(data[i].sender == $("#loginUser").val()){
								$("#chat-box").append('<div class="media w-50 ml-auto mb-3"><div class="media-body"><div style="background-color:#ffd66b;" class="bg rounded py-2 px-3 mb-2"><p class="text-small mb-0 text-muted">'+decodeURIComponent(data[i].chatContent.replace(/\+/g, " "))+'</p></div><p class="small text-muted">'+data[i].chatChatDateFormat+'</p></div></div>');
							}else{
								$("#chat-box").append('<div class="media w-50 mb-3"><img src="'+img+'" alt="user" width="50px" height="50px" class="rounded-circle"><div class="media-body ml-3"><div style="background-color:#F0CEA0;" class="bg rounded py-2 px-3 mb-2"><p class="text-small mb-0 text-muted">'+decodeURIComponent(data[i].chatContent.replace(/\+/g, " "))+'</p></div><p class="small text-muted">'+data[i].chatChatDateFormat+'</p></div></div>');
							}
 							
							if(data[i].chatImgPath != null){
								$(".rounded").last().prepend('<p class="text-small mb-0 text-white"><img src=/resources/chat/'+data[i].roomCode+'/'+data[i].chatImgPath+' style="width:250px;"></p>');
							}
							
							//파일 업로드 후 초기화
							$("#uploadFile").val("");
							// 마지막 시간을 교체 해주는 조건문
							if(i == data.length -1){
							$("#lastChatTime").val(data[i].chatChatDateFormat);
							}
							
							$("#chat-box").scrollTop($("#chat-box")[0].scrollHeight); 
						}
					}
					}
				}
			});
		}
	}
	
	function getimg(){
		var sender = $("#sender").val();
		var reciver = $("#reciver").val();
		var src;
		$.ajax({
				url : "getImg.na",
				type : "get",
				data : {
					"sender" : sender,
					"reciver" : reciver
				},
				dataType : "json",
				async : false,
				success : function(data){
					console.log(data)
					if(data.id == null){
						src = "resources/artistInfoFile/Profile/"+data.imgPath;
					}else if(data.imgPath == "fail"){
						src = "https://res.cloudinary.com/mhmd/image/upload/v1564960395/avatar_usae7z.svg";
					}else{
						src = "resources/customerProfile/"+data.id+"/"+data.imgPath;
					}
				}
		});
		return src;
	}
	
	
	//ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
	function getImgRoom(r,s){
		var sender = r;
		var reciver = s;
		
		
		var src;
		$.ajax({
				url : "getImgRoom.na",
				type : "get",
				data : {
					"sender" : sender,
					"reciver" : reciver
				},
				dataType : "json",
				async : false,
				success : function(data){
					
					if(data.id == null && data.imgPath != "fail"){
						src = "resources/artistInfoFile/Profile/"+data.imgPath;
						
					}else if(data.imgPath == "fail"){
						src = "https://res.cloudinary.com/mhmd/image/upload/v1564960395/avatar_usae7z.svg";
					}else{
						src = "resources/customerProfile/"+data.id+"/"+data.imgPath;
					}
				}
		});
		return src;
	}
</script>
<div id="preloader"></div>
</body>
</html>