<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
       
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<meta charset="UTF-8">
<title>${loginUser }</title>
</head>
<body>
채팅방 들어갔을때 회원 채팅 리스트 출력 <br><br>
	${roomCode }번방<br>
	유저네임 : ${loginUser } 
	<input type="text" id="loginUser" value="${loginUser }">
	<br>
	
	<!-- 아티스트가 채팅방 로그인시 jsp를 그대로 이용할 수 있도록 보내는사람과 받는 사람을 바꿔주는작업 -->
	<c:if test="${loginUser eq chatList[0].reciver}">
	상대방 이름 : ${chatList[0].sender }<br>
	<input type="hidden" id="reciver" value="${chatList[0].sender }">
	</c:if>
	<c:if test="${loginUser ne chatList[0].reciver}">
	상대방 이름 : ${chatList[0].reciver }<br>
	<input type="hidden" id="reciver" value="${chatList[0].reciver }">
	</c:if>
	<hr>
	
	<div id="chat">
	<c:forEach items="${chatList }" var="chat" varStatus="status">
		<c:if test="${status.last}">
		<input type="hidden" id="lastChatTime" value="${chat.chatChatDateFormat }">
		</c:if>
		보낸사람 : ${chat.sender } 받은사람 : ${chat.reciver }<br> 
		${chat.chatContent }<br>
		${chat.chatChatDateFormat }<br>
		<c:if test="${chat.chatImgPath ne null }">
			<img src='/resources/chat/${chat.roomCode }/${chat.chatImgPath}'>
		</c:if>
		<hr>
	</c:forEach>
	</div>	
	<form id="uploadForm">
	<input type="text" id="chatContent">
	<input type="file" name="uploadFile" id="uploadFile">
	<button type="button" id="send">전송</button>
	</form>
</body>
<script>

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
/*    		setInterval(function(){
				console.log("동작중");
				getChatList();
			},1000);   */

	
	$("#send").on("click",function(){
		
		var form = $("#uploadForm")[0];
		var formData = new FormData(form);
		
		var chatContent = $("#chatContent").val();
		var roomCode = ${roomCode };
		var reciver = $("#reciver").val();
		var sender = $("#loginUser").val();
		
 		formData.append("chatContent", chatContent);
		formData.append("roomCode", roomCode);
		formData.append("reciver", reciver);
		formData.append("sender",sender);

		
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
		
			var roomCode = ${roomCode };
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
					console.log(data.length);
					if(data.length > 0){
						for( var i in data){
							console.log(data[i].chatImgPath);
							$("#chat").append(
									'보낸사람 : '+data[i].sender + '받은사람 : ' + data[i].reciver + "<br>"+
									decodeURIComponent(data[i].chatContent.replace(/\+/g, " ") + "<br>"+
											data[i].chatChatDateFormat) 
									);
							if(data[i].chatImgPath != null){
								var img = $("<img>");
								$("#chat").append('<br><img src=/resources/chat/'+data[i].roomCode+'/'+data[i].chatImgPath+'>' + "<hr>");
							}else{
								$("#chat").append("<hr>");
							}
							// 마지막 시간을 교체 해주는 조건문
							$("#uploadFile").val("");
							
							if(i == data.length -1){
							$("#lastChatTime").val(data[i].chatChatDateFormat);
							}
						}
				}
				}
			});
	}
</script>
</html>