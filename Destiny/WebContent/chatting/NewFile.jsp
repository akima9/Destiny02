<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script>
$(document).ready(function(e) {
/* a요소를 클릭 했을 시 */
    $('a').click(function(){
/* iframe 요소의 src 속성값을 a 요소의 data-url 속성값으로 변경 */ 
        $('#iframe').attr('src',$(this).attr('data-url'));
        })
});
</script>




<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<a  data-url="/chatting/getRandomChatting.jsp">랜덤</a>
<a data-url="http://daum.net">다음</a>
<a  data-url="http://nate.com">네이트</a>
<iframe id="iframe" width="1024" height="500" src="/chatting/mainChatting"></iframe>

	<!-- <div style="position:relative;">
     <div style="position:absolute;right:0;bottom:0; background-color: red" ><a href="/chatting/getRandomChatting.jsp">안녕</a></div>
     <iframe frameborder="0" height="500"width="2000" src="/chatting/mainChatting" >
     
     </iframe>
	</div> -->
</body>
</html>