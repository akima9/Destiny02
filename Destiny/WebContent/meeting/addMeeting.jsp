<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="EUC-KR">
	
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!--  ///////////////////////// ����Ʈ��Ŀ ����////////////////////////// -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript" src="../javascript/calendar.js"></script>
    <!--  ///////////////////////// ����Ʈ��Ŀ ���� ////////////////////////// -->
    
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>

     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	////////////////* ����Ʈ��Ŀ ������ ���� */////////
	$( function() {

	    $( "#datepicker" ).datepicker({
	    	dateFormat:"yy-mm-dd"
	    });
    		
	} );
	
	
	
	function fncAddProduct(){
		//Form ��ȿ�� ����

		 
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
		
		console.log("���ɻ�"+interestName);
		console.log("���ü���"+meetingCenter);
		console.log("Ÿ��Ʋ�̹���"+titleImg);
		console.log("����"+meetingName);
		console.log("����"+meetingDetail);
		console.log("�ο�"+meetingCrewLimit);
		console.log("������"+snooze);
		console.log("��¥"+meetingDate);
		console.log("����"+meetingDay);
		console.log("�ð�"+meetingTime);
		console.log("���"+meetingLocation);
		
		
		if(interestName == null || interestName.length<1){
			alert("���ɻ縦 ������ �ּ���.");
			return;
		}
		
		if(meetingCenter == null|| meetingCenter.length<1){
			alert("�߽������� ������ �ּ���.");
			return;
		}
		
		if(titleImg == null || titleImg.length<1){
			alert("��ǥ�̹����� �����Ͽ� �ּ���.");
			return;
		}
		
		if(meetingName == null || meetingName.length<1){
			alert("�����̸��� �ۼ��Ͽ� �ּ���.");
			return;
		}
		
		if(meetingDetail == null || meetingDetail.length<1){
			alert("���Ӽ����� �ۼ��Ͽ� �ּ���.");
			return;
		}
		
		if(meetingCrewLimit == null || meetingCrewLimit.length<1){
			alert("�����ο��� �����Ͽ� �ּ���.");
			return;
		}
		
		if(snooze!='Y' && snooze!='N'){
			alert("�ݺ����θ� �����Ͽ� �ּ���.");
			return;
		}
		
		if(meetingDate == null && meetingDay == null){
			alert("��¥or������ �����Ͽ� �ּ���.");
			return;
		}
		
		if(meetingTime == null || meetingTime=='���ӽð�'){
			alert("���ӽð��� �Է��Ͽ� �ּ���.");
			return;
		}
		
		if(meetingLocation == null || meetingLocation.length<1){
			alert("������Ҹ� �Է��Ͽ� �ּ���.");
			return;
		}
		
		if (confirm("������ ����Ͻðڽ��ϱ�?") == true){    //Ȯ��
			 
			$("form").attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/meeting/addMeeting").submit();

		     //document.removefrm.submit();

		 }else{   //���

		     return;

		 }
		//alert("������ ��ϵǾ����ϴ�.");
	}
	
	$(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
		 $( "button.btn.btn-primary" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('���')" ).html() );
			fncAddProduct();
		});
	});
	
	$(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
		 $( "a[href='#' ]" ).on("click" , function() {
				//Debug..
				//alert(  $( "a[href='#' ]" ).html() );
				//$("form")[0].reset();
				 self.location = "/product/listProduct?menu=search";
		});
	});	
	 
	//=====================================���� / ���� üũ===============================
	
	$(function() {
		
		$('input[name="price"]').on("keyup", function(){
			
			var price = $('input[name="price"]').val();
			
			if(parseInt(price) <= 0){
				//alert("�˳�");
				$('input[name="price"]').css('background-color','pink');
				$('#priceWirte').text("������ 0�����Դϴ�.");
			} else if (parseInt(price) >= 0 || price == null || price == "") {
				$('#priceWirte').text("");
				$('input[name="price"]').css('background-color','white');
			}
		});
	});
	
	$(function() {
		
		$('input[name="quantity"]').on("keyup", function(){
		
			var quantity = $('input[name="quantity"]').val();
			
			if(parseInt(quantity) <= 0){
				$('input[name="quantity"]').css('background-color','pink');
				$('#quantityWirte').text("������ 0�����Դϴ�.");
			} else if (parseInt(quantity) >= 0 || quantity == null || quantity == "") {
				$('#quantityWirte').text("");
				$('input[name="quantity"]').css('background-color','white');
			}
			
			
			
		});
	});
	
	$(function(){
		$('input[name="metaKey"]').on("keyup", function(){
			
			var metaKey = $('input[name="metaKey"]').val();
			
			metaKey = parseInt(metaKey);
			
			//String�� parseInt�Ǹ� NAN�� ������� �̿��� ���� ����
			if(metaKey != $('input[name="metaKey"]').val()){
				$('input[name="metaKey"]').css('background-color','pink');
				$('#metaKeyWirte').text("�߸��� ������ Ÿ���Դϴ�. ���ڸ� �Է��ϼ���.");
			} else if(metaKey == $('input[name="metaKey"]').val()) {
				//alert(metaKey);
				$('input[name="metaKey"]').css('background-color','white');
				$('#metaKeyWirte').text("");
				
				//������ metaKey�� �̹� �ִ��� Ȯ��
				$.ajax({
					url : "/product/json/getProductByMetaKey/"+metaKey,
					method : "GET",
					dataType : "json",
					headers :{
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData , status) {
						//alert(JSONData.product);
						if(JSONData.product != null){
							$('input[name="metaKey"]').css('background-color','pink');
							$('#metaKeyWirte').text("�̹� �����ϴ� ��ŸŰ�Դϴ�.");
						}
					}, 
					error : function(what){
						$('input[name="metaKey"]').css('background-color','white');
						$('#metaKeyWirte').text("");
					}
				});
			}
		});
	});
	

	 $( function() {
		    $( "#manuDate" ).datepicker();
	});
	 
	////* ���ɻ簡 ���õǸ�  *////
	 $(function(){
			$( "#interest" ).on("change" , function() {
				//var idx = $(".brand_ids").index(this);
				var interestNo=$(this).val();
				console.log(interestNo);
				
				$( "#selectedInterest" ).val(interestNo);
					
			});
		});
	////* ���ɻ� ��  *////
	
	////* ������ ���ú�  *////
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
								list+="<option>��/��/�� ����</option>";
								for(i in JSONData.list){
									var town = JSONData.list[i].townName;
									
									list+="<option name='meetingCenter' value='"+town+"'>"+town+"</option>";
							}
								$( "#location" ).empty().append(list);
							}
					});
			});
		});
	////* ������ ���ú� ��!!!!!  *////
	
	////* ���ӿ� ���ú�  *////

	
	////* ���ӿ� ���ú�  ��!!!!!!!!!!*////
	 
	////* �ݺ����ΰ� ���õǸ�  *////
	 $(function(){
			$( "#snooze" ).on("change" , function() {
				//var idx = $(".brand_ids").index(this);
				var snooze=$(this).val();
				console.log(snooze);
				
				if(snooze=='Y'){
					console.log("�ݺ����õ�")
					var list = "";
					list+="<select id='weekday' class='form-control'>";
					list+="<option value='������'>������</option>";
					list+="<option value='ȭ����'>ȭ����</option>";
					list+="<option value='������'>������</option>";
					list+="<option value='�����'>�����</option>";
					list+="<option value='�ݿ���'>�ݿ���</option>";
					list+="<option value='�����'>�����</option>";
					list+="<option value='�Ͽ���'>�Ͽ���</option>";
					list+="</select>";
					$( "#dateOrDay" ).empty().append(list);
				}
			});
		});
	
	
	</script>
	
	
	<!-- ���� ���� -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=54cfa5aea3e5609fcbb420ef8cd6ed4c"></script>
	<script>
	    var mapContainer = document.getElementById('map'), // ������ ǥ���� div
	        mapOption = {
	            center: new daum.maps.LatLng(37.537187, 127.005476), // ������ �߽���ǥ
	            level: 5 // ������ Ȯ�� ����
	        };
	
	    //������ �̸� ����
	    var map = new daum.maps.Map(mapContainer, mapOption);
	    //�ּ�-��ǥ ��ȯ ��ü�� ����
	    var geocoder = new daum.maps.services.Geocoder();
	    //��Ŀ�� �̸� ����
	    var marker = new daum.maps.Marker({
	        position: new daum.maps.LatLng(37.537187, 127.005476),
	        map: map
	    });
	
	
	    function sample5_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                var addr = data.address; // ���� �ּ� ����
	
	                // �ּ� ������ �ش� �ʵ忡 �ִ´�.
	                document.getElementById("sample5_address").value = addr;
	                // �ּҷ� �� ������ �˻�
	                geocoder.addressSearch(data.address, function(results, status) {
	                    // ���������� �˻��� �Ϸ������
	                    if (status === daum.maps.services.Status.OK) {
	
	                        var result = results[0]; //ù��° ����� ���� Ȱ��
	
	                        // �ش� �ּҿ� ���� ��ǥ�� �޾Ƽ�
	                        var coords = new daum.maps.LatLng(result.y, result.x);
	                        // ������ �����ش�.
	                        mapContainer.style.display = "block";
	                        map.relayout();
	                        // ���� �߽��� �����Ѵ�.
	                        map.setCenter(coords);
	                        // ��Ŀ�� ��������� ���� ��ġ�� �ű��.
	                        marker.setPosition(coords)
	                    }
	                });
	            }
	        }).open();
	    }
	</script>
	<!-- �������� �� -->
	
	</head>
	
	<body>
   	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
   		<h1 class="bg-primary text-center">�����ϱ�</h1>
   	
   		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		<input type="hidden" name="meetingMasterId" value="aaaaa">
		<input type="hidden" name="masterProfileImg" value="aaaaa">
		 <div  class="form-group col-sm-4 col-md-4">
		 	<select id="interest" class="form-control">
		 		<option >���ɻ�</option>
		 		<c:forEach var="Meeting" items="${list}">
		 		
		 			<option value="${Meeting.interestName}">${Meeting.interestName }</option>
		 		
		 		</c:forEach>
		 	</select>
		 </div>
		
		 <div class="form-group col-sm-8 col-md-8">
		 	<input  name="interestName" id="selectedInterest" type="text" class="form-control" placeholder="���ɻ縦 ������ �ּ���">
		 </div>
		 
		 <div class="form-group col-sm-6 col-md-6">
		 	<select id="centerLocation" class="form-control">
		 		<option>�߽�����-����</option>
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
		 
		 <div id="location" class="form-group col-sm-6 col-md-6">
		 	<input type="text" class="form-control" placeholder="��/��/���� �������ּ���">
		 </div>
		 	
		 
		<!--
		 <div class="form-group col-sm-8 col-md-8">
		 	<input type="text" class="form-control" placeholder="���������� �Է����ּ���">
		 </div>
		 -->
		 <div class="form-group col-sm-10 col-md-10">
		 	<input type="text" class="form-control" name="titleImg" placeholder="��ǥ�̹����� �����Ͽ� �ּ���">
		 </div>
		 
		 <div class="form-group col-sm-2 col-md-2">
		 	<button type="button" class="btn btn-warning" >÷������</button>
		 </div>
		 
		 <div class="form-group col-sm-12 col-md-12">
		 	<input type="text" class="form-control" name="meetingName" placeholder="�����̸��� �����ּ���">
		 </div>
		 
		 <div class="form-group col-sm-12 col-md-12">
		 	<textarea class="form-control" cols="100" rows="3" 
		 	name="meetingDetail" placeholder="� �������� �������ּ���" ></textarea>
		 </div>
		 
		 <div class="form-group col-sm-12 col-md-12">
		 	<textarea class="form-control" cols="100" rows="3" 
		 	name="meetingRule" placeholder="���ӿ� ��Ģ�� �ֳ���? �ִٸ� ������ �����ּ���"></textarea>
		 </div>
		 
		 <div class="form-group col-sm-10 col-md-10">
		 	�����ο��� �Է��Ͽ� �ּ���
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
		 		<option>�ݺ�����</option>
		 		<option value="Y">�ݺ�</option>
		 		<option value="N">�ѹ�</option>
		 	</select>
		 </div>
		 
		 <div  id="dateOrDay" class="form-group col-sm-4 col-md-4">
		 	<input 	type="text" id="datepicker" readonly="readonly" class="form-control" placeholder="���ӳ�¥or����" name="meetingDate"/>
		 	
		 	<!--  
		 	<select class="form-control">
		 		<option value="">���ӳ�¥or����</option>
		 	</select>
		 	-->
		 </div>
		 
		 <div class="form-group col-sm-4 col-md-4">
		 	<select name="meetingTime" class="form-control">
		 		<option>���ӽð�</option>
		 		<option value="13:00">13:00</option>
		 		<option value="14:00">14:00</option>
		 	</select>
		 </div>
		 
		 <div class="form-group col-sm-10 col-md-10">
		 	ȸ�� �ִٸ� �Է����ּ���
		 </div>
		 
		 <div class="form-group col-sm-2 col-md-2">
		 	<input name="meetingDues" type="text" class="form-control" placeholder="$">
		 </div>
		 
		 <div class="form-group col-sm-10 col-md-10">
		 <input name="meetingLocation" type="text" class="form-control" id="sample5_address" placeholder="�ּ�">
		 	<!-- <input type="text" class="form-control" placeholder="������Ҹ� �Է��Ͽ��ּ���."> -->
		 </div>
		 
		 <div class="form-group col-sm-2 col-md-2">
			<input type="button" class="btn btn-warning" onclick="sample5_execDaumPostcode()" value="�ּ� �˻�"><br>
			<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
		 	<!-- <button type="button" class="btn btn-warning">����˻�</button> -->
		 </div>
		  
		 <div class="form-group">
		   <div class="col-sm-offset-4  col-sm-4 text-center">
		     <button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
			 <a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
		   </div>
		 </div>
	</form>
 	</div>
	<!--  ȭ�鱸�� div end /////////////////////////////////////-->
	
</body>

</html>	
	