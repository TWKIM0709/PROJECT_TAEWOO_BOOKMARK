
	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<meta charset="UTF-8">
	<title>결제목록</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
	tr{text-align: center;}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/utils/include/top.jsp"></jsp:include>
<br>
 <section data-v-c1337ae8="" class="content">
            <div data-v-0807f0e5="" data-v-c1337ae8="" class="inner-content">
                <div data-v-0807f0e5="" class="product">
                    <font size="5em">
                    <h1 data-v-0807f0e5="" class="nick-name">
                     <center> ${sessionScope.id}님의 결제목록입니다.*.☆⸜(⑉˙ᗜ˙⑉)⸝♡.*<br data-v-0807f0e5=""> </center>
                    </h1>
                   </font>
                </div>
            
<div class="container">
  <table class="table table-bordered">
    <thead> 
      <tr>
       <th>주문번호</th>
        <th>주문일</th>
        <th>주문상품</th>
        <th>주문권수</th>
        <th>상품가격</th> 
      </tr>
    </thead>
    <tbody>
		<c:forEach var="payment"  items="${requestScope.paymentlist }"> 
     	 <tr>
			<td>${payment.payment_no}</td>
			<td>${payment.payment_date}</td>
			<td>${payment.isbn}</td>
			<td>${payment.count}</td>
			<td>${payment.sumprice}</td>
     	</tr>
		</c:forEach>
    </tbody>
  </table>
</div>

</body>
</html>