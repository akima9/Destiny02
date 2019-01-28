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
<link rel="stylesheet" href="/resources/css/main.css" > 

<!-- //All CSS Insert -->

<!-- All js -->
	<!--  템플릿 사용하기 위해 필요한 js -->
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
	
	


	
	<script>
	
		
		
		$(function(){
			$("button[id='listButton']").on("click", function(){
				self.location = "/user/listUser";
			});
		});
		
		$(function(){
			$("button[id='leaveSite']").on("click", function(){
				self.location = "/user/userInfo/leaveSite.jsp";
			});
		});
		
		$(function(){
			$("button[id='actMainButton']").on("click", function(){
				self.location = "/user/userAct/actMain.jsp";
			});
		});
		
		
		$(function(){
			$("a[id='letterList']").on("click", function(){
				popWin = window.open("/letter/letterMain.jsp",
					   	 "popWin",
						 "left=300, top=200, width=1100, height=700, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");

			});
		});
		
		$(function(){
			$("a[id='questionButton']").on("click", function(){
				var question = $("input[name='questionButton']").val();
				
				//alert(question);
				
				$.ajax({
					
					//url : "http://api.adams.ai/datamixiApi/deepqa?key=3758962826504551960&answerType=0&question="+question,
					url : "/user/json/getAnswer/"+question,
					method : "GET",
					datatype : "json",
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData, status){
						alert(JSONData.answer.return_object.answer);
						//$('#answerWirte').text(JSONData.answer.return_object.answer);
					}
					
				});
				
			});
		});
		
		$(function() {
            var offset = $("#content").offset();
            var topPadding = 15;
            $(window).scroll(function() {
    
                if ($(window).scrollTop() > offset.top) {
                    $("#content").stop().animate({
                        marginTop: $(window).scrollTop() - offset.top + topPadding
                    }, 500);
                } else {
                    $("#content").stop().animate({
                        marginTop: 0
                    });
                };
             });
        });
		
	</script>
	<script>
	(function(d, s, id){
	    var js, fjs = d.getElementsByTagName(s)[0];
	    if (d.getElementById(id)) {return;}
	    js = d.createElement(s); js.id = id;
	    js.src = "https:\/\/danbee.ai/js/plugins/frogue-embed/frogue-embed.min.js";
	    fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'frogue-embed'));
	</script>
	
	
<!-- //All js -->
	
	
	<style>
	
		#grad1 {
			  height: 300px;
			  background-color: #000000; /* For browsers that do not support gradients */
			  background-image: linear-gradient(to right, #000000 , #FFFFFF); /* Standard syntax (must be last) */
			}

		
	</style>
	
	<style type="text/css" media="screen">
		#content {  
		  position:absolute;
		  height:200px;   /* 퀵메뉴, 배너 이미지의 높이 */
		  width:270px;    /* 퀵메뉴, 배너 이미지의 너비*/
		  margin:0px 0px 0px 700px;   /* 가장 오른쪽의 수치가 화면 가운데에서 얼마만큼 오른쪽으로 레이어를 붙일 것인지 설정  */ 
		  top: 10em;  /* 배너 상단에서 얼마나 떨어뜨릴지 설정*/
		  left: 50%;     /* 레이어의 시작점이 왼쪽으로 부터 50% 지정 */
		  text-align: left;
		  padding: 50px;
		  /* background-image : url("/resources/images/layout/floatbanner.png");
		  background-size : cover; */
		  border : 1px solid #ff879b;
		  border-radius : 15px;
		}
	</style> 
		
	

</head>

<body >	
	

	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->

	
	
	


<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- contents -->
	<section id="main" class="wrapper">
		
		<div class="inner">
		
		<h3>마이페이지</h3>
				
		<br/>
		
		
		<div id="frogue-container" class="position-right-bottom"
			      data-color="#555a9c"
			      data-chatbot="b9ca3ac0-61fd-496b-831f-3906f84fbb90"
			      data-user="b9ca3ac0-61fd-496b-831f-3906f84fbb90"
			      data-init-key="value"
			      ></div>
		
		
		<div id="content">
			<div class="12u">
				<input type="text" name="questionButton" id="question" >
			    <a class="button special 12u" href="#" id="questionButton">질문!</a>
			</div>	
		</div>
		
		
		<div class="box alt">
			<div class="row col-sm-12 col-md-12">
				
				
				
				
				<div class="col-sm-4 col-md-4">
			    <h4>성격 &amp; 유형</h4><p>
			      <a href="/user/addTypeView/${me.userId}"><span class="image"><img class="col-sm-4 col-md-4" src="/resources/images/layout/mbti.jpg" width="300" height="300" /></span></a>
			    	<br/>당신의 MBTI성격유형을 알아보고 선택하세요. <br/>그리고 원하는 상대방 성격유형을 선택하세요.</p>
			    </div>
				    
				
			
			
				<div class="col-sm-4 col-md-4">
			    <h4>회원리스트</h4>
			      <a href="/user/listUser"><span class="image"><img class="col-sm-4 col-md-4" src="/resources/images/layout/users.png" width="300" height="300" /></span></a>
			   	 <br/> 어떤 회원들이 이 사이트를 이용하고 <br/>있는지 확인해보세요
				</div>	
			
			 
			
			
				<div class="col-sm-4 col-md-4">
			    <h4>쪽지</h4>
			    <a href="#" id="letterList"><span class="image"><img  class="col-sm-4 col-md-4" src="/resources/images/layout/letter.png" width="300" height="300" /></span></a>
				   <br/> 유저에게 쪽지를 보내고 받으세요. 
				</div>	
	
				
			
			
			
			
		</div>
		<h4>활동관리</h4>
				<div class="col-sm-12 col-md-12" >
			    <p  style="font-size:120%; color:black;"><a href="/user/userAct/actMain.jsp" id="actMainButton"><span class="image"><img alt="" src="/resources/images/layout/act.jpg" style="width: 300px; height:300px;"  /></span></a>
			   	 <br/>당신의 활동내역을 확인하고 관리하세요. 당신이 가입한 모임, 개설한 모임과 회차, 회원 목록을 조회하고 <br/>가입신청을 관리하세요. 당신이 작성한 개시글, 댓글을 확인하고 이루어진 만남을 돌이켜보고 리뷰를 작성하세요.</p>
				</div>	
			
			
			
			<br/><br/>
			<div class="col-sm-6 col-md-6">
			      <br/><button id="leaveSite" type="button"><p>사이트 탈퇴</p></button>
			</div>	
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