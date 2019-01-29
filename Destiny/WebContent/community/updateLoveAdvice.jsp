<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<!-- include libraries(jQuery, bootstrap) -->
<!-- <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet"> -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<!-- <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> -->

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" integrity="sha384-PmY9l28YgO4JwMKbTvgaS7XNZJ30MK9FAZjjzXtlqyZCqBY6X6bXIkM++IkyinN+" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap-theme.min.css" integrity="sha384-jzngWsPS6op3fgRCDTESqrEJwRKck+CILhJVO5VvaAZCq8JYf8HsR/HPpBOOPZfR" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js" integrity="sha384-vhJnz1OVIdLktyixHY4Uk3OHEwdQqPppqYR8+5mjsauETgLOcEynD9oPHhhz18Nw" crossorigin="anonymous"></script>

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote.js"></script>

<script type="text/javascript">
	$(function(){
		
		$(document).ready(function(){
			$("#loading").hide();
		});
		
		$(document).ready(function(){
			
			$("#summernote").summernote({ //summernote�� ����ϱ� ���� ����
				placeholder : '������ �Է����ּ���.',
				height : 400,
				lang : 'ko-KR',
				callbacks : {
					onImageUpload : function(files, editor, welEditable){
						data = new FormData();
						data.append("file", files[0]);
						
						var $note = $(this);
						$.ajax({
							data : data,
							type : "POST",
							url : '/info/json/imgUpload',
							cache : false,
							contentType : false,
							enctype : 'multipart/form-data',
							processData : false,
							success : function(url){
								console.log("url : "+url)
								while(true){
									var re = doesFileExist(url);
									console.log("re : "+re)
									if(re){
										$note.summernote('insertImage', url);
										break;
									}
								}
							}
						});
					}	
				}
			});
		});
		
		function doesFileExist(urlToFile){
			var xhr = new XMLHttpRequest();
			xhr.open('HEAD', urlToFile, false);
			xhr.send();
			
			if (xhr.status == "404") {
				return false;
			} else {
				return true;
			}
		}
		
		$("#save").on("click",function(){
			fncUpdatecommunity();
		});
		
		function fncUpdatecommunity() {
					
			var name = $("input[name=title]").val();
			var detail = $("textarea[name=detail]").val();
	
			if (name == null || name.length < 1) {
				alert("������ �Է����ּ���.");
				return false;
			}
			if (detail == null || detail.length < 1) {
				alert("������ �Է����ּ���.");
				return false;
			}
			
			$("form").attr("method","POST").attr("action","/love/updateLoveAdvice?communityNo=${community.communityNo}").submit();
		}
		
	});
</script>
<style>
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
		width : 50%;
		height : 40em;
		padding : 1em;
		text-align : center;
		border : 1px solid #a9a9a9;
		border-radius : 5px;
	}
	.representImg img{
		width : 80%;
	}
</style>

</head>
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolBar.jsp" />
	<!-- ToolBar End /////////////////////////////////////-->
	
	<div class="container">
	
		<div class="row text-center">
			<h1>�������� ����</h1>
		</div>
		
		<div class="row">
		
			<form enctype="multipart/form-data">
				
				<!-- �������������� ������Ʈ ��Ʈ�ѷ��� ������ ������ : start -->
				<input type="hidden" name="writerId" value="${ community.writerId }">
				<input type="hidden" name="category" value="${ community.category }">
				<input type="hidden" name="userGrade" value="${ community.userGrade }">
				<input type="hidden" name="writerNickName" value="${ community.writerNickName }">
				<input type="hidden" name="views" value="${ community.views }">
				<input type="hidden" name="like" value="${ community.like }">
				<input type="hidden" name="importRank" value="${ community.importRank }">
				<input type="hidden" name="viewCondition" value="${ community.viewCondition }">
				<!-- �������������� ������Ʈ ��Ʈ�ѷ��� ������ ������ : end -->
				
				<div class="form-group">
				
					<label for="title">����</label>
					<input type="text" class="form-control" name="title" value="${ community.title }">
					
				</div>
				
				<div class="form-group">
				
					<label for="title">��ǥ�̹���</label>
					<input type="file" name="uploadFile" class="form-control">
					<div class="representImg">
						<img src="/resources/images/uploadImg/${community.fileName }">
					</div>
					
				</div>
			
				<div class="form-group">
				
					<textarea id="summernote" name="detail">${ community.detail }</textarea>
					
				</div>
				
				<div class="form-group text-center">
				
					<button type="button" class="btn btn-default btn-lg" id="save">Ȯ��</button>
					
				</div>
				
			
			</form>
				
		</div>
	
	</div>
	
	<div id="loading">
		<img id="loading-image" src="../resources/images/loading.gif" alt="loading">
	</div>
	
</body>
</html>