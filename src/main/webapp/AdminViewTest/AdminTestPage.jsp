<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<span id="text"></span>
<hr>
<button id="btn1" onclick="admin()">어드민버튼</button>
<hr>
<a id="a1" href="/PROJECT_TAEWOO_BOOKMARK/main.do">메인으로</a>
<hr>
</body>
<script type="text/javascript">
	function admin(){
		let admin = sessionStorage.getItem('admin');
		if(admin == null){
			console.log('admin 생성');
			sessionStorage.setItem('admin',1);
			$('#btn1').text('현재:admin');
		} else {
			console.log('admin 삭제');
			sessionStorage.removeItem('admin');
			$('#btn1').text('현재:user');
		}
	}
</script>
</html>