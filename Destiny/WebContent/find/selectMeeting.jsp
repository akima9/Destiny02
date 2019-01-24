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
<!-- //All CSS Insert -->

<!-- All js -->
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	
	
	<script>
	$(function(){
		// 내부에 스크립트 코드 추가
		
		// city & town
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
		
		//찾기 & 이전 button
		var town = $(this).val();
		console.log(town);
		$("a[name='find']" ).on("click" , function() {
			if($('select[name="city"]').val() == 0 || $('select[name="town"]').val() == 0){
				alert('지역을 선택해 주세요.');
			}else{
				$("form").attr("method", "POST").attr("action", "/find/getMeetingResult").submit();
			}
		});
		
		$( "a[name='back']" ).on("click" , function() {
			 history.go(-1);
		});
		
		
	})
		
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
				<h2>이상형 검색</h2>
			</header>
			
			<!-- form Start /////////////////////////////////////-->
			<form class="form-horizontal">
				<div>
					<table class="row-table">
						<caption>테이블 설명</caption>
						
						<colgroup>
							<col style="width:20%;">
							<col style="width:80%;">
						</colgroup>
						
						<thead class="hide">
							<tr>
								<th>구분</th>
								<td>내용</td>
							</tr>
						</thead>
						
						<tbody>
						
							<tr>
								<th>지역 Map</th>
								<td>
									<div class="row uniform">
										<div class="12u">
											<jsp:include page="map.jsp" />
										</div>
									</div>
								</td>
							</tr>
							
							<tr>
								<th>지역</th>
								<td>
									<div class="row uniform">
										<div class="6u$ 12u$(small)">
											<div class="select-wrapper">
												<select name="city" id="city" name="city">
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
											</div>
										</div>
										
										<div class="6u$ 12u$(small)">
											<div class="select-wrapper">
												<select id="town" name="town"></select>
											</div>
										</div>
									</div>
								</td>
							</tr>
							
						</tbody>
					</table>
					
					<ul class="actions align-center">
						<li><a href="#" class="button" name="back">이전</a></li>
						<li><a href="#" class="button special" name="find">찾기</a></li>
					</ul>
				</div>
			</form>
		</div>
	</section>
	<!-- //contents -->
	
	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
	
	
	
</body>
</html>