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

    
   <!-- 케러셀 완료 -->

<!-- //All CSS Insert -->

<!-- All js -->
	<!--  템플릿 사용하기 위해 필요한 js -->
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
	 
	 /* 가로케러셀 */
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
	 /* 가로케러셀 끝!! */
	/*  메인백그라운드 */
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
	
	
	 /*  메인백그라운드 끝! */
	 
	 
	 
	
	
	</style>
	
	
	<script>
	$(function(){
		
		/* 돌아가는 가로 케러셀 */
		
		
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
		/* 돌아가는 가로 케러셀 끝!!!!!!!!!!!!! */
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		// 개설하기 누르면 이벤트 처리
		$( "#addMeeting" ).on("click", function() {
			console.log("${empty sessionScope.me}");
			
			if('${sessionScope.me.userGrade }' !='NEW' && ${!empty sessionScope.me.userId}){
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
			<h1>우리들의<span class="slim">모임</span></h1>
		</div>
		
	 <!-- 베스트상품 테이블 -->
         <%--    <table>

            	  <c:set var="i" value="0" />
				  <c:forEach var="meeting" items="${bestList}">
				  <c:set var="i" value="${ i+1 }" />
				  </c:forEach>

			<div id="myCarousel" class="carousel slide " data-ride="carousel">
			      <!-- Indicators -->
				 <div class="carousel-inner" role="listbox">
			        <div class="item active col-xs-12 col-sm-12" align="center">
			          <img  class="first-slide" src="/resources/images/meeting/${bestList[0].titleImg}" style="width:auto; height: 400px;" alt="First slide"><!-- 첫번째 사진 -->
					
			        </div>
			        <div class="item col-xs-12 col-sm-12" align="center">
			          <img class="second-slide" src="/resources/images/meeting/${bestList[1].titleImg}" style="width:auto; height: 400px;" alt="Second slide"><!-- 두번째 사진 -->

			        </div>
			        <div class="item col-xs-12 col-sm-12" align="center">
			          <img class="third-slide" src="/resources/images/meeting/${bestList[2].titleImg}" style="width:auto; height: 400px;" alt="Third slide"><!-- 세번째 사진 -->
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
            <!-- 베스트상품 테이블 종료 -->
            	<section id="main" class="wrapper">	
            			 <!-- 시작!! -->
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

	<!-- 끝!! -->		
            

		<div  class="landing">
		<div style="width:98%; margin-left:10px;">

        <form>
            <br/>
            <!-- 검색창 시작 -->
            <div style="margin-bottom: 30px;" id="lol" align="center" border="7" height="34px" bordercolor="#326ada" class="row col-xs-12 col-sm-12 col-md-12">

            		<div class="col-xs-12 col-sm-12 col-md-4">
	            		<input name="searchKeyword"  
	            		type="text" placeholder="검색어를 입력" style="width: 100%"/>
            		</div>
            		<div class='search col-xs-12 col-sm-12 col-md-2'>
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
            		</div>
            		<div id="location" class='search col-xs-12 col-sm-12 col-md-2'>
						<input readonly="readonly" id="sconcentering" type="text" class="form-control" style="width: 100%"> 
            		</div>
            		<div class="col-xs-12 col-sm-12 col-md-2">
            			<select id="interest" name="searchSortingOption" class="form-control">
					 		<option >관심사</option>
					 		<c:forEach var="Meeting" items="${interlist}">
					 		
					 			<option value="${Meeting.interestName}">${Meeting.interestName }</option>
					 		
					 		</c:forEach>
				 		</select>
            		</div>
            		<div class="col-xs-12 col-sm-12 col-md-2"><input type='button' id="plzsearch" class='sch_smit search-btn' value="찾기"></div>
			</div>
		</form>	 
			 <!-- 검색창 종료 -->
			 
 
			 
			 <!-- 개설하기 버튼 시작 -->
			 
			 <!-- 개설하기 버튼 종료 -->
			 
			 <!-- 리스트 시작 -->
                <div>
	              	<section style="align-content:center;" id="one" class="wrapper style1">
						<div class="inner">
						<div align="right" class="addMeeting">
						 	<input type="button" id="addMeeting" value="개설하기">
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
									<p>모임정원 /${meeting.meetingCrewLimit}명      조회수 ${meeting.meetingViews}회</p>
									<p>모임날짜:${meeting.meetingDate}</p>
									<p>이번모임장소:${meeting.meetingLocation}</p>
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