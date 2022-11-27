<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<meta charset="UTF-8">
	<title>Insert title here</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/utils/include/admintop.jsp"></jsp:include>
어드민 블로그 리스트
<div class="container">
  <table class="table table-striped">
    <thead>
      <tr>
        <th>게시글번호</th>
        <th>작성자</th>
        <th>제목</th>
        <th>조회수</th>
        <th>작성일</th>
      </tr>
    </thead>
    <tbody>
		<c:forEach var="blog"  items="${requestScope.blogboardlist }"> 
      <tr>
			<td>${blog.blog_no }<td>
			<td>${blog.id }</td>
			<td>${blog.blog_title }</td>
			<td>${blog.hits }</td>
			<td>${blog.blog_date }</td>
      </tr>
		</c:forEach>
    </tbody>
  </table>
</div>

</body>
</html>