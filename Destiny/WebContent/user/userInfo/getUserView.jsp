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
<link rel="stylesheet" href="/resources/css/main.css" > 

<!-- //All CSS Insert -->

<!-- All js -->
	<!--  ���ø� ����ϱ� ���� �ʿ��� js -->
	<script src="/resources/javascript/jquery.min.js"></script>
	<script src="/resources/javascript/skel.min.js"></script>
	<script src="/resources/javascript/util.js"></script>
	<script src="/resources/javascript/main.js"></script>
	
	<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">
	
	


	
	<script>
		/*$(function(){
			$("button[id='listButton']").on("click", function(){
				self.location = "/user/listUser";
			});
		});*/
		
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
	<!-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script> -->
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
		
		
		
		
		#communitymove{
			/* background : #ff8a2c; */
			background : #ffbcc7;
		}
			#communitymove h3{
				color : #ff264a;
				font-weight : bold;
			}
			#communitymove p{
				color : #3e3e3e;
			}
		
		.ment{
			text-align : center;
		}
			
		
		
				
		
	</style>
	
	<style type="text/css" media="screen">
		#content {  
		  position:absolute;
		  height:200px;   /* ���޴�, ��� �̹����� ���� */
		  width:270px;    /* ���޴�, ��� �̹����� �ʺ�*/
		  margin:0px 0px 0px 700px;   /* ���� �������� ��ġ�� ȭ�� ������� �󸶸�ŭ ���������� ���̾ ���� ������ ����  */ 
		  top: 10em;  /* ��� ��ܿ��� �󸶳� ����߸��� ����*/
		  left: 50%;     /* ���̾��� �������� �������� ���� 50% ���� */
		  text-align: left;
		  padding: 50px;
		  /* background-image : url("/resources/images/layout/floatbanner.png");
		  background-size : cover; */
		  border : 1px solid #ff879b;
		  border-radius : 15px;
		}
		
		body{
			background-image : linear-gradient(135deg, #FAB7D9 , #FFFFFF);
		}
		
		
		
		
		
	</style> 
		
	

</head>

<body>	
	

	<!-- header -->
	<jsp:include page="/layout/header.jsp" />
	<!-- //header -->

	<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- contents -->
	<section id="communitymove" class="wrapper align-center" style="background-image : linear-gradient(135deg, #FAB7D9 , #FFFFFF);">
		
		<div class="inner">
		
		<h2 style="font-family: 'Jua', sans-serif;">����������</h2>
				
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
			    <a class="button special 12u" href="#" id="questionButton">����!</a>
			</div>	
		</div>
		
		
		<div class="box alt">
			<div class="row col-sm-12 col-md-12">
				
				
				
			<div class="flex flex-3">
			
				
				<div class="col-sm-4 col-md-4">
			    <h4 style="font-family: 'Jua', sans-serif;">���� &amp; ����</h4><p>
			    	<div class="image">
			    		<img class="col-sm-4 col-md-4" src="/resources/images/layout/KakaoTalk_20190129_213128976.jpg" alt="Pic 01" width="250" height="250" >
			    	</div>
			      <br/>����� MBTI���������� �˾ƺ��� �����ϼ���. <br/>�׸��� ���ϴ� ���� ���������� �����ϼ���.<br/>
			    	<a class="button" href="/user/addTypeView/${me.userId}">select</a>
			    </div>
			   
			   
			
				<div class="col-sm-4 col-md-4">
			    <h4 style="font-family: 'Jua', sans-serif;">����</h4> 
			    	<div class="image">
					    <img  class="col-sm-4 col-md-4" src="/resources/images/layout/letterother.jpg" alt="Pic 01"  width="250" height="250" />
			    	</div>
			      <br/> �������� ������ ������ ��������.<br/><br/>
			    	<a href="#" class="button" id="letterList">open</a>
				</div>	
	
				<div class="col-sm-4 col-md-4" >
				<h4 style="font-family: 'Jua', sans-serif;">Ȱ������</h4>
					<div class="image">
			   		    <img class="col-sm-4 col-md-4" alt="Pic 01" src="/resources/images/layout/act.jpg" width="250" height="250"/>
			   	 	</div>
			   	 <br/>����� Ȱ�������� Ȯ���ϰ� �����ϼ���. <br/><br/>
					<a href="/user/userAct/actMain.jsp" class="button" id="actMainButton">move</a>
				</div>	
			
			</div>
			
			
		</div>
				
				
			
			
			
			<br/><br/>
			<div class="col-sm-6 col-md-6">
			      <br/><button id="leaveSite" type="button"><p>����Ʈ Ż��</p></button>
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