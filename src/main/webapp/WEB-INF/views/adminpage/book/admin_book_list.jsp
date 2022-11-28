<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	 <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!--   	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script> -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  	<style type="text/css">
  		#search{
  			background-color:white;
  			width:100%;
  		}
  		.pager{
  			text-align:center;
  		}
  		#bookaddbtn{
  			min-width:41px;
  		}
  	</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/utils/include/admintop.jsp"></jsp:include>
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
    <tbody id="content-area">
		<c:forEach var="book"  items="${requestScope.booklist}"> 
		      <tr onclick="location.href= 'bookDetail.do?isbn=${book.isbn}' " class="trelement">
					<td style="max-width: 160px;"><img alt="책표지" src="${book.book_filename }"></td>
					<td>${book.isbn }</td>
					<td>${book.book_name }</td>
					<td>${book.author }</td>
					<td>${book.price }</td>
		      </tr>
		</c:forEach>
		<tr>
			<td><input class="form-control"type="text" name="search" id="search" placeholder="ISBN검색"></td>
			<td colspan="3" class="pager" id ="pager-area">
			${requestScope.pager }
			</td>
			<td><button type="button" class="btn btn-outline-dark" id="bookaddbtn">책추가</button></td>
		</tr>
    </tbody>
  </table>
  
</div>
</body>
<script type="text/javascript">
function detail(isbn){
	location.href="bookDetail.do?isbn=" + isbn;
}
$('#search').keydown(function(keyNum){
    if(keyNum.keyCode == 13){
        alert('bookUserLikeList.do');
        $.ajax({
        	url : "bookUserLikeList.do",
        	data : {book_name : $('#search').val()},
        	type:"post",
        	dataType:"json",
        	success : function(result){
        		console.log(result);
        		let text = "";
        		for(let index in result.booklist){
        			text += '<tr onclick="location.href= &#39; bookDetail.do?isbn='+result.booklist[index].isbn+' &#39;" class="trelement">'+
						'<td style="max-width: 160px;"><img alt="책표지" src="'+result.booklist[index].book_filename+'"></td>'+
						'<td>'+result.booklist[index].isbn+'</td>'+
						'<td>'+result.booklist[index].book_name+'</td>'+
						'<td>'+result.booklist[index].author+'</td>'+
						'<td>'+result.booklist[index].price+'</td>'+
			      '</tr>';
        		}
        		console.log(text);
				$('.trelement').remove();
				$('#pager-area').empty();
				
				$('#content-area').prepend(text);
				$('#pager-area').append(result.pager);
        	},
        	error : function(error){
        		alert('error');
        		console.log(error);
        	}
        });
    }
});
$('#bookaddbtn').on({
	click:function(){
		location.href="bookAdd.do"
	}
});
</script>
</html>