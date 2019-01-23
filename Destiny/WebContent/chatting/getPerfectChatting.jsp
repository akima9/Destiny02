  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html> <html> 
 <head> 
 
 <!-- 참조 : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
 <style>
#conversation {
    width: 400px;
    min-width: 400px;
    height: 500px;
    min-height: 500px;
    border: 1px solid black;
}

#msg {
    width: 400px;
}

#msg_process {
    width: 90px;
}
/* gage */
.bar {
		float:left;
		clear:both;
		width:90%;
		height:20px;
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
		height:40px;
		position:relative;
		}
		  
		.bar .percent span {
		display:block;
		position:absolute;
		top:0;
		right:0;
		z-index:2;
		width:100%;
		height:40px;
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
		
</style>
<!--  <script src="/socket.io/socket.io.js"></script> -->
 <script src="http://192.168.0.28:82/socket.io/socket.io.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
<script>

//////////////////////////////////////////
 function noEvent() { // 새로 고침 방지
            if (event.keyCode == 116) {
                alert("새로고침을 할 수 없습니다.");
                event.keyCode = 2;
                return false;
            } else if (event.ctrlKey
                    && (event.keyCode == 78 || event.keyCode == 82)) {
                return false;
            }
        }
    document.onkeydown = noEvent;
 

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
					
					$('#conversation').append('<div>'+username + '<br> ' + message +'<br>'+Data+'</div><br>');
					

				})
			}else{
				//alert("server message");
				$('#conversation').append('<div>'+username + '<br> ' + data1 +'<br>');
			
			}
			 
			
			
			
		
			
	////////////////////////////ajax끝///////
			
			
			
		}else{
			//alert("내 message");
			$('#conversation').append('<div style = "text-align:right;">'+username + '<br> ' + data1 + '</div><br>');
			
		}
		

		$('#conversation').scrollTop($('#conversation').height());

		
		
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
</script>
 </head> 
 <body> 
 

<div id='chat_box'></div>
<div id="conversation" style="overflow: auto;"></div>
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
			
		



 </body> 
 </html>

