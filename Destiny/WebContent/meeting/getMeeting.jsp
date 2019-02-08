<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- ���糯¥���ϱ� -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=54cfa5aea3e5609fcbb420ef8cd6ed4c&libraries=services"></script>
	<link rel="stylesheet" href="/resources/css/main.css" > <!-- �쿬���� -->
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
    <!--  ///////////////////////// ����Ʈ��Ŀ ����////////////////////////// -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <!--  ///////////////////////// ����Ʈ��Ŀ ���� ////////////////////////// -->
    
    <!--  ///////////////////////// Ÿ����Ŀ ////////////////////////// -->
	<link rel="stylesheet"
		href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<link rel="stylesheet"
		href="//cdn.rawgit.com/fgelinas/timepicker/master/jquery.ui.timepicker.css">
	<script
		src='//cdn.rawgit.com/fgelinas/timepicker/master/jquery.ui.timepicker.js'></script>
	    
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	

	.botton{
	 
	}
        #backround {
		    display: none;
		    position: fixed;
		    top: 0; left: 0;
		    width: 100%; height: 100%;
		    background: rgba(0,0,0,.3);
		    z-index: 10;
		}
		
		#dialog, #dialog2, #dialog3, #nextDialog {
		    display: none;
		    position: fixed;
		    left: calc( 35%); top: calc( 10% ); 
		    background: #fff;
		    z-index: 11;
		    padding: 10px;
		    max-height: 700px;
		    max-width: 350px;
		    overflow: auto;
		}
		
		#header{
			position : inherit;
		}
		
		.form-control{
			height: 38.5px;
		}
		.form-horizontal .form-group{
			margin-right: 0;
			margin-left: 0;
		}
		
		.ui-timepicker {
			font-size: 10px;
			width: 100px;
		}
		
		.ui-timepicker-table td a {
			width: 2em;
		}
     </style>
     

    
    <style>/* !!!��Ʈ����!!!!! */
	@import url(//fonts.googleapis.com/earlyaccess/nanumpenscript.css);
	@import url('https://fonts.googleapis.com/css?family=Cute+Font');
	 
	#bigletter span{
	     font-family: 'Nanum Pen Script', cursive;
	     font-size : 90px;
	}
	.imgmen{
		border-radius: 50%;
	}
	
	hr {    border-top: 1px solid #fff0;}
	strong { font-size : 30px}
	.neayong {
		font-family: 'Cute Font', cursive;
		font-size : 30px;
	}
	
	@media screen and (max-width:600px){	
		#dialog, #dialog2, #nextDialog{
		    left: calc( 5%);
		}
	}
	</style>
    
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	function loadMap(keyword){
		if(keyword ==null || keyword == ""){
			keyword = "��Ʈķ�� ���μ���";
		}
		
		
	
		var infowindow = new daum.maps.InfoWindow({zIndex:1});

		var mapContainer = document.getElementById('map2'), // ������ ǥ���� div 
		    mapOption = {
		        center: new daum.maps.LatLng(37.566826, 126.9786567), // ������ �߽���ǥ
		        level: 3 // ������ Ȯ�� ����
		    };  

		// ������ �����մϴ�    
		var map = new daum.maps.Map(mapContainer, mapOption); 

		// ��� �˻� ��ü�� �����մϴ�
		var ps = new daum.maps.services.Places(); 

		// Ű����� ��Ҹ� �˻��մϴ�
		ps.keywordSearch(keyword, placesSearchCB); 

		// Ű���� �˻� �Ϸ� �� ȣ��Ǵ� �ݹ��Լ� �Դϴ�
		function placesSearchCB (data, status, pagination) {
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
				console.log(place);
			    // ��Ŀ�� Ŭ���̺�Ʈ�� ����մϴ�
			    daum.maps.event.addListener(marker, 'click', function() {
			        // ��Ŀ�� Ŭ���ϸ� ��Ҹ��� ���������쿡 ǥ��˴ϴ�
			        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
			        infowindow.open(map, marker);
			        $('#place').val(place.road_address_name + ", "+ place.place_name );
			    });
		}
	}
	////////////////*�ε�� ȣ�� */////////
	$(function() {
		$("#placeSearch").on("click", function() {
			console.log($("#place").val());
			loadMap($("#place").val());
		});
	});
	
