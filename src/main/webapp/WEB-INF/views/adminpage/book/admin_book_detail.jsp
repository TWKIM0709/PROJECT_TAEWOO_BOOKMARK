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
        <td rowspan="4"><img alt="책표지" src="${book.book_filename }"> </td>
        <td>ISBN</td>
        <td>
        	<input type="hidden" class="form-control border" id="isbn" name="isbn" value="${book.isbn }" >
        	<input type="text" class="form-control border" id="" name="" value="${book.isbn }" disabled>
        </td>
      </tr>
      <tr>
        <td>작가</td>
        <td><input type="text" class="form-control border" id="author" name="author" value="${book.author}"></td>
      </tr>
      <tr>
        <td>이름</td>
        <td><input type="text" class="form-control border" id="book_name" name="book_name" value="${book.book_name }"></td>
      </tr>
      <tr>
        <td>가격</td>
        <td><input type="number" class="form-control border" id="price" name="price" value="${book.price }"></td>
      </tr>
      <tr>
        <td id="sign"><input type="text" class="form-control" id="book_filename" name="book_filename" placeholder="책 표지 링크를 입력"  value="${book.book_filename }"></td>
        <td>EBOOK</td>
        <td><span class="ebookfile">등록된 EBOOK : ${book.file_name } </span><input type="file" name="ebook" id="ebook"></td>
      </tr>
      <tr>
        <td colspan="3"><textarea class="form-control" rows="5" id="description" name="description">${book.description }</textarea></td>
      </tr>
      <tr>
        <td colspan="3">
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