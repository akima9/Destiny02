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
<link rel="stylesheet" href="/resources/css/rest.css" /> <!-- ����Ʈ ������ -->
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
    
    <link href="carousel.css" rel="stylesheet">
    
   <!-- �ɷ��� �Ϸ� -->

<!-- //All CSS Insert -->

<!-- All js -->
	<!--  ���ø� ����ϱ� ���� �ʿ��� js -->
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	
	 <style>
		#meetingNo {
			font-size: 30px;
		}
		
		
	</style>
	
	
	<script>
	$(function(){
		// �����ϱ� ������ �̺�Ʈ ó��
		$( "#addMeeting" ).on("click", function() {
			console.log("${empty sessionScope.me}");
			
			if('${sessionScope.me.userGrade }' !='NEW' && '${!empty sessionScope.me.userId}'){
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
		$( ".list_pop td:nth-child(3)" ).on("click", function() {
			var meetingNo = $(this).data("param");
			console.log(meetingNo);
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
		
	})
		
	</script>
<!-- //All js -->
	
	
	<style>
		
	</style>

</head>

<body class="subpage">	
	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->

<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- contents -->
	<section id="main" class="wrapper">
		<div class="inner">
		<div style="width:98%; margin-left:10px;">

        <form>
            <!-- ����Ʈ��ǰ ���̺� -->
            <table>
             <%--    ��� ��ž 
            <c:set var="i" value="0" />
				  <c:forEach var="meeting" items="${bestList}">
				  <c:set var="i" value="${ i+1 }" />
				  </c:forEach>
				   --%>
		<%-- <div id="myCarousel" class="carousel slide" data-ride="carousel">
			      <!-- Indicators -->
			      <ol class="carousel-indicators">
			        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			        <li data-target="#myCarousel" data-slide-to="1"></li>
			        <li data-target="#myCarousel" data-slide-to="2"></li>
			      </ol>
			      <div class="carousel-inner" role="listbox">
			        <div class="item active" align="center">
			          <img class="first-slide" src="/resources/images/meeting/romance2.jpg" alt="First slide"><!-- ù��° ���� -->
			          <div class="container">
			            <div class="carousel-caption">
			            	�������� �ް������ ���⿡
			              <h1>Example headline.</h1>
			              <p>Note: If you're viewing this page via a <code>file://</code> URL, the "next" and "previous" Glyphicon buttons on the left and right might not load/display properly due to web browser security rules.</p>
			              <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
			            </div>
			          </div>
			        </div>
			        <div class="item" align="center">
			          <img class="second-slide" src="/resources/images/meeting/classsicfashion2.jpg" alt="Second slide"><!-- �ι�° ���� -->
			          <!-- <div class="container">
			            <div class="carousel-caption">
			              <h1>Another example headline.</h1>
			              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
			              <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
			            </div>
			          </div> -->
			        </div>
			        <div class="item" align="center">
			          <img class="third-slide" src="/resources/images/meeting/conan2.jpg" alt="Third slide"><!-- ����° ���� -->
			          <!-- <div class="container">
			        	<div class="carousel-caption">
			              <h1>One more for good measure.</h1>
			              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
			              <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
			            </div> 
			          </div> -->
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
            </table>
             --%>
            <!-- /.carousel -->
            <!-- ����Ʈ��ǰ ���̺� ���� -->
            
            <br/>
            <!-- �˻�â ���� -->
            <table align="center" border="7" height="34px" bordercolor="#326ada">
            	<tr>
            		<td width='250px'>
	            		<input name="searchKeyword"  
	            		type="text" placeholder="�˻�� �Է�"/>
            		</td>
            		<td class='search' width='250px'>
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
            		</td>
            		<td id="location" class='search' width='250px'>
						<input id="sconcentering" type="text" class="form-control"> 
            		</td>
            		<td width='250px'>
            			<select id="interest" name="searchSortingOption" class="form-control">
					 		<option >���ɻ�</option>
					 		<c:forEach var="Meeting" items="${interlist}">
					 		
					 			<option value="${Meeting.interestName}">${Meeting.interestName }</option>
					 		
					 		</c:forEach>
				 		</select>
            		</td>
            		<td width='54px'><button type='button' id="plzsearch" class='sch_smit'>ã��</button></td>
            	</tr>
			</table>
			
			 <table class=search2 align="center" height="34px">
			 	
			 	  
			 </table>
		</form>	 
			 <!-- �˻�â ���� -->
			 
			 <!-- �����ϱ� ��ư ���� -->
			 <div align="right" class="addMeeting">
			 <button type="button" id="addMeeting">�����ϱ�</button>
			 </div>
			 <!-- �����ϱ� ��ư ���� -->
			 
			 <!-- ����Ʈ ���� -->

                <table class="listingTAB" width="100%" border="0" cellspacing="0" style="margin-top:10px;">
                    <tr>
                        <td colspan="11" align="left">
                           	<%--  ��ü ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage} ������ --%>
                        </td>
                    </tr>
                  
                    <tr>
                        <td colspan="15" bgcolor="808285" height="1"></td>
                    </tr>
                    
                    <c:set var="i" value="0" />
				 	 <c:forEach var="meeting" items="${list}">
				 	 <c:set var="i" value="${ i+1 }" />
                  
                    <tr>
                        <td valign="middle">
                            <img width="100px" src="/resources/images/meeting/${meeting.titleImg}" >
                        </td>
                        <td></td>
                        <td align="left" data-param="${meeting.meetingCenter}" data-param2="${meeting.meetingCenter}">
                        ${meeting.meetingCenter}
                        </td>
                        <td></td>
                        <td align="left">�����ο�</td>
                        <td></td>
                        <td align="left">${meeting.meetingCrewLimit}��</td>
                        <td></td>
                    </tr>
                    
                    <tr class="list_pop">
                    	<td>
                        </td>
                        <td></td>
                        <td id="meetingNo" align="left" data-param="${meeting.meetingNo}">
                        	${meeting.meetingName}
                        </td>
                        <td></td>
                        <td align="left">��ȸ��</td>
                        <td></td>
                        <td align="left">${meeting.meetingViews}ȸ</td>
                        <td></td>
                    </tr>
                    
                    <tr>
                    	<td>
                        </td>
                        <td></td>
                        <td align="left">
                        	���ӳ�¥:${meeting.meetingDate} �̹��������:${meeting.meetingLocation}
                        </td>
                        <td></td>
                        <td align="left"></td>
                        <td></td>
                        <td align="left"></td>
                        <td></td>
                    </tr>
                    
                    <tr>
                        <td colspan="15" bgcolor="D6D7D6" height="1"></td>
                    </tr>
                    
                   </c:forEach>
                  
                </table>
                <!-- ����Ʈ ���� -->
                <div class="landing">
              	<section id="one" class="wrapper style1">
				<div class="inner">
					<article class="feature left">
						<span class="image"><img src="/resources/images/meeting/pic01.jpg" alt="" /></span>
						<div class="content">
							<h2>Integer vitae libero acrisus egestas placerat  sollicitudin</h2>
							<p>Sed egestas, ante et vulputate volutpat, eros pede semper est, vitae luctus metus libero eu augue. Morbi purus libero, faucibus adipiscing, commodo quis, gravida id, est.</p>
							<ul class="actions">
								<li>
									<a href="#" class="button alt">More</a>
								</li>
							</ul>
						</div>
					</article>
					<article class="feature right">
						<span class="image"><img src="/resources/images/meeting/pic01.jpg" alt="" /></span>
						<div class="content">
							<h2>Integer vitae libero acrisus egestas placerat  sollicitudin</h2>
							<p>Sed egestas, ante et vulputate volutpat, eros pede semper est, vitae luctus metus libero eu augue. Morbi purus libero, faucibus adipiscing, commodo quis, gravida id, est.</p>
							<ul class="actions">
								<li>
									<a href="#" class="button alt">More</a>
								</li>
							</ul>
						</div>
					</article>
				</div>
			</section>
            </div>   
                <!-- PageNavigation Start... -->
                <table width="100%" border="0" cellspacing="0" style="margin-top:10px;">
                    <tr>
                        <td align="center">

                            <jsp:include page="../common/pageNavigator.jsp">
                                <jsp:param value="Product" name="type" />
                            </jsp:include>

                        </td>
                    </tr>

                </table>
                <!-- PageNavigation End... -->
            
        
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