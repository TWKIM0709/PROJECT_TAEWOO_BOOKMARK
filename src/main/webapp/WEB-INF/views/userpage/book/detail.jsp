<%@page import="java.net.InetAddress"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko" class="">

<head>
    <meta charset="UTF-8">

    <script src="https://js.tosspayments.com/v1/payment"></script>
    <link rel="apple-touch-icon" href="https://www.millie.co.kr/favicon/ios-icon.png">
    <link rel="apple-touch-icon-precomposed" href="https://www.millie.co.kr/favicon/ios-icon.png">
    <link rel="shortcut icon" type="image/png" href="https://www.millie.co.kr/favicon/android-icon.png">
    <title>${requestScope.book.book_name}ㅡ${requestScope.book.author}</title>
    <link href="https://d3udu241ivsax2.cloudfront.net/v3/style/vendor.524cdf1d4325d722f545.css" rel="stylesheet">
    <link href="https://d3udu241ivsax2.cloudfront.net/v3/style/millie.4a1320ab272ffa081fae.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css"
        href="https://d3udu241ivsax2.cloudfront.net/v3/style/bookDetail~management~paperBook~payment.5ae25aef3d26b1738ec7.css">
<!--     </script> -->
    <link rel="stylesheet" type="text/css"
        href="https://d3udu241ivsax2.cloudfront.net/v3/style/bookDetail.120e0472d463d372d2c8.css">
    <script charset="utf-8" src="https://d3udu241ivsax2.cloudfront.net/v3/js/bookDetail.91cb8b8cdf6b64a5041a.js">
    </script>
    <script type="text/javascript" async=""
        src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/715358239/?random=1669186459286&amp;cv=11&amp;fst=1669186459286&amp;bg=ffffff&amp;guid=ON&amp;async=1&amp;gtm=2wgb90&amp;u_w=1707&amp;u_h=1067&amp;hn=www.googleadservices.com&amp;frm=0&amp;url=https%3A%2F%2Fwww.millie.co.kr%2Fv3%2FbookDetail%2F179544336%3Freferrer%3DsearchResult&amp;tiba=%EB%8F%84%EC%84%9C%20%EC%83%81%EC%84%B8%20%7C%20%EB%B0%80%EB%A6%AC%EC%9D%98%20%EC%84%9C%EC%9E%AC&amp;auid=492487846.1665120667&amp;uaa=x86&amp;uab=64&amp;uafvl=Microsoft%2520Edge%3B107.0.1418.35%7CChromium%3B107.0.5304.90%7CNot%253DA%253FBrand%3B24.0.0.0&amp;uap=Windows&amp;uapv=10.0.0&amp;uaw=0&amp;rfmt=3&amp;fmt=4">
    </script>
    <script type="text/javascript" async=""
        src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/715358239/?random=1669186459288&amp;cv=11&amp;fst=1669186459288&amp;bg=ffffff&amp;guid=ON&amp;async=1&amp;gtm=2wgb90&amp;u_w=1707&amp;u_h=1067&amp;hn=www.googleadservices.com&amp;frm=0&amp;url=https%3A%2F%2Fwww.millie.co.kr%2Fv3%2FbookDetail%2F179544336%3Freferrer%3DsearchResult&amp;tiba=%EB%8F%84%EC%84%9C%20%EC%83%81%EC%84%B8%20%7C%20%EB%B0%80%EB%A6%AC%EC%9D%98%20%EC%84%9C%EC%9E%AC&amp;auid=492487846.1665120667&amp;uaa=x86&amp;uab=64&amp;uafvl=Microsoft%2520Edge%3B107.0.1418.35%7CChromium%3B107.0.5304.90%7CNot%253DA%253FBrand%3B24.0.0.0&amp;uap=Windows&amp;uapv=10.0.0&amp;uaw=0&amp;rfmt=3&amp;fmt=4">
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <!-- sweetAlert -->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
    .replyhide{
        	display :none;
        }
    </style>
