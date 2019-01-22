<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
    
   <!-- �ɷ��� �Ϸ� -->
	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	var userId="${me.userId}";
	var userType="${me.myType}";
	var firstType="${me.firstType}";
	var secondType="${me.secondType}";
	var thirdType="${me.thirdType}";
	var manCount=0;
	var womanCount=0;
	
	
	function getTelepathyTest(){
		if (userId=="") {
			alert("�α��� �� �̿� �����մϴ�.");
			location="/user/login";
		}else{
			//location="/chatting/addRandomChatting";
			popWin = window.open("/chatting/telepathyTest",
					"popWin",
					"left=500, top=600, width=500, height=800, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");

		}
	}
	function getPerfectChatting(){
		//////////////�α��� ��� �۵� ���ɽ�
		 if (userId=="") {
			alert("�α��� �� �̿� �����մϴ�.");
			location="/user/login";
		}else {
			if(userType==""||firstType==""){
				location = "/user/addTypeView";
			}else{
				//location = "/chatting/addPerfectChatting";
				///////////////////////////////////////////////
				
				$.ajax({	
					
					url : "/chatting/json/addPerfectChatting" ,
					type : "GET" ,
					dataType : "json" ,
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JsonData) {
						//alert("����");
						//alert(JsonData.manList[0].userId);
						//alert(JsonData.womanList[0].userId);
						//alert(JsonData.manList.length);
						
						//manCount=JsonData.manList.length;
						//womanCount=JsonData.womanList.length;
						
						popWin = window.open("/chatting/matching.jsp","popWin", "left=500, top=600, width=500, height=800, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
						
						
						
								/* if (manCount>0 && womanCount>0) {
									alert("�Ѹ� �ִ� ���");
									popWin = window.open("/chatting/addPerfectChatting","popWin", "left=500, top=600, width=500, height=800, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");	
									condition=false;
								} */
						
							
						
						
						
											},//success
				      error: function () {
				    	  alert("error");
				      },
				      complete: function () {
				        // Handle the complete event
				        //alert("complete");
				      }
					
				});//ajax
				
				/* setTimeout(function() {
					var m='${manList.size()}';
					var w='${womanList.size()}';
					var login='${loginList.size()}';
					alert("manCount1"+m);
					alert("womanCount1"+w);
					alert(login);
					}, 5000); */
					
					/* setInterval(function(){
						alert("manCount1"+m);
						alert("womanCount1"+w);}, 3000);	 */
					
						//popWin = window.open("/chatting/addPerfectChatting","popWin", "left=500, top=600, width=500, height=800, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
				
			}
			
		} 
		
	}
	
	 function getNode(){
		location = "/chatting/json/getPerfectChatting";
		 
	} 
	$(function() {
		$( "#telepathy" ).on("click" , function() {
	 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			getTelepathyTest();
		});
		$( "#perfect" ).on("click" , function() {
	 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			
	
			getPerfectChatting();
		});
		
		$( "#node" ).on("click" , function() {
	 		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			getNode();
		});
	});
	</script>
<title>mainChatting</title>



</head>

<body>
  <!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolBar.jsp" />
  <!-- ToolBar End /////////////////////////////////////-->
    


<table>
            
				 
	            <div id="myCarousel" class="carousel slide" data-ride="carousel">
			      <!-- Indicators -->
			      <ol class="carousel-indicators">
			        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			        <li data-target="#myCarousel" data-slide-to="1"></li>
			        <li data-target="#myCarousel" data-slide-to="2"></li>
			      </ol>
			      <div class="carousel-inner" role="listbox">
			        <div class="item active" >
			          <img class="first-slide center-block" src="https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg" alt="First slide"><!-- ù��° ���� -->
			          <div class="container">
			            <div class="carousel-caption">
			            	����� ���������� ����ϼ���!
			              <h1>MBTI</h1>
			              <p>Note: If you're viewing this page via a <code>file://</code> URL, the "next" and "previous" Glyphicon buttons on the left and right might not load/display properly due to web browser security rules.</p>
			              <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
			            </div>
			          </div>
			        </div>
			        <div class="item">
			          <img class="second-slide center-block" src="https://cdn.pixabay.com/photo/2015/05/06/16/31/andromeda-galaxy-755442_960_720.jpg" alt="Second slide"><!-- �ι�° ���� -->
			          <div class="container">
			            <div class="carousel-caption">
			              <h1>�پ��� �ı⸦ Ȯ���� ������!</h1>
			              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
			              <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
			            </div>
			          </div>
			        </div>
			        <div class="item">
			          <img class="third-slide center-block" src="https://cdn.pixabay.com/photo/2018/08/14/13/23/ocean-3605547_960_720.jpg" alt="Third slide"><!-- ����° ���� -->
			          <div class="container">
			        	<div class="carousel-caption">
			              <h1>��������</h1>
			              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
			              <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
			            </div> 
			          </div>
			        </div>
			      </div> 
			      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
			        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			        <span class="sr-only">Previous</span>
			      </a>
			      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
			        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			        <span class="sr-only">Next</span>
			      </a>
			    </div>
            </table>
            
            
            
           <div class="col-sm-6 col-md-6" >
			    <div class="thumbnail"  >
			    
			    <img src="https://media.istockphoto.com/vectors/people-chatting-vector-id504078623" style="width: 200px; height: 200px;" data-image1='${product.prodNo}' data-image2='${product.proTranCode}'>
			      <div class="caption">
			        <h3>����ä��</h3>
			        <p class='text-primary'>�̼��� ����ä�� ����� �����մϴ�.</p>
			        <p  >
			        	<!-- <a href='getTelepathyTest.jsp' class="btn btn-primary" role="button" id="random">����</a> --> 
						<a href='#' class="btn btn-primary" role="button" id="telepathy">����</a>			       
			        </p>
			      </div>
			    </div>
		    </div> 
		    
		    <div class="col-sm-6 col-md-6" >
			    <div class="thumbnail"  >
			    
			    <img src="https://storage.googleapis.com/neris/public/images/system/home/home-16personalities.svg" style="width: 200px; height: 200px;" data-image1='${product.prodNo}' data-image2='${product.proTranCode}'>
			      <div class="caption">
			        <h3>�̻���ä��</h3>
			        <p class='text-primary'>���������˻� ����� �̻��������� ���� �̼��� ����ä�� ����� �����մϴ�.</p>
			        <p  >
			        	<!-- <a href='getPerfectChatting.jsp' class="btn btn-primary" role="button" id="perfect">����</a> --> 
			        	<a href='#' class="btn btn-primary" role="button" id="perfect">����</a>
			        </p>
			      </div>
			    </div>
		    </div> 
   
  			<a href='#' class="btn btn-primary" role="button" id="node">node����</a>	


   
</body>
</html>