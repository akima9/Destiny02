<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
  <head>
    <meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	


	<style>
        body {
            padding-top : 100px;
        }
        .navbar-fixed-top{height:100px; padding-top:20px;}
        .thumbnail img{width:300px; height:300px; vertical-align:middle;}
        .jumbotron{height:450px;}

   	</style>
   	
  </head>

  <body>
  
  <!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolBar.jsp" />
  <!-- ToolBar End /////////////////////////////////////-->
    
    <div class="jumbotron">
      <div class="container">
        <h1>우연	</h1>
        <p>This is a template for a simple marketing or informational website. It includes a large callout called a jumbotron and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
      	
      </div>
    </div>
  
  
    <!-- thumnail -->
    <div class="container">
      <div class="page-header">
        <h1 align="center">BEST</h1>
      </div>
      <p class="lead"> <br/> </p>
    </div>
    
    <!-- Begin page content -->
    <div class="row">
	  <div class="col-xs-6 col-md-3">
	      <a href="#" class="thumbnail">
	      <img src="../resources/images/layout/mbti.jpg" alt="...">
	    </a>
	  </div>
	  
	  <div class="col-xs-6 col-md-3">
	    <a href="#" class="thumbnail">
	      <img src="../resources/images/layout/meeting.jpg" alt="...">
	    </a>
	  </div>
	  <div class="col-xs-6 col-md-3">
	    <a href="#" class="thumbnail">
	      <img src="../resources/images/layout/find.png" alt="...">
	    </a>
	  </div>
	  <div class="col-xs-6 col-md-3">
	    <a href="#" class="thumbnail">
	      <img src="../resources/images/layout/chatting.jpg" alt="...">
	    </a>
	  </div>
	  
	</div>
    <!-- /.thumnail -->
    

	<!-- ToolBar Start /////////////////////////////////////-->
	<br/><br/><br/><br/><br/><br/>
	<jsp:include page="/layout/footer.jsp" />
  	<!-- ToolBar End /////////////////////////////////////-->
    
  </body>
</html>
