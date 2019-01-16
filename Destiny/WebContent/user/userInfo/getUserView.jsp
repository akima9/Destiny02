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
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
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
				var userId = $("input[name='getUserId']").val();
				self.location = "/user/addTypeView/"+userId;
			});
		});
		
		$(function(){
			$("button[id='listButton']").on("click", function(){
				self.location = "/user/listUser";
			});
		});
		
		$(function(){
			$("button[id='letterList']").on("click", function(){
				popWin = window.open("/letter/letterMain.jsp",
					   	 "popWin",
						 "left=300, top=200, width=700, height=700, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");

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
	</body>
</html>