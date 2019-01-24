 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
 <!DOCTYPE html> <html> 
 <head> 
 
 <!-- 참조 : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<!-- <link rel="stylesheet" href="/resources/javascript/malihu-custom-scrollbar-plugin-3.1.5/jquery.mCustomScrollbar.css" /> -->
	
		
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
  <!-- Google CDN jQuery with fallback to local -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    	<!-- 스크롤 js -->
    <!-- 	
    	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="/resources/javascript/malihu-custom-scrollbar-plugin-3.1.1/jquery.mCustomScrollbar.js"></script>
	<script src="/resources/javascript/malihu-custom-scrollbar-plugin-3.1.1/jquery.mCustomScrollbar.concat.min.js"></script>
 -->
<!-- 배경색 -->
<style class="cp-pen-styles">

.chat-box {
    width: 400px;
    min-width: 400px;
    height: 500px;
    min-height: 500px;
    overflow: auto;
    
}

body {
  margin: 0;
  padding: 0;
  background-color:  #fddbdb ;
   
}

* {
  font-family: Helvetica,sans-serif;
  color: #888;
}

main.container {
  width: 90%;
  margin: 40px auto;
}
main.container .list {
  width: 30%;
  float: right;
  background: #ffaaa5;
  height: 600px;
  border-radius: 10px 10px 10px 10px;
  /* border-left: 1px solid #fff; */
}
main.container .list ul {
  list-style-type: none;
  padding: 0;
}
main.container .list ul li a {
  display: block; 
  border: none;
  border-left: 5px solid transparent;
  cursor: pointer; 
  background:  #ffaaa5 ;
  font-size: 15px;
  text-decoration: none;
  padding: 10px 10px;
  color: #fff;
}
main.container .list ul li a:hover {
  border-left: 5px solid #E57373;
}
main.container .list ul li:first-child {
  color: #fff;
  text-align: center;
  /* border: 1px solid #fff; */
  margin-bottom: 3px;
  font-size: 20px;
  background-color: #ff8b94;
  border-radius: 10px 10px 10px 10px;
}
main.container .chat-box {
  float: left;
  width: 69%;
  background: #ffd3b6;
  height: 550px;
  border-radius: 10px 10px 10px 10px ;
}
main.container .chat-box ul {
  list-style-type: none;
  padding: 0;
/*   display: none; */
}
main.container .chat-box ul:target {
  display: block;
}
main.container .chat-box ul li .title {
  color: #888;
  text-align: center;
  border-bottom: 1px solid #88;
  margin-bottom: 3px;
}
main.container .chat-box ul li .me {
  display: flex;
  justify-content: flex-end;
  align-items: center;
}
main.container .chat-box ul li .you {
  display: flex;
  justify-content: flex-start;
  align-items: center;
}
main.container .chat-box ul li .you > div .img {
  /* margin-left: 0; */
  width: 50px;
  height: 50px;
  background: #fff;
  border-radius: 50%;
  margin-bottom: -25px;
  border: 2px solid #ffaaa5;
  z-index: 100;
  position: relative;
  background-image: url("/resources/images/chatting/loading.gif");
  background-size: 45px;
}

main.container .chat-box ul li .me > div .img {
  display: inline-block;
  width: 50px;
  height: 50px;
  background: #fff;
  border-radius: 50%;
  margin-bottom: -25px;
  border: 2px solid #ffaaa5;
  z-index: 100;
  position: relative;
  background-image: url("/resources/images/chatting/loading.gif");
  background-size: 45px;
}
main.container .chat-box ul li > div .name {
  display: inline-block;
  padding: 5px 50px 5px 20px;
  margin-top: -20px;
  margin-right: -30px;
  background-color: #ffaaa5;
  color: #fff;
  border-radius: 15px 0 0 0;
  font-size: 13px;
  position: relative;
}
main.container .chat-box ul li > div .text div {
  background-color: #fff;
  display: inline-block;
  padding: 15px 20px;
  max-width: 300px;
  min-width: 150px;
  margin-left: -55px;
  border-radius: 10px 10px 10px 10px;
  z-index: 10;
  position: relative;
  text-align: right;
}
main.container .chat-box ul li .you .name {
  padding: 5px 25px 5px 65px;
  /* margin-left: -30px; */
  border-radius: 15px 15px 0 15px;
  margin-left : 1px;
}
main.container .chat-box ul li .you .text div {
  margin-left: 35px;
  border-radius: 0 10px 10px 10px;
  text-align: left;
}

