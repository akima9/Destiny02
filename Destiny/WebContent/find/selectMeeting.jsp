<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>�쿬</title>
<!-- All CSS Insert -->
<link rel="stylesheet" href="/resources/css/main.css" >
<style>
#map {
    height: 500px; 
    min-width: 500x; 
    max-width: 500px; 
    margin: 0 auto; 
}
</style> 
<!-- //All CSS Insert -->


<!-- All js -->
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
	<script src="http://code.highcharts.com/maps/highmaps.js"></script>
	<script src="http://code.highcharts.com/maps/modules/drilldown.js"></script>
	<script src="../resources/javascript/highmap/chart.js"></script>

	<script>
	$(function() {
		var town;
		var gu;
		var highMap = new highMaps();
		highMap.init();
		
		// Ŭ�� ��, ���� ��������
		$("#map").click(function(){
			//console.log(highMap);
			console.log(highMap.selected);
			
			town = highMap.selected;
			$('#town-data').val(town)
			console.log(town);
			gu = encodeURI(town);
		});
		
		$("a[name='find']" ).on("click" , function() {
			if($('#town-data').val() == 0){
				alert('������ ������ �ּ���.');
			}else{
				$("form").attr("method", "POST").attr("action", "/find/getMeetingResult").submit();
			}
		});
		
		$( "a[name='back']" ).on("click" , function() {
			 history.go(-1);
		});
	});
		
	</script>
	
	<!-- //All js -->	

</head>

<body class="subpage">	
	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->

	<!-- contents -->
	<section id="main" class="wrapper">
		<div class="inner">
			<header class="align-center">
				<h2>�̻��� �˻�</h2>
			</header>
			
			<!-- form Start /////////////////////////////////////-->
			<form class="form-horizontal">
				<div>
					<table class="row-table">
						<caption>���̺� ����</caption>
						
						<colgroup>
							<col style="width:20%;">
							<col style="width:80%;">
						</colgroup>
						
						<thead class="hide">
							<tr>
								<th>����</th>
								<td>����</td>
							</tr>
						</thead>
						
						<tbody>
						
							<tr>
								<th>���� Map</th>
								<td>
									<div class="row uniform">
										<div class="12u">
											<div id="map"></div>
										</div>
									</div>
								</td>
							</tr>
							
						</tbody>
					</table>
					
					<ul class="actions align-center">
						<li><a href="#" class="button" name="back">����</a></li>
						<li><a href="#" class="button special" name="find">ã��</a></li>
					</ul>
				</div>
				
				<input type="hidden" id="town-data" name="town">
			</form>
		</div>
	</section>
	<!-- //contents -->
	
	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
	
	
	
</body>
</html>