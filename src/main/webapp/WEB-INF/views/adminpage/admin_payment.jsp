<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<meta charset="UTF-8">
	<title>결제내역 | 관리자</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <style type="text/css">
  		.pager{
  		 	text-align:center; 
  		}
  	</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/utils/include/admintop.jsp"></jsp:include>

<div class="container">
  <div class="mx-quto input-group mt-5 mb-3">

    <mx-auto>

        <input id="hjsearch" name="query" type="text" class="form-control" placeholder="ID입력" aria-label="search" aria-describedby="button-addon2">

    </mx-auto>
  
    <button class="btn btn-secondary" type="submit" id="searchBtn">검색</button>
  </div>
    <table class="table table-striped">
      <thead>
        <tr>
          <th>No.</th>
          <th>ID</th>
          <th>책 제목</th>
          <th>결제일</th>
          <th>금액</th>
          <th>우편</th>
          <th>주소</th>
        </tr>
      </thead>
      <tbody id="hjtbody">
      <c:forEach var="payment"  items="${requestScope.paymentalllist }"> 
        <tr>
        <td>${payment.payment_no}</td>
        <td>${payment.id}</td>
        <td>${payment.book_name}</td>
        <td>${payment.payment_date}</td>
        <td>${payment.sumprice}</td>
        <td>${payment.payment_addr}</td>
        <td>${payment.payment_detailaddr}</td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
    <table class="table">
    <thead>
    </thead>
    <tbody>
		<tr>
			<td class="pager" id ="hjpager" >
			${requestScope.pager }
			</td>
		</tr>
    </tbody>
  </table>
</div>

</body>
<script>
     $('#hjsearch').keydown(function(keyNum){
            if(keyNum.keyCode == 13){
                $('#searchBtn').click();
            }
      })

    $('#searchBtn').on("click", function(){
			let inputtxt = $('#hjsearch').val(); //검색어
            
            //태그들 생성
            // let li = document.createElement("li");
            // let a = document.createElement("a");


           likeSearch(inputtxt, "1");
            
      })
//비동기
function likeSearch(inputtxt, cp){
                  $.ajax({
                  url : "paymentLike.do",
                  type : "get",
                //	data : "id=abc&pwd=123",
                  data : { 
                            id : inputtxt,
                            "cp" : cp,
                            ps : "10"
                          }, // 이 값을 가지고 servlet으로 간다.
                  dataType: 'JSON',
                // 매우중요!!	
                      success : function(result) { // Ajax 목적 : result를 얻기 위함
                               $('#hjtbody').empty(); //검색목록 지우기

                                $('#hjpager').empty();

                                let resultData = result;
                                console.log(resultData);
                                let test = '';
                                //[{"isbn":"K502837053","book_name":"칵테일, 러브, 좀비 (리커버)","author":"조예은 (지은이)","description":"undefined","price":10000,"book_filename":"https://image.aladin.co.kr/product/29543/72/coversum/k502837053_1.jpg"}]

                                let listlen = resultData.paymentlist.length;
                                for(let i=0; i < listlen; i++){
                                
                                    let payment_no = resultData.paymentlist[i].payment_no;
                                    let id = resultData.paymentlist[i].id;
                                    let book_name = resultData.paymentlist[i].book_name;
                                    let payment_date =  resultData.paymentlist[i].payment_date;
                                    let sumprice = resultData.paymentlist[i].sumprice;
                                    let payment_addr = resultData.paymentlist[i].payment_addr;
                                    let payment_detailaddr = resultData.paymentlist[i].payment_detailaddr;
                                    
                                    
                                    
                                    $('#hjtbody').append(
                                      '<tr>'+
                                        '<td>' + payment_no + '</td>'+
                                        '<td>' + id + '</td>'+
                                        '<td>' + book_name + '</td>'+
                                        '<td>' + payment_date + '</td>'+
                                        '<td>' + sumprice + '</td>'+
                                        '<td>' + payment_addr + '</td>'+
                                        '<td>' + payment_detailaddr + '</td>' +
                                      '</tr>'
                                    )
                                  

                            }

                            $('#hjpager').append(resultData.pager);
                        
                            },
                  error : function() {
                    alert('error');
                  }
              })
            }
</script>
</html>