////////////////* Ÿ����Ŀ */////////
	$(function() {
		$('.timepicker').timepicker();
	});	
	
 ////////////////* ����Ʈ��Ŀ ������ ���� */////////
		$( function() {
		    $( ".datepicker" ).datepicker({
		    	dateFormat:"yy/mm/dd"
		    });
		} );
////////////////* �����ϱ⿡�� ��� */////////	    
		$(function() {
			//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
			 $( "#dialogConfrim" ).on("click" , function() {
				//alert(  $( "td.ct_btn01:contains('���')" ).html() );
				fncAddProduct();
		});
		
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
			var meetingDate=$("#reDate").val();
			var meetingDay=$("#weekday").val();
			var meetingTime=$("input[name='meetingTime']").val();
			var meetingLocation=$("input[name='meetingLocation']").val();
			var dt = new Date();
			var month = dt.getMonth()+1;
			var day = dt.getDate();
			var year = dt.getFullYear();
			var hours = dt.getHours();
			var minute = dt.getMinutes();
			var time = (hours + ':' +minute);
			var today = (year+'-0' +month + '-' + day+'-'+time);
			var mitingTime = ('${meetingAct.meetingDate}'+'-'+'${meetingAct.meetingTime }');
		
			//console.log("���ɻ�"+interestName);
			//console.log("���͹���"+centerMeeting);
			//console.log("���ü���"+meetingCenter);
			//console.log("Ÿ��Ʋ�̹���"+titleImg);
			//console.log("����"+meetingName);
			//console.log("����"+meetingDetail);
			//console.log("�ο�"+meetingCrewLimit);
			//console.log("������"+snooze);
			console.log("��¥"+meetingDate);
			//console.log("����"+meetingDay);
			//console.log("�ð�"+meetingTime);
			//console.log("���"+meetingLocation);
			console.log("����"+today);
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
				alert("��¥�� �����Ͽ� �ּ���.");
				return;
			}
			
			if (meetingDate<today) {
				alert("�߸� �� ��¥�Դϴ�.");
				return;
			}
			
			if(meetingTime == null && meetingTime=='���ӽð�'){
				alert("���ӽð��� �Է��Ͽ� �ּ���.");
				return;
			}
			
			if(meetingLocation == null){
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
		
////////////////////* ���� ���� ��� �������� �̺�Ʈ ó���κ� *////////////////////////////////////////
		 $( function() {
			 var meetingnickname = "${crewList['0'].crewNickName}"; 
			 var dt = new Date();
			 var month = dt.getMonth()+1;
			 var day = dt.getDate();
			 var year = dt.getFullYear();
			 var hours = dt.getHours();
			 var minute = dt.getMinutes();
			 var time = (hours + ':' +minute);
			 var today = "2019-02-14-14:00";/* (year+'-0' +month + '-' + day+'-'+time); */
			 var mitingTime = ('${meetingAct.meetingDate}'+'-'+'${meetingAct.meetingTime }');
			 /* ${meetingAct.meetingDate} ${meetingAct.meetingTime } */
			 console.log(today);
			 console.log(mitingTime);
			 console.log(mitingTime<today);
				
				$("button:contains('���� ���� ���')").click(function () {
					if('${empty sessionScope.me}'=='true'){
						if (confirm("�α������̿밡���մϴ�.\n�α����Ͻðڽ��ϱ�?") == true){    //Ȯ��
							$("#my-dialog,#dialog-background").toggle();
							//self.location="/user/login";
						 }else{   //���
						     return;
						 }
					}else if("${sessionScope.me.nickName eq crewList['0'].crewNickName}"=="false"){
						alert("�������� �ƴϽó׿�");
					}else if(mitingTime<today==false){
						alert("������������ ������ �ֽ��ϴ�.\n�Ϸ��� ����� �ּ���");
					}else{
						$("#nextDialog, #backround").toggle();
					}
					
				});
		 		 $( "button.btn.btn-primary:contains('�� &nbsp;��')" ).on("click" , function() {
					//Debug..
					//alert(  $( "td.ct_btn01:contains('���')" ).html() );
					fncAddProduct();
				}); 
			});		 
		///////////* ���� ���� �̺�Ʈ ó�� *//////////////
			
			 $( "#nextSchedul" ).on("click" , function() {
					alert("����")
					var meetingDate=$("#nextDay").val();
					var meetingTime=$("#nextTime").val();
					var meetingLocation=$(".nextLocation").val();
					var meetingDues=$("#nextDues").val();
					console.log(meetingDate);
					console.log(meetingTime);
					console.log(meetingLocation);
					console.log(meetingDues);
					
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
						
						//$("#nextDialogForm").attr("method" , "POST").attr("enctype","multipart/form-data").attr("action" , "/meeting/updateMeeting").submit();
						$.ajax( 
							 {
									url : "/meetingRest/nextMeeting",
									method : "post" ,
									dataType : "json" ,
									data : JSON.stringify({
										meetingNo : "${meeting.meetingNo}" ,
										meetingActCount : "${meetingAct.meetingActCount}",
										meetingDate :	meetingDate, 
										meetingLocation :	meetingLocation,
										meetingTime :	meetingTime,
										meetingDues :	meetingDues,
										
									}),
									headers : {
										"Accept" : "application/json",
										"Content-Type" : "application/json"
									},
									success : function(JSONData , status) {
										if(JSONData.result=="5018"){
											alert("someting wrong");
										}else{
											alert(JSONData.changeList.role);
											//alert(JSONData.Meeting.role);
											//alert(JSONData.Meeting);
											if (confirm(JSONData.changeList.meetingActCount+"ȸ ������ ��ϵǾ����ϴ�.") == true){    //Ȯ��
												//alert(JSONData.changeList);
												//alert(JSONData.changeAct);
												var change = "";
												change+="<span id='thisCount' data-param='${meetingAct.meetingActCount}'>"+JSONData.changeList.meetingActCount+"ȸ�� ���� ���� </span>";
												
												var changeList = "";
												changeList+="<img src='/resources/images/meeting/calendar.png' height='50px' alt='Pic 01' >";
												var changeList2 = "";
												changeList2+="<p>��¥ : "+JSONData.changeList.meetingDate+" "+JSONData.changeList.meetingTime+"</p><br/>";
												changeList2+="<p>��� : "+JSONData.changeList.meetingLocation+"</p><br/>";
												changeList2+="<p>ȸ�� :"+JSONData.changeList.meetingDues+"</p><br/>";
												
												$("#thisP").empty().html(change);
												$("#meetingActCount").empty().html(changeList);
												$("#meetingActCount2").empty().html(changeList2);
											 }else{   //���
											     return;
											 } 
											
											
										}
									}
							}); 
					     //document.removefrm.submit();

					 }else{   //���

						 $("#nextDialog, #backround").toggle();

					 }
				});
		
			 $( "#nextCancle" ).on("click" , function() {
				 $("#nextDialog, #backround").toggle();
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
									list+="<select readonly='readonly' name='meetingCenter' class='form-control'>";
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
	 
	 
		$( function() {
			var meetingnickname = ""; 
			var index111= "";
	
			$("a.thisName").click(function () {
				var indext = $(".thisName").index(this);
				meetingnickname = $( ".thisName:eq("+indext+")" ).data("param");
				index111 = $(".thisName").index(this);
				console.log("���� �ε���"+indext);
			});
			
			//=============���� Ŭ�� �� �̺�Ʈ ó��==================================//		
				$("a[href='#' ]:contains('�����ϱ�')").click(function () {
					console.log("�۰��� �ε���"+index111);
						var masterNick = "${crewList['0'].crewNickName}";
						console.log($(".thisName:eq("+index111+")").parent().remove());
					if(meetingnickname==masterNick){
						alert("�ڱ��ڽ��� �����ϼ̽��ϴ�\nŻ���Ͻðڽ��ϱ�?");
					}else{
						$.ajax( 
								 {
										url : "/meetingRest/getCrewrole",
										method : "post" ,
										dataType : "text" ,
										data : JSON.stringify({
											meetingNo : "${meeting.meetingNo}" ,
											meetingMasterId : "${sessionScope.me.userId}", 
											
										}),
										headers : {
											"Accept" : "application/json",
											"Content-Type" : "application/json"
										},
										success : function(JSONData , status) {
											
											if(JSONData=='MST'){
												if (confirm(meetingnickname+"���� �����Ͻðڽ��ϱ�?") == true){    //Ȯ��
													
													$.ajax( 
															 {
																	url : "/meetingRest/kickOut",
																	method : "post" ,
																	dataType : "json" ,
																	data : JSON.stringify({
																		meetingNo : "${meeting.meetingNo}" ,
																		crewNickName : meetingnickname,
																		crewCondition : "OUT",
																		meetingActCount : "${meetingAct.meetingActCount}",
																		
																	}),
																	headers : {
																		"Accept" : "application/json",
																		"Content-Type" : "application/json"
																	},
																	success : function(JSONData , status) {
																		
																		if(JSONData==2){
																			if (confirm(meetingnickname+" ���� ����Ǿ����ϴ�.") == true){    //Ȯ��
																				//console.log("�⼼�� �ε���"+index111);
																				//$(".thisName:eq("+index111+")").parent().remove();
																			 }else{   //���

																			     return;

																			 }
																			
																		}
																	}
															});
												
												 }else{   //���
												     return;
												 }
											}else {
												alert("�����常 �����մϴ�.");
											}
										}
								}); 
					}
					 
				}); 
		
			$("a:contains('����������')").click(function () {
				alert("����");
				console.log("���� �޴»��"+meetingnickname);

				popWin = window.open(
						"/letter/sendLetterView/"+meetingnickname,
						"popWin",
						"left=300, top=200, width=300, height=500, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");

			 });
			
			
				
			});
		 
		$( function() {
			var meetingnickname = ""; 
			$("a.thisName").click(function () {
				var indext = $(".thisName").index(this);
				meetingnickname = $( ".thisName:eq("+indext+")" ).data("param");
			});
			
			//==================���� Ŭ�� �� ���������� Ȯ��==================================//
				$("a[href='#' ]:contains('�����ϱ�')").click(function () {
						var masterNick = "${crewList['0'].crewNickName}";
						console.log(meetingnickname);
						console.log(masterNick);
						
					if(meetingnickname==masterNick){
						alert("�ڱ��ڽ��� �����ϼ̽��ϴ�\n�ٸ������ �������ּ���");
					}else{
						$.ajax( 
								 {
										url : "/meetingRest/getCrewrole",
										method : "post" ,
										dataType : "text" ,
										data : JSON.stringify({
											meetingNo : "${meeting.meetingNo}" ,
											meetingMasterId : "${sessionScope.me.userId}", 
											
										}),
										headers : {
											"Accept" : "application/json",
											"Content-Type" : "application/json"
										},
										success : function(JSONData , status) {
											
											if(JSONData=='MST'){
												if (confirm(meetingnickname+"�Կ��� �������� ���� �Ͻðڽ��ϱ�?") == true){    //Ȯ��
													$.ajax( 
															 {
																	url : "/meetingRest/passto",
																	method : "post" ,
																	dataType : "json" ,
																	data : JSON.stringify({
																		meetingNo : "${meeting.meetingNo}" ,
																		crewNickName : masterNick, /* ������ ���̵� */
																		role : "MST",
																		targetId : meetingnickname, /* Ÿ�� ���̵� */
																		
																	}),
																	headers : {
																		"Accept" : "application/json",
																		"Content-Type" : "application/json"
																	},
																	success : function(JSONData , status) {
																		
																		if(JSONData==2){
																			alert(meetingnickname+" ���� �������̵Ǿ����ϴ�.");
																		}
																	}
															}); 
												 }else{   //���
												     return;
												 }
											}else {
												alert("�����常 �����մϴ�.");
											}
										}
								}); 
					}
					 
				});
			});
//////////////////////////////////////////////////////////////////////////////////////////////////////////////			

///////////////////////////////* �����ϱ� �������� �̺�Ʈ ó���κ� *///////////////////
		 $( function() {
				$("button:contains('�����ϱ�')").click(function () {
					var count = $("#thisCount").data("param");
					if('${empty sessionScope.me}'=='true'){
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
									meetingActCount : count,
									
								}),
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData , status) {
									if(JSONData==5018){
										if (confirm("���ӿ��� ���������մϴ�.\n�����Ͻðڽ��ϱ�?") == true){    //Ȯ��
											$("#dialog2, #backround").toggle();
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

		 $( function() {
				/////////////////* �����ڸ�� �������� �̺�Ʈ ó���κ� */
				$("button:contains('�����ڸ��')").click(function () {
					var count = $("#thisCount").data("param");
					console.log(count);
					
					if('${empty sessionScope.me}'=='true'){
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
									meetingActCount : count,
								}),
								headers : {
									"Accept" : "application/json",
									"Content-Type" : "application/json"
								},
								success : function(JSONData , status) {
									if(JSONData.result==0){
										if (confirm("���ӿ��� ���������մϴ�.\n�����Ͻðڽ��ϱ�?") == true){    //Ȯ��
											$("#dialog2, #backround").toggle();
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
												display+="<button id='joinerConfirm' role='button'>Ȯ��</button>"
												display+="</h6>";
												
										console.log(display);	
										$( ".actCrewList" ).html(display);
										$("#dialog3, #backround").toggle();
										
									}
								}
						}); 
						
					}
					 
				});
				/////         ������ ��!!!!!!!!!!!                  ////
				
				/////////////////���׶���////////////////////
		 		$("#backround").click(function () {
					//alert("dd");
					$("#backround,#dialog2,#dialog,#dialog3,#nextDialog").hide();
				});
				//////////////////���׶��� ��!!!!!!!/////////////////
				//=============�°�
				$("button:contains('�°�')").click(function () { 	
					if('${empty sessionScope.me}'=='true'){
						if (confirm("�α������̿밡���մϴ�.\n�α����Ͻðڽ��ϱ�?") == true){    //Ȯ��
							$("#my-dialog,#dialog-background").toggle();
							//self.location="/user/login";
						 }else{   //���

						     return;

						 }
					}else{
						
				
						$.ajax( 
							 {
									url : "/meetingRest/takeOver",
									method : "post" ,
									dataType : "json" ,
									data : JSON.stringify({
										meetingNo : "${meeting.meetingNo}" ,
										meetingMasterId : "${sessionScope.me.userId}", 
										role : "MST",
									}),
									headers : {
										"Accept" : "application/json",
										"Content-Type" : "application/json"
									},
									success : function(JSONData , status) {
										if(JSONData.result==0){
											alert("���ӿ��� �ƴϽó׿�");
											
										}else {
											alert("������ ����~~");
											self.location="/meeting/getMeeting?meetingNo="+${meeting.meetingNo};
											
										}
									}
							}); 
						
					}//else ��!!
					
				});
			});
		
		$(function () {
			///////////      ������ Ȯ�� ��������    ////////////
			$(document).on("click","#joinerConfirm",function(){
				$("#dialog3, #backround").toggle();
			});
		});

	</script>
	
	<!-- ���� ���� -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<!-- <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=54cfa5aea3e5609fcbb420ef8cd6ed4c"></script> -->
	<script>
	
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
	    
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                var addr = data.address; // ���� �ּ� ����
	
	                // �ּ� ������ �ش� �ʵ忡 �ִ´�.
	                document.getElementById("sample6_address").value = addr;
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
    <jsp:include page="/layout/header.jsp" />
    <!-- ToolBar End /////////////////////////////////////-->


	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<form id="detailForm">
	<input type="hidden" name="meetingNo" value="${meeting.meetingNo}">
	<input type="hidden" name="meetingCondition" value="DEL">
	</form>
	<div class="container" >
		<div class="col-xs-12 col-sm-12 col-md-12 neayong" align="center" id="bigletter">
		  	<span>${meeting.meetingName}</span><br/>
		  	<img src="/resources/images/meeting/family.png" width="50px" height="50px"/>
		  	${meeting.interestName}
		  	
		</div>

		<c:if test="${crewList['0'].role != 'MST'}">	

		 <div class="page-header">
		<c:set var="now" value="<%=new java.util.Date()%>" />
		<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy-mm-dd" /></c:set> 
	       <h3 class=" text-info">
	       	<p>�������� �������Ф�</p> 
	       	<p>�������� �°����� ������ </p> 
	       	<p>������ ���� �� �����Դϴ�.</p> 
	       </h3>
	       <button type="button" id="btn-takeOver">�°�</button>
	      <!-- <img src="/resources/images/meeting/master2.png" width="50px" height="50px"/> be a master -->
	    </div>
		</c:if>

		<div class="row">
		  <div class="col-md-12">
		  	<img src="/resources/images/meeting/${meeting.titleImg}" class="col-xs-12 col-md-12"/>
		  </div>
		  
		  <div class="col-md-12">
		  
		  	<div class="row"><br/>
	  			<div class="col-xs-4 col-md-4"><strong>Who I'm</strong></div><hr/>
				<div style="white-space:pre;" class="col-xs-8 col-md-8 neayong">${meeting.meetingDetail}</div>
			</div>
			<hr/>
			<div class="row">
		  		<div class="col-xs-5 col-md-5 "><strong>Rule</strong></div><hr/>
				<div style="white-space:pre;" class="col-xs-7 col-md-7 neayong">${meeting.meetingRule}</div>
			</div>
			<hr/>
		  </div>
		 </div>
		<c:if test="${crewList['0'].role=='MST'}">	
		<div class='row'>
			<table class="col-sm-12 col-md-12">
				<tr>
					<td id="thisP">
					<span id="thisCount" data-param="${meetingAct.meetingActCount}"> ${meetingAct.meetingActCount}ȸ�� ���� ���� </span>
					</td>
				</tr>
			</table>
		</div>	
		

		<div>
			<div class='row'>
				<div id="meetingActCount" align="center" class="col-xs-2 col-md-2 ">
					<img src="/resources/images/meeting/calendar.png" height="50px" alt="Pic 01" >
				</div>
				
				<div id="meetingActCount2" class="col-xs-6 col-md-6 ">
				<p> ��¥ : ${meetingAct.meetingDate} ${meetingAct.meetingTime } </p>
				<p> ��� : ${meetingAct.meetingLocation} </p>
				<p> ȸ�� : ${meetingAct.meetingDues} </p>
				</div>
			
				<div class="col-xs-4 col-md-4 ">
					<div align="center">
					<button class="button small">�����ϱ�</button>
					<button class="button small">�����ڸ��</button><hr/>
					</div>
					<c:if test="${meeting.snooze=='Y'}">
						<div align="center">
							<button  class="button small" type="button" id="nextMeeting">���� ���� ���</button>
						</div>
					</c:if>
				</div>	
			</div>
			<div class='row'>
			<!-- �������� -->
			<div id="map" style="width:70%;height:350px;"></div>

			
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
			geocoder.addressSearch('${meetingAct.meetingLocation}', function(result, status) {
			
			    // ���������� �˻��� �Ϸ������ 
			     if (status === daum.maps.services.Status.OK) {
			
			        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
			
			        // ��������� ���� ��ġ�� ��Ŀ�� ǥ���մϴ�
			        var marker = new daum.maps.Marker({
			            map: map,
			            position: coords
			        });
			/* 
			        // ����������� ��ҿ� ���� ������ ǥ���մϴ�
			        var infowindow = new daum.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">�츮ȸ��</div>'
			        });
			        infowindow.open(map, marker);
			 */
			        // ������ �߽��� ��������� ���� ��ġ�� �̵���ŵ�ϴ�
			        map.setCenter(coords);
			    } 
			}); 
			</script>
			<!-- �������� �� -->
			</div>
			
		</div>
		</c:if>
	
		<hr/>
		<div align="center" class="col-xs-12 col-md-12 ">
			<button class="button" style="margin-bottom: 30px; width: 100%;">�����ϱ�</button>
		</div>
		
		<jsp:include page="/meeting/modal.jsp" />
		<!-- ���â ������ �κ� :: �����ϱ� ���â -->
        <div id="dialog2" class="madal">
        <form id="dialog2form" class="form-horizontal">
        <div>
        	<div name="meetingMasterId" value="${sessionScope.me.userId}" class="form-group col-sm-12 col-md-12" align="center">
        		<img src="/resources/images/userprofile/${sessionScope.me.profile}" width="100px" height="100px" class="imgmen"/>
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
	         <a type="button" class="btn btn-success"  >Ȯ &nbsp;��</a>
	         <a class="btn btn-primary btn cancelbtn" id="pushCancle2" role="button">��&nbsp;��</a>
	         </div>
	    </div>
        </form>
        <!-- ���â ������ �κ�  ��-->
        </div>

		<div >
			<table>
				
				<tr>
					<td>
					���Ӹ��${crewCount}��
					</td>
				</tr>
				
				<tr>
					<td>
					
					<c:forEach var="crew" items="${crewList}">
					
					 		<div class="dropdown">
					 			<div class="col-xs-12 col-sm-12 col-md-12">
						 			<img src="/resources/images/userprofile/${crew.masterProfileImg}" style="height: 50px; margin-bottom: 6px;"  class="col-xs-4 col-sm-1 col-md-1 imgmen">
									<a href="#" class="dropdown-toggle thisName col-xs-2 col-sm-4 col-md-4" data-param="${crew.crewNickName}" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> 
										<span id="masterNick" data-param="${crew.crewNickName}">${crew.crewNickName}</span>
										<span class="caret"></span>
									</a>
									<a class="col-xs-1 col-sm-4 col-md-4"></a>
									<c:if test="${crew.role=='MST' }"><span><strong class="col-xs-5 col-sm-3 col-md-3">������</strong></span></c:if>
									
								
								<ul class="dropdown-menu">
									<c:if test="${sessionScope.me.nickName eq crewList['0'].crewNickName }">
										<li><a href="#">�����ϱ�</a></li>
										<li><a href="#">�����ϱ�</a></li>
									</c:if>
										<li><a>����������</a></li>
								</ul>
								</div>
							</div>
					</c:forEach>
					</td>
				</tr>
			</table>
		</div>
		
<!--=======================������ ��� ���â================-->
		<div id="dialog3">
			<div class="actCrewList">
				<form id="dialog3From" class="form-horizontal">
				
				</form>
			</div>
		</div>
		
	</div>
	
			<!-- footer -->
		<jsp:include page="/layout/footer.jsp" />
		<!-- //footer -->

	<!-- ////////////////      ���ϸ� ������ �޴� ����             ////////////////////// -->

		    <jsp:include page="/meeting/tapMeun.jsp" />

	<!-- ////////////////      ���ϸ� ������ �޴� ����             ////////////////////// -->
		    <!-- �����ϱ� ���â  -->
        <div id="dialog" class="modal">
        <!-- //////////////////////////���â  �����/////////////////////////////////////////////////// -->
        	<form id="contentsForm" class="form-horizontal">
        	<div id="nextdelete">
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
				 	<input style="width: 100%" name="interestName" id="selectedInterest" type="text" class="form-control" value="${meeting.interestName}">
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
				 	<input style="width: 100%" type="text" class="form-control" id="centerMeeting" name="meetingCenter" data-param="${meeting.meetingCenter}" value="${meeting.meetingCenter}">
				 	
				 </div>
				 
				 <div class="form-group col-sm-12 col-md-12">
				 	<input type="file" class="form-control" name="imgFile" id="imgFile" value="${meeting.titleImg}">
				 </div>
				 
				 <div class="form-group col-sm-12 col-md-12">
				 	<input style="width: 100%" type="text" class="form-control" name="meetingName" value="${meeting.meetingName}">
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
				 
				 <div class="form-group col-sm-12 col-md-12">
				 	<select style="width: 100%;" name="snooze" id="snooze" class="form-control">
				 		<option>�ݺ�����</option>
				 		<option value="Y" ${ ! empty meeting.snooze && meeting.snooze=='Y' ? "selected" : "" }>�ݺ�</option>
				 		<option value="N" ${ ! empty meeting.snooze && meeting.snooze=='N' ? "selected" : "" }>�ѹ�</option>
				 	</select>
				 </div>
			</div>	 
				 <div  id="dateOrDay" class="form-group col-sm-12 col-md-12">
		 			<input style="width: 100%;padding-left: 0px;padding-right: 0px;" type="text" class="datepicker" readonly="readonly" class="form-control" placeholder="���ӳ�¥" id="reDate" name="meetingDate"/>
		 	
				 	<!--  
				 	<select class="form-control">
				 		<option value="">���ӳ�¥or����</option>
				 	</select>
				 	-->
				 </div>
				 
				 <div class="form-group col-sm-12 col-md-12">
				 	<input style="width: 100%;" type="text" readonly="readonly"
					class='form-control timepicker' name="meetingTime"
					placeholder="�ð��� ������ �ּ���.">
				 </div>
				 
				 <div class="form-group col-sm-12 col-md-12">
				 	ȸ�� �ִٸ� �Է����ּ���
				 </div>
				 
				 <div class="form-group col-sm-12 col-md-12">
				 	<input style="width: 100%;" name="meetingDues" placeholder="ex)ȸ�� 1����" type="text" class="form-control" value="${meeting.meetingDues}">
				 </div>
				 
				 <div class="form-group col-sm-12 col-md-12">
					<input style="width: 100%;" name="meetingLocation" type="text" class="form-control"
						id="place" placeholder="�ּҸ� �˻����ּ���.">
				</div>
	
				<div class="form-group col-sm-12 col-md-12">
					<input style="width: 100%;" type="button" class="btn btn-warning"
						 id="placeSearch" value="�ּ� �˻�"><br>
				</div>
				  
				 <div class="form-group">
				   <div class="col-sm-12 col-md-12 text-center">
				     <button class="col-sm-6 col-md-6 text-center"  id="dialogConfrim">Ȯ&nbsp;��</button>
					 <button class="col-sm-6 col-md-6 text-center" >��&nbsp;��</button>
				   </div>
				 </div>
				 
				 <div id="map2" style="width:100%;height:350px;"></div>
		</form>
		<!-- //////////////////////////���â  ����� ��/////////////////////////////////////////////////// -->
		</div>
		<div id="backround"></div>
		
</body>

</html>