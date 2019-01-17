<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
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
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>

    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	$(function() {
		 $( "button.btn.btn-primary" ).on("click" , function() {
			 $("form").attr("method" , "POST").attr("action" , "/letter/sendLetter").submit();
		});
	});
	
	
	</script>
	
</head>


<body>
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
   		<h1 class="bg-primary text-center">�����ۼ�</h1>
   	
   		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		 <div class="form-group">
		    <label for="senderId" class="col-sm-offset-1 col-sm-3 control-label">�߽���ID : ${me.userId}</label>
		    <div class="col-sm-4">
		      <span id="senderId"></span>
		    </div>
		 </div>
		 
		 <div class="form-group">
		    <label for="receiverId" class="col-sm-offset-1 col-sm-3 control-label">������ID</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverId" name="receiverId" value="${senderId}">
		    </div> 
		 </div>
		 
		 <div class="form-group">
		    <label for="letterTitle" class="col-sm-offset-1 col-sm-3 control-label">���� ���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="letterTitle" name="letterTitle">
		      <span id="letterTitle"></span>
		    </div>
		 </div>
		 
		 <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
		    <div class="col-sm-4">
		      <textarea name="letterDetail" class="form-control" cols="25" rows="25" >
			  </textarea>
		    </div>
		 </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
			  <a class="btn btn-primary btn" href="/letter/letterMain.jsp" role="button">��&nbsp;��</a>
		    </div>
		  </div>

	   </form>
 	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->
		  
	
</body>
</html>

