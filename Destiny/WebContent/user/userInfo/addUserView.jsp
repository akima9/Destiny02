<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
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
	
	<!-- 참조 : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	
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
		  
		  

  
		
		//============= "가입"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncAddUser();
			});
		});	
		
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
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
			
			/*if($("#authnumPhoneWirte").text() != "" && $("#authnumPhoneWirte ").text() != null){
				alert("휴대폰 인증이 제대로 수행되지 않았습니다. 인증번호를 확인해 주세요.");
				return;
			}
			
			if($("#authnumWirte").text() != "" && $("#authnumWirte").text() != null){
				alert("이메일 인증이 제대로 수행되지 않았습니다. 인증번호를 확인해 주세요.");
				return;
			}
			
			if(id == null || id.length <1){
				alert("아이디는 반드시 입력하셔야 합니다.");
				return;
			}
			if(pw == null || pw.length <1){
				alert("패스워드는  반드시 입력하셔야 합니다.");
				return;
			}
			if(pw_confirm == null || pw_confirm.length <1){
				alert("패스워드 확인은  반드시 입력하셔야 합니다.");
				return;
			}
			if(name == null || name.length <1){
				alert("이름은  반드시 입력하셔야 합니다.");
				return;
			}
			if(address == null || address.length <1){
				alert("거주지는  반드시 입력하셔야 합니다.");
				return;
			}
			
			if( pw != pw_confirm ) {				
				alert("비밀번호 확인이 일치하지 않습니다.");
				$("input:text[name='password2']").focus();
				return;
			}*/
				
			var value = "";	
			if( $("input:text[id='phone2']").val() != ""  &&  $("input:text[id='phone3']").val() != "") {
				var value = $("select[id='phone1']").val() + "-" 
									+ $("input[id='phone2']").val() + "-" 
									+ $("input[id='phone3']").val();
			}

			
			$("input:hidden[name='phone']").val( value );
			$("input:hidden[name='address']").val( address );
			
			
			$("form").attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/user/addUser").submit();
		}
		

		//==>"이메일" 유효성Check  Event 처리 및 연결
		 $(function() {
			 
			 $("input[name='email']").on("change" , function() {
				
				 var email=$("input[name='email']").val();
			    
				 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
			    	alert("이메일 형식이 아닙니다.");
			     }
			});
			 
		});	
		
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		   //==> 주민번호 유효성 check 는 이해정도로....
			function checkSsn() {
				var ssn1, ssn2; 
				var nByear, nTyear; 
				var today; 
		
				ssn = document.detailForm.ssn.value;
				// 유효한 주민번호 형식인 경우만 나이 계산 진행, PortalJuminCheck 함수는 CommonScript.js 의 공통 주민번호 체크 함수임 
				if(!PortalJuminCheck(ssn)) {
					alert("잘못된 주민번호입니다.");
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
		
			 
			//==>"ID중복확인" Event 처리 및 연결
			 $(function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				 $("#checkVal").on("click" , function() {
					popWin 
					= window.open("/user/checkDuplication.jsp",
												"popWin", 
												"left=300,top=200,width=780,height=130,marginwidth=0,marginheight=0,"+
												"scrollbars=no,scrolling=no,menubar=no,resizable=no");
				});
			});	
	  
		
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $("#emailConfirm").on("click" , function() {
				 
				 var email = $("input[name='email']").val();
				 alert("입력된 이메일"+email);
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
						alert("메일이 발송되었습니다. 메일을 확인해 주세요.");
						
						$('input[name="authnum"]').on("keyup", function(){
							 //alert("좀 돼바 슈밤");
							 if(JSONData.authNum == $("#authnum").val()){
								 //alert("맞음");
								 $('input[name="authnum"]').css('background-color','rgb(207, 253, 170)');
								 $("#authnumWirte").text("");
							 } else {
								 //alert("아님");
								 $('input[name="authnum"]').css('background-color','pink');
								 $("#authnumWirte").text("잘못된 인증번호입니다.");
							 }
						 });							
							
						},
						error : function(what){
							alert("이메일이 전송되지 않았습니다. 유효한 이메일을 입력하여 주십시요.");
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
				//alert("입력된 번호 : "+value);
				
				$.ajax({
					url : "/user/json/SMSAuth/"+value,
					method : "POST",
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					datatype : "json",
					success : function(JSONData, status){
						alert("SMS가 발송되었습니다. 확인해 주세요.");
						
						$('input[name="authnumPhone"]').on("keyup", function(){
							 //alert("좀 돼바 슈밤");
							 if(JSONData.authNum == $("#authnumPhone").val()){
								 //alert("맞음");
								 $('input[name="authnumPhone"]').css('background-color','rgb(207, 253, 170)');
								 $("#authnumPhoneWirte").text("");
							 } else {
								 //alert("아님");
								 $('input[name="authnumPhone"]').css('background-color','pink');
								 $("#authnumPhoneWirte").text("잘못된 인증번호입니다.");
							 }
						 });
					},
					error : function(what){
						alert("SMS가 전송되지 않았습니다. 유효한 번호를 입력하여 주십시요.");
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
									alert("성공?");
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
									alert("ㅇㅇ?" + what);
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
							$('#userIdWirte').text("이미 존재하는 아이디입니다.");
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
							$('#nickNameWirte').text("이미 존재하는 닉네임입니다.");
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
							$('#authnumWirte').text("이미 존재하는 이메일입니다.");
						 } else {
							$('input[name="email"]').css('background-color','white');
							$('#authnumWirte').text("");
						 }
					 }
				 });
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
					//alert("입력된 번호 : "+phone);
				 
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
							$('#authnumPhoneWirte').text("이미 존재하는 번호입니다.");
						 } else {
							 if(phone.length < 13){
								$('input[name="phoneBe"]').css('background-color','pink');
								$('#authnumPhoneWirte').text("전화번호 형식이 아닙니다.");
							 } else {
								$('input[name="phoneBe"]').css('background-color','rgb(207, 253, 170)');
								$('#authnumPhoneWirte').text("");
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
    
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolBar.jsp" />
  <!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<h1 class="bg-primary text-center">회 원 가 입</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">아 이 디</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" placeholder="아이디">
		      <span id="userIdWirte"></span>
		    </div>
		  </div>
		  		  
		  
		  
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">비밀번호</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">비밀번호 확인</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password2"  placeholder="비밀번호 확인">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="nickName" class="col-sm-offset-1 col-sm-3 control-label">닉네임</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="nickName" name="nickName" placeholder="닉네임">
		      <span id="nickNameWirte"></span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="address" class="col-sm-offset-1 col-sm-3 control-label">주소</label>
		    <div class="col-sm-4">
		 	   도/시
		      <select class="form-control" id="address1" name="address1">
		      	<option value="서울">서울</option>
		      	<option value="경기">경기</option>
		      	<option value="인천">인천</option>
		      	<option value="부산">부산</option>
		      	<option value="대구">대구</option>
		      	<option value="광주">광주</option>
		      	<option value="대전">대전</option>
		      	<option value="울산">울산</option>
		      	<option value="세종">세종</option>
		      	<option value="강원">강원</option>
		      	<option value="경남">경남</option>
		      	<option value="경북">경북</option>
		      	<option value="전남">전남</option>
		      	<option value="전북">전북</option>
		      	<option value="충남">충남</option>
		      	<option value="충북">충북</option>
		      	<option value="제주">제주</option>
		      </select>
		     	 구/군
		      <select class="form-control" id="address2" name="address2">
		      	<c:forEach var="location" items="${list}">
					<option value="${location.townName}">${location.townName}</option>
				</c:forEach>
		      </select>
		      <input type="hidden" name="address">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">휴대전화번호</label>
		     <div class="col-sm-2">
		      <select class="form-control" name="phoneBe" id="phone1">
				  	<option value="010" >010</option>
					<option value="011" >011</option>
					<option value="016" >016</option>
					<option value="018" >018</option>
					<option value="019" >019</option>
			 </select>
		    </div>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" id="phone2" name="phoneBe" placeholder="번호">
		    </div>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" id="phone3" name="phoneBe" placeholder="번호">
		    </div>
		     <div class="col-sm-2">
		       <button id="phoneConfirm" type="button" class="btn btn-info">휴대폰 인증</button>
		     </div>
		    <div class="col-sm-4">
		     	<input type='text' class="form-control" id='authnumPhone' name='authnumPhone' placeholder='인증번호 7자리를 입력하세요'>
		     	<span id="authnumPhoneWirte"></span>
		     </div>
		    <input type="hidden" name="phone"  />
		  </div>
		  
		   <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">이메일</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="email" name="email" placeholder="이메일">
		      <input type='text' class="form-control" id='authnum' name='authnum' placeholder='인증번호 7자리를 입력하세요'>
		      <span id="authnumWirte"></span>
		    </div>
		    <div class="col-sm-3">
		      <button id="emailConfirm" type="button" class="btn btn-info">이메일 인증</button>
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		   <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">성 별</label>
		   <div class="col-sm-4">
		      <input type="radio" name="gender" id="gender1" class="form-control" value="M">남성
		      <input type="radio" name="gender" id="gender2" class="form-control" value="W">여성
		   </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="birthday" class="col-sm-offset-1 col-sm-3 control-label">생년월일</label>
		    <div class="col-sm-4">
			<input type="date" id="birthday" name="birthday">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="profile" class="col-sm-offset-1 col-sm-3 control-label">프로필 이미지</label>
		    <div class="col-sm-4">
		      <input type="file" class="form-control" id="file" name="file"  multiple>
		    </div>
		  </div>
		  
		  <!--  //////////////////////////////////////////////////관심사 선택 /////////////////////////////////////////////////////////////////////////////-->
		<div class="form-group">
		   <label for="profile" class="col-sm-offset-1 col-sm-3 control-label">관심사(3개 선택)</label>
		   <div class="col-sm-4">
				<input type="checkbox" name="selectInterest" value="10000" class="inter-chk" id="sltInter01"><label for="sltInter01">아웃도어/여행</label>
				<input type="checkbox" name="selectInterest" value="10001" class="inter-chk" id="sltInter02"><label for="sltInter02">운동/스포츠</label>
				<input type="checkbox" name="selectInterest" value="10002" class="inter-chk" id="sltInter03"><label for="sltInter03">인문학/책/글</label>
				<br/><br/>
				<input type="checkbox" name="selectInterest" value="10003" class="inter-chk" id="sltInter04"><label for="sltInter04">업종/직무</label>
				<input type="checkbox" name="selectInterest" value="10004" class="inter-chk" id="sltInter05"><label for="sltInter05">외국/언어</label>
				<input type="checkbox" name="selectInterest" value="10005" class="inter-chk" id="sltInter06"><label for="sltInter06">문화/공연/축제</label>
				<br/><br/>
				<input type="checkbox" name="selectInterest" value="10006" class="inter-chk" id="sltInter07"><label for="sltInter07">음악/악기</label>
				<input type="checkbox" name="selectInterest" value="10007" class="inter-chk" id="sltInter08"><label for="sltInter08">공예/만들기</label>
				<input type="checkbox" name="selectInterest" value="10008" class="inter-chk" id="sltInter09"><label for="sltInter09">댄스/무용</label>
				<br/><br/>
				<input type="checkbox" name="selectInterest" value="10009" class="inter-chk" id="sltInter10"><label for="sltInter10">봉사활동</label>
				<input type="checkbox" name="selectInterest" value="10010" class="inter-chk" id="sltInter11"><label for="sltInter11">사교/인맥</label>
				<input type="checkbox" name="selectInterest" value="10011" class="inter-chk" id="sltInter12"><label for="sltInter12">차/오토바이</label>
				<br/><br/>
				<input type="checkbox" name="selectInterest" value="10012" class="inter-chk" id="sltInter13"><label for="sltInter13">사진/영상</label>
				<input type="checkbox" name="selectInterest" value="10013" class="inter-chk" id="sltInter14"><label for="sltInter14">야구관람</label>
				<input type="checkbox" name="selectInterest" value="10014" class="inter-chk" id="sltInter15"><label for="sltInter15">게임/오락</label>
				<br/><br/>
				<input type="checkbox" name="selectInterest" value="10015" class="inter-chk" id="sltInter16"><label for="sltInter16">요리/제조</label>
				<input type="checkbox" name="selectInterest" value="10016" class="inter-chk" id="sltInter17"><label for="sltInter17">반려동물</label>
				<input type="checkbox" name="selectInterest" value="10017" class="inter-chk" id="sltInter18"><label for="sltInter18">가족/결혼</label>
				<br/><br/>
				<input type="checkbox" name="selectInterest" value="10018" class="inter-chk" id="sltInter19"><label for="sltInter19">함께해요</label>
				<br/><br/>
				</div>
				<input type="hidden" name="firstInterest">
				<input type="hidden" name="secondInterest">
				<input type="hidden" name="thirdInterest">
			</div>
			<!--  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
			
		  
		  
		  <div id="addConfirm" class="form-group">
		  	
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >가 &nbsp;입</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>