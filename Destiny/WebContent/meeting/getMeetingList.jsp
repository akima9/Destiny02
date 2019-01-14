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
				$( ".addMeeting" ).on("click", function() {
					console.log("${sessionScope.user.userId}");
					
					//if()
					//self.location="/meeting/addMeeting"
				});
		    });
		    
		    $(function() {
				$( ".listingTAB" ).on("click", function() {
					console.log("���� ������");
					
					self.location="/meeting/getMeeting"
				});
		    });

        
        $(function() {
			$( ".search" ).on("click" , function() {
				console.log("����");
				
				var list="";
					list+="<table>";
					list+="<tr>";
					list+="<th class='city' data-param='����'>����</th>";
					list+="<th class='city' data-param='���'>���</th>";
					list+="<th colspan='5' rowspan='11'></th>";
					list+="</tr>";
					list+="<tr>";
					list+="<td>��õ</td>";
					list+="<td>�λ�</td>";
					list+="</tr>";
					list+="<tr>";
					list+="<td>�뱸</td>";
					list+="<td>����</td>";
					list+="</tr>";
					list+="<tr>";
					list+="<td>����</td>";
					list+="<td>���</td>";
					list+="</tr>";
					list+="<tr>";
					list+="<td>����</td>";
					list+="<td>����</td>";
					list+="</tr>";
					list+="<tr>";
					list+="<td>�泲</td>";
					list+="<td>���</td>";
					list+="</tr>";
					list+="<tr>";
					list+="<td>����</td>";
					list+="<td>����</td>";
					list+="</tr>";
					list+="<tr>";
					list+="<td>�泲</td>";
					list+="<td>���</td>";
					list+="</tr>";
					list+="<tr>";
					list+="<td colspan='2'>����</td>";
					list+="</tr>";
					list+="<tr>";
					list+="<td colspan='2' rowspan='2'></td>";
					list+="</tr>";
					list+="<tr>";
					list+="</tr>";
					list+="</table>";
					
					$(".search2").html(list);
				
			}); 
				
			
        });
        
         $(function() {
			$( ".search2" ).on("click",".city", function() {
				console.log("�ٽõ���");
				
				//var idx = $(".city").index(this);
				//console.log(idx);
				var cityName =$(this).data("param");
				console.log(cityName);
				 
				$.ajax( 
						{
							url : "/product/json/location?cityName="+cityName,
							method : "GET" ,
							dataType : "json" ,
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData , status) {
								alert("dd");
								var townList ="";
									townList+="<table>";
									townList+="<tr>";
									townList+="<td width='155px'>";
									townList+="����&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;"+JSONData.city[0].town+"<br/>";
									townList+="��õ&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;�λ�"+"<br/>";
									townList+="�뱸&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;����"+"<br/>";
									townList+="����&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;���"+"<br/>";
									townList+="����&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;����"+"<br/>";
									townList+="�泲&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;���"+"<br/>";
									townList+="����&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;����"+"<br/>";
									townList+="�泲&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;���"+"<br/>";
									townList+="����";
									townList+="</td>";
									townList+="<td width='655px'>";
									townList+="</td>";
									townList+="</tr>";
									townList+="</table>";
								$(".search2").html(townList);
								 
							}
					}); 
				 
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
    <%-- <jsp:include page="/layout/toolbar.jsp" /> --%>
    <!-- ToolBar End /////////////////////////////////////-->

    <div style="width:98%; margin-left:10px;">

        <form name="detailForm">

            <input type="hidden" id="currentPage" name="currentPage" value="" />
            
            <!-- ����Ʈ��ǰ ���̺� -->
            <table>
            <c:set var="i" value="0" />
				  <c:forEach var="product" items="${Bestlist}">
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
			          <img class="first-slide" src="/uppic/911.png" alt="First slide"><!-- ù��° ���� -->
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
			          <img class="second-slide" src="/uppic/macan.png" alt="Second slide"><!-- �ι�° ���� -->
			          <div class="container">
			            <div class="carousel-caption">
			              <h1>Another example headline.</h1>
			              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
			              <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
			            </div>
			          </div>
			        </div>
			        <div class="item">
			          <img class="third-slide" src="/uppic/macan.png" alt="Third slide"><!-- ����° ���� -->
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
	            		<input type="text" placeholder="�˻�� �Է�"/>
            		</td>
            		<td class='search' width='250px'>
						&nbsp;&nbsp;��������&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="caret"></span>
            		</td>
            		<td width='250px'>
            			&nbsp;&nbsp;<i class="glyphicon glyphicon-star" aria-hidden="true"></i> 
            			<select name="brand_id" class="ct_input_g" 
									style="width: 100px; height: 25px" maxLength="20">
						<option >���ɻ� ����</option>
						<%-- <c:forEach var="brand" items="${list}">
						
							
							<option value="${brand.brand_id}">${brand.brandNam }</option>
						</c:forEach> --%>
						</select>
            		</td>
            		<td width='54px' bgcolor='#326ada'><button type='submit' class='sch_smit'>�˻�</button></td>
            	</tr>
			</table>
			
			 <table class=search2 align="center" height="34px">
			 	  <tr>
				    <th></th>
				    <th></th>
				    <th></th>
				  </tr>
				  <tr>
				    <td></td>
				    <td></td>
				  </tr>
				  <tr>
				    <td></td>
				    <td></td>
				  </tr>
				  <tr>
				    <td></td>
				    <td></td>
				  </tr>
				  <tr>
				    <td></td>
				    <td></td>
				  </tr>
				  <tr>
				    <td></td>
				    <td></td>
				  </tr>
				  <tr>
				    <td></td>
				    <td></td>
				  </tr>
				  <tr>
				    <td></td>
				    <td></td>
				  </tr>
				  <tr>
				    <td></td>
				  </tr>
				  <tr>
				    <td></td>
				  </tr>
				  <tr>
				  </tr>		
			 </table>
			 
			 <!-- �˻�â ���� -->
			 
			 <!-- �����ϱ� ��ư ���� -->
			 <div align="right" class="addMeeting">
			 <button type="button" class="btn btn-warning">�����ϱ�</button>
			 </div>
			 <!-- �����ϱ� ��ư ���� -->
			 
			 <!-- ����Ʈ ���� -->
                <table class="listingTAB" width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
                    <tr>
                        <td colspan="11" align="left">
                           	 ��ü ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage} ������
                        </td>
                    </tr>
<%-- 
                    <tr>
                        <td class="ct_list_b" width="100">No</td>
                        <td class="ct_line02"></td>
                        <td class="ct_list_b" width="100">�귣��</td>
                        <td class="ct_line02"></td>
                        <td class="ct_list_b" width="100">����</td>
                        <td class="ct_line02"></td>
                        <td class="ct_list_b" width="150">
                        	    ��ǰ��
                            <input onclick="fncGetProductList('1')" type="checkbox" name="sort" value="1" ${ search.sort==1 ? "checked='checked'" : "" }>
                        </td>
                        <td class="ct_line02"></td>
                        <td class="ct_list_b" width="150">����
                            <input onclick="fncGetProductList('1')" type="checkbox" name="sort" value="2" ${ search.sort==2 ? "checked='checked'" : "" }>
                        </td>
                        <td class="ct_line02"></td>
                        <td class="ct_list_b">�����
                            <input onclick="fncGetProductList('1')" type="checkbox" name="sort" value="3" ${ search.sort==3 ? "checked='checked'" : "" }>
                        </td>
                        <td class="ct_line02"></td>
                        <td class="ct_list_b">��ȸ��</td>
                    </tr>
                     --%>
                    <tr>
                        <td colspan="15" bgcolor="808285" height="1"></td>
                    </tr>
                  
                    <tr class="ct_list_pop">
                        <td>
                            <img width="100px" src="/uppic/Wallpaper.jpg">
                        </td>
                        <td></td>
                        <td align="left" data-param="${ product.prodNo}" data-param2="${product.proTranCode}">
                        	��õ��
                        </td>
                        <td></td>
                        <td align="left">�����ο�</td>
                        <td></td>
                        <td align="left">80��</td>
                        <td></td>
                    </tr>
                    
                    <tr>
                    	<td>
                        </td>
                        <td></td>
                        <td align="left" data-param="${ product.prodNo}" data-param2="${product.proTranCode}">
                        	(�丮 �ǽ�) ����� �԰� ��ܿ�~!!
                        </td>
                        <td></td>
                        <td align="left">��ȸ��</td>
                        <td></td>
                        <td align="left">101ȸ</td>
                        <td></td>
                    </tr>
                    
                    <tr>
                    	<td>
                        </td>
                        <td></td>
                        <td align="left" data-param="${ product.prodNo}" data-param2="${product.proTranCode}">
                        	���ӳ�¥: 12/2 ����� ���ʱ� ���ʵ� 132
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
            
        </form>
    </div>
    
</body>

</html>