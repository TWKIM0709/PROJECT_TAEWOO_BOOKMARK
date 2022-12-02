<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>팝업 | 관리자</title>
	<!-- jquery -->
	 <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	 <!-- bootstrap -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  	<style type="text/css">
  		.title{
  			width:30%;
  		}
  		.content{
  			widt:70%;
  		}
  		th{
  			text-align:center;
  		}
  	</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/utils/include/admintop.jsp"></jsp:include>
어드민 팝업 수정
<div class="container">     
<form action="popupEdit.do" method="post">
<input type="hidden" value="${requestScope.popup.popup_no }" name="popup_no">
<input type="hidden" value='${requestScope.popup.id }' name="id">
  <table class="table">
    <thead>
    	<tr>
    		<th colspan="2"><h1>팝업 공지사항 수정 페이지</h1></th>
    	</tr>
    </thead>
    <tbody>
      <tr>
        <td class="title">팝업제목</td>
        <td class="content"><input type="text" class="form-control border" placeholder="팝업 제목을 입력하세요" name="popup_title" value='${requestScope.popup.popup_title }'></td>
      </tr>
      <tr>
        <td class="title">이미지</td>
        <td class="content"><input type="text" class="form-control border" placeholder="이미지 링크를 입력하세요" name="popup_filename" value='${requestScope.popup.popup_filename }'></td>
      </tr>
      <tr>
        <td class="title">~기간</td>
        <td class="content"><input type="date" class="form-control border"  name="popup_date"  id="popup_date" ></td>
      </tr>
      <tr>
      	<td colspan="2">
      		<input type="submit" value="수정하기" class="btn btn-outline-dark">
      		<input type="button" value="삭제하기" class="btn btn-outline-dark" onclick="location.href='popupDelete.do?popup_no=${requestScope.popup.popup_no}'">
      	</td>
      	
      </tr>
    </tbody>
  </table>
  </form>
</div>
</body>
<script>
$(function(){
	let datestr = '20' + '${requestScope.popup.popup_date}';
	datestr = datestr.replace('/','-');
	datestr = datestr.replace('/','-');
	$('#popup_date').val(datestr);
});
</script>
</html>