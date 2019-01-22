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
	var roomNo='${roomNo}';
	// on connection to server, ask for user's name with an anonymous callback
	socket.on('connect', function(){
		// call the server-side function 'adduser' and send one parameter (value of prompt)
		//socket.emit('adduser', prompt("What's your name?"));
		alert(roomNo);
		//alert($.session.get("roomNo"));
		
		socket.emit('adduser', "${me.userId}");
		socket.emit('addroom',roomNo);
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
			
			
			//$('#conversation').append('<div>'+username + '<br> ' + data + '</div><br>');
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
			//message=message+"<br>"+transText;
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
		var confirmationMessage = '\o/';

		(e || window.event).returnValue = confirmationMessage; //Gecko + IE
		return confirmationMessage; //Webkit, Safari, Chrome
		});
  /////////////////////////////////
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
		


<!-- room 
<div style="float:top;width:100px;border-right:1px solid black;height:30px;padding:10px;overflow:scroll-y;">
	<b>ROOMS</b>
	<div id="rooms"></div>
</div>
   -->
 </body> 
 </html>

