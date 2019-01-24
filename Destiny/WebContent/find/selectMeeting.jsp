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
<!-- //All CSS Insert -->

<!-- All js -->
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	
	
	<script>
	$(function(){
		// ���ο� ��ũ��Ʈ �ڵ� �߰�
		
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
		
		//ã�� & ���� button
		var town = $(this).val();
		console.log(town);
		$("a[name='find']" ).on("click" , function() {
			if($('select[name="city"]').val() == 0 || $('select[name="town"]').val() == 0){
				alert('������ ������ �ּ���.');
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
											<jsp:include page="map.jsp" />
										</div>
									</div>
								</td>
							</tr>
							
							<tr>
								<th>����</th>
								<td>
									<div class="row uniform">
										<div class="6u$ 12u$(small)">
											<div class="select-wrapper">
												<select name="city" id="city" name="city">
													<option value="">��/�ø� ������ �ּ���</option>
											      	<option value="����">����</option>
											      	<option value="���">���</option>
											      	<option value="��õ">��õ</option>
											      	<option value="�λ�">�λ�</option>
											      	<option value="�뱸">�뱸</option>
											      	<option value="����">����</option>
											      	<option value="����">����</option>
											      	<option value="���">���</option>
											      	<option value="����">����</option>
											      	<option value="����">����</option>
											      	<option value="�泲">�泲</option>
											      	<option value="���">���</option>
											      	<option value="����">����</option>
											      	<option value="����">����</option>
											      	<option value="�泲">�泲</option>
											      	<option value="���">���</option>
											      	<option value="����">����</option>
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
						<li><a href="#" class="button" name="back">����</a></li>
						<li><a href="#" class="button special" name="find">ã��</a></li>
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