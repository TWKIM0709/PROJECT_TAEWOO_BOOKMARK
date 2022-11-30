<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><html lang="ko" class="">
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
  <title>갈피표</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">  
  <!-- jquery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <!-- bootstrap -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <style>
    .navbar{
        padding-left: 10%;
    }
    .top-main{
        width:70%;
    }
  </style>
</head>
<body>
<!-- 로그인/권한 체크 -->
<c:if test="${sessionScope.id == null}">
	<script>
		alert('세션만료');
		location.href = 'login.html';
	</script>
</c:if>
<c:if test="${sessionScope.admin != 'admin' }">
	<script type="text/javascript">
		alert('권한이 없습니다.');
		location.href = 'login.html';
	</script>
</c:if>
<!-- navbar -->
<nav class="navbar navbar-expand-sm bg-light navbar-light">
  <a class="navbar-brand" href="main.do">
    <img src="갈피표.png" alt="logo" style="width:40px;">
  </a>
  <ul class="navbar-nav top-main">
    <li class="nav-item active">
      <a class="nav-link" href="blogAlllist.do">블로그</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="bookAlllist.do">책</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="calendarall.do">일정</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="popup.do">팝업</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="question.do">문의사항</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="userList.do">회원</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="paymentAlllist.do">결제내역</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="replyAllList.do">댓글</a>
    </li>
  </ul>
  <ul class="navbar-nav logoutbtn">
    <li class="nav-item active">
     <button class="btn btn-outline-secondary btn-sm">로그아웃</button>
    </li>
  </ul>
</nav>
<!-- navbar end -->
</body>
<!-- script -->
<script type="text/javascript">
	function logout(){
		alert('로그아웃');
		sessionStorage.clear();
		location.href="homepage.html";
	}
</script>
</html>
