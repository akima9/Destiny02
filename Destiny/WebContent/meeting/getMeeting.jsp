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
		
		#my-dialog {
		    display: none;
		    position: fixed;
		    left: calc( 50% - 160px ); top: calc( 50% - 70px );
		    width: 320px; height: 250px; 
		    background: #fff;
		    z-index: 11;
		    padding: 10px;
		}
     </style>
     
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= 회원정보수정 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button:contains('확인')" ).on("click" , function() {
				 self.location = "/product/listProduct?menu=${param.menu}"
				});
			/*  $( "button:contains('수정')" ).on("click" , function() {
				 self.location = "/purchase/addPurchaseView?prodNo=${product.prodNo}"
				}); */
			/*  $( "button:contains('삭제')" ).on("click" , function() {
				 //history.go(-1);
				 self.location = "/product/listProduct02?menu=${param.menu}"
				}); */
		});
		
		 $( function() {
				$("#btn-update-dialog,#dialog-background,#btn-close-dialog").click(function () {
					$("#my-dialog,#dialog-background").toggle();
				});
			});
		 $( function() {
				$("#btn-delete-dialog").click(function () {
					$("#detailForm").attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/meeting/updateMeeting").submit();
					//document.detailForm.submit();
				});
			});
		
	</script>
	
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
	       <button type="button" id="btn-update-dialog" class="btn btn-primary">수정하기</button>
	       <button type="button" id="btn-delete-dialog" class="btn btn-primary">삭제</button>
	    </div>
	    <!-- 모달창 디자인 부분 -->
        <div id="my-dialog">
        	<form class="form-horizontal">
        		ㅇㅇㅇㅇㅇ
			</form>
			<button id="btn-close-dialog">창 닫기</button>
		</div>
	</div>
	
	<div class="container"> <!-- 가장큰 틀 -->
		<div class="row">
		
		  <div class="col-md-12">
		  	<img src="/resources/images/meeting/${meeting.titleImg}" width="600px" height="500px"/>
		  </div>
		  
		  <div class="col-md-5">
		  
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
			
			<div class="row">
		  		<div class="col-xs-5 col-md-3 "><strong>주소</strong></div>
				<div class="col-xs-7 col-md-9">${product.prodAddress}</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-5 col-md-3 "><strong>상품상세정보</strong></div>
				<div class="col-xs-7 col-md-9">${product.prodDetail}</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-5 col-md-3"><strong>유효기간</strong></div>
				<div class="col-xs-7 col-md-3">${product.manuDate}</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-5 col-md-3 "><strong>가격</strong></div>
				<div class="col-xs-7 col-md-3">${product.price}</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-5 col-md-3 "><strong>등록일자</strong></div>
				<div class="col-xs-7 col-md-3">${product.regDate}</div>
			</div>
			
			<br/>
			
			
			<div class="row">
				<div class="col-md-12 text-center ">
				<c:if test="${param.menu=='ok'}">
			  		<button type="button" class="btn btn-primary">확인</button>
			  	</c:if>
			  	<c:if test='${param.menu=="search"}'>
			  		<c:if test="${user.role=='user'}">
			  		<%-- <c:if test=" ${user != null && user.role=='admin'} || prodTranCode==''  "> --%>
			  			<c:if test="${product.proTranCode==null}">
			  				<button type="button" class="btn btn-primary">구매</button>
			  			</c:if>
			  		</c:if>
			  		<button type="button" class="btn btn-primary">이전</button>
			  	</c:if>
			  	</div>
			</div>
		  </div>
		</div>
		
		<hr/><hr/><hr/>
		
		<div id="map" style="width:800px;height:400px;"></div>
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
	
	<!-- <div id="map" style="width:100%;height:350px;"></div>
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