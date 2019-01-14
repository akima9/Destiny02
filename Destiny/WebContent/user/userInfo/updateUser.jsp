<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
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
   
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//============= "수정"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncUpdateUser();
			});
		});	
		
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
			});
		});	
		
		//=============이메일" 유효성Check  Event 처리 =============
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
								$('#authnumWirte').text("이미 존재하는 이메일입니다.");
							 } else {
								$('input[name="email"]').css('background-color','white');
								$('#authnumWirte').text("");
							 }
							
						 } else {
				
							if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
								$('input[name="email"]').css('background-color','pink');
								$('#authnumWirte').text("이메일 형식이 아닙니다.");
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
		
		//=============전화번호" 유효성Check  Event 처리 =============
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
							 if(JSONData.user.phone != JSONData.me.phone){
								$('input[name="phoneBe"]').css('background-color','pink');
								$('#authnumPhoneWirte').text("이미 존재하는 번호입니다.");
							 } else {
								$('input[name="phoneBe"]').css('background-color','white');
								$('#authnumPhoneWirte').text("");
							 }
						 } else {
							 if(phone.length < 13){
								$('input[name="phoneBe"]').css('background-color','pink');
								$('#authnumPhoneWirte').text("전화번호 형식이 아닙니다.");
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
				alert("닉네임은  반드시 입력하셔야 합니다.");
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
		 
		 
		 
		 
	
	</script>
	
</head>

<body>


	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">회원정보수정</h3>
	       <h5 class="text-muted">내 정보를 <strong class="text-danger">최신정보로 관리</strong>해 주세요.</h5>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">아 이 디</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" value="${user.userId}"  readonly>
		       <span id="helpBlock" class="help-block">
		      	<strong class="text-danger">아이디는 수정불가</strong>
		      </span>
		    </div>
		  </div>
		
		  
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">닉네임</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="nickName" name="nickName" value="${user.nickName}" placeholder="${user.nickName}">
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="address" class="col-sm-offset-1 col-sm-3 control-label">주소</label>
		    <div class="col-sm-4">
		 	   도/시
		      <select class="form-control" id="address1" name="address1">
		      	<option value="서울" ${ ! empty location[0] && location[0] == "서울" ? "selected" : ""  }>서울</option>
		      	<option value="경기" ${ ! empty location[0] && location[0] == "경기" ? "selected" : ""  }>경기</option>
		      	<option value="인천" ${ ! empty location[0] && location[0] == "인천" ? "selected" : ""  }>인천</option>
		      	<option value="부산" ${ ! empty location[0] && location[0] == "부산" ? "selected" : ""  }>부산</option>
		      	<option value="대구" ${ ! empty location[0] && location[0] == "대구" ? "selected" : ""  }>대구</option>
		      	<option value="광주" ${ ! empty location[0] && location[0] == "광주" ? "selected" : ""  }>광주</option>
		      	<option value="대전" ${ ! empty location[0] && location[0] == "대전" ? "selected" : ""  }>대전</option>
		      	<option value="울산" ${ ! empty location[0] && location[0] == "울산" ? "selected" : ""  }>울산</option>
		      	<option value="세종" ${ ! empty location[0] && location[0] == "세종" ? "selected" : ""  }>세종</option>
		      	<option value="강원" ${ ! empty location[0] && location[0] == "강원" ? "selected" : ""  }>강원</option>
		      	<option value="경남" ${ ! empty location[0] && location[0] == "경남" ? "selected" : ""  }>경남</option>
		      	<option value="경북" ${ ! empty location[0] && location[0] == "경북" ? "selected" : ""  }>경북</option>
		      	<option value="전남" ${ ! empty location[0] && location[0] == "전남" ? "selected" : ""  }>전남</option>
		      	<option value="전북" ${ ! empty location[0] && location[0] == "전북" ? "selected" : ""  }>전북</option>
		      	<option value="충남" ${ ! empty location[0] && location[0] == "충남" ? "selected" : ""  }>충남</option>
		      	<option value="충북" ${ ! empty location[0] && location[0] == "충북" ? "selected" : ""  }>충북</option>
		      	<option value="제주" ${ ! empty location[0] && location[0] == "제주" ? "selected" : ""  }>제주</option>
		      </select>
		     	 구/군
		      <select class="form-control" id="address2" name="address2">
		      	<c:forEach var="location" items="${list}">
					<option value="${location.townName}" >${location.townName}</option>
				</c:forEach>
		      </select>
		      <input type="hidden" name="address">
		    </div>
		  </div>
		  
		  
		  <div class="form-group">
		    <label for="ssn" class="col-sm-offset-1 col-sm-3 control-label">휴대전화번호</label>
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
		      <input type="text" class="form-control" id="phone2" name="phoneBe" value="${ ! empty phone[1] ? phone[1] : ''}"  placeholder="변경번호">
		    </div>
		    <div class="col-sm-2">
		      <input type="text" class="form-control" id="phone3" name="phoneBe" value="${ ! empty phone[2] ? phone[2]: ''}"   placeholder="변경번호">
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
		      <input type="text" class="form-control" id="email" name="email" value="${user.email}" placeholder="이메일">
		      <input type='text' class="form-control" id='authnum' name='authnum' placeholder='인증번호 7자리를 입력하세요'>
		      <span id="authnumWirte"></span>
		    </div>
		    <div class="col-sm-3">
		      <button id="emailConfirm" type="button" class="btn btn-info">이메일 인증</button>
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
			
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >수 &nbsp;정</button>
			  <a class="btn btn-primary btn" href="#" role="button">취 &nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
</body>

</html>