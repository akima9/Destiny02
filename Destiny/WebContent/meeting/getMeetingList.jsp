<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>



<!DOCTYPE html>

<html lang="ko">

<head>
    <meta charset="EUC-KR">

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>��ǰ �����ȸ</title>
    
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <!-- ���� : http://getbootstrap.com/css/   ���� -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    <!-- Bootstrap Dropdown Hover CSS -->
    <link href="/css/animate.min.css" rel="stylesheet">
    <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
    <script src="/javascript/bootstrap-dropdownhover.min.js"></script>


    <!-- jQuery UI toolTip ��� CSS-->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <!-- jQuery UI toolTip ��� JS-->
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <!--  ///////////////////////// CSS ////////////////////////// -->
    <style>
        body {
            padding-top : 50px;
        }
    </style>
    
    <style>
		.green_window {
			display: inline-block;
			width: 366px; height: 34px;
			border: 3px solid #326ada;
			background: white;
		}
		.input_text {
			width: 348px; height: 21px;
			margin: 6px 0 0 9px;
			border: 0;
			line-height: 21px;
			font-weight: bold;
			font-size: 16px;
			outline: none;
		}
		.sch_smit {
			width: 54px; height: 34px;
			margin: 0; border: 0;
			background: #326ada;
			color: white;
			font-weight: bold;
			border-radius: 3px;
			cursor: pointer;
		}
		.sch_smit:hover {
			background: 	#433e90;
		}
	</style>

    <script type="text/javascript">
		    $(function() {
				$( "#addMeeting" ).on("click", function() {
					console.log("${empty sessionScope.me}");
					
					if(${sessionScope.me.userGrade !='NEW'} && ${!empty sessionScope.me.userId}){
						//alert("����");
						self.location="/meeting/addMeeting"
					}else if(${empty sessionScope.me}){
						if (confirm("�α������̿밡���մϴ�.\n�α����Ͻðڽ��ϱ�?") == true){    //Ȯ��
							$("#my-dialog,#dialog-background").toggle();
							//self.location="/user/login";
						 }else{   //���

						     return;

						 }
					}else if(${sessionScope.me.userGrade =='NEW'}){
						alert("${sessionScope.me.nickName}���� �쿬����Դϴ�.\n�ο��̻� ȸ������ ���� �ϴ��մϴ�.");
					}else{
						alert("�̿� �Ұ��մϴ�.");
					}
				});
		    });
		    
		    $(function() {
				$( ".list_pop td:nth-child(3)" ).on("click", function() {
					var meetingNo = $(this).data("param");
					console.log(meetingNo);
					self.location="/meeting/getMeeting?meetingNo="+meetingNo;
				});
		    });

        
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
										
										list+="<option id='centerMeeting' name='meetingCenter'value='"+town+"'>"+town+"</option>";
								}
									$( "#location" ).empty().append(list);
								}
						});
				});
			});
		    
		    $(function() {
		    	 $( "#plzsearch" ).on("click" , function() {
		    		 alert("dddddd");
		    		 //alert($(this).data("param"));
		    		 $("form").attr("method" , "POST").attr("action" , "/meeting/listMeeting").submit();
		    		 //self.location="/meeting/getMeeting?searchKeyword="+meetingNo;
				 });
		    });
        
        
    </script>
   <!--  �ɷ��� �ʿ� -->
   
   <!-- Bootstrap core CSS -->
    
    <!-- <link href="carousel.css" rel="stylesheet"> -->
    
   <!-- �ɷ��� �Ϸ� -->
</head>

