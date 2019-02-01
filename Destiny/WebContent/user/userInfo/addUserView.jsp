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
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncAddUser();
			});
		});	
		
		
		//============= "���"  Event ó�� ��  ���� =============
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	
	
		
		function fncAddUser() {
			
			var id=$("input[name='userId']").val();
			var pw=$("input[name='password']").val();
			var pw_confirm=$("input[name='password2']").val();
			//var name=$("input[name='userName']").val();
			var address1=$("select[name='address1']").val();
			var address2=$("select[name='address2']").val();
			
			var address = address1 + " " + address2;
			
			alert(address);
			
			var items = [];
			$('input:checkbox[type=checkbox]:checked').each(function () {
			    items.push($(this).val());
			});
			
			alert(items);
			
			$("input:hidden[name='firstInterest']").val( items[0] );
			$("input:hidden[name='secondInterest']").val( items[1] );
			$("input:hidden[name='thirdInterest']").val( items[2] );
			
			if($("#authnumPhoneWirte").text() != "" && $("#authnumPhoneWirte ").text() != null){
				alert("�޴��� ��ȣ�� ����� �Էµǰų� ������ ������� �ʾҽ��ϴ�. Ȯ���� �ּ���.");
				return;
			}
			
			if($("#authnumWirte").text() != "" && $("#authnumWirte").text() != null){
				alert("�̸����� ����� �Էµǰų� ������ ������� �ʾҽ��ϴ�. Ȯ���� �ּ���.");
				return;
			}
			
			if(id == null || id.length <1){
				alert("���̵�� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(pw == null || pw.length <1){
				alert("�н������  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(pw_confirm == null || pw_confirm.length <1){
				alert("�н����� Ȯ����  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(address == null || address.length <1){
				alert("��������  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			
			if( pw != pw_confirm ) {				
				alert("��й�ȣ Ȯ���� ��ġ���� �ʽ��ϴ�.");
				$("input:text[name='password2']").focus();
				return;
			}
				
			var value = "";	
			if( $("input:text[id='phone2']").val() != ""  &&  $("input:text[id='phone3']").val() != "") {
				var value = $("select[id='phone1']").val() + "-" 
									+ $("input[id='phone2']").val() + "-" 
									+ $("input[id='phone3']").val();
			} else {
				alert("�ڵ��� ��ȣ�� �Էµ��� �ʾҽ��ϴ�.");
				return;
			}

			if($("input:text[id='email']").val() == "" || $("input:text[id='email']").val() == null){
				alert("�̸����� �Էµ��� �ʾҽ��ϴ�.");
				return;
			}
			
			if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
		    	alert("�̸��� ������ �ƴմϴ�.");
		    	return;
		     }
			
			$("input:hidden[name='phone']").val( value );
			$("input:hidden[name='address']").val( address );
			
			
			$("form").attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/user/addUser").submit();
		}
		

		
		
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		   //==> �ֹι�ȣ ��ȿ�� check �� ����������....
			function checkSsn() {
				var ssn1, ssn2; 
				var nByear, nTyear; 
				var today; 
		
				ssn = document.detailForm.ssn.value;
				// ��ȿ�� �ֹι�ȣ ������ ��츸 ���� ��� ����, PortalJuminCheck �Լ��� CommonScript.js �� ���� �ֹι�ȣ üũ �Լ��� 
				if(!PortalJuminCheck(ssn)) {
					alert("�߸��� �ֹι�ȣ�Դϴ�.");
					return false;
				}
			}
		
			function PortalJuminCheck(fieldValue){
			    var pattern = /^([0-9]{6})-?([0-9]{7})$/; 
				var num = fieldValue;
			    if (!pattern.test(num)) return false; 
			    num = RegExp.$1 + RegExp.$2;
		
				var sum = 0;
				var last = num.charCodeAt(12) - 0x30;
				var bases = "234567892345";
				for (var i=0; i<12; i++) {
					if (isNaN(num.substring(i,i+1))) return false;
					sum += (num.charCodeAt(i) - 0x30) * (bases.charCodeAt(i) - 0x30);
				}
				var mod = sum % 11;
				return ((11 - mod) % 10 == last) ? true : false;
			}
			 ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
			 
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
										 $('input[name="authnum"]').css('background-color','rgb(207, 253, 170)');
										 $("#authnumWirte").text("");
									 } else {
										 //alert("�ƴ�");
										 $('input[name="authnum"]').css('background-color','pink');
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
									 $('input[name="authnumPhone"]').css('background-color','rgb(207, 253, 170)');
									 $("#authnumPhoneWirte").text("");
								 } else {
									 //alert("�ƴ�");
									 $('input[name="authnumPhone"]').css('background-color','pink');
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
								$('#userId').css('background-color','pink');
								$('#userIdWirte').text("�̹� �����ϴ� ���̵��Դϴ�.");
							 } else {
								$('#userId').css('background-color','white');
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
								$('input[name="nickName"]').css('background-color','pink');
								$('#nickNameWirte').text("�̹� �����ϴ� �г����Դϴ�.");
							 } else {
								$('input[name="nickName"]').css('background-color','white');
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
						$('input[name="email"]').css('background-color','pink');
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
									$('input[name="email"]').css('background-color','pink');
									$('#authnumWirte').text("�̹� �����ϴ� �̸����Դϴ�.");
								 } else {
									$('input[name="email"]').css('background-color','white');
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
								$('input[name="phoneBe"]').css('background-color','pink');
								$('#authnumPhoneWirte').text("�̹� �����ϴ� ��ȣ�Դϴ�.");
							 } else {
								 if(phone.length < 13 || phone.length > 13){
									$('input[name="phoneBe"]').css('background-color','pink');
									$('#authnumPhoneWirte').text("��ȭ��ȣ ������ �ƴմϴ�.");
								 } else {
									$('input[name="phoneBe"]').css('background-color','rgb(207, 253, 170)');
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
				width: 70%;
				margin: 0 auto;
			}
			
			input[type="text"], input[type="text"].join, input[type="password"].join, select.join, .join{
			    background: #fff;
			    border: none;
			    border-bottom: 2px solid #ababab;
			    color: #555;
			    border-radius: 2px;
			    width:70%;
			    display:inline-block;
			}
			
			input[type="text"].join.phone{
			`	width:30%;
			}
			
			row.join{
			    margin-top: 15px;
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
			<div class="box">
			
				<form class="form-horizontal" id="form111">
				
				
				<!-- ////////////////////////////////////////////////////////////////// -->
					
					<div class="row">
						<div class="6u 12u$(small)">
							<i class="material-icons" style="font-size:36px">person</i>
							<input type="text" class="join" id="userId" name="userId" placeholder="���̵�">
				            <span id="userIdWirte"></span>
						</div>
						<div class="6u 12u$(small)">
							<i class="material-icons" style="font-size:36px">person_outline</i>
							<input type="text" class="join" id="nickName" name="nickName" placeholder="�г���">
				            <span id="nickNameWirte"></span>
						</div>
					</div>
					
					<div class="row">
						<div class="6u 12u$(small)">
							<i class="material-icons" style="font-size:36px">https</i>
							<input type="password" class="join" id="password" name="password" placeholder="��й�ȣ">
						</div>
						<div class="6u 12u$(small)">
							<i class="material-icons" style="font-size:36px">https</i>
							<input type="password" class="join" id="password2" name="password2" placeholder="��й�ȣ Ȯ��">
						</div>
					</div>
					
					<div class="row">
						<div class="6u 12u$(small)">
							<i class='fas fa-venus-mars' style='font-size:36px'></i>
							<input type="radio" name="gender" id="gender1" value="M" checked><label for="gender1">����</label>
							<input type="radio" name="gender" id="gender2" value="W"><label for="gender2">����</label>
						</div>
						<div class="6u 12u$(small)">
							<i class="material-icons" style="font-size:36px">cake</i>
							<input type="date" id="birthday" name="birthday">
						</div>
					</div>
					
					<div class="row"><!-- ������ -->
						<div class="6u 12u$(small)">
							<i class='fas fa-home' style='font-size:36px'></i>
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
							<div class="6u 12u$(small)">
							
							<select id="address2" name="address2" class="select_wrapper join">
								<c:forEach var="location" items="${list}">
									<option value="${location.townName}">${location.townName}</option>
								</c:forEach>
							</select>
							
						</div>
					</div>
					
					<div class="row"> <!-- ��ȭ��ȣ-->
						<div class="10u 12u$(small)">
							<i class='fas fa-mobile-alt' style='font-size:36px'></i>
							 <select name="phoneBe" id="phone1" class="select_wrapper join phone">
							 	<option value="010" >010</option>
							 	<option value="011" >011</option>
								<option value="016" >016</option>
								<option value="018" >018</option>
								<option value="019" >019</option>
							 </select>
							 <input type="text" id="phone2" name="phoneBe" placeholder="��ȣ" class="join phone">
							 <input type="text" id="phone3" name="phoneBe" placeholder="��ȣ" class="join phone">
						</div>
						
						<div class="2u 12u$(small)">
							<button  id="phoneConfirm" type="button" class="btn btn-info">����</button>
						</div>
					</div>
					
					<div class="row"> <!-- ��ȭ��ȣ-->
						<div class="6u 12u$(small)">
							<i class='fas fa-mobile-alt' style='font-size:36px'></i>
							 <input type='text' class="join" id='authnumPhone' name='authnumPhone' placeholder='������ȣ�� �Է��ϼ���'/>
							 <input type="hidden" name="phone"/>
						</div>
						<!-- <div class="6u 12u$(small)">
							 <span id="authnumPhoneWirte">���� �������� �ʾҽ��ϴ�.</span>
						</div> -->
					</div>
					
					<div class="row"> <!--�̸��� -->
						<div class="6u 12u$(small)">
							<i class='far fa-envelope' style='font-size:36px'></i>
						</div>
					</div>
					
					<div class="row"><!-- ������ -->
						<div class="6u 12u$(small)">
							<i class='fas fa-portrait' style='font-size:36px'></i>
						</div>
					</div>
					
					<div class="row"><!-- ���ɻ� -->
						<div class="6u 12u$(small)">
							<i class='fas fa-mobile-alt' style='font-size:36px'></i>
						</div>
					</div>
					
					
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