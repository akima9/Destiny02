<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script>
$(document).ready(function(e) {
/* a��Ҹ� Ŭ�� ���� �� */
    $('a').click(function(){
/* iframe ����� src �Ӽ����� a ����� data-url �Ӽ������� ���� */ 
        $('#iframe').attr('src',$(this).attr('data-url'));
        })
});
</script>




<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<a  data-url="/chatting/getRandomChatting.jsp">����</a>
<a data-url="http://daum.net">����</a>
<a  data-url="http://nate.com">����Ʈ</a>
<iframe id="iframe" width="1024" height="500" src="/chatting/mainChatting"></iframe>

	<!-- <div style="position:relative;">
     <div style="position:absolute;right:0;bottom:0; background-color: red" ><a href="/chatting/getRandomChatting.jsp">�ȳ�</a></div>
     <iframe frameborder="0" height="500"width="2000" src="/chatting/mainChatting" >
     
     </iframe>
	</div> -->
</body>
</html>