</head>

<body>
    <%

	InetAddress ip = InetAddress.getLocalHost();
	String hostIP = ip.getHostAddress();
	//System.out.println("현재 아이피 : " + ip.getLocalHost());
	//System.out.println("hostIP : " + hostIP);

	String contextPath = request.getContextPath();
	
	request.setAttribute("ip", hostIP);
	request.setAttribute("contextpath",contextPath);
%>
    <div data-v-c1337ae8="" id="wrap" class="show-top-header show-header web-mount">
	<div data-v-7fc2b3a6="" data-v-c1337ae8="" class="home-banner-component book-detail-banner">

	<c:set var="book" value="${requestScope.book}"/>
        </div>
<jsp:include page="/WEB-INF/views/utils/include/top.jsp"></jsp:include>

        <section data-v-c1337ae8="" class="content">
            <div data-v-0d0ee47c="" data-v-c1337ae8="" class="book-detail">
                <div data-v-0d0ee47c="" class="book-content">
                    <div data-v-54204cd4="" data-v-0d0ee47c="" class="back-component">
                    </div>
                    <div data-v-d536c1c0="" data-v-0d0ee47c="" class="book-container book-cover line">
                        <div data-v-d536c1c0="" class="thumbnail">
                            <div data-v-d536c1c0="" class="inner">
                                <div data-v-96e558f2="" data-v-d536c1c0="" class="book-picture imageLoaded"
                                    data-observe="true">
                                    <picture data-v-96e558f2="">
									 <img data-v-96e558f2=""
                                            src="${book.book_filename }"
                                            alt="${book.book_name }" width="220"></picture>
                                </div>
                            </div>
                        </div>
                        <div data-v-d536c1c0="" class="cover-data">

                            <div data-v-d536c1c0="" class="meta-data">

                                <p data-v-d536c1c0="" class="book-name">
									${book.book_name }
                                </p>
                                <p>&nbsp;</p>
                                <p data-v-d536c1c0="" class="author"><span data-v-d536c1c0="">${book.author }</span></p>

                            </div>
                            <div data-v-d536c1c0="" class="book-data">
                                <div data-v-d536c1c0="" class="review">
                                        <button id="like"><img data-v-d536c1c0="" 
                                        <c:choose>
                                        	<c:when test="${requestScope.likestatus > 0 }">
                                        		src="https://cdn-icons-png.flaticon.com/128/6516/6516177.png"
                                        	</c:when>
                                        	<c:otherwise>
                                        		src="https://cdn-icons-png.flaticon.com/128/6516/6516176.png"
                                        	</c:otherwise>
                                        </c:choose>
                                        id="likeimg">
                                        </button>
                                        <p data-v-d536c1c0="" class="text">좋아요</p> <strong data-v-d536c1c0=""
                                            class="number" id="likecount">${requestScope.likecount}</strong>
                                    </div>
                                    <script type="text/javascript">
                                        
                                    	$('#like').click(function() {
                                    		  let userId = $('#like').val(); // input_id에 입력되는 값
                                              console.log(userId);
                                              $.ajax({
                                                 url : "bookLike.do",
                                                 type : "post",
                                                 data : {"id": "${sessionScope.id}",
                                                	 "isbn":"${book.isbn}"},
                                                 dataType : 'json',
                                                 success : function(result){
                                                    console.log(result);
                                                    /* if(result == "false"){
                                                       alert("이미 있는 아이디입니다.")
                                                    } else {
                                                       alert("사용 가능한 아이디입니다.");
                                                    }  */
                                                    if(result.like >0){
                                                    	$('#likeimg').attr("src","https://cdn-icons-png.flaticon.com/128/6516/6516177.png");
                                                    }else{
                                                    	$('#likeimg').attr("src","https://cdn-icons-png.flaticon.com/128/6516/6516176.png");
                                                    }
                                                    $("#likecount").text(result.count);
                                                 },
                                                 error : function(){
                                                    alert("서버요청실패");
                                                 }
                                              })
										})
                                    </script>
                                <div data-v-d536c1c0="" class="review"><a data-v-d536c1c0="" href="#bookinfo"
                                        class="gtm-review-move"><img data-v-d536c1c0=""
                                            src="https://cdn-icons-png.flaticon.com/128/5999/5999928.png">
                                        <p data-v-d536c1c0="" class="text"></p> <strong data-v-d536c1c0=""
                                            class="number">책 소개</strong>
                                    </a></div>
                                <div data-v-d536c1c0="" class="post"><a data-v-d536c1c0="" href="#anchorReview"
                                        class="gtm-post-move"><img data-v-d536c1c0=""
                                            src="https://d3udu241ivsax2.cloudfront.net/v3/images/bookDetail/post-mark.e6660d3d2be8d740e6accf5f63489487.png">
                                        <p data-v-d536c1c0="" class="text">댓글</p>
                                    </a></div>

                            </div>
                        </div>


                    </div>
                    <div data-v-5dcc70f0="" data-v-0d0ee47c="" class="book-container book-info">

                        <div data-v-5dcc70f0="" class="awards section p0">
                            <ul data-v-5dcc70f0="">
                                <li data-v-5dcc70f0="" class="report"><strong data-v-5dcc70f0="" class="text">
                                갈피표가 자신있게 추천하는 책</strong></li>

                                <li data-v-5dcc70f0="" class="bestseller first">
                                    <div data-v-5dcc70f0="" class="text">태우 마음 속의 공동 1위</div>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div data-v-f6f25216="" data-v-0d0ee47c="" class="book-container book-info">
                        <div data-v-f6f25216="" class="subtitle section">
                            <h3 data-v-f6f25216="" class="book-info-title">
                                책이 주는 감동을 인터넷으로도 느껴보세요<br data-v-f6f25216="">갈피표는 여러분의 독서를 응원합니다
                            </h3>
                            <p data-v-f6f25216="" class="desc">
                                <p>각박한 세상 속 상상의 폭도 줄어드는 현대사회에서 책의 무거움이 아닌 인터넷을 통해 가볍게 독서를 즐겨보세요<br>
                                갈피표가 당신의 독서를 응원합니다.</p>
                            </p>
                        </div>
                    </div>
                    <!-- 밀리 그래프 지운 곳 -->

                    <div data-v-4edfbce0="" data-v-0d0ee47c="" class="book-container book-info">

                        <div data-v-4edfbce0="" class="introduction section">
                            <h3 data-v-4edfbce0="" class="book-info-title" id="bookinfo">책 소개</h3>
                            <div data-v-4edfbce0="" class="text-area desc">
                                <p data-v-4edfbce0="" class=""><b>${book.book_name}</b><br>${book.description}</p>
                                <br>
                            </div>
                        </div>
                    </div>
                    
                    <!-- 댓글 영역 -->
                    <div data-v-da7fb214="" data-v-0d0ee47c="" id="anchorReview" class="review-container thin-line">
                        <h3 data-v-da7fb214="" class="book-info-title link">
							다른사람에게  책을 소개해주세요</h3>
                        <div data-v-da7fb214="" class="review-register">
                            <div data-v-da7fb214="" class="register">
                                <div data-v-da7fb214="" class="mds-textarea mds-textarea--default">
                                    <div class="inner"><label><span class="label">한 줄 리뷰
                                            </span> <textarea id="textarea-39" placeholder="다양한 생각을 남겨주세요"
                                                class="mds-textarea-field"></textarea></label>
                                                <br>
                                    </div>
                                </div> <button data-v-da7fb214="" type="button" 
                                    class="gtm-review-write mds-button mds-button--secondary mds-button--h56 mds-button--r4" id="reply_insert"><span>등록</span></button>
                                    <script>
	                                    $('#reply_insert').click(function() {
											let text = $('#textarea-39').val();
	                                        console.log(text);
	                                        $.ajax({
	                                           url : "ReplyWrite",
	                                           type : "post",
	                                           data : {"type":"book", "isbn":"${book.isbn}", "id":"${sessionScope.id}", "reply_content":text},
	                                           dataType : 'json',
	                                           success : function(result){
	                                        	   if(result.result == "fail"){
	                                        		   alert("댓글쓰기 실패");
	                                        		   return;
	                                        	   } 
	                                        	   replyload();
	                                        	   $('#textarea-39').val("");
	                                           },
	                                           error : function(){
	                                              alert("서버요청실패");
	                                           }
	                                        })
	                                       
										})
                                    </script>
                            </div>
                        </div>
                        <ul data-v-da7fb214="" class="review-list" id="reply">
                          </ul>
                    </div>
                </div>
                <!-- 사이드바 -->
                <div data-v-07a4da8a="" data-v-0d0ee47c="" class="button-area">
                    <ul data-v-07a4da8a="" class="button-list">
                        <li data-v-07a4da8a="" class="shelf"><button id="hjCart" data-v-07a4da8a="" type="button"
                                class="gtm-bdtl-libbtn">장바구니 담기</button></li>
                        <li data-v-07a4da8a="" class="share1"><button data-v-07a4da8a="" type="button"
                                class="gtm-bdtl-postbtn" onclick="b()">YouTube에서 검색하기</button></li>
                        <li data-v-07a4da8a="" class="share2"><button data-v-07a4da8a="" type="button"
                               id="ebookPayment"class="gtm-bdtl-postbtn">E-book 구매하기</button></li>
                        <style>
                            .share1 {
                                background-image: url(https://www.youtube.com/s/desktop/ff71ea81/img/favicon.ico);
                                font-weight: 700;
                                width: 100%;
                                display: flex;
                                -ms-flex-align: center;
                                align-items: center;
                                height: 100%;
                                text-align: left;
                                background-size: 24px;
                                background-position: left 24px center;
                                background-repeat: no-repeat;
                            }
                            .share2{
                                background-image: url(https://cdn-icons-png.flaticon.com/512/1945/1945963.png);
                                font-weight: 700;
                                width: 100%;
                                display: flex;
                                -ms-flex-align: center;
                                align-items: center;
                                height: 100%;
                                text-align: left;
                                background-size: 24px;
                                background-position: left 24px center;
                                background-repeat: no-repeat;
                            }
                        </style>
                    </ul>
                    
                    
                    <div data-v-07a4da8a="" class="button">
                        <div data-v-07a4da8a="" class="inner"><button data-v-07a4da8a="" type="button" id="hjCartList"
                                class="enter gtm-bdtl-readbtn e-book"><span data-v-07a4da8a="">구매하기</span></button>
                        </div>
                    </div>
                </div>
                <div data-v-722c61ad="" data-v-0d0ee47c="" class="audiodrama-popup">
                </div>
            </div>
        </section>
    </div>
    <!-- 스크립트 지운 곳 -->
</body>

<script>

$('#ebookPayment').click(function(){
    test();
})

 let customerName = "<c:out value='${sessionScope.id}' />";
 
function test(){

    // let totalprice =  '${param.totalprice}';
    // let cartsize = '${param.cartsize}';
    // let customername = '${sessionScope.id}';
    // let firstbook = '${param.firstbook}'	 
    // let addr = '${param.addr}'
    // let detail_addr = '${param.detail_addr}'

 console.log("test함수 실행됐습니다~")
    
	let ip = '${requestScope.ip}';
	let contextpath = '${requestScope.contextpath}'
    let customername = customerName;
    
 	console.log(ip);
    //let url = "http://localhost:8090/PROJECT_TAEWOO_BOOKMARK/paymentOk.do?id=" + customername + "&addr=" + addr.replace(/ /g,"") + "&detail_addr=" + detail_addr.replace(/ /g,"-");
    let successurl = "http://" + ip + ":8090" + contextpath +"/ebookpayment.do?isbn=" + '${book.isbn}'
    //let failurl = "http://" + ip + ":8090/PROJECT_TAEWOO_BOOKMARK/WEB-INF/views/userpage/user_paymentFail.jsp";
    let failurl = "http://" + ip + ":8090"+contextpath+"/paymentFail.do";

    console.log(successurl);
    
        var clientKey = 'test_ck_D5GePWvyJnrK0W0k6q8gLzN97Eoq'
        var tossPayments = TossPayments(clientKey) // 클라이언트 키로 초기화하기
        let num = '${requestScope.book.price}';
        tossPayments.requestPayment('카드', { // 결제 수단
		// 결제 정보
		amount: num,
		orderId: 'QTIk82kxDPefXZC8MLFj0',
		orderName: '${requestScope.book.book_name}',
		customerName: customername,
		successUrl: successurl,
		failUrl: "https://www.musinsa.com/app/",	
		flowMode: 'D',
		easyPay: '토스페이'
		})
}




    function b() {
    	window.open('https://www.youtube.com/results?search_query=' + '${book.book_name}'+' 리뷰');
    }
    function deletereply(book_reply_no){
        	$.ajax({
        		url:"ReplyDelete",
        		type :"post",
        		data:{
        			type : "book",
        			book_reply_no : book_reply_no
        		},
        		dataType : 'text',
        		success : function(result){
        			if(result == 1){
        				alert("댓글 삭제 완료");
        				replyload();
        			} else {
        				alert("댓글 삭제 실패");
        			}
        		},
        		error : function(error){
        			alert('error');
        		}
        		
        	})//ajax end
        		 
        	
        }
    
    function updatetest(book_reply_no){
    	let contentvalue = "\#replyinput"+book_reply_no;
    	$.ajax({
    		url : 'ReplyUpdate',
    		type : 'post',
    		data : {
    			type: 'book',
    			"book_reply_no" : book_reply_no  ,
    			reply_content : $(contentvalue).val()
    		},
    		dataType : 'text',
    		success : function(result){
    			if(result == 1){
    				alert('수정성공');
    				replyload();
    			} else {
    				alert('수정실패...');
    			}
    		},
    		error:function(){
    			alert("에러발생");
    		}
    	})
    } //update end
    
    //수정기능 스위치 함수
    function updateset(book_reply_no){
		let spanid = "\#replyspan" +book_reply_no; //내용
		let rewrite = "\#rewritebtn"  +book_reply_no; //답글 버튼
		let deletebtn = "\#deletebtn" + +book_reply_no; //삭제버튼
		let updatebtn = "\#updatebtn" + +book_reply_no; //수정버튼
		let inputid = "\#replyinput"+book_reply_no; //수정input
		let updateok = "\#updateokbtn" +book_reply_no; //수정완료버튼
		let updatecancel = "\#updatecancelbtn"+book_reply_no; //수정취소 버튼\

		$(updatebtn).toggleClass('replyhide');
		$(spanid).toggleClass('replyhide');
		$(rewrite).toggleClass('replyhide');
		$(deletebtn).toggleClass('replyhide');
		$(inputid).toggleClass('replyhide');
		$(updateok).toggleClass('replyhide');
		$(updatecancel).toggleClass('replyhide');
    }//updateset end
    $(function() {
    	replyload()
	})//onload
	function replyload(){
    	 $.ajax({
               url : "RepleListBlogOrBook",
               type : "post",
               data : {"type": "book",
              	 "isbn":"${book.isbn}"},
               dataType : 'json',
               success : function(result){
                 $("#reply").empty();
                 
                 let text = "";
                 for(let index in result.BOOK){
                	 let id = result.BOOK[index].id;
                	 text += '<li data-v-da7fb214="">' +
                	 '<div data-v-da7fb214="" class="info">'+
                	 '<input type="hidden" value="' + result.BOOK[index].reply_no+'">'+
                	 '<p data-v-da7fb214="" class="nickname">'+result.BOOK[index].id+'</p>'+
                	 '<span data-v-da7fb214="" class="date">'+result.BOOK[index].reply_date+'</span>'+
                	 '<pre data-v-da7fb214="" class="cont" id=content'+result.BOOK[index].reply_no+'>'+
                	 '<span id="replyspan'+result.BOOK[index].reply_no+ '">'+ result.BOOK[index].reply_content +'</span>'+
                	 '<input type="text" value="'+ result.BOOK[index].reply_content +'" id="replyinput'+result.BOOK[index].reply_no+ '" class="replyhide" style="background-color:#e8e8e8; width:70%;"></pre></div>';
                	if("${sessionScope.id}" == id){
                		/* text += '<button onclick=>수정</button><button disabled>|</button><button onclick=deletereply(' +result.BOOK[index].reply_no +')>삭제</button>'; */
              		    text += 
                        '<button id="updateokbtn' +result.BOOK[index].reply_no+'" onclick="updatetest(' +result.BOOK[index].reply_no+')" class="replyhide"><span><br>수정완료|</span></button>'+
                        '<button id="updatecancelbtn' +result.BOOK[index].reply_no+'" onclick="updateset('+result.BOOK[index].reply_no+')" class="replyhide"><span><br>취소</span></button>'+
                        '<button id="updatebtn'+result.BOOK[index].reply_no+'" onclick="updateset('+result.BOOK[index].reply_no+')"><br>수정 |</button>'+
                        '<button id="deletebtn'+result.BOOK[index].reply_no+'" onclick="deletereply(' +result.BOOK[index].reply_no+')"><br>삭제</button>'
                	}
                	
                	 text +='</li>'                	 
                 }
                 $("#reply").append(text);
               },
               error : function(){
                  alert("서버요청실패");
               }
            })
    }
    
    //장바구니 담기
    $('#hjCart').click(function(){
        let isbn = "<c:out value='${requestScope.isbn}' />"
        let id = "<c:out value='${sessionScope.id}' />"
        //let type = "false"; 왜 이렇게 했을때 파라미터로 안가지?
        $.ajax({
            url: 'cartAdd.do',
            type: 'get',
            data: {
                isbn:isbn,
                id:id,
                type:'false',
            }, //이 값을 서블릿으로 가지고 감
            dataType: 'JSON',
            
            success: function(result){
                Swal.fire(
                    '장바구니에 담았습니다',
                    '당신의 독서를 응원합니다!',
                    'success'
                    )
            },
            error : function(){
                Swal.fire(
                    '오류가 발생했네요',
                    '다시 시도해보세요',
                    'error'
                    )
            }
        })
        // $(location).attr("href", `cartAdd.do?isbn=${isbn}&id=${id}&type=false`);
    })
    //장바구니 이동
    $('#hjCartList').click(function(){
        let id =  "<c:out value='${sessionScope.id}' />";
        let isbn = "<c:out value='${requestScope.isbn}' />"
        //let type = "false"; 왜 이렇게 했을때 파라미터로 안가지?
        $.ajax({
            url: 'cartAdd.do',
            type: 'get',
            data: {
                isbn:isbn,
                id:id,
                type:'false',
            }, //이 값을 서블릿으로 가지고 감
            dataType: 'JSON',
            
            success: function(result){
                $(location).attr("href", `cartList.do?id=${id}`);
            },
            error : function(){
                Swal.fire(
                    '오류가 발생했네요',
                    '다시 시도해보세요',
                    'error'
                    )
            }
        })


        //$(location).attr("href", `cartList.do?id=${id}`);
    })
</script>

</html>