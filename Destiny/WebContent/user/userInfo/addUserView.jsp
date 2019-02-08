<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>�쿬</title>
<!-- All CSS Insert -->
<link rel="stylesheet" href="/resources/css/main.css" > 
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>

<!-- //All CSS Insert -->

<!-- All js -->
	<!--  ���ø� ����ϱ� ���� �ʿ��� js -->
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	
	
	
	
	
	
	<script>
	//============= "����"  Event ���� =============
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "a[name='join']" ).on("click" , function() {
				fncAddUser();
			});
		});	
		
		
		//============= "���"  Event ó�� ��  ���� =============
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[name='reset']").on("click" , function() {
				$("form")[0].reset();
			});
		});	
	
		
		function fncAddUser() {
			
			var id=$("input[name='userId']").val();
			var nickName=$("input[name='nickName']").val();
			var pw=$("input[name='password']").val();
			var pw_confirm=$("input[name='password2']").val();
			var address1=$("select[name='address1']").val();
			var address2=$("select[name='address2']").val();
			
			var address = address1 + " " + address2;
			alert(address);
			
			var items = [];
			$('input:checkbox[type=checkbox]:checked').each(function () {
			    items.push($(this).val());
			});
			
			//alert(items);
			
			$("input:hidden[name='firstInterest']").val( items[0] );
			$("input:hidden[name='secondInterest']").val( items[1] );
			$("input:hidden[name='thirdInterest']").val( items[2] );
			
			
			if(id == null || id.length <1){
				alert("���̵� �Է��� �ּ���.");
				return;
			} else if(nickName == null || nickName.length < 1){
				alert("�г����� �Է��� �ּ���.");
				return;
			} else if(pw == null || pw.length <1){
				alert("��й�ȣ�� �Է��� �ּ���.");
				return;
			} else if(pw_confirm == null || pw_confirm.length <1){
				alert("��й�ȣ�� Ȯ���� �ּ���.");
				return;
			} else if( pw != pw_confirm ) {				
				alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
				$("input:text[name='password2']").focus();
				return;
			} else if( $('[name="gender"]:checked').length != 1 ){
				alert('������ ������ �ּ���.');
				return;
			} else if( $('[name="birthday"]:checked').length != 1 ){
				alert('��������� ������ �ּ���.');
				return;
			} else if(address == null || address.length <1){
				alert("�������� ������ �ּ���.");
				return;
			} else if($("#authnumPhoneWirte").text() != "" && $("#authnumPhoneWirte ").text() != null){
				alert("�޴��� ��ȣ�� ����� �Էµǰų� ������ ������� �ʾҽ��ϴ�. Ȯ���� �ּ���.");
				return;
			}
			
			var value = "";	
			if( $("input:text[id='phone2']").val() != ""  &&  $("input:text[id='phone3']").val() != "") {
				var value = $("select[id='phone1']").val() + "-" 
									+ $("input[id='phone2']").val() + "-" 
									+ $("input[id='phone3']").val();
			} else {
				alert("�ڵ��� ��ȣ�� �Է��� �ּ���.");
				return;
			}
			
			
			
			
			/* if($("#authnumPhoneWirte").text() != "" && $("#authnumPhoneWirte ").text() != null){
				alert("�޴��� ��ȣ�� ����� �Էµǰų� ������ ������� �ʾҽ��ϴ�. Ȯ���� �ּ���.");
				return;
			}
			
			if($("#authnumWirte").text() != "" && $("#authnumWirte").text() != null){
				alert("�̸����� ����� �Էµǰų� ������ ������� �ʾҽ��ϴ�. Ȯ���� �ּ���.");
				return;
			}
			
			if(id == null || id.length <1){
				alert("���̵� �Է��� �ּ���.");
				return;
			}
			if(pw == null || pw.length <1){
				alert("�н����带 �Է��� �ּ���.");
				return;
			}
			if(pw_confirm == null || pw_confirm.length <1){
				alert("�н����带 Ȯ���� �ּ���.");
				return;
			}
			if(address == null || address.length <1){
				alert("�������� ������ �ּ���.");
				return;
			}
			
			if( pw != pw_confirm ) {				
				alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
				$("input:text[name='password2']").focus();
				return;
			}
				
			var value = "";	
			if( $("input:text[id='phone2']").val() != ""  &&  $("input:text[id='phone3']").val() != "") {
				var value = $("select[id='phone1']").val() + "-" 
									+ $("input[id='phone2']").val() + "-" 
									+ $("input[id='phone3']").val();
			} else {
				alert("�ڵ��� ��ȣ�� �Է��� �ּ���.");
				return;
			}

			if($("input:text[id='email']").val() == "" || $("input:text[id='email']").val() == null){
				alert("�̸����� �Է����ּ���.");
				return;
			}
			
			if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
		    	alert("�̸��� ������ �ƴմϴ�.");
		    	return;
		     }
			
			$("input:hidden[name='phone']").val( value );
			$("input:hidden[name='address']").val( address );
			
			
			$("form").attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/user/addUser").submit(); */
		}
		

			 
			//==>"ID�ߺ�Ȯ��" Event ó�� �� ����
			 $(function() {
					//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					 $("#checkVal").on("click" , function() {
						popWin 
						= window.open("/user/checkDuplication.jsp",
													"popWin", 
													"left=300,top=200,width=780,height=130,marginwidth=0,marginheight=0,"+
													"scrollbars=no,scrolling=no,menubar=no,resizable=no");
					});
				});	
		  
			
			 $(function() {
				//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				 $("#emailConfirm").on("click" , function() {
					 
					 if($("#authnumWirte").text() != "���� �������� �ʾҽ��ϴ�."){
						 alert("��Ȯ�� �̸����� �Է����ּ���.");
					 } else {
					 
						 var email = $("input[name='email']").val();
						 alert("�Էµ� �̸���"+email);
						 email = email.substr(0, email.length - 3);
							
						 $.ajax({
							url : "/user/json/emailAuth/"+email,
							method : "POST",
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							datatype : "json",
							success : function(JSONData, status){
								alert("������ �߼۵Ǿ����ϴ�. ������ Ȯ���� �ּ���.");
								
								$('input[name="authnum"]').on("keyup", function(){
									 //alert("�� �Ź� ����");
									 if(JSONData.authNum == $("#authnum").val()){
										 //alert("����");
										 /* $('input[name="authnum"]').css('background-color','rgb(207, 253, 170)'); */
										 $("#authnumWirte").text("");
									 } else {
										 //alert("�ƴ�");
										 /* $('input[name="authnum"]').css('background-color','pink'); */
										 $("#authnumWirte").text("�߸��� ������ȣ�Դϴ�.");
									 }
								 });							
									
								},
								error : function(what){
									alert("�̸����� ���۵��� �ʾҽ��ϴ�. ��ȿ�� �̸����� �Է��Ͽ� �ֽʽÿ�.");
								}
							 });
						 }
					});
				});	
			 
			 
			 $(function() {
				 $("#phoneConfirm").on("click" , function() {
					 
					var value = "";	
					if( $("input:text[id='phone2']").val() != ""  &&  $("input:text[id='phone3']").val() != "") {
						var value = $("select[id='phone1']").val()  
											+ $("input[id='phone2']").val() 
											+ $("input[id='phone3']").val();
					}
					//alert("�Էµ� ��ȣ : "+value);
					
					$.ajax({
						url : "/user/json/SMSAuth/"+value,
						method : "POST",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						datatype : "json",
						success : function(JSONData, status){
							alert("SMS�� �߼۵Ǿ����ϴ�. Ȯ���� �ּ���.");
							
							$('input[name="authnumPhone"]').on("keyup", function(){
								 //alert("�� �Ź� ����");
								 if(JSONData.authNum == $("#authnumPhone").val()){
									 //alert("����");
									 /* $('input[name="authnumPhone"]').css('background-color','rgb(207, 253, 170)'); */
									 $("#authnumPhoneWirte").text("");
								 } else {
									 //alert("�ƴ�");
									 /* $('input[name="authnumPhone"]').css('background-color','pink'); */
									 $("#authnumPhoneWirte").text("�߸��� ������ȣ�Դϴ�.");
								 }
							 });
						},
						error : function(what){
							alert("SMS�� ���۵��� �ʾҽ��ϴ�. ��ȿ�� ��ȣ�� �Է��Ͽ� �ֽʽÿ�.");
						}
					 });
				 });
			 });
			 
			 $(function() {
					$( "#address1" ).on("change" , function() {
						
						var idx = $("#address1").index(this);
						var city = $(this).val();
						
						alert(city + idx);
						
						$.ajax( 
								{
									url : "/user/json/getLocationList/"+city ,
									method : "GET" ,
									dataType : "json" ,
									headers : {
										"Accept" : "application/json",
										"Content-Type" : "application/json"
									},
									success : function(JSONData , status) {
										alert("����?");
										var list="";
										//list+="<option></option>";
										for(i in JSONData.list){
											var town = JSONData.list[i].townName;
											//alert(town);
											list+="<option value='"+town+"'>"+town+"</option>";
									}
										$( "#address2:eq("+idx+")" ).empty().append(list);
									},
									error : function(what){
										alert("����?" + what);
									}
							});
					});
				});
			 
			 $(function() {
				 $('#userId').on("keyup", function(){
					 
					 var userId = $('#userId').val();
					 
					 $.ajax({
						 url : "/user/json/getUser/"+userId,
						 method : "GET",
						 datatype : "json",
						 headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						 },
						 success : function(JSONData, status){
							 //alert(JSONData.user);
							 if(JSONData.user != null){
								/* $('#userId').css('background-color','pink'); */
								$('#userIdWirte').text("�̹� �����ϴ� ���̵��Դϴ�.");
							 } else {
								/* $('#userId').css('background-color','white'); */
								$('#userIdWirte').text("");
							 }
						 },
						error : function(what){
								
						 }
					 });
				 });
			 });
			 
			 $(function() {
				 $('input[name="nickName"]').on("keyup", function(){
					 
					 var nickName = $('input[name="nickName"]').val();
					 
					 $.ajax({
						 url : "/user/json/getUserByNickName/"+nickName,
						 method : "GET",
						 datatype : "json",
						 headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						 },
						 success : function(JSONData, status){
							 //alert(JSONData.user);
							 if(JSONData.user != null){
								/* $('input[name="nickName"]').css('background-color','pink'); */
								$('#nickNameWirte').text("�̹� �����ϴ� �г����Դϴ�.");
							 } else {
								/* $('input[name="nickName"]').css('background-color','white'); */
								$('#nickNameWirte').text("");
							 }
						 },
						error : function(what){
								
						}
					 });
				 });
			 });
			 

			 $(function() {
				 $('input[name="email"]').on("keyup", function(){
					 
					 var email = $('input[name="email"]').val();
					 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
						/* $('input[name="email"]').css('background-color','pink'); */
						$('#authnumWirte').text("�̸��� ������ �ƴմϴ�.");
					 }else {
					 
						 $.ajax({
							 url : "/user/json/getUserByEmail/"+email,
							 method : "GET",
							 datatype : "json",
							 headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							 },
							 success : function(JSONData, status){
								 //alert(JSONData.user);
								 if(JSONData.user != null){
									/* $('input[name="email"]').css('background-color','pink'); */
									$('#authnumWirte').text("�̹� �����ϴ� �̸����Դϴ�.");
								 } else {
									/* $('input[name="email"]').css('background-color','white'); */
									$('#authnumWirte').text("���� �������� �ʾҽ��ϴ�.");
								 }
							 },
							error : function(what){
								
							 }
						 });
					 }
				 });
			 });
			 
			 $(function() {
				 $('input[name="phoneBe"]').on("keyup", function(){
					 
					 var phone = "";	
						if( $("input:text[id='phone2']").val() != ""  &&  $("input:text[id='phone3']").val() != "") {
							var phone = $("select[id='phone1']").val() + "-"
												+ $("input[id='phone2']").val() + "-"
												+ $("input[id='phone3']").val();
						}
						//alert("�Էµ� ��ȣ : "+phone);
					 
					 $.ajax({
						 url : "/user/json/getUserByPhone/"+phone,
						 method : "GET",
						 datatype : "json",
						 headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						 },
						 success : function(JSONData, status){
							 //alert(JSONData.user);
							 if(JSONData.user != null){
								/* $('input[name="phoneBe"]').css('background-color','pink'); */
								$('#authnumPhoneWirte').text("�̹� �����ϴ� ��ȣ�Դϴ�.");
							 } else {
								 if(phone.length < 13 || phone.length > 13){
									/* $('input[name="phoneBe"]').css('background-color','pink'); */
									$('#authnumPhoneWirte').text("��ȭ��ȣ ������ �ƴմϴ�.");
								 } else {
									/* $('input[name="phoneBe"]').css('background-color','rgb(207, 253, 170)'); */
									$('#authnumPhoneWirte').text("���� �������� �ʾҽ��ϴ�.");
								 }
							 }
						 }, error : function(what){
								
						}
					 });
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
			 
			
		
	</script>
<!-- //All js -->
	
	
	<style>
		body{
			position : relative;
			font-family: 'Nanum Myeongjo', serif;
		}
		.container{
			font-weight : 700;
		}
		.tumTitle{
			font-weight : 700;
		}
	
		.topImg{
			display : block;
			position : absolute;
			top : 0;
			background-image : url("/resources/images/background/meetingbg.jpg");
			background-repeat : no-repeat;
			background-position : center center;
			background-size : cover;
			width : 100%;
			height : 400px;
		}
		
		.topImg::after{
			content : "";
			background : rgba(0, 0, 0, 0.2);
			position : absolute;
			top : 0;
			left : 0;
			width : 100%;
			height : 400px;
		}
		
		.topImg h1{
			position : absolute;
			line-height : 450px;
			width : 100%;
			text-align : center;
			color : white;
			z-index : 99;
			font-size : 60px;
		}
		
		h1 .slim{
			font-weight : lighter;
		}
		.wrap{
			margin-top : 400px;
		}
		
		li{
			list-style-type : none;
		}
		
		.smallNavi{
			overflow : hidden;
			float : right;
			margin-top : -30px;
			margin-bottom : 60px;
		}
		
		.smallNavi li{
			float : left;
			margin-right : 20px;
			margin-top : 8em;
		}
		
		.homeImg{
			margin-top : -2px;
		}
		
		section.wrapper, article.wrapper {
	    	padding: 500px 0;
		}
		
		/* /////////////////////////////////////////////////////////// */
		
			.box{
				width: 100%;
				margin: 0 auto;
			}
			
			input[type="text"], input[type="text"].join, input[type="password"].join, .join{
			    background: #fff;
			    border: none;
			    border-bottom: 2px solid #ababab;
			    color: #555;
			    border-radius: 2px;
			    width:100%;
			    display:inline-block;
			}
			
			row.join{
			    margin-top: 15px;
			}
			
			input[type="text"], input[type="password"], select.join, textarea {
		       background: #ffe7e7;
		       border: none;
		       color: #555;
		       border-radius: 2px;
		       width: 100%;
		   }
			
		/* /////////////////////////////////////////////////////////// */
		
	</style>
</head>

<body>	
	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->
	
	<!-- ���ι���̹��� : start -->
	<div class="topImg">
		<h1>ȸ��<span class="slim">����</span></h1>
	</div>
	<!-- ���ι���̹��� : end -->
	
	
	<!-- contents -->
	<section id="main" class="wrapper">
		<div class="inner">
			<h3>ȸ������</h3>
			
			
				<form class="form-horizontal" id="form111">
				
				
				<!-- ////////////////////////////////////////////////////////////////// -->
				
				<table class="row-table tablebm">
					<caption>���̺� ����</caption>
					
					<colgroup>
						<col style="width:20%;">
						<col style="width:80%;">
					</colgroup>
					
					<thead class="hide">
						<tr>
							<th>����</th>
							<td>����</td>
						</tr>
					</thead>
					
					<tbody>
						<tr>
							<th>���̵�</th>
							<td>
								<div class="row uniform">
									<div class="6u$ 12u$(small)">
										<input type="text" class="join" id="userId" name="userId">
			          				  	<span id="userIdWirte"></span>
									</div>
								</div>
							</td>
						</tr>
						
						<tr>
							<th>�г���</th>
							<td>
								<div class="row uniform">
									<div class="6u$ 12u$(small)">
										<input type="text" class="join" id="nickName" name="nickName">
				            			<span id="nickNameWirte"></span>
									</div>
								</div>
							</td>
						</tr>
						
						<tr>
							<th>��й�ȣ</th>
							<td>
								<div class="row uniform">
									<div class="6u$ 12u$(small)">
										<input type="password" class="join" id="password" name="password">
									</div>
								</div>
							</td>
						</tr>
						
						<tr>
							<th>��й�ȣ Ȯ��</th>
							<td>
								<div class="row uniform">
									<div class="6u$ 12u$(small)">
										<input type="password" class="join" id="password2" name="password2">
									</div>
								</div>
							</td>
						</tr>
						
						<tr>
							<th>����</th>
							<td>
								<div class="row uniform">
									<div class="4u 6u$(small)">
										<input type="radio" name="gender" id="gender1" value="M" checked>
										<label for="gender1">����</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="radio" name="gender" id="gender2" value="W">
										<label for="gender2">����</label>
									</div>
								</div>
							</td>
						</tr>
						
						<tr>
							<th>�������</th>
							<td>
								<div class="row uniform">
									<div class="6u$ 12u$(small)">
										<input type="date" id="birthday" name="birthday">
									</div>
								</div>
							</td>
						</tr>
						
						<tr>
							<th>������</th>
							<td>
								<div class="row uniform">
									<div class="4u 6u$(small)">
										<div class="select-wrapper">
											<select id="address1" name="address1" class="select_wrapper join">
												<option value="����">����</option>
												<option value="���">���</option>
												<option value="��õ">��õ</option>
												<option value="�λ�">�λ�</option>
												<option value="�뱸">�뱸</option>
												<option value="����">����</option>
												<option value="����">����</option>
												<option value="���">���</option>
												<option value="����">����</option>
												<option value="����">����</option>
												<option value="�泲">�泲</option>
												<option value="���">���</option>
												<option value="����">����</option>
												<option value="����">����</option>
												<option value="�泲">�泲</option>
												<option value="���">���</option>
												<option value="����">����</option>
											</select>
										</div>
									</div>
									
									<div class="4u 6u$(small)">
										<div class="select-wrapper">
											<select id="address2" name="address2" class="select_wrapper join">
												<c:forEach var="location" items="${list}">
													<option value="${location.townName}">${location.townName}</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
							</td>
						</tr>
						
						<tr>
							<th>�޴��� ��ȣ</th>
							<td>
								<div class="row uniform">
									<div class="3u 12u$(small)">
										<div class="select-wrapper">
											<select name="phoneBe" id="phone1" class="select_wrapper join phone">
											 	<option value="010" >010</option>
											 	<option value="011" >011</option>
												<option value="016" >016</option>
												<option value="018" >018</option>
												<option value="019" >019</option>
											 </select>
										 </div>
									 </div>
									 
									 <div class="3u 12u$(small)">
									 	<input type="text" id="phone2" name="phoneBe" placeholder="��ȣ" class="join phone" maxlength="4">
									 </div>
									 
									 <div class="3u 12u$(small)">
										 <input type="text" id="phone3" name="phoneBe" placeholder="��ȣ" class="join phone" maxlength="4">
									 </div>
									 
									 <div class="3u 12u$(small)">
										 <button id="phoneConfirm" type="button" class="btn btn-info">����</button>
									 </div>
									 
									 <div class="6u$ 12u$(small)">
										<input type='text' class="join" id='authnumPhone' name='authnumPhone' placeholder='������ȣ�� �Է��ϼ���'/>
										<input type="hidden" name="phone">
										<span id="authnumPhoneWirte">���� �������� �ʾҽ��ϴ�.</span>
									</div>
								</div>
							</td>
						</tr>
						
						<tr>
							<th>���ɻ�</th>
							<td>
								<div class="row uniform">
									<div class="4u 6u$(small)">
										<input type="checkbox" name="selectInterest" value="10000" id="sltInter01">
										<label for="sltInter01">�ƿ�����/����</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="selectInterest" value="10001" id="sltInter02">
										<label for="sltInter02">�/������</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="selectInterest" value="10002" id="sltInter03">
										<label for="sltInter03">�ι���/å/��</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="selectInterest" value="10003" id="sltInter04">
										<label for="sltInter04">����/����</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="selectInterest" value="10004" id="sltInter05">
										<label for="sltInter05">�ܱ�/���</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="selectInterest" value="10005" id="sltInter06">
										<label for="sltInter06">��ȭ/����/����</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="selectInterest" value="10006" id="sltInter07">
										<label for="sltInter07">����/�Ǳ�</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="selectInterest" value="10007" id="sltInter08">
										<label for="sltInter08">����/�����</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="selectInterest" value="10008" id="sltInter09">
										<label for="sltInter09">��/����</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="selectInterest" value="10009" id="sltInter10">
										<label for="sltInter10">����Ȱ��</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="selectInterest" value="10010" id="sltInter11">
										<label for="sltInter11">�米/�θ�</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="selectInterest" value="10011" id="sltInter12">
										<label for="sltInter12">��/�������</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="selectInterest" value="10012" id="sltInter13">
										<label for="sltInter13">����/����</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="selectInterest" value="10013" id="sltInter14">
										<label for="sltInter14">�߱�����</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="selectInterest" value="10014" id="sltInter15">
										<label for="sltInter15">����/����</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="selectInterest" value="10015" id="sltInter16">
										<label for="sltInter16">�丮/����</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="selectInterest" value="10016" id="sltInter17">
										<label for="sltInter17">�ݷ�����</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="selectInterest" value="10017" id="sltInter18">
										<label for="sltInter18">����/��ȥ</label>
									</div>
									<div class="4u 6u$(small)">
										<input type="checkbox" name="selectInterest" value="10018" id="sltInter19">
										<label for="sltInter19">�Բ��ؿ�</label>
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				
				<ul class="actions align-center">
					<li><a href="#" class="button" name="reset">���</a></li>
					<li><a href="#" class="button special" name="join">����</a></li>
				</ul>
					
				<!-- ////////////////////////////////////////////////////////////////// -->
						
				</form>
			</div>
			
		</div>
	</section>
	<!-- //contents -->
<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->

	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
	
	
	
</body>
</html>
