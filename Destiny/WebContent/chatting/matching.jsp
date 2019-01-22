<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	
   
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	
	
	
	<!-- Bootstrap core CSS -->
    
    <link href="carousel.css" rel="stylesheet">
    
   <!-- 케러셀 완료 -->
	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	var userId="${me.userId}";
	var userType="${me.myType}";
	var firstType="${me.firstType}";
	var secondType="${me.secondType}";
	var thirdType="${me.thirdType}";
	var manCount=0;
	var womanCount=0;
	var n=0;
	(function poll() {
	    $.ajax({
	        url: '/chatting/json/matching',
	        type: 'GET',
	        dataType: 'json',
	        success: function(JsonData) {
	            console.log('success');
	            
	           // manCount=JsonData.manList.length;
				//womanCount=JsonData.womanList.length;
				//alert("manId : "+JsonData.manId+" womanId : "+JsonData.womanId);
				if (JsonData.roomNo!=0) {
					alert("manId : "+JsonData.manId+" womanId : "+JsonData.womanId);
					//location="/chatting/getPerfectChatting/"+JsonData.roomNo;
					
					popWin = window.open("/chatting/getPerfectChatting.jsp","popWin", "left=500, top=600, width=500, height=800, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
					return false;
				}else{
					alert("manCount : "+manCount+" womanCount : "+womanCount);
				}
	        },
	        //timeout: 3000,
	        complete: setTimeout(function() { 
	        	if (n<2) {
	        	poll();
				}else{
					  var confirmflag = confirm("상대방을 찾을 수 없습니다. 나가시겠습니까?");

			           if(confirmflag){

			              //확인 버튼 클릭 true 
			        	   window.close();
			           }else{

			             //취소 버튼 클릭 false

			           }
			
				}console.log(n); n++; }, 6000)
			
	    })
	})();
	
	 
	 
	 
	$(function() {
		
		$( "#matching" ).on("click" , function() {
	 		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			
	 		
		});
	});
	</script>
<title>matching</title>



</head>

<body>
  

			  
  			<a href='#' class="btn btn-primary" role="button" id="matching">matching</a>	


   
</body>
</html>