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
<link href="carousel.css" rel="stylesheet">
<!-- //All CSS Insert -->

<!-- All js -->
   <!--  템플릿 사용하기 위해 필요한 js -->
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
         alert("로그인 후 이용 가능합니다.");
         $("#my-dialog,#dialog-background").toggle();
      }else if (userGrade=='BLK') {
    	  alert("일반회원 이상부터 이용 가능합니다.");
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
                  //alert("성공");
                  
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
      //////////////로그인 기능 작동 가능시
       if (userId=="") {
         alert("로그인 후 이용 가능합니다.");
         $("#my-dialog,#dialog-background").toggle();
      }else {
         if (userGrade=='NEW' || userGrade=='BLK') {
            alert("일반회원 이상부터 이용 가능합니다.");
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
                     //alert("성공");
                     
                     popWin = window.open("/chatting/getPerfectMatching.jsp","popWin", "left=500, top=600, width=800, height=800, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
                     
                                    },//success
                     error: function () {
                        alert("error");
                     },
                     complete: function () {                
                       //alert("complete");
                     }
                  
               });//ajax 끝
            }//type 확인
         }//grade확인
         
      } 
      
   }
   
    function getNode(){
      location = "/chatting/json/getPerfectChatting";
       
   } 
   $(function() {
      $( "#telepathy" ).on("click" , function() {
          //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
         getTelepathyTest();
      });
      $( "#perfect" ).on("click" , function() {
          //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
         
   
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
                   <img class="first-slide center-block" src="/resources/images/chatting/main01.jpg"  alt="First slide"><!-- 첫번째 사진 -->
                 <div class="container">
                   <div class="carousel-caption">
                      당신의 성격유형을 등록하세요!
                     <h1>MBTI</h1>
                     <p>MyPage에서 성격유형을 선택하세요.<code></code> 유형 등록 후 이상형 채팅이 가능합니다.</p>
                     <p><a class="button special" href="#" role="button">MyPage</a></p>
                   </div>
                 </div>
               </div>
               <div class="item col-xs-12 col-sm-12">
                 <img class="second-slide center-block" src="/resources/images/chatting/main02.jpg" alt="Second slide"><!-- 두번째 사진 -->
                 <div class="container">
                   <div class="carousel-caption">
                     <h1>다양한 후기를 확인해 보세요!</h1>
                     <p></p>
                     <p><a class="button special" href="#" role="button">Story</a></p>
                   </div>
                 </div>
               </div>
               <div class="item col-xs-12 col-sm-12">
                 <img class="third-slide center-block" src="/resources/images/chatting/main03.jpg"  alt="Third slide"><!-- 세번째 사진 -->
                     <div class="container">
                      <div class="carousel-caption">
                         <h1>연애조언</h1>
                         <p>고민이 있다면 이곳으로!</p>
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
                        <h3>랜덤채팅</h3>
                      </header>
                        <p>이성과 랜덤채팅 기능을 제공합니다.</p>
                       
                     <footer>
                        <a href="#" class="button" role="button" id="telepathy">참여하기</a>
                     </footer>
                  </article>
                  
                  
                  <article>
                     <div  class="image round" >
             
                      <img src="https://storage.googleapis.com/neris/public/images/system/home/home-16personalities.svg" style="width: 200px; height: 200px;" alt="Pic 01">
                       </div>
                       <header>
                       	<h3>이상형채팅</h3>
                       </header>
                        <p>성격유형을 이용한 랜덤채팅 기능을 제공합니다.</p>
                
                     <footer>
                        <a href="#" class="button" role="button" id="perfect">참여하기</a>
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