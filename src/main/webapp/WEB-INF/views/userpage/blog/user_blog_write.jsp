<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>blog 글쓰기</title>
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<!-- include summernote css/js-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<style>
#inputTitle {
	width: 90%;
	font-size: xx-large;
}
</style>

</head>
<body>
	<a href="javascript:history.back();">뒤로가기</a>
	<h1></h1>
	<form action="blogWriteOk.do" method="post"
		enctype="multipart/form-data">
		<div>
			<input id="inputTitle" placeholder="제목을 작성해주세요" name="blog_title">
		</div>
		<textarea id="summernote" name="blog_content"></textarea>
		<input type="submit" id="test" value="글쓰기">
	</form>
	<script>
		// 메인화면 페이지 로드 함수
		 $(document).ready(function() {
			//여기 아래 부분
			$('#summernote').summernote({
				  height: 700,                 // 에디터 높이
				  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
				  lang: "ko-KR",					// 한글 설정
				  placeholder: '내용',
		          disableResizeEditor: true,	// 크기 조절 기능 삭제
		          toolbar: [
		            ['fontname', ['fontname']],
		            ['fontsize', ['fontsize']],
		            ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		            ['color', ['forecolor','color']],
		            ['table', ['table']],
		            ['para', ['ul', 'ol', 'paragraph']],
		            ['height', ['height']],
		            ['insert',['picture','link','video']],
		            ['view', ['fullscreen', 'help']]
		          ],
		        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
		        fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
		        callbacks :{
		        	
		        	onImageUpload: function(files) {
						 fileChange(files);
					   },
		        	
		        }
		       
			});
			});
    
		function fileChange(file) {
			let fileurl = "";
			var form = new FormData();
			form.append("image", file[0]);

			var settings = {
				"url" : "https://api.imgbb.com/1/upload?key=bb2840aa7662570a5576bbd59c7c849a",
				"method" : "POST",
				"timeout" : 0,
				"processData" : false,
				"mimeType" : "multipart/form-data",
				"contentType" : false,
				"data" : form
			};

			$.ajax(settings).done(function(response) {
				var jx = JSON.parse(response);
				fileurl = jx.data.url;
				$('#summernote').summernote('insertImage', fileurl);
			});
		}
	</script>
</body>
</html>