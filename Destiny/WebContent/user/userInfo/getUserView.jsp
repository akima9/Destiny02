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
		
		<h3>����������</h3>
				
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
				
				
				
				
				<div class="col-sm-4 col-md-4">
			    <h4>���� &amp; ����</h4><p>
			      <a href="/user/addTypeView/${me.userId}"><span class="image"><img class="col-sm-4 col-md-4" src="/resources/images/layout/mbti.jpg" width="300" height="300" /></span></a>
			    	<br/>����� MBTI���������� �˾ƺ��� �����ϼ���. <br/>�׸��� ���ϴ� ���� ���������� �����ϼ���.</p>
			    </div>
				    
				
			
			
				<div class="col-sm-4 col-md-4">
			    <h4>ȸ������Ʈ</h4>
			      <a href="/user/listUser"><span class="image"><img class="col-sm-4 col-md-4" src="/resources/images/layout/users.png" width="300" height="300" /></span></a>
			   	 <br/> � ȸ������ �� ����Ʈ�� �̿��ϰ� <br/>�ִ��� Ȯ���غ�����
				</div>	
			
			 
			
			
				<div class="col-sm-4 col-md-4">
			    <h4>����</h4>
			    <a href="#" id="letterList"><span class="image"><img  class="col-sm-4 col-md-4" src="/resources/images/layout/letter.png" width="300" height="300" /></span></a>
				   <br/> �������� ������ ������ ��������. 
				</div>	
	
				
			
			
			
			
		</div>
		<h4>Ȱ������</h4>
				<div class="col-sm-12 col-md-12" >
			    <p  style="font-size:120%; color:black;"><a href="/user/userAct/actMain.jsp" id="actMainButton"><span class="image"><img alt="" src="/resources/images/layout/act.jpg" style="width: 300px; height:300px;"  /></span></a>
			   	 <br/>����� Ȱ�������� Ȯ���ϰ� �����ϼ���. ����� ������ ����, ������ ���Ӱ� ȸ��, ȸ�� ����� ��ȸ�ϰ� <br/>���Խ�û�� �����ϼ���. ����� �ۼ��� ���ñ�, ����� Ȯ���ϰ� �̷���� ������ �����Ѻ��� ���並 �ۼ��ϼ���.</p>
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