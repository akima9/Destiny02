<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
<head><meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<script src="https://www.gstatic.com/firebasejs/5.5.2/firebase.js"></script>
	
	<!-- Firebase App is always required and must be first -->
	<script src="https://www.gstatic.com/firebasejs/5.5.2/firebase-app.js"></script>
	
	<!-- Add additional services that you want to use -->
	<script src="https://www.gstatic.com/firebasejs/5.5.2/firebase-auth.js"></script>
	<script src="https://www.gstatic.com/firebasejs/5.5.2/firebase-database.js"></script>
	<script src="https://www.gstatic.com/firebasejs/5.5.2/firebase-firestore.js"></script>
	<script src="https://www.gstatic.com/firebasejs/5.5.2/firebase-messaging.js"></script>
	<script src="https://www.gstatic.com/firebasejs/5.5.2/firebase-functions.js"></script>
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js" ></script>
	
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	//============= "성격유형 등록"  Event 연결 =============
	 $(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		$( "button.btn.btn-primary" ).on("click" , function() {
			fncAddType();
		});
	});	
	
	 $(function() {
		 $('.inter-chk').on('change', function() {
			
			if( $('.inter-chk:checked').length <= 2 ) {
				$('.inter-chk').attr('disabled', false);
			} else {
				$('.inter-chk').attr('disabled', true);
				$('.inter-chk:checked').attr('disabled', false);
			}
		}); 
	 });
	 
	 function fncAddType(){
		 var myType = $("select[name='myType']").val();
		 var otherType = [];
		 $('input:checkbox[type=checkbox]:checked').each(function () {
			 otherType.push($(this).val());
		 });
		 
		 alert(otherType);
		 
	    $("input:hidden[name='firstType']").val( otherType[0] );
		$("input:hidden[name='secondType']").val( otherType[1] );
		$("input:hidden[name='thirdType']").val( otherType[2] );
		
		$("form").attr("method" , "POST").attr("action" , "/user/addType").submit();		 
	 }
	</script>
</head>
<body>
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolBar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">MBTI 유형 선택</h3>
	    </div>
		
		<form class="form-horizontal">
		
		<div class="form-group">
		
		<div class="row">
	  		<div class="col-xs-4 col-md-12"><strong>성격유형</strong>
				<br/>
				<c:set var="i" value="0"/>
				<c:forEach var="file" items="${list}">
					<c:set var="i" value="${i+1}"/>
					<div class="col-xs-8 col-md-3">${file}<img src="/resources/images/MBTI/${file}.JPG" width="200" height="200"/></div>
				</c:forEach>
			</div>
			
			<div class="col-xs-4 col-md-3"><strong>당신의 성격유형</strong>
				<c:set var="i" value="10000"/>
				<select class="form-control" id="myType" name="myType">
				<c:forEach var="file" items="${list}">
					<option value="${i}" ${ (! empty userList) && (userList[0] == i) ? 'selected' : '' }>${file}</option>
					<c:set var="i" value="${i+1}"/>
				</c:forEach>
				</select>
			</div>
			
			<div class="col-xs-4 col-md-8"><strong>당신이 원하는 상대방 성격유형</strong><br/>
				<c:set var="i" value="10000"/>
				<c:forEach var="file" items="${list}">
					<input type="checkbox" name="otherType" id="otherType" value="${i}" class="inter-chk" ${ (! empty userList) && (userList[1] == i || userList[2] == i || userList[3] == i) ? 'checked' : '' }><label>${file}</label>
					<c:set var="i" value="${i+1}"/>
				</c:forEach>
				<input type="hidden" name="firstType">
				<input type="hidden" name="secondType">
				<input type="hidden" name="thirdType">
			</div>
		</div>
		
		<hr/>
	
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary">성격유형 등록</button>
	  		</div>
		</div>
		
		<br/>
		</div>
	</form>
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->
		
	
</body>
</html>