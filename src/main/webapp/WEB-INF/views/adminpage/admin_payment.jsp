<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<meta charset="UTF-8">
	<title>Insert title here</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/utils/include/admintop.jsp"></jsp:include>

<div class="container">
  <table class="table table-striped">
    <thead>
      <tr>
        <th>책결재번호</th>
        <th>책 번호</th>
        <th>책 구매 권수</th>
        <th>결제일</th>
        <th>총 결제금액</th>
        <th>우편번호</th>
        <th>주소</th>
      </tr>
    </thead>
    <tbody>
		<c:forEach var="payment"  items="${requestScope.paymentalllist }"> 
      <tr>
			<td>${payment.payment_no}</td>
			<td>${payment.isbn}</td>
			<td>${payment.count}</td>
			<td>${payment.payment_date}</td>
			<td>${payment.sumprice}</td>
			<td>${payment.payment_addr}</td>
			<td>${payment.payment_detailaddr}</td>
      </tr>
		</c:forEach>
    </tbody>
  </table>
</div>

</body>
</html>