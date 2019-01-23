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
   <!--  ///////////////////////// ����Ʈ��Ŀ ����////////////////////////// -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript" src="../javascript/calendar.js"></script>
    <!--  ///////////////////////// ����Ʈ��Ŀ ���� ////////////////////////// -->
   
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
	
	    ////////////////* ����Ʈ��Ŀ ������ ���� */////////
		$( function() {
	
		    $( "#datepicker" ).datepicker({
		    	dateFormat:"yy-mm-dd"
		    });
	    		
		} );
		
		function fncAddProduct(){
			//Form ��ȿ�� ����

			 
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
			
			console.log("���ɻ�"+interestName);
			console.log("���͹���"+centerMeeting);
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
			
			if(meetingCenter == null && centerMeeting == null){
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
			
			if (confirm("������ �����Ͻðڽ��ϱ�?") == true){    //Ȯ��
				
				$("#contentsForm").attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/meeting/updateMeeting").submit();

			     //document.removefrm.submit();

			 }else{   //���

			     return;

			 }
			//alert("������ ��ϵǾ����ϴ�.");
		}
		///////////* �����ϱ⿡�� Ȯ�δ����� �̺�Ʈ ó�� *//////////////
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
			 $( "button.btn.btn-primary:contains('�� &nbsp;��')" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('���')" ).html() );
				fncAddProduct();
			});
		});
		
		///////////* �����ϱ⿡�� Ȯ�δ����� �̺�Ʈ ó�� *//////////////
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
			 $( "button.btn.btn-success" ).on("click" , function() {
				 //var meetingNo = ${meeting.meetingNo};
				// var meetingMasterId= ${sessionScope.me.userId};
				//alert("ȣ��!");
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
										alert("�̹� �����ϼ̽��ϴ�.");
										$("#dialog2form")[0].reset();
										$("#dialog2").toggle();
									}else{
										alert("���� ��û�� �Ϸ�Ǿ����ϴ�.");
										//window.opener.location.reload(false);
										$("#dialog2form")[0].reset();
										$("#dialog2").toggle();
									}
								}
				});
				 
			});
		});
		
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
			 $( "button.btn.btn-primary" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('���')" ).html() );
				fncAddProduct();
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
									list+="<select name='meetingCenter' class='form-control'>";
									list+="<option>��/��/�� ����</option>";
									for(i in JSONData.list){
										var town = JSONData.list[i].townName;
										
										list+="<option value='"+town+"'>"+town+"</option>";
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
		/*  $(function(){
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
			}); */
		
		
		
		
		//============= ȸ���������� Event  ó�� =============	
		 $(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			/*  $( "button:contains('Ȯ��')" ).on("click" , function() {
				 self.location = "/product/listProduct?menu=${param.menu}"
				}); */
			  	$( "button:contains('�Ű�')" ).on("click" , function() {
			  		if(${empty sessionScope.me}){
						if (confirm("�α������̿밡���մϴ�.\n�α����Ͻðڽ��ϱ�?") == true){    //Ȯ��
							$("#my-dialog,#dialog-background").toggle();
							//self.location="/user/login";
						 }else{   //���

						     return;

						 }
					}else{
						self.location = "/complain/addComplain?meetingNo=${meeting.meetingNo}"
					}
				 
				}); 
			/*  $( "button:contains('����')" ).on("click" , function() {
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
					if (confirm("�����Ͻðڽ��ϱ�?") == true){    //Ȯ��
						$("#detailForm").attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/meeting/updateMeeting").submit();
						//self.location="/user/login";
					 }else{   //���

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
		 //////////////////* �����ϱ� �������� �α��� Ȯ�� �̺�Ʈ ó��  *////////////////
		 $( function() {
				$("button:contains('�����ϱ�')").click(function () {
					if(${empty sessionScope.me}){
						if (confirm("�α������̿밡���մϴ�.\n�α����Ͻðڽ��ϱ�?") == true){    //Ȯ��
							$("#my-dialog,#dialog-background").toggle();
							//self.location="/user/login";
						 }else{   //���

						     return;

						 }
					}else{
						$("#dialog2").toggle();
					}
				});
			});
		 /* �����ϱ� �������� �̺�Ʈ ó���κ� */
		 $( function() {
				$("button:contains('�����ϱ�')").click(function () {
					if(${empty sessionScope.me}){
						if (confirm("�α������̿밡���մϴ�.\n�α����Ͻðڽ��ϱ�?") == true){    //Ȯ��
							$("#my-dialog,#dialog-background").toggle();
							//self.location="/user/login";
						 }else{   //���

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
										if (confirm("���ӿ��� ���������մϴ�.\n�����Ͻðڽ��ϱ�?") == true){    //Ȯ��
											$("#dialog2").toggle();
										 }else{   //���
										     return;
										 }
									}else if(JSONData==486){
										alert("�̹� �����ϼ̽��ϴ�.");
									}
									else{
										alert("${meeting.meetingName} ${meetingAct.meetingActCount} ȸ\n���ӿ� �����Ǿ����ϴ�.");
										
									}
								}
						}); 
						
					}
					
				});
			});
		 
		 /* �����ڸ�� �������� �̺�Ʈ ó���κ� */
		 $( function() {
				$("button:contains('�����ڸ��')").click(function () {
					if(${empty sessionScope.me}){
						if (confirm("�α������̿밡���մϴ�.\n�α����Ͻðڽ��ϱ�?") == true){    //Ȯ��
							$("#my-dialog,#dialog-background").toggle();
							//self.location="/user/login";
						 }else{   //���

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
										if (confirm("���ӿ��� ���������մϴ�.\n�����Ͻðڽ��ϱ�?") == true){    //Ȯ��
											$("#dialog2").toggle();
										 }else{   //���
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
												display+="<a class='btn btn-primary btn' id='pushCancle3' role='button'>Ȯ&nbsp;��</a>"
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
		/*  //�����ϱ⿡�� ��� �������� �̺�Ʈ ó�� //*/
		 $( function() {
				$("#pushCancle2").click(function () {
					$("#dialog2").toggle();
				});
			});
		/*///////�����ڸ�Ͽ��� Ȯ�� �������� //////////////*/
		 $( function() {
				$("button.btn.btn-primary:contains('Ȯ&nbsp;��')").click(function () {
					alert("dd");
					$("#dialog3").toggle();
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
	<!-- ToolBar Start /////////////////////////////////////-->
    <jsp:include page="/layout/toolBar.jsp" />
    <!-- ToolBar End /////////////////////////////////////-->


	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<form id="detailForm">
	<input type="hidden" name="meetingNo" value="${meeting.meetingNo}">
	<input type="hidden" name="meetingCondition" value="DEL">
	</form>
	<div class="container" >
	
		<div class="page-header">
	       <h3 class=" text-info">getMeeting.jsp</h3>
	       <a id="update-dialog">�����ϱ�</a>
	       <button type="button" id="btn-delete-dialog">����</button>
	       <button type="button" id="complain">�Ű�</button>
	    </div>
	    <!-- ���â ������ �κ� -->
        <div id="dialog">
        <!-- //////////////////////////���â  �����/////////////////////////////////////////////////// -->
        	<form id="contentsForm" class="form-horizontal">
        	<input type="hidden" name="meetingNo" value="${meeting.meetingNo}">
				 <div  class="form-group col-sm-4 col-md-4">
				 	<select id="interest" class="form-control">
				 		<option >���ɻ�</option>
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
				 	<input type="text" class="form-control" id="centerMeeting" name="meetingCenter" data-param="${meeting.meetingCenter}" value="${meeting.meetingCenter}">
				 	
				 </div>
				 
				 <div class="form-group col-sm-10 col-md-10">
				 	<input type="file" class="form-control" name="imgFile" id="imgFile" value="${meeting.titleImg}">
				 </div>
				 
				 <div class="form-group col-sm-2 col-md-2">
				 	<button type="button" class="btn btn-warning" >÷������</button>
				 </div>
				 
				 <div class="form-group col-sm-12 col-md-12">
				 	<input type="text" class="form-control" name="meetingName" value="${meeting.meetingName}">
				 </div>
				 
				 <div class="form-group col-sm-12 col-md-12">
				 	<textarea class="form-control" cols="100" rows="3" 
				 	name="meetingDetail" placeholder="� �������� �������ּ���" >${meeting.meetingDetail}</textarea>
				 </div>
				 
				 <div class="form-group col-sm-12 col-md-12">
				 	<textarea class="form-control" cols="100" rows="3" 
				 	name="meetingRule" placeholder="���ӿ� ��Ģ�� �ֳ���? �ִٸ� ������ �����ּ���">${meeting.meetingRule}</textarea>
				 </div>
				 
				 <div class="form-group col-sm-8 col-md-8">
				 	�����ο��� �Է��Ͽ� �ּ���
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
				 		<option>�ݺ�����</option>
				 		<option value="Y" ${ ! empty meeting.snooze && meeting.snooze=='Y' ? "selected" : "" }>�ݺ�</option>
				 		<option value="N" ${ ! empty meeting.snooze && meeting.snooze=='N' ? "selected" : "" }>�ѹ�</option>
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
				 		<option value="12:00" ${ ! empty meeting.meetingTime && meeting.meetingTime=='12:00' ? "selected" : "" }>12:00</option>
				 		<option value="13:00" ${ ! empty meeting.meetingTime && meeting.meetingTime=='13:00' ? "selected" : "" }>13:00</option>
				 		<option value="14:00" ${ ! empty meeting.meetingTime && meeting.meetingTime=='14:00' ? "selected" : "" }>14:00</option>
				 	</select>
				 </div>
				 
				 <div class="form-group col-sm-8 col-md-8">
				 	ȸ�� �ִٸ� �Է����ּ���
				 </div>
				 
				 <div class="form-group col-sm-4 col-md-4">
				 	<input name="meetingDues" type="text" class="form-control" value="${meeting.meetingDues}">
				 </div>
				 
				 <div class="form-group col-sm-10 col-md-10">
				 <input name="meetingLocation" type="text" class="form-control" id="sample5_address" value="${meeting.meetingLocation}">
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
					 <a class="btn btn-primary btn" id="pushCancle" role="button">��&nbsp;��</a>
				   </div>
				 </div>
		</form>
		<!-- //////////////////////////���â  ����� ��/////////////////////////////////////////////////// -->
		</div>
	</div>
	
	<div class="container"> <!-- ����ū Ʋ -->
		<div class="row">
		
		  <div class="col-md-12">
		  	<img src="/resources/images/meeting/${meeting.titleImg}" width="600px" height="500px"/>
		  </div>
		  
		  <div class="col-md-12">
		  
		  	<div class="row">
	  			<div class="col-xs-4 col-md-3"><strong>���Ӽ���</strong></div><hr/>
				<div class="col-xs-8 col-md-3">${meeting.meetingDetail}</div>
			</div>
		
			<hr/>
		
			<div class="row">
		  		<div class="col-xs-5 col-md-3 "><strong>���ӱ�Ģ</strong></div><hr/>
				<div class="col-xs-7 col-md-3">${meeting.meetingRule}</div>
			</div>
			
			<hr/>
		  </div>
		</div>
		
		<hr/>
		${meetingAct.meetingActCount}ȸ�� ���� ����<br/>
		${meetingAct.meetingDate} ${meetingAct.meetingTime }<br/>
		${meetingAct.meetingLocation}<br/>
		${meetingAct.meetingDues}<br/>
		<button>�����ϱ�</button>
		<button>�����ڸ��</button>
		<hr/>
		<button>�����ϱ�</button>
		<!-- ���â ������ �κ� -->
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
		 	 placeholder="������ �Է����ּ���" ></textarea>
        	</div>
        	
        	<div class="form-group col-sm-12 col-md-12" align="center">
		 	<textarea id="interview" class="form-control" cols="100" rows="3" 
		 	 placeholder="������ �Է����ּ���" ></textarea>
		 	</div>
	        <div class="form-group col-sm-12 col-md-12" align="center">
	         <button type="button" class="btn btn-success"  >Ȯ &nbsp;��</button>
	         <a class="btn btn-primary btn" id="pushCancle2" role="button">��&nbsp;��</a>
	         </div>
	    </div>
        </form>
        <!-- ���â ������ �κ�  ��-->
        </div>
		<hr/>
		<hr/>
		<div >
			���Ӹ��${crewCount}��
			<input type="checkbox">�α��ε� ����� ����<br/>
			<ul>
			<c:forEach var="crew" items="${crewList}">
		 		<img class="first-slide" src="/resources/images/userprofile/${crew.masterProfileImg}" width="100px" height="100px"> ${crew.crewNickName}
		 		<c:if test="${crew.role=='MST' }">
					������
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
			ps.keywordSearch('${meeting.meetingLocation} ', placesSearchCB); 
		
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
	
	<div id="map" style="width:100%;height:350px;"></div>
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