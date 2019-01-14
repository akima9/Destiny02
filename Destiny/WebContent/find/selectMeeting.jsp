<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>selectMeeting</title>
		
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
				var town = $(this).val();
				console.log(town);
				$( "button:contains('찾기')" ).on("click" , function() {
					$("form").attr("method", "POST").attr("action", "/find/getMeetingResult/town?="+town).submit();
					//$("form").attr("method", "POST").attr("action", "/find/getMeetingResult").submit();
				});
				
				$( "button:contains('이전')" ).on("click" , function() {
					 history.go(-1);
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
	<h1>selectMeeting.jsp</h1>

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container" >
	
		<div class="page-header">
	       <h3 class=" text-info">모임 검색</h3>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2 "><strong>지역</strong></div>
				<div class="col-xs-8 col-md-4">
					<select class="form-control" id="city">
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