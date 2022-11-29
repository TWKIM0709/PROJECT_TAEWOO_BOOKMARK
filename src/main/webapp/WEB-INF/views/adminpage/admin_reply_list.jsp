<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
	 <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/utils/include/admintop.jsp"></jsp:include>
어드민 댓글 리스트
<div class="container">
  <div class="row">
    <div class="col" style="background-color:lavender;">
    	  <table class="table table-striped">
		    <thead>
		    	<tr rowspan="4">
		    		<td>책 댓글</td>
		    	</tr>
		      <tr>
		        <th>댓글번호</th>
		        <th>작성자</th>
		        <th>댓글내용</th>
		        <th>비고</th>
		      </tr>
		    </thead>
		    <tbody id="bookreply">
			      <tr onclick="location.href= '#' " class="trelement">
						<td>댓글번호</td>
						<td>작성자</td>
						<td>	댓글내용</td>
						<td>작성일</td>
			      </tr>
		    </tbody>
		  </table>
    </div>
    <div class="col" style="background-color:orange;">
    	  <table class="table table-striped">
		    <thead>
		    	<tr rowspan="4">
		    		<td>블로그 댓글</td>
		    	</tr>
		      <tr>
		        <th>댓글번호</th>
		        <th>작성자</th>
		        <th>댓글내용</th>
		        <th>작성일</th>
		      </tr>
		    </thead>
		    <tbody id="blogreply">
			      <tr onclick="location.href= '#' " class="trelement">
						<td>댓글번호</td>
						<td>작성자</td>
						<td>	댓글내용</td>
						<td>작성일</td>
			      </tr>
		    </tbody>
		  </table>
    </div>
  </div>
</div>
</body>
<script type="text/javascript">

// = = = = 책 댓글 불러오는 함수
 	function bookreload(){
		$.ajax({
			url:"ReplyAll",
			type:"post",
			dataType:"json",
			data:{"type":"book"},
			success:function(result){
				console.log(result);
				$('#bookreply').empty();
				let text = '';
				for(let index in result.BOOK){
					text += '<tr onclick="location.href= &#39;#&#39; " class="trelement">'+
										'<td> '+ result.BOOK[index].reply_no+'</td>'+    
										'<td> '+ result.BOOK[index].id+'</td>'+
										'<td> '+ result.BOOK[index].reply_content+'</td>'+
										'<td> '+ result.BOOK[index].reply_date+'</td>'+
							      '</tr>';
				}//for end
				$('#bookreply').append(text);
			},//success end
			error:function(error){
				console.log(error);
			}//error end
		});//ajax end
	}
// = = = = 블로그 댓글 불러오는 함수
 	function blogreload(){
		$.ajax({
			url:"ReplyAll",
			type:"post",
			dataType:"json",
			data:{"type":"blog"},
			success:function(result){
				console.log(result);
				$('#blogreply').empty();
				let text = '';
				for(let index in result.BLOG){
					text += '<tr onclick="location.href= &#39;#&#39; " class="trelement">'+
										'<td> '+ result.BLOG[index].blog_reply_no+'</td>'+    
										'<td> '+ result.BLOG[index].id+'</td>'+
										'<td> '+ result.BLOG[index].reply_content+'</td>'+
										'<td> '+ result.BLOG[index].reply_date+'</td>'+
							      '</tr>';
				}//for end
				$('#blogreply').append(text);
			},//success end
			error:function(error){
				console.log(error);
			}//error end
		});//ajax end
	}
// = = = = onload
$(function(){
	bookreload();
	blogreload();
}); //onload end

</script>
</html>