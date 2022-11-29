<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <!--  <script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
	 -->
	 <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	 <meta charset="UTF-8">
	<title>Insert title here</title>
  	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<style type="text/css">
		#sign{
			width:15%;
		}
		.ebookfile{
			color:gray;
		}
	</style>
	<!-- include summernote css/js-->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/utils/include/admintop.jsp"></jsp:include>
어드민 책 상세
<c:set var="book"  value="${requestScope.book }"/>
<div class="container">
<form action="bookUpdate.do" method="post"  enctype="multipart/form-data"><!-- bookUpdate.do -->
  <table class="table table-bordered">
    <thead>
    </thead>
    <tbody>
      <tr>
        <td>글번호</td>
        <td>
        	<input type="hidden" class="form-control border" id="isbn" name="isbn" value="${blog.blog_no}" >
        	<input type="text" class="form-control border" id="" name="" value="${blog.blog_no}" disabled>
        </td>
      </tr>
      <tr>
        <td>작성자</td>
        <td><input type="text" class="form-control border" id="author" name="author" value="${blog.id}"></td>
      </tr>
      <tr>
        <td>제목</td>
        <td><input type="text" class="form-control border" id="book_name" name="book_name" value="${blog.blog_content }"></td>
      </tr>
      <tr>
        <td>조회수</td>
        <td><input type="number" class="form-control border" id="price" name="price" value="${blog.hits }"></td>
      </tr>
      <tr>
        <td>작성일</td>
        <td>
        <input type="hidden" class="form-control border" id="book_name" name="book_name" value="${blog.blog_date }">
        <input type="text" class="form-control border" id="book_name" name="book_name" value="${blog.blog_date }">
        </td>
      </tr>
      <tr>
        <td colspan="2"><textarea class="form-control" rows="5" id="description" name="description"></textarea></td>
      </tr>
      <tr>
        <td colspan="2">
			<button type="submit" class="btn btn-outline-dark" id="updatebtn">수정하기</button>
			<button type="button" class="btn btn-outline-dark" id="canclebtn">취소하기</button>
			<button type="button" class="btn btn-outline-dark" id="deletebtn">삭제하기</button>
		</td>
      </tr>
    </tbody>
  </table>
  </form>
</div>
</body>
<script type="text/javascript">
	$('#deletebtn').on({
		click:()=>{
			$.ajax({
				url:"bookDeleteOk.do",
				type : "post",
				data : {
					isbn : $('#isbn').val()
				},
				dataType : "text",
				success : function(result){
					console.log(result);
					if(result == 0){
						alert('삭제됨');
						location.href = "bookAlllist.do";
					} else if (result == 1){
						alert('삭제 실패');
					} else if (result == 2){
						alert('삭제 에러');
					}
				},
				error : function(){
					alert('삭제 에러');
				}
			});
		}
	});
	$('#canclebtn').on({
		click:function(){
			history.back();
		}
	});
</script>
</html>