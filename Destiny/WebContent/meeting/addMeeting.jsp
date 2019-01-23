<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!--  ///////////////////////// 데이트픽커 시작////////////////////////// -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript" src="../javascript/calendar.js"></script>
    <!--  ///////////////////////// 데이트픽커 엔드 ////////////////////////// -->
    
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>

     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	////////////////* 데이트픽커 데이터 포맷 */////////
	$( function() {

	    $( "#datepicker" ).datepicker({
	    	dateFormat:"yy-mm-dd"
	    });
    		
	} );
	
	
	
	function fncAddProduct(){
		//Form 유효성 검증

		 
		var interestName=$("input[name='interestName']").val();
		var meetingCenter=$("#meetingCenter").val();
		var titleImg=$("input[name='titleImg']").val();
		var meetingName=$("input[name='meetingName']").val();
		var meetingDetail=$("textarea[name='meetingDetail']").val();
		var meetingCrewLimit=$("select[name='meetingCrewLimit']").val();
		var snooze=$("select[name='snooze']").val();
		var meetingDate=$("input[name='meetingDate']").val();
		var meetingDay=$("#weekday").val();
		var meetingTime=$("select[name='meetingTime']").val();
		var meetingLocation=$("input[name='meetingLocation']").val();
		
		console.log("관심사"+interestName);
		console.log("미팅센터"+meetingCenter);
		console.log("타이틀이미지"+titleImg);
		console.log("제목"+meetingName);
		console.log("내용"+meetingDetail);
		console.log("인원"+meetingCrewLimit);
		console.log("스누즈"+snooze);
		console.log("날짜"+meetingDate);
		console.log("요일"+meetingDay);
		console.log("시간"+meetingTime);
		console.log("장소"+meetingLocation);
		
		
		if(interestName == null || interestName.length<1){
			alert("관심사를 선택해 주세요.");
			return;
		}
		
		if(meetingCenter == null|| meetingCenter.length<1){
			alert("중심지역을 선택해 주세요.");
			return;
		}
		/*
		if(titleImg == null || titleImg.length<1){
			alert("대표이미지를 설정하여 주세요.");
			return;
		}
		*/
		if(meetingName == null || meetingName.length<1){
			alert("모임이름을 작성하여 주세요.");
			return;
		}
		
		if(meetingDetail == null || meetingDetail.length<1){
			alert("모임설명을 작성하여 주세요.");
			return;
		}
		
		if(meetingCrewLimit == null || meetingCrewLimit.length<1){
			alert("모임인원을 설정하여 주세요.");
			return;
		}
		
		if(snooze!='Y' && snooze!='N'){
			alert("반복여부를 설정하여 주세요.");
			return;
		}
		
		if(meetingDate == null && meetingDay == null){
			alert("날짜or요일을 설정하요 주세요.");
			return;
		}
		
		if(meetingTime == null || meetingTime=='모임시간'){
			alert("모임시간을 입력하여 주세요.");
			return;
		}
		
		if(meetingLocation == null || meetingLocation.length<1){
			alert("모임장소를 입력하여 주세요.");
			return;
		}
		
		if (confirm("모임을 등록하시겠습니까?") == true){    //확인
			 
			$("form").attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/meeting/addMeeting").submit();

		     //document.removefrm.submit();

		 }else{   //취소

		     return;

		 }
		//alert("모임이 등록되었습니다.");
	}
	
	$(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
		 $( "button.btn.btn-primary" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('등록')" ).html() );
			fncAddProduct();
		});
	});
	
	 $( function() {
		    $( "#manuDate" ).datepicker();
	});
	 
	////* 관심사가 선택되면  *////
	 $(function(){
			$( "#interest" ).on("change" , function() {
				//var idx = $(".brand_ids").index(this);
				var interestNo=$(this).val();
				console.log(interestNo);
				
				$( "#selectedInterest" ).val(interestNo);
					
			});
		});
	////* 관심사 끝  *////
	
	////* 지역구 선택부  *////
	 $(function(){
			$( "#centerLocation" ).on("change" , function() {
				//var idx = $(".brand_ids").index(this);
				var city=$(this).val();
				console.log(city);
				
				$.ajax( 
						{
							url : "/user/json/getLocationList/"+city,
							method : "GET" ,
							dataType : "json" ,
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData , status) {
								
								var list="";
								list+="<select id='meetingCenter' name='meetingCenter' class='form-control'>";
								list+="<option>시/군/구 선택</option>";
								for(i in JSONData.list){
									var town = JSONData.list[i].townName;
									
									list+="<option name='meetingCenter' value='"+town+"'>"+town+"</option>";
							}
								$( "#location" ).empty().append(list);
							}
					});
			});
		});
	////* 지역구 선택부 끝!!!!!  *////
	
	////* 모임원 선택부  *////

	
	////* 모임원 선택부  끝!!!!!!!!!!*////
	 
	////* 반복여부가 선택되면  *////
	 $(function(){
			$( "#snooze" ).on("change" , function() {
				//var idx = $(".brand_ids").index(this);
				var snooze=$(this).val();
				console.log(snooze);
				
				if(snooze=='Y'){
					console.log("반복선택됨")
					var list = "";
					list+="<select id='weekday' class='form-control'>";
					list+="<option value='월요일'>월요일</option>";
					list+="<option value='화요일'>화요일</option>";
					list+="<option value='수요일'>수요일</option>";
					list+="<option value='목요일'>목요일</option>";
					list+="<option value='금요일'>금요일</option>";
					list+="<option value='토요일'>토요일</option>";
					list+="<option value='일요일'>일요일</option>";
					list+="</select>";
					$( "#dateOrDay" ).empty().append(list);
				}
			});
		});
	
	
	</script>
	
	
	<!-- 다음 우편 -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=54cfa5aea3e5609fcbb420ef8cd6ed4c"></script>
	<script>
	    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	        mapOption = {
	            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
	            level: 5 // 지도의 확대 레벨
	        };
	
	    //지도를 미리 생성
	    var map = new daum.maps.Map(mapContainer, mapOption);
	    //주소-좌표 변환 객체를 생성
	    var geocoder = new daum.maps.services.Geocoder();
	    //마커를 미리 생성
	    var marker = new daum.maps.Marker({
	        position: new daum.maps.LatLng(37.537187, 127.005476),
	        map: map
	    });
	
	
	    function sample5_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                var addr = data.address; // 최종 주소 변수
	
	                // 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("sample5_address").value = addr;
	                // 주소로 상세 정보를 검색
	                geocoder.addressSearch(data.address, function(results, status) {
	                    // 정상적으로 검색이 완료됐으면
	                    if (status === daum.maps.services.Status.OK) {
	
	                        var result = results[0]; //첫번째 결과의 값을 활용
	
	                        // 해당 주소에 대한 좌표를 받아서
	                        var coords = new daum.maps.LatLng(result.y, result.x);
	                        // 지도를 보여준다.
	                        mapContainer.style.display = "block";
	                        map.relayout();
	                        // 지도 중심을 변경한다.
	                        map.setCenter(coords);
	                        // 마커를 결과값으로 받은 위치로 옮긴다.
	                        marker.setPosition(coords)
	                    }
	                });
	            }
	        }).open();
	    }
	</script>
	<!-- 다음우편 끝 -->
	
	</head>
	
	<body>
	<!-- ToolBar Start /////////////////////////////////////-->
    <jsp:include page="/layout/toolBar.jsp" />
    <!-- ToolBar End /////////////////////////////////////-->
   	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
   		<h1 class="bg-primary text-center">개설하기</h1>
   	
   		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">
		<input type="hidden" name="meetingMasterId" value="${sessionScope.me.userId}">
		<input type="hidden" name="masterProfileImg" value="${sessionScope.me.profile}">
		<input type="hidden" name="crewNickName" value="${sessionScope.me.nickName}">
		 <div  class="form-group col-sm-4 col-md-4">
		 	<select id="interest" class="form-control">
		 		<option >관심사</option>
		 		<c:forEach var="Meeting" items="${list}">
		 		
		 			<option value="${Meeting.interestName}">${Meeting.interestName }</option>
		 		
		 		</c:forEach>
		 	</select>
		 </div>
		
		 <div class="form-group col-sm-8 col-md-8">
		 	<input  name="interestName" id="selectedInterest" type="text" class="form-control" placeholder="관심사를 선택해 주세요">
		 </div>
		 
		 <div class="form-group col-sm-6 col-md-6">
		 	<select id="centerLocation" class="form-control">
		 		<option>중심지역-지역</option>
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
		 
		 <div id="location" class="form-group col-sm-6 col-md-6">
		 	<input type="text" class="form-control" placeholder="시/군/구를 설정해주세요">
		 </div>
		 	
		 
		<!--
		 <div class="form-group col-sm-8 col-md-8">
		 	<input type="text" class="form-control" placeholder="모임지역을 입력해주세요">
		 </div>
		 -->
		 <div class="form-group col-sm-10 col-md-10">
		 	<input type="file" class="form-control" name="imgFile" placeholder="대표이미지를 설정하여 주세요">
		 </div>
		 
		 <div class="form-group col-sm-2 col-md-2">
		 	<button type="button" class="btn btn-warning" >첨부파일</button>
		 </div>
		 
		 <div class="form-group col-sm-12 col-md-12">
		 	<input type="text" class="form-control" name="meetingName" placeholder="모임이름을 적어주세요">
		 </div>
		 
		 <div class="form-group col-sm-12 col-md-12">
		 	<textarea class="form-control" cols="100" rows="3" 
		 	name="meetingDetail" placeholder="어떤 모임인지 설명해주세요" ></textarea>
		 </div>
		 
		 <div class="form-group col-sm-12 col-md-12">
		 	<textarea class="form-control" cols="100" rows="3" 
		 	name="meetingRule" placeholder="모임에 규칙이 있나요? 있다면 간략히 적어주세요"></textarea>
		 </div>
		 
		 <div class="form-group col-sm-10 col-md-10">
		 	모임인원을 입력하여 주세요
		 </div>
		
		 <div id="crewNo" class="form-group col-sm-2 col-md-2">
		 	<select name="meetingCrewLimit" class="form-control">
		 		<option value="1">1</option>
		 		<option value="2">2</option>
		 		<option value="3">3</option>
		 		<option value="4">4</option>
		 		<option value="5">5</option>
		 		<option value="6">6</option>
		 		<option value="7">7</option>
		 		<option value="8">8</option>
		 		<option value="9">9</option>
		 		<option value="10">10</option>
		 		<option value="11">11</option>
		 		<option value="12">12</option>
		 		<option value="13">13</option>
		 		<option value="14">14</option>
		 		<option value="15">15</option>
		 		<option value="16">16</option>
		 		<option value="17">17</option>
		 		<option value="18">18</option>
		 		<option value="19">19</option>
		 		<option value="20">20</option>
		 	</select>
		 </div>
		 
		 <div class="form-group col-sm-4 col-md-4">
		 	<select name="snooze" id="snooze" class="form-control">
		 		<option>반복여부</option>
		 		<option value="Y">반복</option>
		 		<option value="N">한번</option>
		 	</select>
		 </div>
		 
		 <div  id="dateOrDay" class="form-group col-sm-4 col-md-4">
		 	<input 	type="text" id="datepicker" readonly="readonly" class="form-control" placeholder="모임날짜or요일" name="meetingDate"/>
		 	
		 	<!--  
		 	<select class="form-control">
		 		<option value="">모임날짜or요일</option>
		 	</select>
		 	-->
		 </div>
		 
		 <div class="form-group col-sm-4 col-md-4">
		 	<select name="meetingTime" class="form-control">
		 		<option>모임시간</option>
		 		<option value="13:00">13:00</option>
		 		<option value="14:00">14:00</option>
		 	</select>
		 </div>
		 
		 <div class="form-group col-sm-10 col-md-10">
		 	회비가 있다면 입력해주세요
		 </div>
		 
		 <div class="form-group col-sm-2 col-md-2">
		 	<input name="meetingDues" type="text" class="form-control" placeholder="$">
		 </div>
		 
		 <div class="form-group col-sm-10 col-md-10">
		 <input name="meetingLocation" type="text" class="form-control" id="sample5_address" placeholder="주소">
		 	<!-- <input type="text" class="form-control" placeholder="모임장소를 입력하여주세요."> -->
		 </div>
		 
		 <div class="form-group col-sm-2 col-md-2">
			<input type="button" class="btn btn-warning" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
			<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
		 	<!-- <button type="button" class="btn btn-warning">우편검색</button> -->
		 </div>
		  
		 <div class="form-group">
		   <div class="col-sm-offset-4  col-sm-4 text-center">
		     <button type="button" class="btn btn-primary"  >등 &nbsp;록</button>
			 <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		   </div>
		 </div>
	</form>
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>	
	