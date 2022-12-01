<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 | 관리자</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<style type="text/css">
		#sign{
			width:15%;
		}
	</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/utils/include/admintop.jsp"></jsp:include>
어드민 책 상세
<div class="container">
<form action="bookAddOk.do" method="post" enctype="multipart/form-data">
  <table class="table table-bordered">
    <thead>
    </thead>
    <tbody>
      <tr>
        <td rowspan="4"><img alt="책표지" > </td>
        <td>ISBN</td>
        <td><input type="text" class="form-control" id="isbn" name="isbn"></td>
      </tr>
      <tr>
        <td>작가</td>
        <td><input type="text" class="form-control" id="author" name="author" ></td>
      </tr>
      <tr>
        <td>이름</td>
        <td><input type="text" class="form-control" id="book_name" name="book_name" ></td>
      </tr>
      <tr>
        <td>가격</td>
        <td><input type="number" class="form-control" id="price" name="price"></td>
      </tr>
      <tr>
      	<td id="sign"><input type="text" class="form-control" id="book_filename" name="book_filename" placeholder="책 표지 링크를 입력" ></td>
        <td>ebook</td>
        <td><input type="file" name="ebook" id="ebook"></td> 	
      </tr>
      <tr>
        <td colspan="3"><textarea class="form-control" rows="5" id="description" name="description"></textarea></td>
      </tr>
      <tr>
        <td colspan="3">
			<button type="submit" class="btn btn-outline-dark" id="addbtn" >추가하기</button>
			<button type="button" class="btn btn-outline-dark" id="canclebtn">취소하기</button>
		</td>
      </tr>
    </tbody>
  </table>
  </form>
</div>
</body>
<script type="text/javascript">
	$('#addbtn').on({
		click:function(){
			alert('추가');
		}
	});
	$('#canclebtn').on({
		click:function(){
			history.back();
		}
	});
</script>
</html>