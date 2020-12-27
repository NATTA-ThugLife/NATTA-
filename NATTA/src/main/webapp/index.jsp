<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring Project</title>
<!-- 안정민 -->
<style>
	* {
		box-sizing: board-box;
	}
	
	.video-film {
		box-shadow: rgba(0, 7, 15, 0.7) 0 0 0 9999px;
		z-index: 100;
	}
	
	.video-background {
		/* background: #000; */
		background : url("resources/assets/img/nattaBack/bg1.jpg") center center;
		background-size: cover;
		 position: fixed; 
		 top: 0;
		right: 0;
		bottom: 0;
		left: 0; 
		z-index: -99; 
	}
	
	.video-foreground, .video-background iframe {
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		pointer-events: none;
	}
	
	@media ( min-aspect-ratio : 16/9) {
		.video-foreground {
			height: 300%;
			top: -100%;
		}
	}
	
	@media ( max-aspect-ratio : 16/9) {
		.video-foreground {
			width: 300%;
			left: -100%;
		}
	}
	
	h1 {
		color: white;
	}
	
	#visual-btn {
		z-index: 50;
		color: #fff;
		font-size: 20px;
		border: 2px solid #fff;
		padding: 12px 24px;
		border-radius: 5px;
		cursor: pointer;
		background-color: rgba(0, 0, 0, 0);
	}
	
	#visual-btn:hover {
		color: #ff6868;
		font-size: 20px;
		border: 2px solid #ff6868;
		padding: 12px 24px;
		border-radius: 5px;
		cursor: pointer;
	}
	
	#indexBtn {
		position: fixed;
		text-align: center
	}
	
	.center {
		position: absolute;
		top: 60%;
		left: 47%;
		margin: -50px 0 0 -50px;
	}
	
</style>
</head>
<body>
	<h1 style="text-align: center; color: #fff">
		<!-- <img src="resources/images/tugcat.png"> -->
	</h1>

	<div id="indexBtn" class="center">
		<!-- url 요청을 *.kh로 받도록 web.xml에서 설정을 해주어야 함. -->
		<!-- 고침? -->
		<button id="visual-btn" onclick="location.href='main.na';">N A T T A</button>
	</div>

	<div class="video-background">
		<!-- <div class="video-background">|
			<div id="muteYouTubeVideoPlayer"></div>
			<img alt="" src="resources/assets/img/nattaBack/mainback.jpg">
		</div> -->
	</div>
	
	<div class="video-film"></div>
	
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script async src="https://www.youtube.com/iframe_api"></script>
	<script type="text/javascript">
	var player;
	
	function onYouTubePlayerAPIReady(){
		player = new YT.Player('muteYouTubeVideoPlayer', {
			videoId : 'SMemB8qejtk',
			playerVars : {
				autoplay : 1, 		// Auto-play the video on load
				controls : 0, 		// Show pause/play buttons in player
				rel : 0,
				start : 30,
				end : 60,
				showinfo : 0,
				showinfo : 0, 		// Hide the video title
				modestbranding : 1, // Hide the Youtube Logo
				loop : 1, 			// Run the video in a loop
				playlist : 'SMemB8qejtk',
				fs : 0, 			// Hide the full screen button
				cc_load_policy : 0, // Hide closed captions
				iv_load_policy : 3, // Hide the Video Annotations
				autohide : 1		// Hide video controls when playing
			},
			events:{
				onReady:function(e){
					e.target.mute();
				}
			}
		});
	}
</script>

</body>
</html>