<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head>
  <title>관리자 댓글</title>
  <meta charset="utf-8">
  <!-- jquery -->
	 <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	 <!-- bootstrap -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<style type="text/css">
		table{
			font-size:12px;
			margin-top:15px;
		}
		.col{
			padding-top:10px;
		}
	</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/utils/include/admintop.jsp"></jsp:include>
어드민 댓글 리스트
<div class="container">
  <div class="row">
    <div class="col" style="background-color:lavender;">
    	  <table class="table table-striped" id="booktable">
		    <thead>
		    	<tr>
		    		<td colspan="4">책 댓글</td>
		    	</tr>
		      <tr>
		        <th>댓글번호</th>
		        <th>작성자</th>
		        <th>댓글내용</th>
		        <th>작성일</th>
		        <td>선택</td>
		      </tr>
		    </thead>
		    <tbody id="bookreply">
			      <tr onclick="location.href= '#' " class="trelement">
						<td>댓글번호</td>
						<td>작성자</td>
						<td>	댓글내용</td>
						<td>작성일</td>
					<td>선택</td>
			      </tr>
		    </tbody>
		  </table>
    </div>
    <div class="col" style="background-color:orange;">
    	  <table class="table table-striped" id="blogtable">
		    <thead>
		    	<tr>
		    		<td colspan="4">블로그 댓글</td>
		    	</tr>
		      <tr>
		        <th>댓글번호</th>
		        <th>작성자</th>
		        <th>댓글내용</th>
		        <th>작성일</th>
		          <th>선택</th>
		      </tr>
		    </thead>
		    <tbody id="blogreply">
			      <tr onclick="location.href= '#' " class="trelement">
						<td>댓글번호</td>
						<td>작성자</td>
						<td>	댓글내용</td>
						<td>작성일</td>
						<td>선택</td>
			      </tr>
		    </tbody>
		  </table>
    </div>
  </div>
</div>
</body>
<script type="text/javascript">
	// = = = = onload
	$(function(){
		bookreload();
		blogreload();
	}); //onload end
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
										'<td> </td>'
									
							      '</tr>';
				}//for end
				$('#bookreply').append(text);
				let booktable = $('#booktable').DataTable();
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
										'<td> </td>'+
							      '</tr>';
				}//for end
				$('#blogreply').append(text);
				let blogtable = $('#blogtable').DataTable();
			},//success end
			error:function(error){
				console.log(error);
			}//error end
		});//ajax end
	}
</script>
</html>