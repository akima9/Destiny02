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
<link href="carousel.css" rel="stylesheet">
<!-- //All CSS Insert -->

<!-- All js -->
   <!--  ���ø� ����ϱ� ���� �ʿ��� js -->
   <script src="/resources/javascript/jquery.min.js"></script>
   <script src="/resources/javascript/skel.min.js"></script>
   <script src="/resources/javascript/util.js"></script>
   <script src="/resources/javascript/main.js"></script>
   
   <!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
   
   <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   
   
   <script type="text/javascript">
   var userId="${me.userId}";
   var userType="${me.myType}";
   var firstType="${me.firstType}";
   var secondType="${me.secondType}";
   var thirdType="${me.thirdType}";
   var userGrade="${me.userGrade}";
   var manCount=0;
   var womanCount=0;
   
   
   function getTelepathyTest(){
      if (userId=="") {
         alert("�α��� �� �̿� �����մϴ�.");
         $("#my-dialog,#dialog-background").toggle();
      }else if (userGrade=='BLK') {
    	  alert("�Ϲ�ȸ�� �̻���� �̿� �����մϴ�.");
	  }else{
         //location="/chatting/addRandomChatting";
         ///////////////////////////////////////////////
            
            $.ajax({   
               
               url : "/chatting/json/addRandomChatting" ,
               type : "GET" ,
               dataType : "json" ,
               headers : {
                  "Accept" : "application/json",
                  "Content-Type" : "application/json"
               },
               success : function(JsonData) {
                  //alert("����");
                  
                  popWin = window.open("/chatting/getRandomMatching.jsp","popWin", "left=500, top=600, width=800, height=800, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
                           },//success
                  error: function () {
                     alert("error");
                  },
                  complete: function () {
                    
                    //alert("complete");
                  }
               
            });//ajax
         
      }
   }
   function getPerfectChatting(){
      //////////////�α��� ��� �۵� ���ɽ�
       if (userId=="") {
         alert("�α��� �� �̿� �����մϴ�.");
         $("#my-dialog,#dialog-background").toggle();
      }else {
         if (userGrade=='NEW' || userGrade=='BLK') {
            alert("�Ϲ�ȸ�� �̻���� �̿� �����մϴ�.");
         }else{
            
         
            if(userType==""||firstType==""){
               location = "/user/addTypeView";
            }else{
               
               ///////////////////////////////////////////////
               
               $.ajax({   
                  
                  url : "/chatting/json/addPerfectChatting" ,
                  type : "GET" ,
                  dataType : "json" ,
                  headers : {
                     "Accept" : "application/json",
                     "Content-Type" : "application/json"
                  },
                  success : function(JsonData) {
                     //alert("����");
                     
                     popWin = window.open("/chatting/getPerfectMatching.jsp","popWin", "left=500, top=600, width=800, height=800, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
                     
                                    },//success
                     error: function () {
                        alert("error");
                     },
                     complete: function () {                
                       //alert("complete");
                     }
                  
               });//ajax ��
            }//type Ȯ��
         }//gradeȮ��
         
      } 
      
   }
   
    function getNode(){
      location = "/chatting/json/getPerfectChatting";
       
   } 
   $(function() {
      $( "#telepathy" ).on("click" , function() {
          //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
         getTelepathyTest();
      });
      $( "#perfect" ).on("click" , function() {
          //==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
         
   
         getPerfectChatting();
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
   
         <table>
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
               <!-- Indicators -->
               <ol class="carousel-indicators">
                 <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                 <li data-target="#myCarousel" data-slide-to="1"></li>
                 <li data-target="#myCarousel" data-slide-to="2"></li>
               </ol>
               
               <div class="carousel-inner" role="listbox">
                 <div class="item active col-xs-12 col-sm-12" >
                   <img class="first-slide center-block" src="/resources/images/chatting/main01.jpg"  alt="First slide"><!-- ù��° ���� -->
                 <div class="container">
                   <div class="carousel-caption">
                      ����� ���������� ����ϼ���!
                     <h1>MBTI</h1>
                     <p>MyPage���� ���������� �����ϼ���.<code></code> ���� ��� �� �̻��� ä���� �����մϴ�.</p>
                     <p><a class="button special" href="#" role="button">MyPage</a></p>
                   </div>
                 </div>
               </div>
               <div class="item col-xs-12 col-sm-12">
                 <img class="second-slide center-block" src="/resources/images/chatting/main02.jpg" alt="Second slide"><!-- �ι�° ���� -->
                 <div class="container">
                   <div class="carousel-caption">
                     <h1>�پ��� �ı⸦ Ȯ���� ������!</h1>
                     <p></p>
                     <p><a class="button special" href="#" role="button">Story</a></p>
                   </div>
                 </div>
               </div>
               <div class="item col-xs-12 col-sm-12">
                 <img class="third-slide center-block" src="/resources/images/chatting/main03.jpg"  alt="Third slide"><!-- ����° ���� -->
                     <div class="container">
                      <div class="carousel-caption">
                         <h1>��������</h1>
                         <p>����� �ִٸ� �̰�����!</p>
                         <p><a class="button special" href="#" role="button">Advice</a></p>
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
          
           
          <!-- Community start -->
         <section id="three" class="wrapper align-center">
            <div class="inner">
               <div class="flex flex-2">
                  <article>
                     <div class="image round" >
             
                      <img src="https://media.istockphoto.com/vectors/people-chatting-vector-id504078623" style="width: 200px; height: 200px;" alt="Pic 01">
                      </div>
                      <header>
                        <h3>����ä��</h3>
                      </header>
                        <p>�̼��� ����ä�� ����� �����մϴ�.</p>
                       
                     <footer>
                        <a href="#" class="button" role="button" id="telepathy">�����ϱ�</a>
                     </footer>
                  </article>
                  
                  
                  <article>
                     <div  class="image round" >
             
                      <img src="https://storage.googleapis.com/neris/public/images/system/home/home-16personalities.svg" style="width: 200px; height: 200px;" alt="Pic 01">
                       </div>
                       <header>
                       	<h3>�̻���ä��</h3>
                       </header>
                        <p>���������� �̿��� ����ä�� ����� �����մϴ�.</p>
                
                     <footer>
                        <a href="#" class="button" role="button" id="perfect">�����ϱ�</a>
                     </footer>
                  </article>
               </div>
            </div>
         </section>
         <!-- Community end -->
          
   <!-- //contents -->
<!-- ////////////////////////////////////////////////////////////////////////////////////////////// -->

   <!-- footer -->
   <jsp:include page="/layout/footer.jsp" />
   <!-- //footer -->
   
   
   
</body>
</html>