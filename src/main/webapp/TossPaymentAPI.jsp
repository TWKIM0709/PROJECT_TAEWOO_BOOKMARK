<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제하기</title>
</head>
<body style="background-color:blue">
<div id="test">
</div>
<button onclick="test()" id="testbtn">
	테스트
</button>
</body>
  <script src="https://js.tosspayments.com/v1/payment"></script>
	 <script>
	//  let totalprice =  "<c:out value='${request.getParameter('totalprice')}' />"    
	//  let cartsize = '<c:out value="${request.getParameter("cartsize")}" />';
	//  let customername = "<c:out value = '${sessionScope.id}' />";
	//  let firstbook ="<c:out value='${request.getParameter('firstbook')}' />";
	
	 let totalprice =  '${param.totalprice}';
	 let cartsize = '${param.cartsize}';
	 let customername = '${sessionScope.id}';
	 let firstbook = '${param.firstbook}'	 
	 let addr = '${param.addr}'
	 let detail_addr = '${param.detail_addr}'
	 
		 console.log("addr :" + addr);
	 	console.log("detail_addr : " + detail_addr);
	 	console.log("==================")
	 	console.log("addr :" + addr.replace(/ /g,""));
	 	console.log("detail_addr : " + detail_addr.replace(/ /g,""));
	 
	let url = "http://localhost:8090/PROJECT_TAEWOO_BOOKMARK/paymentOk.do?id=" + customername + "&addr=" + addr.replace(/ /g,"") + "&detail_addr=" + detail_addr.replace(/ /g,"");
	
	
	console.log(url);
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
			successUrl: url,
			failUrl: 'http://localhost:8080/fail',	
			flowMode: 'D',
			easyPay: '토스페이'
			})
		}
    </script>
</html>