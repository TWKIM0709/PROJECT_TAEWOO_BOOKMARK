<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	button{
		font-size:12px;
		position:absolute;
		top:90%;
		left:90%;
	}
</style>
</head>
<body>
<img alt="팝업" src=${param.file}>
<button onclick="closePopup()">하루동안 보지 않기</button>
</body>
<script type="text/javascript">
	function setCookie(name, value, expiredays){
		var date = new Date();
		date.setDate(date.getDate() + expiredays);
		document.cookie = escape(name)  +"="+ escape(value) +"; expires=" +date.toUTCString();
	}
	function closePopup(){
		setCookie('${param.file}','N',1);
		self.close();
	}
</script>
</html>