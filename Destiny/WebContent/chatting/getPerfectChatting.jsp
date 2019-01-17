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
			
			
			$('#conversation').append('<div>'+username + '<br> ' + data + '</div><br>');
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
 

<div id='chat_box'></div>
<div id="conversation"></div>
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

