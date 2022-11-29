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
어드민 유저 리스트
  <table class="table table-striped">
    <thead>
      <tr>
        <th>아이디</th>
        <th>비밀번호</th>
        <th>이름</th>
        <th>관리자유무</th>
        <th>생년월일/성별</th>
      </tr>
    </thead>
    <tbody id="content-area">
		<c:forEach var="user"  items="${requestScope.userlist}">
		
		      <tr onclick="location.href= '#' " class="trelement">
					<td>${user.id }</td>
					<td>${user.password }</td>
					<td>	${user.name}</td>
					<td>${user.state }</td>
					<td>${user.regist_no }</td>
		      </tr>
		</c:forEach>
		<tr>
			<td><input class="form-control"type="text" name="search" id="search" placeholder="회원ID검색"></td>
			<td colspan="3" class="pager" id ="pager-area">
			${requestScope.pager }
			</td>
			<td></td>
		</tr>
    </tbody>
  </table>
</body>
<script type="text/javascript">
 $('#search').keydown(function(keyNum){
	if(keyNum.keyCode == 13){
	    $.ajax({
	    	url : "userSearch.do",
	    	data : {
				"type":"id",
				"value":$('#search').val()
	    	},
	    	type:"post",
	    	dataType:"json",
	    	success : function(result){
	    		console.log(result);
	    		let text = "";
	    		for(let index in result.likeuserlist){// &#39;
	    			text += '<tr onclick="location.href= &#39;#&#39; " class="trelement">'+
										'<td>'+result.likeuserlist[index].id + '</td>'+
										'<td>'+result.likeuserlist[index].password + '</td>'+
										'<td>'+result.likeuserlist[index].name+'</td>'+
										'<td>'+result.likeuserlist[index].state+'</td>'+
										'<td>'+result.likeuserlist[index].regist_no+'</td>'+
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
</script>
</html>