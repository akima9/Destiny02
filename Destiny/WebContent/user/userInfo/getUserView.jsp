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
    
   
	
	 <script src="https://cdn.onesignal.com/sdks/OneSignalSDK.js" async='async'></script>

    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		var OneSignal = window.OneSignal || [];
	    OneSignal.push(["init", {
	      appId: "4ab7e493-6f90-4250-8613-3892f90e07fa",
	      autoRegister: true, /* Set to true to automatically prompt visitors */
	      httpPermissionRequest: {
	        enable: true
	      },
	      notifyButton: {
	          enable: true, /* Required to use the Subscription Bell */
	        /* SUBSCRIPTION BELL CUSTOMIZATIONS START HERE */
	          size: 'medium', /* One of 'small', 'medium', or 'large' */
	          theme: 'default', /* One of 'default' (red-white) or 'inverse" (white-red) */
	          position: 'bottom-right', /* Either 'bottom-left' or 'bottom-right' */
	          offset: {
	              bottom: '0px',
	              left: '0px', /* Only applied if bottom-left */
	              right: '0px' /* Only applied if bottom-right */
	          },
	          prenotify: true, /* Show an icon with 1 unread message for first-time site visitors */
	          showCredit: false, /* Hide the OneSignal logo */
	          text: {
	              'tip.state.unsubscribed': 'Subscribe to notifications',
	              'tip.state.subscribed': "You're subscribed to notifications",
	              'tip.state.blocked': "You've blocked notifications",
	              'message.prenotify': 'Click to subscribe to notifications',
	              'message.action.subscribed': "Thanks for subscribing!",
	              'message.action.resubscribed': "You're subscribed to notifications",
	              'message.action.unsubscribed': "You won't receive notifications again",
	              'dialog.main.title': 'Manage Site Notifications',
	              'dialog.main.button.subscribe': 'SUBSCRIBE',
	              'dialog.main.button.unsubscribe': 'UNSUBSCRIBE',
	              'dialog.blocked.title': 'Unblock Notifications',
	              'dialog.blocked.message': "Follow these instructions to allow notifications:"
	          },
	          colors: { // Customize the colors of the main button and dialog popup button
	             'circle.background': 'rgb(84,110,123)',
	             'circle.foreground': 'white',
	             'badge.background': 'rgb(84,110,123)',
	             'badge.foreground': 'white',
	             'badge.bordercolor': 'white',
	             'pulse.color': 'white',
	             'dialog.button.background.hovering': 'rgb(77, 101, 113)',
	             'dialog.button.background.active': 'rgb(70, 92, 103)',
	             'dialog.button.background': 'rgb(84,110,123)',
	             'dialog.button.foreground': 'white'
	           },
	          /* HIDE SUBSCRIPTION BELL WHEN USER SUBSCRIBED */
	          displayPredicate: function() {
	              return OneSignal.isPushNotificationsEnabled()
	                  .then(function(isPushEnabled) {
	                      return !isPushEnabled;
	                  });
	          },
	        },  welcomeNotification: {
	            "title": "My Custom Title",
	            "message": "Thanks for subscribing!",
	            // "url": "" /* Leave commented for the notification to not open a window on Chrome and Firefox (on Safari, it opens to your webpage) */
	          },
	          promptOptions: {
	        	  /* Change bold title, limited to 30 characters */
	              siteName: 'OneSignal Documentation',
	              /* Subtitle, limited to 90 characters */
	              actionMessage: "We'd like to show you notifications for the latest news and updates.",
	              /* Example notification title */
	              exampleNotificationTitle: 'Example notification',
	              /* Example notification message */
	              exampleNotificationMessage: 'This is an example notification',
	              /* Text below example notification, limited to 50 characters */
	              exampleNotificationCaption: 'You can unsubscribe anytime',
	              /* Accept button text, limited to 15 characters */
	              acceptButtonText: "ALLOW",
	              /* Cancel button text, limited to 15 characters */
	              cancelButtonText: "NO THANKS"
	          }	      
	    }]);

		
	
		
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