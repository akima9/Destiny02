<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ã�� ���</title>

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
   <!--  Kakao ���� 
   <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=238c3f6eaacc311151fd24574cf5b8e9&libraries=services"></script>-->
   
   <script type="text/javascript">
		$(function() {
			$( "button:contains('Ȯ��')" ).on("click" , function() {
				self.location = "/find/mainFind.jsp"
			});
		});
		
		
	</script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
        
        .row{text-align : center; }
        .count{font-size: 25px; font-weight: bold; color: #6666ff;}
        
        .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '����', sans-serif;line-height: 1.5;}
	    .wrap * {padding: 0;margin: 0;}
	    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
	    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
	    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
	    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
	    .info .close:hover {cursor: pointer;}
	    .info .body {position: relative;overflow: hidden;}
	    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
	    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
	    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
	    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
	    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
	    .info .link {color: #5085BB;}
	    
     </style>
     
</head>
<body>

<div class="container">
	
		<div class="page-header"> <h3 class=" text-info">���� ã�� ���</h3> </div>
		
		<%-- <div class="row" >
			ȸ������ ã�� ������ ������ ����
			<span class="count">${totalCount}��</span> �Դϴ�.
		</div> <br/><br/><hr/>--%>
		
		<div class="container">
			<div class="row">
				<!-- /////////���� ����ǥ�� ////////////////////////////////////////////////////////////////////////// -->
				<div class="col-md-6">
				
				<br/><br/><br/><br/><br/><br/><br/>
				
				<c:forEach var="meeting" items="${list}">
				
					<div id="map" style="width:100%;height:350px;"></div>
					
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=238c3f6eaacc311151fd24574cf5b8e9&libraries=services"></script>
						<script>
						var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
						    mapOption = {
						        center: new daum.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
						        level: 3 // ������ Ȯ�� ����
						    };  
						
						// ������ �����մϴ�    
						var map = new daum.maps.Map(mapContainer, mapOption); 
						
						// �ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
						var geocoder = new daum.maps.services.Geocoder();
						
						// �ּҷ� ��ǥ�� �˻��մϴ�
						geocoder.addressSearch('${meeting.meetingLocation} ', function(result, status) {
						
						    // ���������� �˻��� �Ϸ������ 
						     if (status === daum.maps.services.Status.OK) {
						
						        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
						
						        // ��������� ���� ��ġ�� ��Ŀ�� ǥ���մϴ�
						        var marker = new daum.maps.Marker({
						            map: map,
						            position: coords
						        });
						        
						        var content = '<div class="wrap">' + 
					            '    <div class="info">' + 
					            '        <div class="title">' + 
					            '           ${meeting.meetingName}' + 
					            '            <div class="close" onclick="closeOverlay()" title="�ݱ�"></div>' + 
					            '        </div>' + 
					            '        <div class="body">' + 
					            '            <div class="img">' +
					            '                <img src="/resources/images/findUpload/${meeting.titleImg}" width="73" height="70"/>' +
					            '           </div>' + 
					            '            <div class="desc">' + 
					            '                <div class="ellipsis">${meeting.meetingLocation}</div>' + 	
					            '            </div>' + 
					            '        </div>' + 
					            '    </div>' +    
					            '</div>';
						        
						        var overlay = new daum.maps.CustomOverlay({
						            content: content,
						            position: marker.getPosition()
						        });
		
						        // ��Ŀ�� Ŭ������ �� Ŀ���� �������̸� ǥ���մϴ�
						        daum.maps.event.addListener(marker, 'click', function() {
						            overlay.setMap(map);
						        });
		
						        // ������ �߽��� ��������� ���� ��ġ�� �̵���ŵ�ϴ�
						        map.setCenter(coords);
						     // Ŀ���� �������̸� �ݱ� ���� ȣ��Ǵ� �Լ��Դϴ� 
						        function closeOverlay() {
						            overlay.setMap(null);     
						        }
						     
						     // ����������� ��ҿ� ���� ������ ǥ���մϴ�
						        var infowindow = new daum.maps.InfoWindow({
						            content: '<div style="padding:5px;font-size:12px;"> ${meeting.meetingName}</div>'
						        });
						        /*infowindow.open(map, marker); */
						        
						        (function(marker, infowindow) {
						            // ��Ŀ�� mouseover �̺�Ʈ�� ����ϰ� ���콺 ���� �� ���������츦 ǥ���մϴ� 
						            daum.maps.event.addListener(marker, 'mouseover', function() {
						                infowindow.open(map, marker);
						            });
		
						            // ��Ŀ�� mouseout �̺�Ʈ�� ����ϰ� ���콺 �ƿ� �� ���������츦 �ݽ��ϴ�
						            daum.maps.event.addListener(marker, 'mouseout', function() {
						                infowindow.close();
						            });
						        })(marker, infowindow);
						    } 
						    
						});   
						
						
						</script>
	     			 </c:forEach>
				</div>
			<!-- ////////////////////////////////////////////////////////////////////////////////////////// -->
	
			<!-- /////////���� ����Ʈ ////////////////////////////////////////////////////////////////////////// -->
			<div class="col-md-6">
			<br/><br/><br/>
				<table class="table table-hover table-striped" >
					<colgroup>
						<col style="width:10%;">
						<col style="width:40%;">
						<col style="width:15%;">
						<col style="width:15%;">
						<col style="width:20%;">
					</colgroup>
			        <thead>
			          <tr>
			            <th align="center">No</th>
			            <th align="center" >Image</th>
			            <th align="left" >�����̸�</th>
			            <th align="center">���ӳ�¥</th>
			          </tr>
			        </thead>
		       
					<tbody>
					  <c:set var="i" value="0" />
					  <c:forEach var="meeting" items="${list}">
						<c:set var="i" value="${ i+1 }" />
						<tr>
						  <td align="center">${ i }</td>
						  <td align="left"> <img src="/resources/images/findUpload/${meeting.titleImg}" width=200px height=150px/></td>
						  <td align="left"  title="Click : ��ǰ���� Ȯ��" data-param="${meeting.meetingNo}" >${meeting.meetingName}</td>
						  <td align="left">${meeting.meetingDate}</td>
						</tr>
					  </c:forEach>
			        </tbody>
				</table>
				
				<div class="col-md-12 text-center ">
					<button type="button" class="btn btn-primary">Ȯ��</button>
				</div>
				
			</div>
	    	<!-- /////////////////////////////////////////////////////////////////////////////////// -->

		</div>
 	</div>
 </div>

</body>
</html>