<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getPerfectChatting</title>
 
<style>
#chat_box {
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
</head>
<body>
    <div id="chat_box"></div>
    <input type="text" id="msg">
    <button id="msg_process">전송</button>
 
    <script src="http://192.168.0.28:82/socket.io/socket.io.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.1.js"></script>
    <script>
    
            $(document).ready(function(){
                var socket = io("http://192.168.0.28:82");
                
                //msg에서 키를 누를떄
                $("#msg").keydown(function(key){
                    //해당하는 키가 엔터키(13) 일떄
                    if(key.keyCode == 13){
                        //msg_process를 클릭해준다.
                        msg_process.click();
                    }
                });
                
                //msg_process를 클릭할 때
                $("#msg_process").click(function(){
                    //소켓에 send_msg라는 이벤트로 input에 #msg의 벨류를 담고 보내준다.
                    
                    socket.emit("send_id","${me.userId}");
                     socket.emit("send_msg",  $("#msg").val());
                    
                    //#msg에 벨류값을 비워준다.
                    //var text=${me.userId}+":"+$("#msg").val();
                    //var userId=${me.userId};
                    $('<div style = "text-align:right;"></div>').text($("#msg").val()).appendTo("#chat_box");
                   
                    
                
                
                	   
                	   
				
                   
                });
                
                //소켓 서버로 부터 send_msg를 통해 이벤트를 받을 경우 
                socket.on('send_msg', function(msg) {
                    //div 태그를 만들어 텍스트를 msg로 지정을 한뒤 #chat_box에 추가를 시켜준다.
                   if (msg!=$("#msg").val()) {
                	
                	   
                	   $('<div></div>').html("<div class='ui-widget-header ui-corner-all'></div>"+msg).appendTo("#chat_box");
				}else{
					$("#msg").val("");
				}
                   
                });
                
                socket.on('send_id', function(id) {
                    //div 태그를 만들어 텍스트를 msg로 지정을 한뒤 #chat_box에 추가를 시켜준다.
                   
                	if (id!="${me.userId}") {
                		$('<div></div>').html("<img src='https://images.clipartlogo.com/files/istock/previews/8401/84019939-diamond-jewelry-circle-icon-with-long-shadow.jpg' style='width: 50px; height: 50px;' >상대방").appendTo("#chat_box");
                		//$('<div></div>').text("상대방").appendTo("#chat_box");
					}
                
           		 });


            });
        </script>
</body>
</html>




 --%>
 
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!DOCTYPE html> <html> 
 <head> 
 <style>
#chat_box {
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
	var socket = io.connect('http://192.168.0.28:82');
	// on connection to server, ask for user's name with an anonymous callback
	socket.on('connect', function(){
		// call the server-side function 'adduser' and send one parameter (value of prompt)
		//socket.emit('adduser', prompt("What's your name?"));
		socket.emit('adduser', "${me.userId}");
	});
	// listener, whenever the server emits 'updatechat', this updates the chat body
	socket.on('updatechat', function (username, data) {
		if (username!='${me.userId}') {
			
			
			$('#conversation').append('<c>'+username + '<br> ' + data + '<br></c>');
		}
		
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
		// when the client clicks SEND
		$('#datasend').click( function() {
			var message = $('#data').val();
			var userId="${me.userId}";
			$('#conversation').append('<div style = "text-align:right;">'+userId + '<br> ' + message + '</div><br>');
			$('#data').val('');
			// tell server to execute 'sendchat' and send along one parameter
			socket.emit('sendchat', message);
		});
		// when the client hits ENTER on their keyboard
		$('#data').keypress(function(e) {
			if(e.which == 13) {
				$(this).blur();
				$('#datasend').focus().click();
			}
		});
	});
</script>
 </head> 
 <body> 
 

<div id='chat_box' style="float:left;width:300px;height:250px;overflow:scroll-y;padding:10px;">
	<div id="conversation"></div>

</div>
<input id="data" style="width:200px;" />
<input type="button" id="datasend" value="send" />

<!-- room 
<div style="float:top;width:100px;border-right:1px solid black;height:30px;padding:10px;overflow:scroll-y;">
	<b>ROOMS</b>
	<div id="rooms"></div>
</div>
   -->
 </body> 
 </html>

