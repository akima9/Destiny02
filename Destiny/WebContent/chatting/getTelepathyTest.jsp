<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	  <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" integrity="sha384-PmY9l28YgO4JwMKbTvgaS7XNZJ30MK9FAZjjzXtlqyZCqBY6X6bXIkM++IkyinN+" crossorigin="anonymous">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap-theme.min.css" integrity="sha384-jzngWsPS6op3fgRCDTESqrEJwRKck+CILhJVO5VvaAZCq8JYf8HsR/HPpBOOPZfR" crossorigin="anonymous">
	
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js" integrity="sha384-vhJnz1OVIdLktyixHY4Uk3OHEwdQqPppqYR8+5mjsauETgLOcEynD9oPHhhz18Nw" crossorigin="anonymous"></script>
	
	
<script type="text/javascript">


function getRandomChatting(){
	$("form").attr("method" , "POST").attr("action" , "/chatting/telepathyResult").submit();
  	}

$(function() {
	$( "#random" ).on("click" , function() {
 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		getRandomChatting();
	});
	
});

var n=0;
	setTimeout(function() { 
   
   		alert("TimeOut! chatting을 시작합니다!");
   		getRandomChatting(); }, 10000);
	
	(function poll() {
		setTimeout(function() { 
			if (n<10) {
				$($('.title').val()).remove();
				poll();
				$('.title').last().append(10-n);
	            
			}
			
	   		 n++; }, 1000);
		
	})();

</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
body {
	
	 
}

body:after{
background-image: url("/resources/images/chatting/back.jpg");
  background-repeat: no-repeat;
   background-color: rgba( 255, 255, 255, 0.5 );
   
   background-size: cover;
    top:0;
    left:0;
    position:absolute;
    background-size:100%;
    opacity:0.5!important;
    filter:alpha(opacity=50);
    z-index:-1;
    content:"";
    width:100%;
    height:100%;
}
</style>
</head>
<body>
	<div class="text-center">TelepathyTest</div>
	<br>
	
	${roomNo}<br>
	<div class='title'>
	</div>
	<form class="form-horizontal">
	
		<div>
		<c:set var="i" value="0" />
		<c:forEach var="telepathy" items="${telepathyList}">
		<c:set var="i" value="${ i+1 }" />	
			<div class="row">
					<div class="col-xs-2 col-md-2"><strong></strong></div>
			  		<div class="col-xs-1 col-md-1"><strong>${i}</strong></div>
					<div class="col-xs-6 col-md-6">${telepathy.telepathyQuestion}</div>
			</div>
			
			<div class="row text-center">
			  		<div class="col-xs-6 col-md-6"><strong>ONE</strong></div>
					<div class="col-xs-6 col-md-6"><strong>TWO</strong></div>
			</div>
		
			<div class="row text-center">
			 
			  		<div class="col-xs-6 col-md-6"><img src="/resources/images/telepathy/${telepathy.exOneImg}" width='100' height='100' class="img-circle" ></div>
					<div class="col-xs-6 col-md-6"><img src="/resources/images/telepathy/${telepathy.exTwoImg}" width='100' height='100' class="img-circle"></div>
			</div>
			<div class="row text-center form-group">
			  		<div class="col-xs-6 col-md-6"><label><input type="radio" name="${i}" value="1" checked="checked" style=" position:absolute; "/><br><strong>${telepathy.exOne}</strong></label></div>
					<div class="col-xs-6 col-md-6"><label><input type="radio" name="${i}" value="2" style=" position:absolute; "/><br><strong>${telepathy.exTwo}</strong></label></div>
					
			</div>
				
				<br>
				
		</c:forEach>
		</div>
		<div class='text-center form-group'>
			<input type="hidden" name="roomNo" value="${roomNo}">
			<input type="hidden" name="telepathyNo1" value="${telepathyList[0].telepathyNo}">
			<input type="hidden" name="telepathyNo2" value="${telepathyList[1].telepathyNo}">
			<input type="hidden" name="telepathyNo3" value="${telepathyList[2].telepathyNo}">
			
			<a href='#' class="btn btn-primary" role="button" id="random">참여</a>
		</div>
	
	</form>
</body>
</html>