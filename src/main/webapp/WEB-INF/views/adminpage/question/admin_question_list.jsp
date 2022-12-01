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
        <th>글번호</th>
        <th>작성자</th>
        <th>제목</th>
        <th>조회수</th>
        <th>작성일</th>
      </tr>
    </thead>
    <tbody id="content-area">
		<c:forEach var="question"  items="${requestScope.questionlist}">
		
		      <tr onclick="location.href= 'questionDetail.do?question_no=${question.question_no}' " class="trelement">
					<td>${question.question_no }</td>
					<td>${question.id }</td>
					<td>
						<c:forEach var="i" begin="0" end="${question.depth }">&nbsp;&nbsp;&nbsp;</c:forEach>
						<c:if test="${question. step > 0}">ㄴ</c:if> 
						${question.question_title}
					</td>
					<td>${question.hits }</td>
					<td>${question.question_date }</td>
		      </tr>
		</c:forEach>
    </tbody>
  </table>
  <table class="table">
    <thead>
    </thead>
    <tbody>
		<tr>
			<td style="width:20%"><input class="form-control"type="text" name="search" id="search" placeholder="글 제목"></td>
			<td class="pager" id ="pager-area" >
			${requestScope.pager }
			</td>
			<td style="width:20%"></td>
		</tr>
    </tbody>
  </table>
</div>
</body>
<script type="text/javascript">
 $('#search').keydown(function(keyNum){
	if(keyNum.keyCode == 13){
		let inputtext = $('#search').val();
	    likeSearch(inputtext, "1")
	}
}); 
 function likeSearch(searchval, cpageval){
	 $.ajax({
	    	url : "questionLike.do",
	    	data : {
	    		search: searchval,
	    		ps : "5",
	    		cp : cpageval
	    	},
	    	type:"post",
	    	dataType:"json",
	    	success : function(result){
	    		let text = "";
	    		for(let index in result.questionlist){// &#39;
	    			console.log(result.questionlist[index].depth);
	    			text += '<tr onclick="location.href= &#39;ㅇㅇㅇ&#39; " class="trelement">'+
										'<td>'+result.questionlist[index].question_no+'</td>'+
										'<td>'+result.questionlist[index].id + '</td>'+
										'<td>'+
											'<c:if test=" '+result.questionlist[index].step+' > 0}">ㄴ</c:if>'+ 
											result.questionlist[index].question_title+
										'</td>'+
										'<td>'+result.questionlist[index].hits+'</td>'+
										'<td>'+result.questionlist[index].question_date+'</td>'+
							      '</tr>'; 
	    		}
				$('.trelement').remove();
				$('#pager-area').empty();
				
				$('#content-area').prepend(text);
				$('#pager-area').append(result.pager);
	    	},
	    	error : function(error){
	    		alert('error');
	    	}
	    });
 }
</script>
</html>