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
								alert("����?");
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
				$( "button:contains('ã��')" ).on("click" , function() {
					$("form").attr("method", "POST").attr("action", "/find/getMeetingResult/town?="+town).submit();
					//$("form").attr("method", "POST").attr("action", "/find/getMeetingResult").submit();
				});
				
				$( "button:contains('����')" ).on("click" , function() {
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

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container" >
	
		<div class="page-header">
	       <h3 class=" text-info">���� �˻�</h3>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
			
			<div class="row">
		  		<div class="col-xs-4 col-md-2 "><strong>����</strong></div>
				<div class="col-xs-8 col-md-4">
					<select class="form-control" id="city">
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
					<button type="button" class="btn btn-primary">����</button>
					<button type="button" class="btn btn-primary">ã��</button>
			  	</div>
			</div>
	
			<br/>
		</form>
	 </div>
	 
 	
</body>
</html>