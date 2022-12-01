<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css">
	<!-- sweetalert -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<meta charset="UTF-8">
	<title>블로그 | 관리자</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/utils/include/admintop.jsp"></jsp:include>
어드민 블로그 리스트a
<div class="container">
  <table class="table table-striped" id="blogtable">
    <thead>
      <tr>
        <th>게시글번호</th>
        <th>작성자</th>
        <th>제목</th>
        <th>조회수</th>
        <th>작성일</th>
        <th>삭제하기</th>
      </tr>
    </thead>
    <tbody>
		<c:forEach var="blog"  items="${requestScope.blogboardlist }"> 
		      <tr>
					<td>${blog.blog_no }</td>
					<td>${blog.id }</td>
					<td onclick=" location.href='blogDetail.do?blog_no=${blog.blog_no}' " style="cursor:pointer">${blog.blog_title }</td>
					<td>${blog.hits }</td>
					<td>${blog.blog_date }</td>
					<td><button class="btn btn-dark" onclick="blogdelete(${blog.blog_no})">삭제하기</button></td>
		      </tr>
		</c:forEach>
    </tbody>
  </table>
</div>

</body>
<script type="text/javascript">
	/* $('#blogtable').DataTable({
		ajax:{url:"data.json",dataSrc:''},
		columns:[
			{data:"blog_no"},
			{data:"id"},
			{data:"blog_title"},
			{data:"hits"},
			{data:"blog_date"}
		]
	}); */
	 $(function(){
		$('#blogtable').DataTable();
	}) 
	function blogdelete(blog_no){ 
		Swal.fire({
			  title: 'Are you sure?',
			  text: blog_no +"번 글이 삭제됩니다.",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes, delete it!'
			}).then((result) => {
			  if (result.isConfirmed) {
					location.href = "blogDeleteOk.do?blog_no="+blog_no;
			  }
			})
	}
</script>
</html>