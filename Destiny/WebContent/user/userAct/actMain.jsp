<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= ȸ���������� Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button[id='CommunityListButton']" ).on("click" , function() {
			 	//var userId = $("input[name='getUserId']").val();
			 	var userId = "${me.userId}";
				self.location = "/act/getWriteCommunityList/"+userId;
		    });
		});
		
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button[id='openMeetingListButton']" ).on("click" , function() {
			 	//var userId = $("input[name='getUserId']").val();
			 	var userId = "${me.userId}";
				self.location = "/act/getOpenMeetingList/"+userId;
		    });
		});
		 
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button[id='joinMeetingListButton']" ).on("click" , function() {
			 	//var userId = $("input[name='getUserId']").val();
			 	var userId = "${me.userId}";
				self.location = "/act/getJoinMeetingList/"+userId;
		    });
		});
		
		
	</script>
	<title>act main</title>
	</head>
	<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolBar.jsp" />
  	<!-- ToolBar End /////////////////////////////////////-->
  
		<div class="form-group">
		    <label for="userId" class="col-sm-4 control-label"></label>
		    <div class="col-sm-4">
		      <button id="CommunityListButton" type="button">�ۼ��� ���ñ� ���</button>
		    </div>
		</div>	
		
		<br/>
		
		<div class="form-group">
		    <label for="userId" class="col-sm-4 control-label"></label>
		    <div class="col-sm-4">
		      <button id="openMeetingListButton" type="button">������ ���� ���</button>
		    </div>
		</div>	
		
		<br/>
		
		<div class="form-group">
		    <label for="userId" class="col-sm-4 control-label"></label>
		    <div class="col-sm-4">
		      <button id="joinMeetingListButton" type="button">������ ���� ���</button>
		    </div>
		</div>	
		
		<br/>
		
		
	</body>
</html>