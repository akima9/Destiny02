<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
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
   <!--  ///////////////////////// 데이트픽커 시작////////////////////////// -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript" src="../javascript/calendar.js"></script>
    <!--  ///////////////////////// 데이트픽커 엔드 ////////////////////////// -->
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=238c3f6eaacc311151fd24574cf5b8e9&libraries=services"></script>
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=238c3f6eaacc311151fd24574cf5b8e9"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
        #dialog-background {
		    display: none;
		    position: fixed;
		    top: 0; left: 0;
		    width: 100%; height: 100%;
		    background: rgba(0,0,0,.3);
		    z-index: 10;
		}
		
		#dialog {
		    display: none;
		    position: fixed;
		    left: calc( 50% - 160px ); top: calc( 20% - 80px );
		    width: 500px; height: 650px; 
		    background: gainsboro;
		    z-index: 11;
		    padding: 10px;
		}
		
		#dialog2 {
		    display: none;
		    position: fixed;
		    left: calc( 50% - 160px ); top: calc( 30% - 70px );
		    width: 350px; height: 350px; 
		    background: gainsboro;
		    z-index: 11;
		    padding: 10px;
		}
		
		#dialog3 {
		    display: none;
		    position: fixed;
		    left: calc( 50% - 160px ); top: calc( 30% - 70px );
		    width: 350px; height: 350px; 
		    background: gainsboro;
		    z-index: 11;
		    padding: 10px;
		}
     </style>
     
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
			var centerMeeting=$("#centerMeeting").data("param");
			var meetingCenter=$("select[name='meetingCenter']").val();
			var titleImg=$("input[name='imgFile']").val();
			var meetingName=$("input[name='meetingName']").val();
			var meetingDetail=$("textarea[name='meetingDetail']").val();
			var meetingCrewLimit=$("select[name='meetingCrewLimit']").val();
			var snooze=$("select[name='snooze']").val();
			var meetingDate=$("input[name='meetingDate']").val();
			var meetingDay=$("#weekday").val();
			var meetingTime=$("select[name='meetingTime']").val();
			var meetingLocation=$("input[name='meetingLocation']").val();
			
			console.log("관심사"+interestName);
			console.log("센터미팅"+centerMeeting);
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
			
			if(meetingCenter == null && centerMeeting == null){
				alert("중심지역을 선택해 주세요.");
				return;
			}
			
			if(titleImg == null || titleImg.length<1){
				alert("대표이미지를 설정하여 주세요.");
				return;
			}
			
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
			
			if (confirm("내용을 수정하시겠습니까?") == true){    //확인
				
				$("#contentsForm").attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/meeting/updateMeeting").submit();

			     //document.removefrm.submit();

			 }else{   //취소

			     return;

			 }
			//alert("모임이 등록되었습니다.");
		}
		///////////* 수정하기에서 확인누르면 이벤트 처리 *//////////////
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
			 $( "button.btn.btn-primary:contains('등 &nbsp;록')" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('등록')" ).html() );
				fncAddProduct();
			});
		});
		
		///////////* 가입하기에서 확인누르면 이벤트 처리 *//////////////
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
			 $( "button.btn.btn-success" ).on("click" , function() {
				 //var meetingNo = ${meeting.meetingNo};
				// var meetingMasterId= ${sessionScope.me.userId};
				//alert("호잇!");
				  $.ajax( 
							{
								url : "/meetingRest/addCrewM",
								method : "post" ,
								dataType : "json" ,
								data : JSON.stringify({
									meetingNo : "${meeting.meetingNo}" ,
									meetingMasterId : "${sessionScope.me.userId}", 
									interviewTitle : $("#interviewTitle").val(),
									interview : $("#interview").val()
									
								}),
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData , status) {
									if(JSONData==5018){
										alert("이미 가입하셨습니다.");
										$("#dialog2form")[0].reset();
										$("#dialog2").toggle();
									}else{
										alert("가입 신청이 완료되었습니다.");
										//window.opener.location.reload(false);
										$("#dialog2form")[0].reset();
										$("#dialog2").toggle();
									}
								}
				});
				 
			});
		});
		
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
									list+="<select name='meetingCenter' class='form-control'>";
									list+="<option>시/군/구 선택</option>";
									for(i in JSONData.list){
										var town = JSONData.list[i].townName;
										
										list+="<option value='"+town+"'>"+town+"</option>";
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
		/*  $(function(){
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
			}); */
		
		
		
		
		//============= 회원정보수정 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			/*  $( "button:contains('확인')" ).on("click" , function() {
				 self.location = "/product/listProduct?menu=${param.menu}"
				}); */
			  	$( "button:contains('신고')" ).on("click" , function() {
			  		if(${empty sessionScope.me}){
						if (confirm("로그인후이용가능합니다.\n로그인하시겠습니까?") == true){    //확인
							$("#my-dialog,#dialog-background").toggle();
							//self.location="/user/login";
						 }else{   //취소

						     return;

						 }
					}else{
						self.location = "/complain/addComplain?meetingNo=${meeting.meetingNo}"
					}
				 
				}); 
			/*  $( "button:contains('삭제')" ).on("click" , function() {
				 //history.go(-1);
				 self.location = "/product/listProduct02?menu=${param.menu}"
				}); */
		});
		
		 $( function() {
				$("#update-dialog").click(function () {
					$("#dialog").toggle();
				});
			});
		 
		 $( function() {
				$("#btn-delete-dialog").click(function () {
					if (confirm("삭제하시겠습니까?") == true){    //확인
						$("#detailForm").attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/meeting/updateMeeting").submit();
						//self.location="/user/login";
					 }else{   //취소

					     return;

					 }
					//$("#detailForm").attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/meeting/updateMeeting").submit();
					//document.detailForm.submit();
				});
			});
		 $( function() {
				$("#pushCancle").click(function () {
					$("#dialog").toggle();
				});
			});
		 //////////////////* 가입하기 눌렀을때 로그인 확인 이벤트 처리  *////////////////
		 $( function() {
				$("button:contains('가입하기')").click(function () {
					if(${empty sessionScope.me}){
						if (confirm("로그인후이용가능합니다.\n로그인하시겠습니까?") == true){    //확인
							$("#my-dialog,#dialog-background").toggle();
							//self.location="/user/login";
						 }else{   //취소

						     return;

						 }
					}else{
						$("#dialog2").toggle();
					}
				});
			});
		 /* 참여하기 눌렀을때 이벤트 처리부분 */
		 $( function() {
				$("button:contains('참여하기')").click(function () {
					if(${empty sessionScope.me}){
						if (confirm("로그인후이용가능합니다.\n로그인하시겠습니까?") == true){    //확인
							$("#my-dialog,#dialog-background").toggle();
							//self.location="/user/login";
						 }else{   //취소

						     return;

						 }
					}else{
						
						$.ajax( 
						 {
								url : "/meetingRest/addActList",
								method : "post" ,
								dataType : "json" ,
								data : JSON.stringify({
									meetingNo : "${meeting.meetingNo}" ,
									meetingMasterId : "${sessionScope.me.userId}",
									meetingActCount : "${meetingAct.meetingActCount}",
									
								}),
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData , status) {
									if(JSONData==5018){
										if (confirm("모임원만 참여가능합니다.\n가입하시겠습니까?") == true){    //확인
											$("#dialog2").toggle();
										 }else{   //취소
										     return;
										 }
									}else if(JSONData==486){
										alert("이미 참여하셨습니다.");
									}
									else{
										alert("${meeting.meetingName} ${meetingAct.meetingActCount} 회\n모임에 참여되었습니다.");
										
									}
								}
						}); 
						
					}
					
				});
			});
		 
		 /* 참여자목록 눌렀을때 이벤트 처리부분 */
		 $( function() {
				$("button:contains('참여자목록')").click(function () {
					if(${empty sessionScope.me}){
						if (confirm("로그인후이용가능합니다.\n로그인하시겠습니까?") == true){    //확인
							$("#my-dialog,#dialog-background").toggle();
							//self.location="/user/login";
						 }else{   //취소

						     return;

						 }
					}else{
						
						$.ajax( 
						 {
								url : "/meetingRest/getActCrew",
								method : "post" ,
								dataType : "json" ,
								data : JSON.stringify({
									meetingNo : "${meeting.meetingNo}" ,
									meetingMasterId : "${sessionScope.me.userId}", 
									
								}),
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData , status) {
									if(JSONData.result==0){
										if (confirm("모임원만 열람가능합니다.\n가입하시겠습니까?") == true){    //확인
											$("#dialog2").toggle();
										 }else{   //취소
										     return;
										 }
									}else {
										//alert(JSONData.actCrewList[0].masterProfileImg);
										 var crewArray = new Array();
										var displayValue = JSONData.actCrewList;
										for(i=0; i+1<=displayValue.length; i++){
											crewArray[i] = displayValue[i].masterProfileImg;
										}
										//console.log(crewArray);
										//console.log("<img src='/resources/images/userprofile/"+crewArray[0]+"'width='100px' height='100px'>")
										
											var display = "<h6>"
											for(i=0; i+1<=displayValue.length; i++){
												display+="<img src='/resources/images/userprofile/"+displayValue[i].masterProfileImg+"' width='100px' height='100px'> <br/>";
												display+=displayValue[i].crewNickName+"<br/>";
											}
												display+="<a class='btn btn-primary btn' id='pushCancle3' role='button'>확&nbsp;인</a>"
												display+="</h6>";
												
										console.log(display);	
										$( ".actCrewList" ).html(display);
										$("#dialog3").toggle();
										
									}
								}
						}); 
						
					}	 
				});
			});
		/*  //가입하기에서 취소 눌렀을때 이벤트 처리 //*/
		 $( function() {
				$("#pushCancle2").click(function () {
					$("#dialog2").toggle();
				});
			});
		/*///////참여자목록에서 확인 눌렀을때 //////////////*/
		 $( function() {
				$("button.btn.btn-primary:contains('확&nbsp;인')").click(function () {
					alert("dd");
					$("#dialog3").toggle();
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
	<form id="detailForm">
	<input type="hidden" name="meetingNo" value="${meeting.meetingNo}">
	<input type="hidden" name="meetingCondition" value="DEL">
	</form>
	<div class="container" >
	
		<div class="page-header">
	       <h3 class=" text-info">getMeeting.jsp</h3>
	       <a id="update-dialog">수정하기</a>
	       <button type="button" id="btn-delete-dialog">삭제</button>
	       <button type="button" id="complain">신고</button>
	    </div>
	    <!-- 모달창 디자인 부분 -->
        <div id="dialog">
        <!-- //////////////////////////모달창  내용부/////////////////////////////////////////////////// -->
        	<form id="contentsForm" class="form-horizontal">
        	<input type="hidden" name="meetingNo" value="${meeting.meetingNo}">
				 <div  class="form-group col-sm-4 col-md-4">
				 	<select id="interest" class="form-control">
				 		<option >관심사</option>
				 		<c:forEach var="Meeting" items="${list}">
				 		
				 			<option value="${Meeting.interestName}">${Meeting.interestName }</option>
				 		
				 		</c:forEach>
				 	</select>
				 </div>
				
				 <div class="form-group col-sm-8 col-md-8">
				 	<input  name="interestName" id="selectedInterest" type="text" class="form-control" value="${meeting.interestName}">
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
				 	<input type="text" class="form-control" id="centerMeeting" name="meetingCenter" data-param="${meeting.meetingCenter}" value="${meeting.meetingCenter}">
				 	
				 </div>
				 
				 <div class="form-group col-sm-10 col-md-10">
				 	<input type="file" class="form-control" name="imgFile" id="imgFile" value="${meeting.titleImg}">
				 </div>
				 
				 <div class="form-group col-sm-2 col-md-2">
				 	<button type="button" class="btn btn-warning" >첨부파일</button>
				 </div>
				 
				 <div class="form-group col-sm-12 col-md-12">
				 	<input type="text" class="form-control" name="meetingName" value="${meeting.meetingName}">
				 </div>
				 
				 <div class="form-group col-sm-12 col-md-12">
				 	<textarea class="form-control" cols="100" rows="3" 
				 	name="meetingDetail" placeholder="어떤 모임인지 설명해주세요" >${meeting.meetingDetail}</textarea>
				 </div>
				 
				 <div class="form-group col-sm-12 col-md-12">
				 	<textarea class="form-control" cols="100" rows="3" 
				 	name="meetingRule" placeholder="모임에 규칙이 있나요? 있다면 간략히 적어주세요">${meeting.meetingRule}</textarea>
				 </div>
				 
				 <div class="form-group col-sm-8 col-md-8">
				 	모임인원을 입력하여 주세요
				 </div>
				
				 <div id="crewNo" class="form-group col-sm-4 col-md-4">
				 	<select name="meetingCrewLimit" class="form-control">
				 		<option value="1"  ${ ! empty meeting.meetingCrewLimit && meeting.meetingCrewLimit==1 ? "selected" : "" }>1</option>
				 		<option value="2" ${ ! empty meeting.meetingCrewLimit && meeting.meetingCrewLimit==2 ? "selected" : "" }>2</option>
				 		<option value="3" ${ ! empty meeting.meetingCrewLimit && meeting.meetingCrewLimit==3 ? "selected" : "" }>3</option>
				 		<option value="4" ${ ! empty meeting.meetingCrewLimit && meeting.meetingCrewLimit==4 ? "selected" : "" }>4</option>
				 		<option value="5" ${ ! empty meeting.meetingCrewLimit && meeting.meetingCrewLimit==5 ? "selected" : "" }>5</option>
				 		<option value="6" ${ ! empty meeting.meetingCrewLimit && meeting.meetingCrewLimit==6 ? "selected" : "" }>6</option>
				 		<option value="7" ${ ! empty meeting.meetingCrewLimit && meeting.meetingCrewLimit==7 ? "selected" : "" }>7</option>
				 		<option value="8" ${ ! empty meeting.meetingCrewLimit && meeting.meetingCrewLimit==8 ? "selected" : "" }>8</option>
				 		<option value="9" ${ ! empty meeting.meetingCrewLimit && meeting.meetingCrewLimit==9 ? "selected" : "" }>9</option>
				 		<option value="10" ${ ! empty meeting.meetingCrewLimit && meeting.meetingCrewLimit==10 ? "selected" : "" }>10</option>
				 		<option value="11" ${ ! empty meeting.meetingCrewLimit && meeting.meetingCrewLimit==11 ? "selected" : "" }>11</option>
				 		<option value="12" ${ ! empty meeting.meetingCrewLimit && meeting.meetingCrewLimit==12 ? "selected" : "" }>12</option>
				 		<option value="13" ${ ! empty meeting.meetingCrewLimit && meeting.meetingCrewLimit==13 ? "selected" : "" }>13</option>
				 		<option value="14" ${ ! empty meeting.meetingCrewLimit && meeting.meetingCrewLimit==14 ? "selected" : "" }>14</option>
				 		<option value="15" ${ ! empty meeting.meetingCrewLimit && meeting.meetingCrewLimit==15 ? "selected" : "" }>15</option>
				 		<option value="16" ${ ! empty meeting.meetingCrewLimit && meeting.meetingCrewLimit==16 ? "selected" : "" }>16</option>
				 		<option value="17" ${ ! empty meeting.meetingCrewLimit && meeting.meetingCrewLimit==17 ? "selected" : "" }>17</option>
				 		<option value="18" ${ ! empty meeting.meetingCrewLimit && meeting.meetingCrewLimit==18 ? "selected" : "" }>18</option>
				 		<option value="19" ${ ! empty meeting.meetingCrewLimit && meeting.meetingCrewLimit==19 ? "selected" : "" }>19</option>
				 		<option value="20" ${ ! empty meeting.meetingCrewLimit && meeting.meetingCrewLimit==20 ? "selected" : "" }>20</option>
				 	</select>
				 </div>
				 
				 <div class="form-group col-sm-4 col-md-4">
				 	<select name="snooze" id="snooze" class="form-control">
				 		<option>반복여부</option>
				 		<option value="Y" ${ ! empty meeting.snooze && meeting.snooze=='Y' ? "selected" : "" }>반복</option>
				 		<option value="N" ${ ! empty meeting.snooze && meeting.snooze=='N' ? "selected" : "" }>한번</option>
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
				 		<option value="12:00" ${ ! empty meeting.meetingTime && meeting.meetingTime=='12:00' ? "selected" : "" }>12:00</option>
				 		<option value="13:00" ${ ! empty meeting.meetingTime && meeting.meetingTime=='13:00' ? "selected" : "" }>13:00</option>
				 		<option value="14:00" ${ ! empty meeting.meetingTime && meeting.meetingTime=='14:00' ? "selected" : "" }>14:00</option>
				 	</select>
				 </div>
				 
				 <div class="form-group col-sm-8 col-md-8">
				 	회비가 있다면 입력해주세요
				 </div>
				 
				 <div class="form-group col-sm-4 col-md-4">
				 	<input name="meetingDues" type="text" class="form-control" value="${meeting.meetingDues}">
				 </div>
				 
				 <div class="form-group col-sm-10 col-md-10">
				 <input name="meetingLocation" type="text" class="form-control" id="sample5_address" value="${meeting.meetingLocation}">
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
					 <a class="btn btn-primary btn" id="pushCancle" role="button">취&nbsp;소</a>
				   </div>
				 </div>
		</form>
		<!-- //////////////////////////모달창  내용부 끝/////////////////////////////////////////////////// -->
		</div>
	</div>
	
	<div class="container"> <!-- 가장큰 틀 -->
		<div class="row">
		
		  <div class="col-md-12">
		  	<img src="/resources/images/meeting/${meeting.titleImg}" width="600px" height="500px"/>
		  </div>
		  
		  <div class="col-md-12">
		  
		  	<div class="row">
	  			<div class="col-xs-4 col-md-3"><strong>모임설명</strong></div><hr/>
				<div class="col-xs-8 col-md-3">${meeting.meetingDetail}</div>
			</div>
		
			<hr/>
		
			<div class="row">
		  		<div class="col-xs-5 col-md-3 "><strong>모임규칙</strong></div><hr/>
				<div class="col-xs-7 col-md-3">${meeting.meetingRule}</div>
			</div>
			
			<hr/>
		  </div>
		</div>
		
		<hr/>
		${meetingAct.meetingActCount}회차 모임 일정<br/>
		${meetingAct.meetingDate} ${meetingAct.meetingTime }<br/>
		${meetingAct.meetingLocation}<br/>
		${meetingAct.meetingDues}<br/>
		<button>참여하기</button>
		<button>참여자목록</button>
		<hr/>
		<button>가입하기</button>
		<!-- 모달창 디자인 부분 -->
        <div id="dialog2">
        <form id="dialog2form" class="form-horizontal">
        <div>
        	<div name="meetingMasterId" value="${sessionScope.me.userId}" class="form-group col-sm-12 col-md-12" align="center">
        		<img src="/resources/images/userprofile/${sessionScope.me.profile}" width="100px" height="100px">
        	</div>
        	
        	<div class="form-group col-sm-12 col-md-12" align="center">
        		${sessionScope.me.nickName}
        	</div>
        	
        	<div class="form-group col-sm-12 col-md-12" align="center">
        		<textarea id="interviewTitle" class="form-control" cols="100" rows="1" 
		 	 placeholder="제목을 입력해주세요" ></textarea>
        	</div>
        	
        	<div class="form-group col-sm-12 col-md-12" align="center">
		 	<textarea id="interview" class="form-control" cols="100" rows="3" 
		 	 placeholder="내용을 입력해주세요" ></textarea>
		 	</div>
	        <div class="form-group col-sm-12 col-md-12" align="center">
	         <button type="button" class="btn btn-success"  >확 &nbsp;인</button>
	         <a class="btn btn-primary btn" id="pushCancle2" role="button">취&nbsp;소</a>
	         </div>
	    </div>
        </form>
        <!-- 모달창 디자인 부분  끝-->
        </div>
		<hr/>
		<hr/>
		<div >
			모임멤버${crewCount}명
			<input type="checkbox">로그인된 멤버만 보기<br/>
			<ul>
			<c:forEach var="crew" items="${crewList}">
		 		<img class="first-slide" src="/resources/images/userprofile/${crew.masterProfileImg}" width="100px" height="100px"> ${crew.crewNickName}
		 		<c:if test="${crew.role=='MST' }">
					모임장
		 		</c:if>
		 		<br/>
			
			</c:forEach>
			
			</ul>
		</div>
		<div id="dialog3">
		<div class="actCrewList">
			<form id="dialog3From" class="form-horizontal">
			
			</form>
		</div>
		</div>
		<hr/>
		
		
		
		<!-- <div id="map" style="width:800px;height:400px;"></div>
		<script>
			var infowindow = new daum.maps.InfoWindow({zIndex:1});
		
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };  
		
			// 지도를 생성합니다    
			var map = new daum.maps.Map(mapContainer, mapOption); 
		
			// 장소 검색 객체를 생성합니다
			var ps = new daum.maps.services.Places();
			
			// 키워드로 장소를 검색합니다
			ps.keywordSearch('${meeting.meetingLocation} ', placesSearchCB); 
		
			// 키워드 검색 완료 시 호출되는 콜백함수 입니다
			function placesSearchCB (data, status, pagination) {
				console.log("data : " + data);
				console.log("pagination : " + pagination);
				console.log("prodName : " + '${product.prodName}');
				
			    if (status === daum.maps.services.Status.OK) {
		
			        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			        // LatLngBounds 객체에 좌표를 추가합니다
			        var bounds = new daum.maps.LatLngBounds();
		
			        for (var i=0; i<data.length; i++) {
			            displayMarker(data[i]); 
			            bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
			        }       
		
			        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			        map.setBounds(bounds);
			    } 
			}
		
			// 지도에 마커를 표시하는 함수입니다
			function displayMarker(place) {
			    
			    // 마커를 생성하고 지도에 표시합니다
			    var marker = new daum.maps.Marker({
			        map: map,
			        position: new daum.maps.LatLng(place.y, place.x) 
			    });
		
			    // 마커에 클릭이벤트를 등록합니다
			    daum.maps.event.addListener(marker, 'click', function() {
			        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
			        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
			        infowindow.open(map, marker);
			    });
			}

	</script>
	
	<hr/><hr/><hr/>
	
	<div id="map" style="width:100%;height:350px;"></div>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		    mapOption = { 
		        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		
		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		 
		// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
		var positions = [
			for(){
				content: '<div>${product.prodName}</div>',
		        latlng: new daum.maps.LatLng(33.451393, 126.570738)
			}
		    {
		        content: '<div>카카오</div>', 
		        latlng: new daum.maps.LatLng(33.450705, 126.570677)
		    },
		    {
		        content: '<div>생태연못</div>', 
		        latlng: new daum.maps.LatLng(33.450936, 126.569477)
		    },
		    {
		        content: '<div>텃밭</div>', 
		        latlng: new daum.maps.LatLng(33.450879, 126.569940)
		    },
		    {
		        content: '<div>${product.prodName}</div>',
		        latlng: new daum.maps.LatLng(33.451393, 126.570738)
		    }
		];
		
		for (var i = 0; i < positions.length; i ++) {
		    // 마커를 생성합니다
		    var marker = new daum.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng // 마커의 위치
		    });
		
		    // 마커에 표시할 인포윈도우를 생성합니다 
		    var infowindow = new daum.maps.InfoWindow({
		        content: positions[i].content // 인포윈도우에 표시할 내용
		    });
		
		    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
		    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		    daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		    daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		}
		
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}
		
		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}
	</script> -->

<hr/><hr/><hr/>
	
	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->

</body>

</html>