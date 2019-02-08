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
<link rel="stylesheet" href="/resources/css/main.css" > <!-- �쿬���� -->	



	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	
   
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	

	
	
	<!-- Bootstrap core CSS -->

    
   <!-- �ɷ��� �Ϸ� -->

<!-- //All CSS Insert -->

<!-- All js -->
	<!--  ���ø� ����ϱ� ���� �ʿ��� js -->
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	
	
	
	
	 <style>
	 body {
	 	background-color: #fff;
	 	
	 }
	 
	 #one{
	 	padding: 0;
	 }
	 
	 #lol{
	 	margin-top: 350px;
	 }
	 
	 /* �����ɷ��� */
	 .col-centered {
		    float: none;
		    margin: 0 auto;
		}
		
		.carousel-control { 
		    width: 8%;
		    width: 0px;
		}
		.carousel-control.left,
		.carousel-control.right { 
		    margin-right: 40px;
		    margin-left: 32px; 
		    background-image: none;
		    opacity: 1;
		}
		.carousel-control > a > span {
		    color: white;
			  font-size: 29px !important;
		}
		
		.carousel-col { 
		    position: relative; 
		    min-height: 1px; 
		    padding: 5px; 
		    float: left;
		 }
		
		 .active > div { display:none; }
		 .active > div:first-child { display:block; }
		
		/*xs*/
		@media (max-width: 767px) {
		  .carousel-inner .active.left { left: -50%; }
		  .carousel-inner .active.right { left: 50%; }
			.carousel-inner .next        { left:  50%; }
			.carousel-inner .prev		     { left: -50%; }
		  .carousel-col                { width: 50%; }
			.active > div:first-child + div { display:block; }
		}
		
		/*sm*/
		@media (min-width: 768px) and (max-width: 991px) {
		  .carousel-inner .active.left { left: -50%; }
		  .carousel-inner .active.right { left: 50%; }
			.carousel-inner .next        { left:  50%; }
			.carousel-inner .prev		     { left: -50%; }
		  .carousel-col                { width: 50%; }
			.active > div:first-child + div { display:block; }
		}
		
		/*md*/
		@media (min-width: 992px) and (max-width: 1199px) {
		  .carousel-inner .active.left { left: -33%; }
		  .carousel-inner .active.right { left: 33%; }
			.carousel-inner .next        { left:  33%; }
			.carousel-inner .prev		     { left: -33%; }
		  .carousel-col                { width: 33%; }
			.active > div:first-child + div { display:block; }
		  .active > div:first-child + div + div { display:block; }
		}
		
		/*lg*/
		@media (min-width: 1200px) {
		  .carousel-inner .active.left { left: -25%; }
		  .carousel-inner .active.right{ left:  25%; }
			.carousel-inner .next        { left:  25%; }
			.carousel-inner .prev		     { left: -25%; }
		  .carousel-col                { width: 25%; }
			.active > div:first-child + div { display:block; }
		  .active > div:first-child + div + div { display:block; }
			.active > div:first-child + div + div + div { display:block; }
		}
		
		.block {
			width: 306px;
			height: 230px;
		}
		
		.red {background: red;}
		
		.blue {background: blue;}
		
		.green {background: green;}
		
		.yellow {background: yellow;}
	 /* �����ɷ��� ��!! */
	/*  ���ι�׶��� */
	 	#loading {
		 width: 100%;  
		 height: 100%;  
		 top: 0px;
		 left: 0px;
		 position: fixed;  
		 display: block;  
		 opacity: 0.7;  
		 background-color: #fff;  
		 z-index: 99;  
		 text-align: center; 
	} 
	  
	#loading-image {  
		 position: absolute;  
		 top: 50%;  
		 left: 50%; 
		 z-index: 100; 
	}
	.representImg{
		margin-top : 1em;
		width : 25%;
		height : 20em;
		padding : 1em;
		text-align : center;
		border : 1px solid #a9a9a9;
		border-radius : 5px;
	}
	.representImg img{
		width : 80%;
	}
	.topImg{
		display : block;
		position : absolute;
		top : 0;
		background-image : url("/resources/images/background/meetingbg.jpg");
		background-repeat : no-repeat;
		background-position : center -400px;
		background-size : cover;
		width : 100%;
		height : 400px;
	}
	.topImg::before{
		content : "";
		background : rgba(0, 0, 0, 0.2);
		position : absolute;
		top : 0;
		left : 0;
		width : 100%;
		height : 400px;
	}
	.topImg h1{
		position : absolute;
		line-height : 330px;
		width : 100%;
		text-align : center;
		color : white;
		z-index : 99;
		font-size : 60px;
	}
	h1 .slim{font-weight : lighter;}
	
	.smallNavi{
		overflow : hidden;
		float : right;
	}
	
	.smallNavi li{
		float : left;
	}
	.updateForm{
		padding : 25em 0 10em 0;
	}
	
	
	 /*  ���ι�׶��� ��! */
	 
	 
	 
	
	
	</style>
	
	
	<script>
	$(function(){
		
		/* ���ư��� ���� �ɷ��� */
		
		
		$('.carousel[data-type="multi"] .item').each(function() {
			var next = $(this).next();
			if (!next.length) {
				next = $(this).siblings(':first');
			}
			next.children(':first-child').clone().appendTo($(this));

			for (var i = 0; i < 2; i++) {
				next = next.next();
				if (!next.length) {
					next = $(this).siblings(':first');
				}

				next.children(':first-child').clone().appendTo($(this));
			}
		});
		/* ���ư��� ���� �ɷ��� ��!!!!!!!!!!!!! */
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		// �����ϱ� ������ �̺�Ʈ ó��
		$( "#addMeeting" ).on("click", function() {
			console.log("${empty sessionScope.me}");
			
			if('${sessionScope.me.userGrade }' !='NEW' && ${!empty sessionScope.me.userId}){
				//alert("����");
				self.location="/meeting/addMeeting"
			}else if('${empty sessionScope.me}'=='true'){
				if (confirm("�α������̿밡���մϴ�.\n�α����Ͻðڽ��ϱ�?") == true){    //Ȯ��
					$("#my-dialog,#dialog-background").toggle();
					//self.location="/user/login";
				 }else{   //���
				     return;
				 }
			}else if('${sessionScope.me.userGrade }'=='NEW'){
				alert("${sessionScope.me.nickName}���� �쿬����Դϴ�.\n�ο��̻� ȸ������ ���� �ϴ��մϴ�.");
			}else{
				alert("�̿� �Ұ��մϴ�.");
			}
		});
		
		//���񴭷����� �̺�Ʈ ó��
		/* $( ".list_pop td:nth-child(3)" ).on("click", function() {
			var meetingNo = $(this).data("param");
			console.log(meetingNo);
			self.location="/meeting/getMeeting?meetingNo="+meetingNo;
		}); */
		$("a[href='#' ]:contains('More')").on("click", function() {
			var meetingNo = $(this).data("param");
			//console.log(meetingNo);
			self.location="/meeting/getMeeting?meetingNo="+meetingNo;
		});
		
		//�ñ��� ������ �ִ� �� 
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
							list+="<select  id='centering' name='meetingCenter' class='form-control'>";
							list+="<option>��/��/�� ����</option>";
							for(i in JSONData.list){
								var town = JSONData.list[i].townName;
								
								list+="<option id='centerMeeting' name='searchCondition' data-param='$(this).value' value='"+town+"'>"+town+"</option>";
						}
							$( "#location" ).empty().append(list);
						}
				});
		});
		
		//�˻��� �̺�Ʈ ó��
		$( "#plzsearch" ).on("click" , function() {
   		 var meetingCenter=$("#centering").val();
   		 var seconCenter=$("#sconcentering").val();
   		 var interest=$("#interest").val();
   		 console.log(meetingCenter);
   		 console.log(interest);
   		 console.log(seconCenter);
   		 if(interest=='���ɻ�'){
   			 $("#interest").val("");
   		 }
   		 if(meetingCenter=="" || seconCenter==""){
   			 //alert("�����ο��� �����Ͽ� �ּ���.");
   			 meetingCenter="�ƴ�";
   		 }
   		$("form").attr("method" , "POST").attr("action" , "/meeting/listMeeting/"+meetingCenter).submit();
		 });
		
	});
		
	</script>
