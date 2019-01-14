<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
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
	
		//============= "����"  Event ���� =============
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncUpdateUser();
			});
		});	
		
		
		//============= "���"  Event ó�� ��  ���� =============
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	
		
		//=============�̸���" ��ȿ��Check  Event ó�� =============
		 $(function() {
			 
			 $("input[name='email']").on("keyup" , function() {
					
				 var email=$("input[name='email']").val();
				 
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
							 if(JSONData.user.email != JSONData.me.email){
								$('input[name="email"]').css('background-color','pink');
								$('#authnumWirte').text("�̹� �����ϴ� �̸����Դϴ�.");
							 } else {
								$('input[name="email"]').css('background-color','white');
								$('#authnumWirte').text("");
							 }
							
						 } else {
				
							if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
								$('input[name="email"]').css('background-color','pink');
								$('#authnumWirte').text("�̸��� ������ �ƴմϴ�.");
						     } else {
						    	 $('input[name="email"]').css('background-color','rgb(207, 253, 170)');
								$('#authnumWirte').text("");
						     }
						 }
					 },
					error : function(what){
						
					}
				 });
			});
		});	
		
		//=============��ȭ��ȣ" ��ȿ��Check  Event ó�� =============
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
							 if(JSONData.user.phone != JSONData.me.phone){
								$('input[name="phoneBe"]').css('background-color','pink');
								$('#authnumPhoneWirte').text("�̹� �����ϴ� ��ȣ�Դϴ�.");
							 } else {
								$('input[name="phoneBe"]').css('background-color','white');
								$('#authnumPhoneWirte').text("");
							 }
						 } else {
							 if(phone.length < 13){
								$('input[name="phoneBe"]').css('background-color','pink');
								$('#authnumPhoneWirte').text("��ȭ��ȣ ������ �ƴմϴ�.");
							 } else {
								$('input[name="phoneBe"]').css('background-color','rgb(207, 253, 170)');
								$('#authnumPhoneWirte').text("");
							 }
						 }
					 }
				 });
			 });
		 });
			
		
		///////////////////////////////////////////////////////////////////////
		function fncUpdateUser() {
			var name=$("input[name='nickName']").val();
			
			if(name == null || name.length <1){
				alert("�г�����  �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
				
			var value = "";	
			if( $("input[id='phone2']").val() != ""  &&  $("id[name='phone3']").val() != "") {
				var value = $("select[id='phone1']").val() + "-" 
									+ $("input[id='phone2']").val() + "-" 
									+ $("input[id='phone3']").val();
			}
			
			//Debug...
			//alert("phone : "+value);
			$("input:hidden[name='phone']").val( value );
				
			$("form").attr("method" , "POST").attr("action" , "/user/updateUser").submit();
		}
		

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
			 $('.inter-chk').on('change', function() {
				
				if( $('.inter-chk:checked').length <= 2 ) {
					$('.inter-chk').attr('disabled', false);
				} else {
					$('.inter-chk').attr('disabled', true);
					$('.inter-chk:checked').attr('disabled', false);
				}
			}); 
		 });
		 
		 
		 $(function(){
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
		 
		 
		 
		 
	
	</script>
	
</head>

<body>


	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">ȸ����������</h3>
	       <h5 class="text-muted">�� ������ <strong class="text-danger">�ֽ������� ����</strong>�� �ּ���.</h5>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">�� �� ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" value="${user.userId}"  readonly>
		       <span id="helpBlock" class="help-block">
		      	<strong class="text-danger">���̵�� �����Ұ�</strong>
		      </span>
		    </div>
		  </div>
		
		  
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">�г���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="nickName" name="nickName" value="${user.nickName}" placeholder="${user.nickName}">
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="address" class="col-sm-offset-1 col-sm-3 control-label">�ּ�</label>
		    <div class="col-sm-4">
		 	   ��/��
		      <select class="form-control" id="address1" name="address1">
		      	<option value="����" ${ ! empty location[0] && location[0] == "����" ? "selected" : ""  }>����</option>
		      	<option value="���" ${ ! empty location[0] && location[0] == "���" ? "selected" : ""  }>���</option>
		      	<option value="��õ" ${ ! empty location[0] && location[0] == "��õ" ? "selected" : ""  }>��õ</option>
		      	<option value="�λ�" ${ ! empty location[0] && location[0] == "�λ�" ? "selected" : ""  }>�λ�</option>
		      	<option value="�뱸" ${ ! empty location[0] && location[0] == "�뱸" ? "selected" : ""  }>�뱸</option>
		      	<option value="����" ${ ! empty location[0] && location[0] == "����" ? "selected" : ""  }>����</option>
		      	<option value="����" ${ ! empty location[0] && location[0] == "����" ? "selected" : ""  }>����</option>
		      	<option value="���" ${ ! empty location[0] && location[0] == "���" ? "selected" : ""  }>���</option>
		      	<option value="����" ${ ! empty location[0] && location[0] == "����" ? "selected" : ""  }>����</option>
		      	<option value="����" ${ ! empty location[0] && location[0] == "����" ? "selected" : ""  }>����</option>
		      	<option value="�泲" ${ ! empty location[0] && location[0] == "�泲" ? "selected" : ""  }>�泲</option>
		      	<option value="���" ${ ! empty location[0] && location[0] == "���" ? "selected" : ""  }>���</option>
		      	<option value="����" ${ ! empty location[0] && location[0] == "����" ? "selected" : ""  }>����</option>
		      	<option value="����" ${ ! empty location[0] && location[0] == "����" ? "selected" : ""  }>����</option>
		      	<option value="�泲" ${ ! empty location[0] && location[0] == "�泲" ? "selected" : ""  }>�泲</option>
		      	<option value="���" ${ ! empty location[0] && location[0] == "���" ? "selected" : ""  }>���</option>
		      	<option value="����" ${ ! empty location[0] && location[0] == "����" ? "selected" : ""  }>����</option>
		      </select>
		     	 ��/��
		      <select class="form-control" id="address2" name="address2">
		      	<c:forEach var="location" items="${list}">
					<option value="${location.townName}" >${location.townName}</option>
				</c:forEach>
		      </select>
		      <input type="hidden" name="address">
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">�޴���ȭ��ȣ</label>
		     <div class="col-sm-2">
		      <select class="form-control" name="phoneBe" id="phone1">
				  	<option value="010" ${ ! empty phone[0] && phone[0] == "010" ? "selected" : ""  } >010</option>
					<option value="011" ${ ! empty phone[0] && phone[0] == "011" ? "selected" : ""  } >011</option>
					<option value="016" ${ ! empty phone[0] && phone[0] == "016" ? "selected" : ""  } >016</option>
					<option value="018" ${ ! empty phone[0] && phone[0] == "018" ? "selected" : ""  } >018</option>
					<option value="019" ${ ! empty phone[0] && phone[0] == "019" ? "selected" : ""  } >019</option>
				</select>
		    </div>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" id="phone2" name="phoneBe" value="${ ! empty phone[1] ? phone[1] : ''}"  placeholder="�����ȣ">
		    </div>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" id="phone3" name="phoneBe" value="${ ! empty phone[2] ? phone[2]: ''}"   placeholder="�����ȣ">
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
		      <input type="text" class="form-control" id="email" name="email" value="${user.email}" placeholder="�̸���">
		      <input type='text' class="form-control" id='authnum' name='authnum' placeholder='������ȣ 7�ڸ��� �Է��ϼ���'>
		      <span id="authnumWirte"></span>
		    </div>
		    <div class="col-sm-3">
		      <button id="emailConfirm" type="button" class="btn btn-info">�̸��� ����</button>
		    </div>
		  </div>
		  
		   <!--  //////////////////////////////////////////////////���ɻ� ���� /////////////////////////////////////////////////////////////////////////////-->
		<div class="form-group">
		   <label for="profile" class="col-sm-offset-1 col-sm-3 control-label">���ɻ�(3�� ����)</label>
		   <div class="col-sm-4">
				<input type="checkbox" name="selectInterest" value="10000" class="inter-chk" id="sltInter01"><label for="sltInter01">�ƿ�����/����</label>
				<input type="checkbox" name="selectInterest" value="10001" class="inter-chk" id="sltInter02"><label for="sltInter02">�/������</label>
				<input type="checkbox" name="selectInterest" value="10002" class="inter-chk" id="sltInter03"><label for="sltInter03">�ι���/å/��</label>
				<br/><br/>
				<input type="checkbox" name="selectInterest" value="10003" class="inter-chk" id="sltInter04"><label for="sltInter04">����/����</label>
				<input type="checkbox" name="selectInterest" value="10004" class="inter-chk" id="sltInter05"><label for="sltInter05">�ܱ�/���</label>
				<input type="checkbox" name="selectInterest" value="10005" class="inter-chk" id="sltInter06"><label for="sltInter06">��ȭ/����/����</label>
				<br/><br/>
				<input type="checkbox" name="selectInterest" value="10006" class="inter-chk" id="sltInter07"><label for="sltInter07">����/�Ǳ�</label>
				<input type="checkbox" name="selectInterest" value="10007" class="inter-chk" id="sltInter08"><label for="sltInter08">����/�����</label>
				<input type="checkbox" name="selectInterest" value="10008" class="inter-chk" id="sltInter09"><label for="sltInter09">��/����</label>
				<br/><br/>
				<input type="checkbox" name="selectInterest" value="10009" class="inter-chk" id="sltInter10"><label for="sltInter10">����Ȱ��</label>
				<input type="checkbox" name="selectInterest" value="10010" class="inter-chk" id="sltInter11"><label for="sltInter11">�米/�θ�</label>
				<input type="checkbox" name="selectInterest" value="10011" class="inter-chk" id="sltInter12"><label for="sltInter12">��/�������</label>
				<br/><br/>
				<input type="checkbox" name="selectInterest" value="10012" class="inter-chk" id="sltInter13"><label for="sltInter13">����/����</label>
				<input type="checkbox" name="selectInterest" value="10013" class="inter-chk" id="sltInter14"><label for="sltInter14">�߱�����</label>
				<input type="checkbox" name="selectInterest" value="10014" class="inter-chk" id="sltInter15"><label for="sltInter15">����/����</label>
				<br/><br/>
				<input type="checkbox" name="selectInterest" value="10015" class="inter-chk" id="sltInter16"><label for="sltInter16">�丮/����</label>
				<input type="checkbox" name="selectInterest" value="10016" class="inter-chk" id="sltInter17"><label for="sltInter17">�ݷ�����</label>
				<input type="checkbox" name="selectInterest" value="10017" class="inter-chk" id="sltInter18"><label for="sltInter18">����/��ȥ</label>
				<br/><br/>
				<input type="checkbox" name="selectInterest" value="10018" class="inter-chk" id="sltInter19"><label for="sltInter19">�Բ��ؿ�</label>
				<br/><br/>
				</div>
				<input type="hidden" name="firstInterest">
				<input type="hidden" name="secondInterest">
				<input type="hidden" name="thirdInterest">
			</div>
			<!--  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
			
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">�� &nbsp;��</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
 	
</body>

</html>