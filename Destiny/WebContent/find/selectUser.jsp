<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>selectUser</title>
		
		<meta charset="EUC-KR">
	
		<!-- 참조 : http://getbootstrap.com/css/   -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		
		<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
		
		
		<script type="text/javascript">
		
		$(function() {
			$( "#city" ).on("change" , function() {
				var idx = $("#city").index(this);
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
								for(i in JSONData.list){
									var town = JSONData.list[i].townName;
									list+="<option value='"+town+"'>"+town+"</option>";
							}
								$( "#town:eq("+idx+")" ).empty().append(list);
							},
							error : function(what){
								alert("town ERROR" + what);
							}
						});
				});
			
			});
		
		$(function() {
			
			$("button:contains('찾기')").on("click", function() {
				if( $('.selectGender:checked').length != 1 ){
					alert('성별 체크');
				} else if( $('select[name="selectAge"]').val() == 0 ) {
					alert('나이 선택');
				} else if($('select[name="city"]').val() == 0 || $('select[name="town"]').val() == 0){
					alert('지역 선택');
				} else if( $('.inter-chk:checked').length != 3 ) {
					alert('체크박스 클릭');
				} else {
					$("form").attr("method", "POST").attr("action", "/find/getUserResult").submit();	
				}
			});		
			
			$( "button:contains('이전')" ).on("click" , function() {
				 history.go(-1);
			});
			
			// checkbox controll
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
		
		<style>
	       body > div.container{
	        	border: 3px solid #D6CDB7;
	            margin-top: 10px;
	        }
	    </style>
	</head>
<body>
	<!-- ToolBar Start /////////////////////////////////////-->
	  <jsp:include page="/layout/toolBar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
	  	
	<h1>selectUser.jsp</h1>

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container" >
	
		<div class="page-header">
	       <h3 class=" text-info">이상형 검색</h3>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
			
			<!--  ////성별 선택///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>성별</strong></div>
				<div class="col-xs-8 col-md-4">
					<input type="radio" class="selectGender" name="selectGender" value='M'>남자</input>
					<input type="radio" class="selectGender" name="selectGender" value='W'>여자</input>
				</div>
			</div>
			<!--  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
			
			<hr/>
			
			<!--  //////////////////////////////////////////////////연령 선택 /////////////////////////////////////////////////////////////////////////////-->
			 <div class="row">
		  		<div class="col-xs-4 col-md-2 "><strong>연령</strong></div>
				<div class="col-xs-8 col-md-4">
					<select class="form-control" name="selectAge">
						<option value="">원하는 연령을 선택해 주세요.</option>
						<option value="1">20세 ~ 24세</option>
						<option value="2">24세 ~ 29세</option>
						<option value="3">30세 ~ 34세</option>
						<option value="4">34세 ~ 49세</option>
						<option value="5">40세 ~ 44세</option>
						<option value="6">44세 ~ 59세</option>
						<option value="7">50세 ~ </option>
					</select>
				</div>
			</div>
			<!--  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
			
			<hr/>
			
			<!--  //////////////////////////////////////////////////지역 선택 /////////////////////////////////////////////////////////////////////////////-->
			<div class="row">
		  		<div class="col-xs-4 col-md-2 "><strong>지역</strong></div>
				<div class="col-xs-8 col-md-4">
					<select class="form-control" id="city" name="city">
						<option value="">도/시를 선택해 주세요</option>
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
				      
				      <br/>
				      
					<select class="form-control" id="town" name="town">
		      	<c:forEach var="location" items="${list}">
					<option value="${location.townName}">${location.townName}</option>
				</c:forEach>
		      </select>
				</div>
			</div>
			<!--  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
			
			<hr/>
			
			<!--  //////////////////////////////////////////////////관심사 선택 /////////////////////////////////////////////////////////////////////////////-->
			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>관심사</strong></div>
				<div class="col-xs-8 col-md-4">
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
			</div>
			<!--  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
			
			<hr/>
			
			<div class="row">
				<div class="col-md-12 text-center ">
					<button type="button" class="btn btn-primary">이전</button>
					<button type="button" class="btn btn-primary">찾기</button>
			  	</div>
			</div>
	
			<br/>
		</form>
	 </div>
	 
 	
</body>
</html>