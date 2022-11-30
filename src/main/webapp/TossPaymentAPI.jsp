<%@page import="java.net.InetAddress"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<title>결제하기</title>
</head>
<body style="background-color:blue">
<div id="test">
</div>

<%

	InetAddress ip = InetAddress.getLocalHost();
	String hostIP = ip.getHostAddress();
	//System.out.println("현재 아이피 : " + ip.getLocalHost());
	//System.out.println("hostIP : " + hostIP);


	request.setAttribute("ip", hostIP);
	
%>
</body>
  <script src="https://js.tosspayments.com/v1/payment"></script>
	 <script>
	 let totalprice =  '${param.totalprice}';
	 let cartsize = '${param.cartsize}';
	 let customername = '${sessionScope.id}';
	 let firstbook = '${param.firstbook}'	 
	 let addr = '${param.addr}'
	 let detail_addr = '${param.detail_addr}'

		 let ip = '${requestScope.ip}';
	 
	 	//console.log(ip);
	//let url = "http://localhost:8090/PROJECT_TAEWOO_BOOKMARK/paymentOk.do?id=" + customername + "&addr=" + addr.replace(/ /g,"") + "&detail_addr=" + detail_addr.replace(/ /g,"-");
	let successurl = "http://" + ip + ":8090/PROJECT_TAEWOO_BOOKMARK/paymentOk.do?id=" + customername + "&addr=" + addr.replace(/ /g,"") + "&detail_addr=" + detail_addr.replace(/ /g,"-");
	//let failurl = "http://" + ip + ":8090/PROJECT_TAEWOO_BOOKMARK/WEB-INF/views/userpage/user_paymentFail.jsp";
	let failurl = "http://" + ip + ":8090/PROJECT_TAEWOO_BOOKMARK/paymentFail.do";
	function test(){
		var clientKey = 'test_ck_D5GePWvyJnrK0W0k6q8gLzN97Eoq'
		var tossPayments = TossPayments(clientKey) // 클라이언트 키로 초기화하기
		let num = parseInt(totalprice);
			tossPayments.requestPayment('카드', { // 결제 수단
			// 결제 정보
			amount: num,
			orderId: 'QTIk82kxDPefXZC8MLFj0',
			orderName: firstbook + " 외 " + (parseInt(cartsize)-1) + "건",
			customerName: customername,
			successUrl: successurl,
			failUrl: "https://www.musinsa.com/app/",	
			flowMode: 'D',
			easyPay: '토스페이'
			})
	}
	
	

	test();
	// test().catch((err) => { location.href = "https://www.musinsa.com/app/" })
	

	
		
    </script>
</html>