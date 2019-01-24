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
  
  <!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">마이페이지</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
  
		<!--  <div class="form-group">
		    <label for="userId" class="col-sm-4 control-label"></label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" name="findUserId" id="findUserId"  placeholder="아이디" >
		      <button id="findButton" type="button">회원검색</button>
		    </div>
		</div> -->	
		
		<br/>
		<div class="form-group" >
		    <label  class="col-sm-4 control-label">성격유형 선택하기</label><br/>
		    <div class="col-sm-4"   >
		      <button id="typeButton"  type="button"><img src="/resources/images/layout/mbti.jpg" width="300" height="300" /></button>
		    </div>
		</div>	
		
		
		<div class="form-group">
		    <label  class="col-sm-4 control-label">회원리스트</label>
		    <div class="col-sm-4">
		      <button id="listButton" type="button"><img src="/resources/images/layout/users.png" width="300" height="300" /></button>
		    </div>
		</div>	
		
		
		<div class="form-group">
		    <label  class="col-sm-4 control-label">쪽지</label>
		    <div class="col-sm-4">
		      <button id="letterList" type="button"><img src="/resources/images/layout/letter.png" width="300" height="300" /></button>
		    </div>
		</div>	

		
		<div class="form-group">
		    <label  class="col-sm-4 control-label">활동관리</label>
		    <div class="col-sm-4">
		      <button id="actMainButton" type="button"><img src="/resources/images/layout/act.jpg" width="300" height="300" /></button>
		    </div>
		</div>	
		
		
		
		
		<div class="form-group">
		    <label  class="col-sm-4 control-label"></label>
		    <div class="col-sm-4">
		      <button id="leaveSite" type="button">사이트 탈퇴</button>
		    </div>
		</div>	
		
		<div class="form-group">
		    <label  class="col-sm-4 control-label"></label>
		    <div class="col-sm-4">
		      <button id="pushButton" type="button">푸쉬 보넹!</button>
		    </div>
		</div>	
		
		</form>
		</div>
		
	</body>
</html>