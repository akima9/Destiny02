<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
	
	

	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
    </style>
    
   
	
	 <script src="https://www.gstatic.com/firebasejs/5.8.0/firebase.js"></script>
	
	<!-- Firebase App is always required and must be first -->
	<script src="https://www.gstatic.com/firebasejs/5.5.2/firebase-app.js"></script>
	
	<!-- Add additional services that you want to use -->
	<script src="https://www.gstatic.com/firebasejs/5.5.2/firebase-auth.js"></script>
	<script src="https://www.gstatic.com/firebasejs/5.5.2/firebase-database.js"></script>
	<script src="https://www.gstatic.com/firebasejs/5.5.2/firebase-firestore.js"></script>
	<script src="https://www.gstatic.com/firebasejs/5.5.2/firebase-messaging.js"></script>
	<script src="https://www.gstatic.com/firebasejs/5.5.2/firebase-functions.js"></script>
	
	<!-- Comment out (or don't include) services that you don't want to use -->
	<!-- <script src="https://www.gstatic.com/firebasejs/5.5.2/firebase-storage.js"></script> -->
    

	
	
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		// Initialize Firebase
		  var config = {
		    apiKey: "AIzaSyBGjyfyeNMYtdnH1CtJOlsbkXtPsm8dxuk",
		    authDomain: "minipjt-cea92.firebaseapp.com",
		    databaseURL: "https://minipjt-cea92.firebaseio.com",
		    projectId: "minipjt-cea92",
		    storageBucket: "minipjt-cea92.appspot.com",
		    messagingSenderId: "778811965162"
		  };
		  firebase.initializeApp(config);
		  
		// Retrieve Firebase Messaging object.
		  const messaging = firebase.messaging();
		  messaging.usePublicVapidKey("BKmgxoh5xoADg06nwXsMlNs2A5qGaRFul1Oiz1i2U9BUI2ozecUt6t-CGgLRGwMFn6E1KLL4SYrjosnjX2nDGZ0");
		
		  
		  
		  
		  
		  
		  
		//============= 회원정보수정 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button[id='findButton']" ).on("click" , function() {
				 	var userId = $("input[name='getUserId']").val();
					self.location = "/user/getUser/"+userId;
				});
		});
		
		$(function(){
			$("button[id='typeButton']").on("click", function(){
				//var userId = $("input[name='getUserId']").val();
				var userId = "${me.userId}";
				self.location = "/user/addTypeView/"+userId;
			});
		});
		
		$(function(){
			$("button[id='listButton']").on("click", function(){
				self.location = "/user/listUser";
			});
		});
		
		$(function(){
			$("button[id='leaveSite']").on("click", function(){
				self.location = "/user/userInfo/leaveSite.jsp";
			});
		});
		
		$(function(){
			$("button[id='actMainButton']").on("click", function(){
				self.location = "/user/userAct/actMain.jsp";
			});
		});
		
		
		$(function(){
			$("button[id='letterList']").on("click", function(){
				popWin = window.open("/letter/letterMain.jsp",
					   	 "popWin",
						 "left=300, top=200, width=700, height=700, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");

			});
		});
		
		$(function(){
			$("button[id='pushButton']").on("click", function(){
				
			});
		});
		
		
		
	</script>
	<title>Insert title here</title>
	</head>
	<body>
	
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolBar.jsp" />
  	<!-- ToolBar End /////////////////////////////////////-->
  
		<div class="form-group">
		    <label for="userId" class="col-sm-4 control-label"></label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" name="getUserId" id="getUserId"  placeholder="아이디" >
		      <button id="findButton" type="button">회원검색</button>
		    </div>
		</div>	
		
		<br/>
		<div class="form-group">
		    <label  class="col-sm-4 control-label"></label>
		    <div class="col-sm-4">
		      <button id="typeButton" type="button">성격유형</button>
		    </div>
		</div>	
		
		<br/>
		<div class="form-group">
		    <label  class="col-sm-4 control-label"></label>
		    <div class="col-sm-4">
		      <button id="listButton" type="button">회원리스트</button>
		    </div>
		</div>	
		
		<br/>
		<div class="form-group">
		    <label  class="col-sm-4 control-label"></label>
		    <div class="col-sm-4">
		      <button id="letterList" type="button">쪽지</button>
		    </div>
		</div>	
		
		<br/>
		<div class="form-group">
		    <label  class="col-sm-4 control-label"></label>
		    <div class="col-sm-4">
		      <button id="leaveSite" type="button">사이트 탈퇴</button>
		    </div>
		</div>	
		
		<br/>
		<div class="form-group">
		    <label  class="col-sm-4 control-label"></label>
		    <div class="col-sm-4">
		      <button id="actMainButton" type="button">활동관리</button>
		    </div>
		</div>	
		
		<br/>
		
		<div class="form-group">
		    <label  class="col-sm-4 control-label"></label>
		    <div class="col-sm-4">
		      <button id="pushButton" type="button">푸쉬 보넹!</button>
		    </div>
		</div>	
		
	</body>
</html>