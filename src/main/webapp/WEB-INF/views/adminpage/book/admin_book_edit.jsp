<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<jsp:include page="/WEB-INF/views/utils/include/admintop.jsp"></jsp:include>
어드민 책 상세
<c:set var="book"  value="${requestScope.book }"/>
<div class="container">
  <table class="table table-bordered">
    <thead>
    </thead>
    <tbody>
      <tr>
        <td rowspan="4"><img alt="책표지" src="${book.book_filename }"> </td>
        <td>ISBN</td>
        <td><input type="text" class="form-control" id="" name="" value="${book.isbn }"></td>
      </tr>
      <tr>
        <td>작가</td>
        <td><input type="text" class="form-control" id="" name="" value="${book.author}"></td>
      </tr>
      <tr>
        <td>이름</td>
        <td><input type="text" class="form-control" id="" name="" value="${book.book_name }"></td>
      </tr>
      <tr>
        <td>가격</td>
        <td><input type="number" class="form-control" id="" name="" value="${book.price }"></td>
      </tr>
      <tr>
      <td><input type="text" class="form-control" id="book_filename" name="book_filename" placeholder="책 표지 링크를 입력"  value="${book.book_filename }"></td>
        <td>ebook</td>
        <td>${book.file_name }</td>
      </tr>
      <tr>
        <td colspan="3"><textarea class="form-control" rows="5" id="" value="${book.description }"></textarea></td>
      </tr>
      <tr>
        <td colspan="3">
			<button type="button" class="btn btn-outline-dark" id="updatebtn">수정하기</button>
			<button type="button" class="btn btn-outline-dark" id="canclebtn">취소하기</button>
		</td>
      </tr>
    </tbody>
  </table>
</div>
</body>
<script type="text/javascript">
$('#updatebtn').on({
	click:function(){
		alert('수정');
	}
});
$('#canclebtn').on({
	click:function(){
		history.back();
	}
});
$('#canclebtn').on({
	click:function(){
		history.back();
	}
});
$('#canclebtn').on({
	click:function(){
		history.back();
	}
});
</script>
</html>