<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>blog 글 수정하기</title>
    <!-- include libraries(jQuery, bootstrap) -->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

    <!-- include summernote css/js-->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<style>

 #inputTitle {
        width: 90%;
        font-size: xx-large;
    }
</style>

</head>
<body>
<a href="javascript:history.back();">뒤로가기</a>

<form action="blogUpdateOk.do" method="post">
	<input type="hidden" value="${requestScope.content.blog_no }" name="blog_no" id="blog_no">
	<input type="hidden" value="${requestScope.content.id }" name="id" id="id">
	<input type="hidden" value="${requestScope.content.hits }" name="hits" id="hits">
	<input type="hidden" value="${requestScope.content.blog_date }" name="blog_date" id="blog_date">
	<div>
		<input id="inputTitle" placeholder="제목을 작성해주세요" name = "blog_title" value="${requestScope.content.blog_title}">
	</div>
		<textarea id="summernote" name="blog_content"  ></textarea>
	<div id="test_cnt">(0 / 100)</div>
	<input type="submit" id="test" value="수정하기" >
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
        	onChange:function(contents, $editable){ //텍스트 글자수 및 이미지등록개수
        		console.log(contents);
                setContentsLength(contents, 0);
            }
			
        }
	});//summernote end
		 $('#summernote').summernote('pasteHTML', '${requestScope.content.blog_content}');
	});//window.onload end 
	
	function setContentsLength(str, index) {
	    var status = false;
	    var textCnt = 0; //총 글자수
	    var maxCnt = 100; //최대 글자수
	    var editorText = f_SkipTags_html(str); //에디터에서 태그를 삭제하고 내용만 가져오기
	    editorText = editorText.replace(/\s/gi,""); //줄바꿈 제거
	    editorText = editorText.replace(/&nbsp;/gi, ""); //공백제거

        textCnt = editorText.length;
	    if(maxCnt > 0) {
        	if(textCnt > maxCnt) {
                status = true;
        	}
	    }

	    if(status) {
        	var msg = "등록오류 : 글자수는 최대 "+maxCnt+"까지 등록이 가능합니다. / 현재 글자수 : "+textCnt+"자";
        	console.log(msg);
        	alert(msg);
	    }
	} //setContentsLength
    
//에디터 내용 텍스트 제거
  function f_SkipTags_html(input, allowed) {
  	// 허용할 태그는 다음과 같이 소문자로 넘겨받습니다. (<a><b><c>)
      allowed = (((allowed || "") + "").toLowerCase().match(/<[a-z][a-z0-9]*>/g) || []).join('');
      var tags = /<\/?([a-z][a-z0-9]*)\b[^>]*>/gi,
      commentsAndPhpTags = /<!--[\s\S]*?-->|<\?(?:php)?[\s\S]*?\?>/gi;
      return input.replace(commentsAndPhpTags, '').replace(tags, function ($0, $1) {
          return allowed.indexOf('<' + $1.toLowerCase() + '>') > -1 ? $0 : '';
      });
  }
    
    
    $('#test').click(function(){
    	console.log($('.panel-body').html());
    	alert($('.panel-body').html());
    });
   
    
    function fileChange(file){
    	console.log(typeof file);
    	console.log(file);
        let fileurl = "";
        var form = new FormData();
        form.append("image", file[0]);

        var settings = {
        "url": "https://api.imgbb.com/1/upload?key=bb2840aa7662570a5576bbd59c7c849a",
        "method": "POST",
        "timeout": 0,
        "processData": false,
        "mimeType": "multipart/form-data",
        "contentType": false,
        "data": form
        };


        $.ajax(settings).done(function (response) {
            console.log(response);
            var jx = JSON.parse(response);
            console.log(jx.data.url);
            fileurl = jx.data.url;
            console.log(fileurl);
            console.log(1);
        	$('#summernote').summernote('insertImage', fileurl);
        	console.log(2);
        });
    }
</script>
</body>
</html>