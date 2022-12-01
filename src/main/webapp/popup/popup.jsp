<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팝업</title>
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
<button onclick="setItemWithExpireTime(${param.file},1,86400000)">하루동안 보지 않기</button>
</body>
<script type="text/javascript">
	function setItemWithExpireTime(keyName, keyValue, tts) {
		  // localStorage에 저장할 객체
		  alert('');
		  const obj = {
		    value : keyValue,
		    expire : Date.now() + tts
		  }
		 
		  // 객체를 JSON 문자열로 변환
		  const objString = JSON.stringify(obj);
		 
		  // setItem
		  window.localStorage.setItem(keyName, objString);
		  self.close();
		}
</script>
</html>