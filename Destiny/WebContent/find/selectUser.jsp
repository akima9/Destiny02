<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>selectUser</title>
		
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
			
			$("button:contains('ã��')").on("click", function() {
				if( $('.selectGender:checked').length != 1 ){
					alert('���� üũ');
				} else if( $('select[name="selectAge"]').val() == 0 ) {
					alert('���� ����');
				} else if($('select[name="city"]').val() == 0 || $('select[name="town"]').val() == 0){
					alert('���� ����');
				} else if( $('.inter-chk:checked').length != 3 ) {
					alert('üũ�ڽ� Ŭ��');
				} else {
					$("form").attr("method", "POST").attr("action", "/find/getUserResult").submit();	
				}
			});		
			
			$( "button:contains('����')" ).on("click" , function() {
				 history.go(-1);
			});
			
			// checkbox controll
			$('.inter-chk').on('change', function() {
				
				if( $('.inter-chk:checked').length <= 2 ) {
					$('.inter-chk').attr('disabled', false);
				} else {
					$('.inter-chk').attr('disabled', true);
					$('.inter-chk:checked').attr('disabled', false);
				}
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
	<h1>selectUser.jsp</h1>

	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container" >
	
		<div class="page-header">
	       <h3 class=" text-info">�̻��� �˻�</h3>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
			
			<!--  ////���� ����///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>����</strong></div>
				<div class="col-xs-8 col-md-4">
					<input type="radio" class="selectGender" name="selectGender" value='M'>����</input>
					<input type="radio" class="selectGender" name="selectGender" value='W'>����</input>
				</div>
			</div>
			<!--  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
			
			<hr/>
			
			<!--  //////////////////////////////////////////////////���� ���� /////////////////////////////////////////////////////////////////////////////-->
			 <div class="row">
		  		<div class="col-xs-4 col-md-2 "><strong>����</strong></div>
				<div class="col-xs-8 col-md-4">
					<select class="form-control" name="selectAge">
						<option value="">���ϴ� ������ ������ �ּ���.</option>
						<option value="1">20�� ~ 24��</option>
						<option value="2">24�� ~ 29��</option>
						<option value="3">30�� ~ 34��</option>
						<option value="4">34�� ~ 49��</option>
						<option value="5">40�� ~ 44��</option>
						<option value="6">44�� ~ 59��</option>
						<option value="7">50�� ~ </option>
					</select>
				</div>
			</div>
			<!--  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
			
			<hr/>
			
			<!--  //////////////////////////////////////////////////���� ���� /////////////////////////////////////////////////////////////////////////////-->
			<div class="row">
		  		<div class="col-xs-4 col-md-2 "><strong>����</strong></div>
				<div class="col-xs-8 col-md-4">
					<select class="form-control" id="city" name="city">
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
			<!--  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
			
			<hr/>
			
			<!--  //////////////////////////////////////////////////���ɻ� ���� /////////////////////////////////////////////////////////////////////////////-->
			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>���ɻ�</strong></div>
				<div class="col-xs-8 col-md-4">
					<input type="checkbox" name="selectInterest" value="10000" class="inter-chk" id="sltInter01"><label for="sltInter01">�ƿ�����/����</label>
					<input type="checkbox" name="selectInterest" value="10001" class="inter-chk" id="sltInter02"><label for="sltInter02">�/������</label>
					<input type="checkbox" name="selectInterest" value="10002" class="inter-chk" id="sltInter03"><label for="sltInter03">�ι���/å/��</label>
					<br/><br/>
					<input type="checkbox" name="selectInterest" value="10003" class="inter-chk" id="sltInter04"><label for="sltInter04">����/����</label>
					<input type="checkbox" name="selectInterest" value="10004" class="inter-chk" id="sltInter05"><label for="sltInter05">�ܱ�/���</label>
					<input type="checkbox" name="selectInterest" value="10005" class="inter-chk" id="sltInter06"><label for="sltInter06">��ȭ/����/����</label>
					<br/><br/>
					<input type="checkbox" name="selectInterest" value="10006" class="inter-chk" id="sltInter07"><label for="sltInter07">����/�Ǳ�</label>
					<input type="checkbox" name="selectInterest" value="10007" class="inter-chk" id="sltInter08"><label for="sltInter08">����/�����</label>
					<input type="checkbox" name="selectInterest" value="10008" class="inter-chk" id="sltInter09"><label for="sltInter09">��/����</label>
					<br/><br/>
					<input type="checkbox" name="selectInterest" value="10009" class="inter-chk" id="sltInter10"><label for="sltInter10">����Ȱ��</label>
					<input type="checkbox" name="selectInterest" value="10010" class="inter-chk" id="sltInter11"><label for="sltInter11">�米/�θ�</label>
					<input type="checkbox" name="selectInterest" value="10011" class="inter-chk" id="sltInter12"><label for="sltInter12">��/�������</label>
					<br/><br/>
					<input type="checkbox" name="selectInterest" value="10012" class="inter-chk" id="sltInter13"><label for="sltInter13">����/����</label>
					<input type="checkbox" name="selectInterest" value="10013" class="inter-chk" id="sltInter14"><label for="sltInter14">�߱�����</label>
					<input type="checkbox" name="selectInterest" value="10014" class="inter-chk" id="sltInter15"><label for="sltInter15">����/����</label>
					<br/><br/>
					<input type="checkbox" name="selectInterest" value="10015" class="inter-chk" id="sltInter16"><label for="sltInter16">�丮/����</label>
					<input type="checkbox" name="selectInterest" value="10016" class="inter-chk" id="sltInter17"><label for="sltInter17">�ݷ�����</label>
					<input type="checkbox" name="selectInterest" value="10017" class="inter-chk" id="sltInter18"><label for="sltInter18">����/��ȥ</label>
					<br/><br/>
					<input type="checkbox" name="selectInterest" value="10018" class="inter-chk" id="sltInter19"><label for="sltInter19">�Բ��ؿ�</label>
					<br/><br/>
				</div>
			</div>
			<!--  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-->
			
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