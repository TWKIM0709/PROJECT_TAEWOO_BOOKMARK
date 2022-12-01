<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팝업 | 관리자</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<jsp:include page="/WEB-INF/views/utils/include/admintop.jsp"></jsp:include>
어드민 팝업 리스트
<div class="container">
  <table class="table table-striped">
    <thead>
      <tr>
      	<th>팝업 이미지</th>
        <th>팝업번호</th>
        <th>작성자</th>
        <th>제목</th>
        <th>~기간</th>
      </tr>
    </thead>
    <tbody>
		<c:forEach var="popup"  items="${requestScope.list }"> 
      <tr>
			<td><img alt="이미지 없음" src="${popup.popup_filename }" style="width:200px; max-height:120px;"> </td>
			<td>${popup.popup_no }</td>
			<td>${popup.id }</td>
			<td onclick=" location.href='popupDetail.do?popup_no=${popup.popup_no}'; ">${popup.popup_title }</td>
			<td>~${popup.popup_date }</td>
      </tr>
		</c:forEach>
      <tr>
      	<td colspan="4">${requestScope.pager }</td>
      	<td><button type="button" class="btn btn-outline-dark" onclick="location.href='popupAdd.do' ">팝업추가</button></td>
      </tr>
    </tbody>
  </table>
</div>
</body>
</html>