.you{
	margin-top : 10px;
}

.me{
	margin-bottom : 20px;
}

.title{
	margin-bottom : 10px;
}

.you .img{
	margin-top : -35px;
}

.you .text{
	margin-top : 10px;
	margin-bottom : 20px;
}

/* gage */
.bar {
		float:left;
		clear:both;
		width:100%;
		height:30px;
		position:relative;
		
		}
		  
		.bar .percent {
		background:#2caedd;
		background:-moz-linear-gradient(left, #2caedd 0%, #86dd2a 28%, #e0d72a 46%, #e8902c 66%, #ed2d2d 86%, #ff0000 100%);
		background:-webkit-gradient(linear, left top, right top, color-stop(0%,#2caedd), color-stop(28%,#86dd2a), color-stop(46%,#e0d72a), color-stop(66%,#e8902c), color-stop(86%,#ed2d2d), color-stop(100%,#ff0000));
		background:-webkit-linear-gradient(left, #2caedd 0%,#86dd2a 28%,#e0d72a 46%,#e8902c 66%,#ed2d2d 86%,#ff0000 100%);
		background:-o-linear-gradient(left, #2caedd 0%,#86dd2a 28%,#e0d72a 46%,#e8902c 66%,#ed2d2d 86%,#ff0000 100%);
		background:-ms-linear-gradient(left, #2caedd 0%,#86dd2a 28%,#e0d72a 46%,#e8902c 66%,#ed2d2d 86%,#ff0000 100%);
		background:linear-gradient(left, #2caedd 0%,#86dd2a 28%,#e0d72a 46%,#e8902c 66%,#ed2d2d 86%,#ff0000 100%);
		filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#2caedd', endColorstr='#ff0000', GradientType=1);
		float:left;
		width:100%;
		height:30px;
		position:relative;
		
		}
		  
		.bar .percent span {
		display:block;
		position:absolute;
		top:0;
		right:0;
		z-index:2;
		width:100%;
		height:30px;
		background:rgba(255, 255, 255, .7);
		
		}
		  
		.bar .circle {
		display:block;
		position:absolute;
		top:50%;
		left:0;
		z-index:3;
		margin:-40px 0 0 -40px;
		width:80px;
		height:80px;
		line-height:80px;
		text-align:center;
		font-size:20px;
		font-family:'PT Sans Narrow', sans-serif;
		color:#fff;
		background:rgba(0, 0, 0, .1);
		-moz-border-radius:40px;
		-webkit-border-radius:40px;
		border-radius:40px;
		-webkit-transition:all 1s ease;
		-moz-transition:all 1s ease;
		-o-transition:all 1s ease;
		}
		  
		.bar .circle.rotate {
		-webkit-transform:rotate(1080deg);
		-moz-transform:rotate(1080deg);
		-o-transform:rotate(1080deg);
		}
		  
		.bar .circle span {
		display:inline-block;
		width:70px;
		height:70px;
		line-height:70px;
		background:rgba(0, 0, 0, .3);
		-moz-border-radius:35px;
		-webkit-border-radius:35px;
		border-radius:35px;
		}
		/* gage끝 */
</style>
<script src="http://192.168.0.28:82/socket.io/socket.io.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>

<script>


////////////////////////////////////////////

var socket = io.connect('http://192.168.0.28:82');
var timeout;
var chattingNo='${chatting.chattingNo}';
var manId="${chatting.manId}";
var womanId="${chatting.womanId}";
var chatting={"chattingNo":chattingNo,"manId":manId,"womanId":womanId};
// on connection to server, ask for user's name with an anonymous callback
socket.on('connect', function(){
	// call the server-side function 'adduser' and send one parameter (value of prompt)
	
	socket.emit('adduser', "${me.userId}");
	socket.emit('addroom',chatting);
});
// listener, whenever the server emits 'updatechat', this updates the chat body
socket.on('updatechat', function (username, data1) {
	
	if (username!='${me.userId}') {
		////번역//////////////////////////////////////
		var lang=$('select').val();
		var data2={"message":data1,"lang":lang};
		var transText='';
		
	   /////////////////////
		//alert(message);
		//alert(lang);
		if (username!="SERVER : ") {
			//alert(lang);
			
			var message=data1;
			//alert(message);
			var trans=$.ajax({	
				
				url : "/chatting/json/translate" ,
				type : "POST" ,
				dataType : "text" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				//data : JSON.stringify(data2),
				data : JSON.stringify(data2),
				success : function(Data) {
										},//success
			      error: function () {
			    	  //alert("error");
			      },
			      complete: function () {
			        // Handle the complete event
			        //alert("complete");
			      }
				
			});//ajax
			//return false;
			trans.done(function(Data) {
			////////////////////////////번역끝////////
				//Debug...
				//alert("다른 사람 message");
				
				//$('#chat-box').append('<div>'+username + '<br> ' + message +'<br>'+Data+'</div><br>');
				$('#user_1').append("<li><div class='you'><div><div class='name'>"+username+"</div><div class='img'></div><div class='text'><div>"+data1+"번역 :"+Data+"</div></div></div></div></li>");


			})
		}else{
			//alert("server message");
			//$('#chat-box').append('<div>'+username + '<br> ' + data1 +'<br>');
			$('#user_1').append("<li><div class='title'><div>"+username+"<div>"+data1+"<</div></div></div></li>");

		}
		 
		
		
		
	
		
////////////////////////////ajax끝///////
		
		
		
	}else{
		//alert("내 message");
		//$('#chat-box').append('<div style = "text-align:right;">'+username + '<br> ' + data1 + '</div><br>');
		$('#user_1').append("<li><div class='me'><div><div class='name'>"+username+"</div><div class='img'></div><div class='text'><div>"+data1+"</div></div></div></div></li>");

	}
	

	$('.chat-box').scrollTop($('.chat-box').height());

	
	
});
// listener, whenever the server emits 'updaterooms', this updates the room the client is in
socket.on('updaterooms', function(rooms, current_room) {
	$('#rooms').empty();
	
		
	
	$.each(rooms, function(key, value) {
		if(value == current_room){
			$('#rooms').append('<div>' + value + '</div>');
			
		}
		else {
			$('#rooms').append('<div><a href="#" onclick="switchRoom(\''+value+'\')">' + value + '</a></div>');
			
		}
	});
});
function switchRoom(room){
	socket.emit('switchRoom', room);
	 
	//$('#conversation').remove();
	
}


// on load of page
$(function(){
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	// when the client clicks SEND
	$('#datasend').click( function() {
		var message = $('#data').val();
		var userId="${me.userId}";
		
		
   

		if (message==""||message==null) {
								
		}else{
			socket.emit('sendchat', message);
		}
		$('#data').val('');
		// tell server to execute 'sendchat' and send along one parameter
		//보낼 메세지
		//alert("보낼 메세지 : "+message);
		
	});
});
$(function(){
	// when the client hits ENTER on their keyboard
	$('#data').keypress(function(e) {
		if(e.which == 13) {
			$(this).blur();
			$('#datasend').focus().click();
		}
	});
	
/////////////////////////////////////////////
///////////////////////////////////////////////
});

window.addEventListener('beforeunload', function (e) {
	location="/chatting/endChatting";
	
	});
/////////////////////////////////
/////////게이지
	$(function() {
	    var input = $('.input'),
	        bar = $('.bar'),
	        bw =
	        bar.width(),
	        percent = bar.find('.percent'),
	        circle =
	        bar.find('.circle'),
	        ps = percent.find('span'),
	        cs =
	        circle.find('span'),
	        name = 'rotate';
	    var ti = 0;
	    
	   $('.input').click( function(e) {
	    	
	    	console.log(ti);
	    	
	        if (true) {
	        	
	        	ti=ti+5; 
	            var val = ti;
	            console.log("안쪽"+ti);
	            if (val >= 0 && val <=
	                100) {
	                var w = 100 - val,
	                    pw = (bw * w) / 100,
	                    pa = {
	                        width: w + '%'
	                    },
	                    cw =
	                    (bw - pw) / 2,
	                    ca = {
	                        left: cw
	                    }
	                ps.animate(pa);
	                cs.text(val + '%');
	                circle.animate(ca, function() {
	                    circle.removeClass(name)
	                }).addClass(name);
	            } else {
	                alert('range: 0 - 100');
	                ti.val('');
	            }
	        }
	    });
	});
//////////////////////////////////////////
/* $(function(){
			$(window).on("load",function(){
				
				$(".chat-box").mCustomScrollbar({
					autoHideScrollbar:true,
					theme:"rounded"
				});
				
			});
		});

 */
</script>
</head>
<body>

<main class='container'>

	<div class='list'>
		<ul>
			<li>이심전심 결과</li>
			<li><a href='#user_1'>상대방</a></li>
			<br><br><br><br>
			<li><a href='#user_2'>나</a></li>
			<br><br><br><br>
		</ul>
		<ul>
			<li>관심사</li>
			<li><a href='#user_1'>상대방</a></li>
			<br><br>
			<div class=" text-center"><a class="btn btn-default" href="#" role="button">확인</a></div>
			<br><br>
			
		</ul>
		<ul>
			<li>기타</li>
			<br><br>
			<div class="col-sm-4 col-md-4 text-center">
			<img  src="/resources/images/chatting/voice.png" style="width: 40px; height: 40px;">
			</div>
			<div class="col-sm-4 col-md-4 text-center">
			<img alt="" src="/resources/images/chatting/image.png" style="width: 40px; height: 40px;">
			</div>
			<div class="col-sm-4 col-md-4 text-center">
			<img alt="" src="/resources/images/chatting/profile.png" style="width: 40px; height: 40px;">
			</div>
			<br><br>
			
		</ul>
	</div>
	

	<!-- User Number 1 -->
	<div class='chat-box'  data-mcs-theme="rounded-dots">
		<ul id='user_1' >
			<li><div class='title'>2019.01.11</div></li>
			
		
		
		
	</div>
	
		<div class="form-group">
	  		<label for="lang" class="col-sm-offset-1 col-sm-1 col-md-2 control-label">언어</label>
			
			<div class="col-md-6">
				<select id="lang"	name="lnag">
					<option value="ko" selected="selected">한국어</option>
					<option value="en">영어</option>
					<option value="ja">일본어</option>
					<option value="zh-cn">중국어 간체</option>
					<option value="zh-tw">중국어 번체</option>
					<option value="hi">힌디어</option>
					<option value="es">스페인어</option>
					<option value="fr">프랑스어</option>
					<option value="de">독일어</option>
					<option value="ru">러시아어</option>
				</select>
				<input id="data" style="width:200px;" />
				<input type="button" id="datasend" value="전송" />
				
			</div>
		</div>
		
		 <div class="bar">
			    <div class="percent">
			        <span style="width: 100%;"></span>
			    </div>
			    <div class="circle">
			        <span>0%</span>
			    </div>
			    <div class="text">
			        <input type="text" class="input" value="0" />
			        <input type="button" class="input" value="좋아요"/>
			        <small>Please change a value and hit the enter key.</small>
			    </div>
			</div>
	
</main>

</body></html>