<body>
    <!-- ToolBar Start /////////////////////////////////////-->
    <jsp:include page="/layout/toolBar.jsp" />
    <!-- ToolBar End /////////////////////////////////////-->

    <div style="width:98%; margin-left:10px;">

        <form>
            <!-- ����Ʈ��ǰ ���̺� -->
            <table>
            <c:set var="i" value="0" />
				  <c:forEach var="meeting" items="${bestList}">
				  <c:set var="i" value="${ i+1 }" />
				  </c:forEach>
	            <div id="myCarousel" class="carousel slide" data-ride="carousel">
			      <!-- Indicators -->
			      <ol class="carousel-indicators">
			        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			        <li data-target="#myCarousel" data-slide-to="1"></li>
			        <li data-target="#myCarousel" data-slide-to="2"></li>
			      </ol>
			      <div class="carousel-inner" role="listbox">
			        <div class="item active">
			          <img class="first-slide" src="/resources/images/meeting/${bestList[0].titleImg}" alt="First slide"><!-- ù��° ���� -->
			          <div class="container">
			            <div class="carousel-caption">
			            	�������� �ް������ ���⿡
			              <h1>Example headline.</h1>
			              <p>Note: If you're viewing this page via a <code>file://</code> URL, the "next" and "previous" Glyphicon buttons on the left and right might not load/display properly due to web browser security rules.</p>
			              <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
			            </div>
			          </div>
			        </div>
			        <div class="item">
			          <img class="second-slide" src="/resources/images/meeting/${bestList[1].titleImg}" alt="Second slide"><!-- �ι�° ���� -->
			          <div class="container">
			            <div class="carousel-caption">
			              <h1>Another example headline.</h1>
			              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
			              <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
			            </div>
			          </div>
			        </div>
			        <div class="item">
			          <img class="third-slide" src="/resources/images/meeting/${bestList[2].titleImg}" alt="Third slide"><!-- ����° ���� -->
			          <div class="container">
			        	<div class="carousel-caption">
			              <h1>One more for good measure.</h1>
			              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
			              <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
			            </div> 
			          </div>
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
            
            <!-- /.carousel -->
            <!-- ����Ʈ��ǰ ���̺� ���� -->
            
            <br/>
            <!-- �˻�â ���� -->
            <table align="center" border="7" height="34px" bordercolor="#326ada">
            	<tr>
            		<td width='250px'>
	            		&nbsp;&nbsp;<i class="glyphicon glyphicon-search" aria-hidden="true"></i>
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
						<input type="text" class="form-control" id="centerMeeting" name="meetingCenter" data-param="${meeting.meetingCenter}" value="${meeting.meetingCenter}">
            		</td>
            		<td width='250px'>
            			<select id="interest" class="form-control">
					 		<option >���ɻ�</option>
					 		<c:forEach var="Meeting" items="${list}">
					 		
					 			<option value="${Meeting.interestName}">${Meeting.interestName }</option>
					 		
					 		</c:forEach>
				 		</select>
            		</td>
            		<td width='54px' bgcolor='#326ada'><button type='button' id="plzsearch" class='sch_smit'>ã��</button></td>
            	</tr>
			</table>
			
			 <table class=search2 align="center" height="34px">
			 	
			 	  
			 </table>
		</form>	 
			 <!-- �˻�â ���� -->
			 
			 <!-- �����ϱ� ��ư ���� -->
			 <div align="right" class="addMeeting">
			 <button type="button" class="btn btn-warning" id="addMeeting">�����ϱ�</button>
			 </div>
			 <!-- �����ϱ� ��ư ���� -->
			 
			 <!-- ����Ʈ ���� -->
			 	
                <table class="listingTAB" width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
                    <tr>
                        <td colspan="11" align="left">
                           	 ��ü ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage} ������
                        </td>
                    </tr>
                  
                    <tr>
                        <td colspan="15" bgcolor="808285" height="1"></td>
                    </tr>
                    
                    <c:set var="i" value="0" />
				 	 <c:forEach var="meeting" items="${list}">
				 	 <c:set var="i" value="${ i+1 }" />
                  
                    <tr>
                        <td>
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
                        	���ӳ�¥:${meeting.meetingDate} �����������:${meeting.meetingLocation}
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
                
                <!-- PageNavigation Start... -->
                <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
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
    
</body>

</html>