<!-- //All js -->
	
	
	<style>
		
	</style>

</head>

<body>	
	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->

<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- contents -->

	
		<div class="topImg">
			<h1>�츮����<span class="slim">����</span></h1>
		</div>
		
	 <!-- ����Ʈ��ǰ ���̺� -->
         <%--    <table>

            	  <c:set var="i" value="0" />
				  <c:forEach var="meeting" items="${bestList}">
				  <c:set var="i" value="${ i+1 }" />
				  </c:forEach>

			<div id="myCarousel" class="carousel slide " data-ride="carousel">
			      <!-- Indicators -->
				 <div class="carousel-inner" role="listbox">
			        <div class="item active col-xs-12 col-sm-12" align="center">
			          <img  class="first-slide" src="/resources/images/meeting/${bestList[0].titleImg}" style="width:auto; height: 400px;" alt="First slide"><!-- ù��° ���� -->
					
			        </div>
			        <div class="item col-xs-12 col-sm-12" align="center">
			          <img class="second-slide" src="/resources/images/meeting/${bestList[1].titleImg}" style="width:auto; height: 400px;" alt="Second slide"><!-- �ι�° ���� -->

			        </div>
			        <div class="item col-xs-12 col-sm-12" align="center">
			          <img class="third-slide" src="/resources/images/meeting/${bestList[2].titleImg}" style="width:auto; height: 400px;" alt="Third slide"><!-- ����° ���� -->
			        </div>
			      </div> 
			      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
			        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			        <span class="sr-only">Previous</span>
			      </a>
			      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
			        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			        <span class="sr-only">Next</span>
			      </a> 
			   </div>
            </table> --%>
            
            <!-- /.carousel -->
            <!-- ����Ʈ��ǰ ���̺� ���� -->
            	<section id="main" class="wrapper">	
            			 <!-- ����!! -->
		<%-- <div class="col-xs-11 col-md-10 col-centered">
					  <c:set var="i" value="0" />
					  <c:forEach var="meet" items="${bestList}">
					  <c:set var="i" value="${ i+1 }" />
					  </c:forEach>
					  
			<div id="carousel" class="carousel slide" data-ride="carousel" data-type="multi" data-interval="2500">
				<div class="carousel-inner">
					<div class="item active">
						<div class="carousel-col">
							<!-- <div class="block red img-responsive"></div> -->
							<img class="block" src="/resources/images/meeting/action.jpg" style="width:150px; height: 230px;" alt="First slide">
						</div>
					</div>
					
					<div class="item">
						<div class="carousel-col">
							<!-- <div class="block red img-responsive"></div> -->
							<img class="block" src="/resources/images/meeting/${bestList[1].titleImg}" style="width:150px; height: 230px;" alt="First slide">
							
						</div>
					</div>
					
					<div class="item">
						<div class="carousel-col">
							<!-- <div class="block red img-responsive"></div> -->
							<img class="block" src="/resources/images/meeting/action.jpg"" style="width:150px; height: 230px;" alt="First slide">
						</div>
					</div> --%>
					<!-- 
					<div class="item">
						<div class="carousel-col">
							<div class="block green img-responsive"></div>
						</div>
					</div>
					<div class="item">
						<div class="carousel-col">
							<div class="block blue img-responsive"></div>
						</div>
					</div>
					<div class="item">
						<div class="carousel-col">
							<div class="block yellow img-responsive"></div>
						</div>
					</div>
					 
				</div>-->

				<!-- Controls -->
				<!-- <div class="left carousel-control">
					<a href="#carousel" role="button" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a>
				</div>
				<div class="right carousel-control">
					<a href="#carousel" role="button" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div> 

		</div>-->

	<!-- ��!! -->		
            

		<div  class="landing">
		<div style="width:98%; margin-left:10px;">

        <form>
            <br/>
            <!-- �˻�â ���� -->
            <div style="margin-bottom: 30px;" id="lol" align="center" border="7" height="34px" bordercolor="#326ada" class="row col-xs-12 col-sm-12 col-md-12">

            		<div class="col-xs-12 col-sm-12 col-md-4">
	            		<input name="searchKeyword"  
	            		type="text" placeholder="�˻�� �Է�" style="width: 100%"/>
            		</div>
            		<div class='search col-xs-12 col-sm-12 col-md-2'>
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
            		<div id="location" class='search col-xs-12 col-sm-12 col-md-2'>
						<input readonly="readonly" id="sconcentering" type="text" class="form-control" style="width: 100%"> 
            		</div>
            		<div class="col-xs-12 col-sm-12 col-md-2">
            			<select id="interest" name="searchSortingOption" class="form-control">
					 		<option >���ɻ�</option>
					 		<c:forEach var="Meeting" items="${interlist}">
					 		
					 			<option value="${Meeting.interestName}">${Meeting.interestName }</option>
					 		
					 		</c:forEach>
				 		</select>
            		</div>
            		<div class="col-xs-12 col-sm-12 col-md-2"><input type='button' id="plzsearch" class='sch_smit search-btn' value="ã��"></div>
			</div>
		</form>	 
			 <!-- �˻�â ���� -->
			 
 
			 
			 <!-- �����ϱ� ��ư ���� -->
			 
			 <!-- �����ϱ� ��ư ���� -->
			 
			 <!-- ����Ʈ ���� -->
                <div>
	              	<section style="align-content:center;" id="one" class="wrapper style1">
						<div class="inner">
						<div align="right" class="addMeeting">
						 	<input type="button" id="addMeeting" value="�����ϱ�">
						 </div>
							<c:set var="i" value="0" />
						 	<c:forEach var="meeting" items="${list}">
						 	<c:set var="i" value="${ i+1 }" />
						 	<hr/>
						 	
							<article class="feature left">
								<div class="image"><img src="/resources/images/meeting/${meeting.titleImg}" class="col-xs-12 col-sm-12 col-md-12" alt="" /></div>
								<div class="content">
									<p>${meeting.meetingCenter}<p>
									<h2>${meeting.meetingName}</h2>
									<p>�������� /${meeting.meetingCrewLimit}��      ��ȸ�� ${meeting.meetingViews}ȸ</p>
									<p>���ӳ�¥:${meeting.meetingDate}</p>
									<p>�̹��������:${meeting.meetingLocation}</p>
									<ul class="actions">
										<li>
											<a href="#" data-param="${meeting.meetingNo}" class="button">More</a>
										</li>
									</ul>
								</div>
							</article>
							
							</c:forEach>
							 
						</div>
					</section>
            	</div>   
       		<!-- ����Ʈ ���� -->
    </div>
	
		
			
		</div>
	</section>
	<!-- //contents -->
<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->

	<!-- footer -->
	<jsp:include page="/layout/footer.jsp" />
	<!-- //footer -->
	            
	
</body>
</html>