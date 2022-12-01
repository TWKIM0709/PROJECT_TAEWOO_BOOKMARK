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
  <div class="mx-quto input-group mt-5 mb-3">

    <mx-auto>

        <input id="hjsearch" name="query" type="text" class="form-control" placeholder="검색어 입력" aria-label="search" aria-describedby="button-addon2">

    </mx-auto>
  
    <button class="btn btn-success" type="submit" id="searchBtn">검색</button>
  </div>
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
      <tbody id="hjtbody">
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
    <div id="hjpager">${requestScope.pager}</div>
</div>

</body>
<script>
     $('#hjsearch').keydown(function(keyNum){
            if(keyNum.keyCode == 13){
                $('#searchBtn').click();
            }
      })

    $('#searchBtn').on("click", function(){
      console.log("클릭됐삼!!!!")
			let inputtxt = $('#hjsearch').val(); //검색어
            
            $('#hjtbody').empty(); //검색목록 지우기
            //태그들 생성
            // let li = document.createElement("li");
            // let a = document.createElement("a");


            //비동기
            $.ajax({
              url : "paymentLike.do",
              type : "get",
            //	data : "id=abc&pwd=123",
              data : { 
                        id : inputtxt,
                      }, // 이 값을 가지고 servlet으로 간다.
              dataType: 'JSON',
            // 매우중요!!	
                  success : function(result) { // Ajax 목적 : result를 얻기 위함

                            $('#hjPager').empty();

                            let resultData = result;
                            console.log(resultData);
                            let test = '';
                            //[{"isbn":"K502837053","book_name":"칵테일, 러브, 좀비 (리커버)","author":"조예은 (지은이)","description":"undefined","price":10000,"book_filename":"https://image.aladin.co.kr/product/29543/72/coversum/k502837053_1.jpg"}]

                            let listlen = resultData.paymentlist.length;
                            for(let i=0; i < listlen; i++){
                              /*
                              		json.put("payment_no", p.getPayment_no());
                                  json.put("isbn", p.getIsbn());
                                  json.put("count", p.getCount());
                                  json.put("payment_date", p.getPayment_date());
                                  json.put("sumprice", p.getSumprice());
                                  json.put("payment_addr", p.getPayment_addr());
                                  json.put("payment_detailaddr", p.getPayment_detailaddr());
                              */
                             
                            let payment_no = resultData.paymentlist[i].payment_no;
                            let isbn = resultData.paymentlist[i].isbn;
                            let count = resultData.paymentlist[i].count;
                            let payment_date =  resultData.paymentlist[i].payment_date;
                            let sumprice = resultData.paymentlist[i].sumprice;
                            let payment_addr = resultData.paymentlist[i].payment_addr;
                            let payment_detailaddr = resultData.paymentlist[i].payment_detailaddr;
                            
                            $('#hjtbody').append(
                              '<tr>'+
                                '<td>' + payment_no + '</td>'+
                                '<td>' + isbn + '</td>'+
                                '<td>' + count + '</td>'+
                                '<td>' + payment_date + '</td>'+
                                '<td>' + sumprice + '</td>'+
                                '<td>' + payment_addr + '</td>'+
                                '<td>' + payment_detailaddr + '</td>' +
                              '</tr>'
                            )
                              

                        }

                        $('#hjPager').append(resultData.pager);
                    
                        },
              error : function() {
                alert('error');
              }
		    })
      })

</script>
</html>