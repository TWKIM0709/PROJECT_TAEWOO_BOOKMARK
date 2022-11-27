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
어드민 책 리스트
<div class="container">        
  <table class="table table-striped">
    <thead>
      <tr>
        <th>표지</th>
        <th>ISBN</th>
        <th>이름</th>
        <th>작가</th>
        <th>가격</th>
      </tr>
    </thead>
    <tbody>
		<c:forEach var="book"  items="${requestScope.booklist}"> 
		      <tr onclick="location.href= 'bookDetail.do?isbn=${book.isbn}&id=${sessionScope.id }' ">
					<td><img alt="책표지" src="${book.book_filename }"></td>
					<td>${book.isbn }</td>
					<td>${book.book_name }</td>
					<td>${book.author }</td>
					<td>${book.price }</td>
		      </tr>
		</c:forEach>
		<tr>
			<td colspan="5">
			${requestScope.pager }
			</td>
		</tr>
    </tbody>
  </table>
  
</div>
</body>
</html>