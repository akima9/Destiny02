<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>이상형 찾기 결과</title>

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
   
   <script type="text/javascript">
		$(function() {
			$( "button:contains('이전')" ).on("click" , function() {
				 history.go(-1);
			});
				
			$("a[href='#' ]:contains('YES')").on("click", function() {
				self.location = "../chatting/mainChatting.jsp"
			});
		});
		
		
	</script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
        
        .row{text-align : center; }
        .count{font-size: 25px; font-weight: bold; color: #6666ff;}
     </style>
     
</head>
<body>

<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">이상형 찾기 결과</h3>
	    </div>
		
		<div class="row" >
			회원님이 찾는 조건의 회원수는
			<span class="count">${totalCount}명</span> 입니다.
		</div>
		<br/><br/>
		<div class="row">
			회원님이 찾는 조건의 회원 중 현재 접속중인 회원의 수는<br/>
			<span class="count"> ${numberOfLogin}명</span> 입니다.
		</div>
		<br/><br/>
		
		<div class="row">
			채팅을 시작하겠습니까?
			<br/><br/>
			<a href="#">YES</a>
		</div>
		
		<div class="row">
			<div class="col-md-12 text-center ">
				<button type="button" class="btn btn-primary">이전</button>
			</div>
		</div>
 	</div>

</body>
</html>