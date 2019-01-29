<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>우연</title>
<!-- All CSS Insert -->
<link rel="stylesheet" href="/resources/css/rest.css" /> <!-- 리스트 참조용 -->
<link rel="stylesheet" href="/resources/css/main.css" > <!-- 우연메인 -->

	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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
    
   <!-- 케러셀 완료 -->

<!-- //All CSS Insert -->

<!-- All js -->
	<!--  템플릿 사용하기 위해 필요한 js -->
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
		// 개설하기 누르면 이벤트 처리
		$( "#addMeeting" ).on("click", function() {
			console.log("${empty sessionScope.me}");
			
			if('${sessionScope.me.userGrade }' !='NEW' && '${!empty sessionScope.me.userId}'){
				//alert("성공");
				self.location="/meeting/addMeeting"
			}else if('${empty sessionScope.me}'=='true'){
				if (confirm("로그인후이용가능합니다.\n로그인하시겠습니까?") == true){    //확인
					$("#my-dialog,#dialog-background").toggle();
					//self.location="/user/login";
				 }else{   //취소

				     return;

				 }
			}else if('${sessionScope.me.userGrade }'=='NEW'){
				alert("${sessionScope.me.nickName}님은 우연등급입니다.\n인연이상 회원부터 개설 하능합니다.");
			}else{
				alert("이용 불가합니다.");
			}
		});
		
		//제목눌렸을때 이벤트 처리
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
		
		//시군구 가져다 주는 애 
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
							list+="<option>시/군/구 선택</option>";
							for(i in JSONData.list){
								var town = JSONData.list[i].townName;
								
								list+="<option id='centerMeeting' name='searchCondition' data-param='$(this).value' value='"+town+"'>"+town+"</option>";
						}
							$( "#location" ).empty().append(list);
						}
				});
		});
		
		//검색어 이벤트 처리
		$( "#plzsearch" ).on("click" , function() {
   		 var meetingCenter=$("#centering").val();
   		 var seconCenter=$("#sconcentering").val();
   		 var interest=$("#interest").val();
   		 console.log(meetingCenter);
   		 console.log(interest);
   		 console.log(seconCenter);
   		 if(interest=='관심사'){
   			 $("#interest").val("");
   		 }
   		 if(meetingCenter=="" || seconCenter==""){
   			 //alert("모임인원을 설정하여 주세요.");
   			 meetingCenter="아님";
   		 }
   		$("form").attr("method" , "POST").attr("action" , "/meeting/listMeeting/"+meetingCenter).submit();
		 });
		
	})
		
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
	<section id="main" class="wrapper">
		<div class="inner">
		<div style="width:98%; margin-left:10px;">

        <form>
            <!-- 베스트상품 테이블 -->
            <table>
             <%--    잠깐 스탑 
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
			          <img class="first-slide" src="/resources/images/meeting/romance2.jpg" alt="First slide"><!-- 첫번째 사진 -->
			          <div class="container">
			            <div class="carousel-caption">
			            	무슨설명 달고싶으면 여기에
			              <h1>Example headline.</h1>
			              <p>Note: If you're viewing this page via a <code>file://</code> URL, the "next" and "previous" Glyphicon buttons on the left and right might not load/display properly due to web browser security rules.</p>
			              <p><a class="btn btn-lg btn-primary" href="#" role="button">Sign up today</a></p>
			            </div>
			          </div>
			        </div>
			        <div class="item" align="center">
			          <img class="second-slide" src="/resources/images/meeting/classsicfashion2.jpg" alt="Second slide"><!-- 두번째 사진 -->
			          <!-- <div class="container">
			            <div class="carousel-caption">
			              <h1>Another example headline.</h1>
			              <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
			              <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
			            </div>
			          </div> -->
			        </div>
			        <div class="item" align="center">
			          <img class="third-slide" src="/resources/images/meeting/conan2.jpg" alt="Third slide"><!-- 세번째 사진 -->
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
            <!-- 베스트상품 테이블 종료 -->
            
            <br/>
            <!-- 검색창 시작 -->
            <table align="center" border="7" height="34px" bordercolor="#326ada">
            	<tr>
            		<td width='250px'>
	            		<input name="searchKeyword"  
	            		type="text" placeholder="검색어를 입력"/>
            		</td>
            		<td class='search' width='250px'>
						<select id="centerLocation" class="form-control">
				 		<option>중심지역-지역</option>
				 		<option value="서울">서울</option>
		                <option value="경기">경기</option>
		                <option value="인천">인천</option>
		                <option value="부산">부산</option>
		                <option value="대구">대구</option>
		                <option value="광주">광주</option>
		                <option value="대전">대전</option>
		                <option value="울산">울산</option>
		                <option value="세종">세종</option>
		                <option value="강원">강원</option>
		                <option value="경남">경남</option>
		                <option value="경북">경북</option>
		                <option value="전남">전남</option>
		                <option value="전북">전북</option>
		                <option value="충남">충남</option>
		                <option value="충북">충북</option>
		                <option value="제주">제주</option>
				 	</select>
            		</td>
            		<td id="location" class='search' width='250px'>
						<input readonly="readonly" id="sconcentering" type="text" class="form-control"> 
            		</td>
            		<td width='250px'>
            			<select id="interest" name="searchSortingOption" class="form-control">
					 		<option >관심사</option>
					 		<c:forEach var="Meeting" items="${interlist}">
					 		
					 			<option value="${Meeting.interestName}">${Meeting.interestName }</option>
					 		
					 		</c:forEach>
				 		</select>
            		</td>
            		<td width='54px'><button type='button' id="plzsearch" class='sch_smit'>찾기</button></td>
            	</tr>
			</table>
			
			 <table class=search2 align="center" height="34px">
			 	
			 	  
			 </table>
		</form>	 
			 <!-- 검색창 종료 -->
			 
			 <!-- 개설하기 버튼 시작 -->
			 <div align="right" class="addMeeting">
			 <button type="button" id="addMeeting">개설하기</button>
			 </div>
			 <!-- 개설하기 버튼 종료 -->
			 
			 <!-- 리스트 시작 -->
                <div class="landing">
	              	<section id="one" class="wrapper style1">
						<div class="inner">
							<c:set var="i" value="0" />
						 	<c:forEach var="meeting" items="${list}">
						 	<c:set var="i" value="${ i+1 }" />
						 	<c:if test="${i%2==0}">
								<article class="feature left">
							</c:if>
							<c:if test="${i%2!=0}">
								<article class="feature right">
							</c:if>
							
								<span class="image"><img src="/resources/images/meeting/${meeting.titleImg}" alt="" /></span>
								<div class="content">
									<p>${meeting.meetingCenter}<p>
									<h2>${meeting.meetingName}</h2>
									<p>모임정원 /${meeting.meetingCrewLimit}명      조회수 ${meeting.meetingViews}회</p>
									<p>모임날짜:${meeting.meetingDate} 이번모임장소:${meeting.meetingLocation}</p>
									<ul class="actions">
										<li>
											<a href="#" data-param="${meeting.meetingNo}" class="button alt">More</a>
										</li>
									</ul>
								</div>
							</article>
							</c:forEach>
						</div>
					</section>
            	</div>   
       		<!-- 리스트 종료 -->
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