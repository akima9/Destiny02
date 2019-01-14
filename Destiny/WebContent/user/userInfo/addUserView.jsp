<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
	
		var config = {
				  apiKey: "AIzaSyBGjyfyeNMYtdnH1CtJOlsbkXtPsm8dxuk",
				    authDomain: "minipjt-cea92.firebaseapp.com",
				    databaseURL: "https://minipjt-cea92.firebaseio.com",
				    projectId: "minipjt-cea92",
				    storageBucket: "minipjt-cea92.appspot.com",
				    messagingSenderId: "778811965162"
		  };
		  firebase.initializeApp(config);
		  firebase.auth().languageCode = 'it';
		  // To apply the default browser preference instead of explicitly setting it.
		  // firebase.auth().useDeviceLanguage();
		  
		  

  
		
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
			var name=$("input[name='userName']").val();
			var address1=$("select[name='address1']").val();
			var address2=$("select[name='address2']").val();
			
			var address = address1 + " " + address2;
			
			alert(address);
			
			/*if($("#authnumPhoneWirte").text() != "" && $("#authnumPhoneWirte ").text() != null){
				alert("�޴��� ������ ����� ������� �ʾҽ��ϴ�. ������ȣ�� Ȯ���� �ּ���.");
				return;
			}
			
			if($("#authnumWirte").text() != "" && $("#authnumWirte").text() != null){
				alert("�̸��� ������ ����� ������� �ʾҽ��ϴ�. ������ȣ�� Ȯ���� �ּ���.");
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
			if(name == null || name.length <1){
				alert("�̸���  �ݵ�� �Է��ϼž� �մϴ�.");
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
			}*/
				
			var value = "";	
			if( $("input:text[name='phone2']").val() != ""  &&  $("input:text[name='phone3']").val() != "") {
				var value = $("select[name='phone1']").val() + "-" 
									+ $("input[name='phone2']").val() + "-" 
									+ $("input[name='phone3']").val();
			}

			
			$("input:hidden[name='phone']").val( value );
			$("input:hidden[name='address']").val( address );
			
			
			$("form").attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/user/addUser").submit();
		}
		

		//==>"�̸���" ��ȿ��Check  Event ó�� �� ����
		 $(function() {
			 
			 $("input[name='email']").on("change" , function() {
				
				 var email=$("input[name='email']").val();
			    
				 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
			    	alert("�̸��� ������ �ƴմϴ�.");
			     }
			});
			 
		});	
		
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
				});
			});	
		 
		 
		 $(function() {
			 $("#phoneConfirm").on("click" , function() {
				 
				var value = "";	
				if( $("input:text[name='phone2']").val() != ""  &&  $("input:text[name='phone3']").val() != "") {
					var value = $("select[name='phone1']").val()  
										+ $("input[name='phone2']").val() 
										+ $("input[name='phone3']").val();
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
			 $('input[name="userId"]').on("keyup", function(){
				 
				 var userId = $('input[name="userId"]').val();
				 
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
							$('input[name="userId"]').css('background-color','pink');
							$('#userIdWirte').text("�̹� �����ϴ� ���̵��Դϴ�.");
						 } else {
							$('input[name="userId"]').css('background-color','white');
							$('#userIdWirte').text("");
						 }
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
					 }
				 });
			 });
		 });
		 

		 $(function() {
			 $('input[name="email"]').on("keyup", function(){
				 
				 var email = $('input[name="email"]').val();
				 
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
							$('#authnumWirte').text("");
						 }
					 }
				 });
			 });
		 });
		 
		 $(function() {
			 $('input[name="phone3"]').on("keyup", function(){
				 
				 var phone = "";	
					if( $("input:text[name='phone2']").val() != ""  &&  $("input:text[name='phone3']").val() != "") {
						var phone = $("select[name='phone1']").val() + "-"
											+ $("input[name='phone2']").val() + "-"
											+ $("input[name='phone3']").val();
					}
					alert("�Էµ� ��ȣ : "+phone);
				 
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
							$('input[name="phone3"]').css('background-color','pink');
							$('#authnumPhoneWirte').text("�̹� �����ϴ� ��ȣ�Դϴ�.");
						 } else {
							$('input[name="phone3"]').css('background-color','white');
							$('#authnumPhoneWirte').text("");
						 }
					 }
				 });
			 });
		 });
		 
		 
		
		 
		
		

	</script>		
    
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Destiny Add User</a>
   		</div>
   	</div>
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">ȸ �� �� ��</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">�� �� ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" placeholder="���̵�">
		      <span id="userIdWirte"></span>
		    </div>
		  </div>
		  		  
		  
		  
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="��й�ȣ">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">��й�ȣ Ȯ��</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password2"  placeholder="��й�ȣ Ȯ��">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="nickName" class="col-sm-offset-1 col-sm-3 control-label">�г���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="nickName" name="nickName" placeholder="�г���">
		      <span id="nickNameWirte"></span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="address" class="col-sm-offset-1 col-sm-3 control-label">�ּ�</label>
		    <div class="col-sm-4">
		 	   ��/��
		      <select class="form-control" id="address1" name="address1">
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
		     	 ��/��
		      <select class="form-control" id="address2" name="address2">
		      	<c:forEach var="location" items="${list}">
					<option value="${location.townName}">${location.townName}</option>
				</c:forEach>
		      </select>
		      <input type="hidden" name="address">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�޴���ȭ��ȣ</label>
		     <div class="col-sm-2">
		      <select class="form-control" name="phone1" id="phone1">
				  	<option value="010" >010</option>
					<option value="011" >011</option>
					<option value="016" >016</option>
					<option value="018" >018</option>
					<option value="019" >019</option>
			 </select>
		    </div>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" id="phone2" name="phone2" placeholder="��ȣ">
		    </div>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" id="phone3" name="phone3" placeholder="��ȣ">
		    </div>
		     <div class="col-sm-2">
		       <button id="phoneConfirm" type="button" class="btn btn-info">�޴��� ����</button>
		     </div>
		    <div class="col-sm-4">
		     	<input type='text' class="form-control" id='authnumPhone' name='authnumPhone' placeholder='������ȣ 7�ڸ��� �Է��ϼ���'>
		     	<span id="authnumPhoneWirte"></span>
		     </div>
		    <input type="hidden" name="phone"  />
		  </div>
		  
		   <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�̸���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="email" name="email" placeholder="�̸���">
		      <input type='text' class="form-control" id='authnum' name='authnum' placeholder='������ȣ 7�ڸ��� �Է��ϼ���'>
		      <span id="authnumWirte"></span>
		    </div>
		    <div class="col-sm-3">
		      <button id="emailConfirm" type="button" class="btn btn-info">�̸��� ����</button>
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		   <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�� ��</label>
		   <div class="col-sm-4">
		      <input type="radio" name="gender" id="gender1" class="form-control" value="M">����
		      <input type="radio" name="gender" id="gender2" class="form-control" value="W">����
		   </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="birthday" class="col-sm-offset-1 col-sm-3 control-label">�������</label>
		    <div class="col-sm-4">
			<input type="date" id="birthday" name="birthday">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="profile" class="col-sm-offset-1 col-sm-3 control-label">������ �̹���</label>
		    <div class="col-sm-4">
		      <input type="file" class="form-control" id="file" name="file"  multiple>
		    </div>
		  </div>
		  
		  
		  
		  <div id="addConfirm" class="form-group">
		  	
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->
	
</body>

</html>