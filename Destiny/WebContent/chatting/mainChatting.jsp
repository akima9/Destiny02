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
	var userGrade="${me.userGrade}";
	var manCount=0;
	var womanCount=0;
	
	
	function getTelepathyTest(){
		if (userId=="") {
			alert("�α��� �� �̿� �����մϴ�.");
			$("#my-dialog,#dialog-background").toggle();
		}else{
			//location="/chatting/addRandomChatting";
			///////////////////////////////////////////////
				
				$.ajax({	
					
					url : "/chatting/json/addRandomChatting" ,
					type : "GET" ,
					dataType : "json" ,
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JsonData) {
						//alert("����");
						
						popWin = window.open("/chatting/getRandomMatching.jsp","popWin", "left=500, top=600, width=500, height=800, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
									},//success
				      error: function () {
				    	  alert("error");
				      },
				      complete: function () {
				        
				        //alert("complete");
				      }
					
				});//ajax
			
		}
	}
	function getPerfectChatting(){
		//////////////�α��� ��� �۵� ���ɽ�
		 if (userId=="") {
			alert("�α��� �� �̿� �����մϴ�.");
			$("#my-dialog,#dialog-background").toggle();
		}else {
			if (userGrade=='NEW') {
				alert("�Ϲ�ȸ�� �̻���� �̿� �����մϴ�.");
			}else{
				
			
				if(userType==""||firstType==""){
					location = "/user/addTypeView";
				}else{
					
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
							
							popWin = window.open("/chatting/getPerfectMatching.jsp","popWin", "left=500, top=600, width=500, height=800, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
							
												},//success
					      error: function () {
					    	  alert("error");
					      },
					      complete: function () {				    
					        //alert("complete");
					      }
						
					});//ajax ��
				}//type Ȯ��
			}//gradeȮ��
			
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
			          <img class="first-slide center-block" src="/resources/images/chatting/main01.jpg" style="width: 960px; height: 600px;" alt="First slide"><!-- ù��° ���� -->
			          <div class="container">
			            <div class="carousel-caption">
			            	����� ���������� ����ϼ���!
			              <h1>MBTI</h1>
			              <p>MyPage���� ���������� �����ϼ���.<code></code> ���� ��� �� �̻��� ä���� �����մϴ�.</p>
			              <p><a class="btn btn-lg btn-primary" href="#" role="button">MyPage</a></p>
			            </div>
			          </div>
			        </div>
			        <div class="item">
			          <img class="second-slide center-block" src="/resources/images/chatting/main02.jpg" style="width: 960px; height: 600px;" alt="Second slide"><!-- �ι�° ���� -->
			          <div class="container">
			            <div class="carousel-caption">
			              <h1>�پ��� �ı⸦ Ȯ���� ������!</h1>
			              <p></p>
			              <p><a class="btn btn-lg btn-primary" href="#" role="button">Story</a></p>
			            </div>
			          </div>
			        </div>
			        <div class="item">
			          <img class="third-slide center-block" src="/resources/images/chatting/main03.jpg" style="width: 960px; height: 600px;" alt="Third slide"><!-- ����° ���� -->
			          <div class="container">
			        	<div class="carousel-caption">
			              <h1>��������</h1>
			              <p>����� �ִٸ� �̰�����!</p>
			              <p><a class="btn btn-lg btn-primary" href="#" role="button">Advice</a></p>
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
            
            <div class="col-sm-2 col-md-2" ></div>
            
           <div class="col-sm-4 col-md-4" >
			    <div style="text-align: center;"  >
			    
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
		    
		    <div class="col-sm-4 col-md-4" >
			    <div style="text-align: center;"  >
			    
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
   			 <div class="col-sm-2 col-md-2" ></div>
  		


   
</body>
</html>