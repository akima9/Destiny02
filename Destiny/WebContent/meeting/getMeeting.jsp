<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
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
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=238c3f6eaacc311151fd24574cf5b8e9&libraries=services"></script>
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=238c3f6eaacc311151fd24574cf5b8e9"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
     </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= ȸ���������� Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "button:contains('Ȯ��')" ).on("click" , function() {
				 self.location = "/product/listProduct?menu=${param.menu}"
				});
			 $( "button:contains('����')" ).on("click" , function() {
				 self.location = "/purchase/addPurchaseView?prodNo=${product.prodNo}"
				});
			 $( "button:contains('����')" ).on("click" , function() {
				 //history.go(-1);
				 self.location = "/product/listProduct02?menu=${param.menu}"
				});
		});
		
	</script>
	
</head>

<body>
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container" >
	
		<div class="page-header">
	       <h3 class=" text-info">��ǰ����ȸ</h3>
	    </div>
	</div>
	
	<div class="container">
		<div class="row">
		
		  <div class="col-md-7">
		  	<img src="/images/uploadFiles/${product.fileName}" width="600px" height="500px"/>
		  </div>
		  
		  <div class="col-md-5">
		  
		  	<div class="row">
	  			<div class="col-xs-4 col-md-3"><strong>��ǰ��ȣ</strong></div>
				<div class="col-xs-8 col-md-3">${product.prodNo}</div>
			</div>
		
			<hr/>
		
			<div class="row">
		  		<div class="col-xs-5 col-md-3 "><strong>��ǰ��</strong></div>
				<div class="col-xs-7 col-md-3">${product.prodName}</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-5 col-md-3 "><strong>�ּ�</strong></div>
				<div class="col-xs-7 col-md-9">${product.prodAddress}</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-5 col-md-3 "><strong>��ǰ������</strong></div>
				<div class="col-xs-7 col-md-9">${product.prodDetail}</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-5 col-md-3"><strong>��ȿ�Ⱓ</strong></div>
				<div class="col-xs-7 col-md-3">${product.manuDate}</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-5 col-md-3 "><strong>����</strong></div>
				<div class="col-xs-7 col-md-3">${product.price}</div>
			</div>
			
			<hr/>
			
			<div class="row">
		  		<div class="col-xs-5 col-md-3 "><strong>�������</strong></div>
				<div class="col-xs-7 col-md-3">${product.regDate}</div>
			</div>
			
			<hr/>
			
			
			<div class="row">
				<div class="col-md-12 text-center ">
				<c:if test="${param.menu=='ok'}">
			  		<button type="button" class="btn btn-primary">Ȯ��</button>
			  	</c:if>
			  	<c:if test='${param.menu=="search"}'>
			  		<c:if test="${user.role=='user'}">
			  		<%-- <c:if test=" ${user != null && user.role=='admin'} || prodTranCode==''  "> --%>
			  			<c:if test="${product.proTranCode==null}">
			  				<button type="button" class="btn btn-primary">����</button>
			  			</c:if>
			  		</c:if>
			  		<button type="button" class="btn btn-primary">����</button>
			  	</c:if>
			  	</div>
			</div>
		  </div>
		</div>
		
		<hr/><hr/><hr/>
		
		<div id="map" style="width:800px;height:400px;"></div>
		<script>
			var infowindow = new daum.maps.InfoWindow({zIndex:1});
		
			var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
			    mapOption = {
			        center: new daum.maps.LatLng(37.566826, 126.9786567), // ������ �߽���ǥ
			        level: 3 // ������ Ȯ�� ����
			    };  
		
			// ������ �����մϴ�    
			var map = new daum.maps.Map(mapContainer, mapOption); 
		
			// ��� �˻� ��ü�� �����մϴ�
			var ps = new daum.maps.services.Places();
			
			// Ű����� ��Ҹ� �˻��մϴ�
			ps.keywordSearch('${product.prodAddress} ', placesSearchCB); 
		
			// Ű���� �˻� �Ϸ� �� ȣ��Ǵ� �ݹ��Լ� �Դϴ�
			function placesSearchCB (data, status, pagination) {
				console.log("data : " + data);
				console.log("pagination : " + pagination);
				console.log("prodName : " + '${product.prodName}');
				
			    if (status === daum.maps.services.Status.OK) {
		
			        // �˻��� ��� ��ġ�� �������� ���� ������ �缳���ϱ�����
			        // LatLngBounds ��ü�� ��ǥ�� �߰��մϴ�
			        var bounds = new daum.maps.LatLngBounds();
		
			        for (var i=0; i<data.length; i++) {
			            displayMarker(data[i]); 
			            bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
			        }       
		
			        // �˻��� ��� ��ġ�� �������� ���� ������ �缳���մϴ�
			        map.setBounds(bounds);
			    } 
			}
		
			// ������ ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
			function displayMarker(place) {
			    
			    // ��Ŀ�� �����ϰ� ������ ǥ���մϴ�
			    var marker = new daum.maps.Marker({
			        map: map,
			        position: new daum.maps.LatLng(place.y, place.x) 
			    });
		
			    // ��Ŀ�� Ŭ���̺�Ʈ�� ����մϴ�
			    daum.maps.event.addListener(marker, 'click', function() {
			        // ��Ŀ�� Ŭ���ϸ� ��Ҹ��� ���������쿡 ǥ��˴ϴ�
			        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
			        infowindow.open(map, marker);
			    });
			}

	</script>
	
	<hr/><hr/><hr/>
	
	<!-- <div id="map" style="width:100%;height:350px;"></div>
	<script>
		var mapContainer = document.getElementById('map'), // ������ ǥ���� div  
		    mapOption = { 
		        center: new daum.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
		        level: 3 // ������ Ȯ�� ����
		    };
		
		var map = new daum.maps.Map(mapContainer, mapOption); // ������ �����մϴ�
		 
		// ��Ŀ�� ǥ���� ��ġ�� ������ ������ �ִ� ��ü �迭�Դϴ� 
		var positions = [
			for(){
				content: '<div>${product.prodName}</div>',
		        latlng: new daum.maps.LatLng(33.451393, 126.570738)
			}
		    {
		        content: '<div>īī��</div>', 
		        latlng: new daum.maps.LatLng(33.450705, 126.570677)
		    },
		    {
		        content: '<div>���¿���</div>', 
		        latlng: new daum.maps.LatLng(33.450936, 126.569477)
		    },
		    {
		        content: '<div>�Թ�</div>', 
		        latlng: new daum.maps.LatLng(33.450879, 126.569940)
		    },
		    {
		        content: '<div>${product.prodName}</div>',
		        latlng: new daum.maps.LatLng(33.451393, 126.570738)
		    }
		];
		
		for (var i = 0; i < positions.length; i ++) {
		    // ��Ŀ�� �����մϴ�
		    var marker = new daum.maps.Marker({
		        map: map, // ��Ŀ�� ǥ���� ����
		        position: positions[i].latlng // ��Ŀ�� ��ġ
		    });
		
		    // ��Ŀ�� ǥ���� ���������츦 �����մϴ� 
		    var infowindow = new daum.maps.InfoWindow({
		        content: positions[i].content // ���������쿡 ǥ���� ����
		    });
		
		    // ��Ŀ�� mouseover �̺�Ʈ�� mouseout �̺�Ʈ�� ����մϴ�
		    // �̺�Ʈ �����ʷδ� Ŭ������ ����� ����մϴ� 
		    // for������ Ŭ������ ����� ���� ������ ������ ��Ŀ���� �̺�Ʈ�� ��ϵ˴ϴ�
		    daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		    daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		}
		
		// ���������츦 ǥ���ϴ� Ŭ������ ����� �Լ��Դϴ� 
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}
		
		// ���������츦 �ݴ� Ŭ������ ����� �Լ��Դϴ� 
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}
	</script> -->

<hr/><hr/><hr/>
	
	</div>
 	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

</body>

</html>