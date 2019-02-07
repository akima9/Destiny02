<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>우연</title>
<!-- All CSS Insert -->
<link rel="stylesheet" href="/resources/css/main.css" > 
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>

<!-- //All CSS Insert -->

<!-- All js -->
	<!--  템플릿 사용하기 위해 필요한 js -->
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	
	
	
	
	
	
	<script>
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
			
			if($("#authnumPhoneWirte").text() != "" && $("#authnumPhoneWirte ").text() != null){
				alert("휴대폰 번호가 제대로 입력되거나 인증이 수행되지 않았습니다. 확인해 주세요.");
				return;
			}
			
			if($("#authnumWirte").text() != "" && $("#authnumWirte").text() != null){
				alert("이메일이 제대로 입력되거나 인증이 수행되지 않았습니다. 확인해 주세요.");
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
			if(address == null || address.length <1){
				alert("거주지는  반드시 입력하셔야 합니다.");
				return;
			}
			
			if( pw != pw_confirm ) {				
				alert("비밀번호 확인이 일치하지 않습니다.");
				$("input:text[name='password2']").focus();
				return;
			}
				
			var value = "";	
			if( $("input:text[id='phone2']").val() != ""  &&  $("input:text[id='phone3']").val() != "") {
				var value = $("select[id='phone1']").val() + "-" 
									+ $("input[id='phone2']").val() + "-" 
									+ $("input[id='phone3']").val();
			} else {
				alert("핸드폰 번호가 입력되지 않았습니다.");
				return;
			}

			if($("input:text[id='email']").val() == "" || $("input:text[id='email']").val() == null){
				alert("이메일이 입력되지 않았습니다.");
				return;
			}
			
			if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
		    	alert("이메일 형식이 아닙니다.");
		    	return;
		     }
			
			$("input:hidden[name='phone']").val( value );
			$("input:hidden[name='address']").val( address );
			
			
			$("form").attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/user/addUser").submit();
		}
		

		
		
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
					 
					 if($("#authnumWirte").text() != "아직 인증되지 않았습니다."){
						 alert("정확한 이메일을 입력해주세요.");
					 } else {
					 
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
								$('#userIdWirte').text("이미 존재하는 아이디입니다.");
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
								$('#nickNameWirte').text("이미 존재하는 닉네임입니다.");
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
						$('#authnumWirte').text("이메일 형식이 아닙니다.");
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
									$('#authnumWirte').text("이미 존재하는 이메일입니다.");
								 } else {
									$('input[name="email"]').css('background-color','white');
									$('#authnumWirte').text("아직 인증되지 않았습니다.");
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
								 if(phone.length < 13 || phone.length > 13){
									$('input[name="phoneBe"]').css('background-color','pink');
									$('#authnumPhoneWirte').text("전화번호 형식이 아닙니다.");
								 } else {
									$('input[name="phoneBe"]').css('background-color','rgb(207, 253, 170)');
									$('#authnumPhoneWirte').text("아직 인증되지 않았습니다.");
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
	
	<!-- 메인배경이미지 : start -->
	<div class="topImg">
		<h1>회원<span class="slim">가입</span></h1>
	</div>
	<!-- 메인배경이미지 : end -->
	
	
	<!-- contents -->
	<section id="main" class="wrapper">
		<div class="inner">
			<h3>회원가입</h3>
			<div class="box">
			
				<form class="form-horizontal" id="form111">
				
				
				<!-- ////////////////////////////////////////////////////////////////// -->
					
					<div class="row">
						<div class="6u 12u$(small)">
							<i class="material-icons" style="font-size:36px">person</i>
							<input type="text" class="join" id="userId" name="userId" placeholder="아이디">
				            <span id="userIdWirte"></span>
						</div>
						<div class="6u 12u$(small)">
							<i class="material-icons" style="font-size:36px">person_outline</i>
							<input type="text" class="join" id="nickName" name="nickName" placeholder="닉네임">
				            <span id="nickNameWirte"></span>
						</div>
					</div>
					
					<div class="row">
						<div class="6u 12u$(small)">
							<i class="material-icons" style="font-size:36px">https</i>
							<input type="password" class="join" id="password" name="password" placeholder="비밀번호">
						</div>
						<div class="6u 12u$(small)">
							<i class="material-icons" style="font-size:36px">https</i>
							<input type="password" class="join" id="password2" name="password2" placeholder="비밀번호 확인">
						</div>
					</div>
					
					<div class="row">
						<div class="6u 12u$(small)">
							<i class='fas fa-venus-mars' style='font-size:36px'></i>
							<input type="radio" name="gender" id="gender1" value="M" checked><label for="gender1">남성</label>
							<input type="radio" name="gender" id="gender2" value="W"><label for="gender2">여성</label>
						</div>
						<div class="6u 12u$(small)">
							<i class="material-icons" style="font-size:36px">cake</i>
							<input type="date" id="birthday" name="birthday">
						</div>
					</div>
					
					<div class="row"><!-- 거주지 -->
						<div class="6u 12u$(small)">
							<i class='fas fa-home' style='font-size:36px'></i>
							<select id="address1" name="address1" class="select_wrapper join">
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
							
							</div>
							<div class="6u 12u$(small)">
							
							<select id="address2" name="address2" class="select_wrapper join">
								<c:forEach var="location" items="${list}">
									<option value="${location.townName}">${location.townName}</option>
								</c:forEach>
							</select>
							
						</div>
					</div>
					
					<div class="row"> <!-- 전화번호-->
						<div class="10u 12u$(small)">
							<i class='fas fa-mobile-alt' style='font-size:36px'></i>
							 <select name="phoneBe" id="phone1" class="select_wrapper join phone">
							 	<option value="010" >010</option>
							 	<option value="011" >011</option>
								<option value="016" >016</option>
								<option value="018" >018</option>
								<option value="019" >019</option>
							 </select>
							 <input type="text" id="phone2" name="phoneBe" placeholder="번호" class="join phone">
							 <input type="text" id="phone3" name="phoneBe" placeholder="번호" class="join phone">
						</div>
						
						<div class="2u 12u$(small)">
							<button  id="phoneConfirm" type="button" class="btn btn-info">인증</button>
						</div>
					</div>
					
					<div class="row"> <!-- 전화번호-->
						<div class="6u 12u$(small)">
							<i class='fas fa-mobile-alt' style='font-size:36px'></i>
							 <input type='text' class="join" id='authnumPhone' name='authnumPhone' placeholder='인증번호를 입력하세요'/>
							 <input type="hidden" name="phone"/>
						</div>
						<!-- <div class="6u 12u$(small)">
							 <span id="authnumPhoneWirte">아직 인증되지 않았습니다.</span>
						</div> -->
					</div>
					
					<div class="row"> <!--이메일 -->
						<div class="6u 12u$(small)">
							<i class='far fa-envelope' style='font-size:36px'></i>
						</div>
					</div>
					
					<div class="row"><!-- 프로필 -->
						<div class="6u 12u$(small)">
							<i class='fas fa-portrait' style='font-size:36px'></i>
						</div>
					</div>
					
					<div class="row"><!-- 관심사 -->
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