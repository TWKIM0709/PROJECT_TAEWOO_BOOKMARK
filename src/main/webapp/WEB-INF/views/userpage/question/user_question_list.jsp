<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no,viewport-fit=cover">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="apple-touch-icon" href="https://www.millie.co.kr/favicon/ios-icon.png">
    <link rel="apple-touch-icon-precomposed" href="https://www.millie.co.kr/favicon/ios-icon.png">
    <link rel="shortcut icon" type="image/png" href="https://www.millie.co.kr/favicon/android-icon.png">
    <title>문의사항 | 갈피표</title>
    <link rel="stylesheet" type="text/css"
        href="https://d3udu241ivsax2.cloudfront.net/v3/style/reading.035196bb4109f16f48dc.css">
</head>

<body>
    <div data-v-c1337ae8="" id="wrap" class="show-top-header show-header web-mount">
        <section data-v-c1337ae8="" class="content">
        <jsp:include page="/WEB-INF/views/utils/include/top.jsp"></jsp:include>
            <section data-v-282e1880="" data-v-c1337ae8="" class="customer millie-sub-inner">
                <div data-v-54204cd4="" data-v-282e1880="" class="back-component">
                    <div data-v-54204cd4="" class="back"><button data-v-54204cd4="" type="button"
                            class="close-button"><i data-v-54204cd4="" class="mds-icon--arrow-left"></i></button>
                        <h2 data-v-54204cd4="" class="">문의사항</h2>
                        <!---->
                    </div>
                </div>
                <section data-v-282e1880="" class="customer-container">
                    <div data-v-282e1880="" class="customer-header">
                        <div data-v-282e1880="" style="height:100px">
                            <h3 data-v-282e1880="">무엇을 도와드릴까요?</h3>
                            <p data-v-282e1880="">환불은 100% 확실하고, <br>문의는 신속하게 답변드리겠습니다.</p> <img data-v-282e1880=""
                            	src="https://millie-opm.s3.ap-northeast-2.amazonaws.com/cs/62f45746bbaac.png"
                                alt="무엇을 도와드릴까요">
                        </div>
                    </div>
                    <!--  -->
                    <br><br>
                    <!--  -->
                    <c:set var="questionlist" value="${requestScope.questionlist }" />
                    <div data-v-282e1880="" class="customer-content" >
                        <div data-v-282e1880="" class="topquestion-inner" >
                            <h4 data-v-282e1880="" class="title">질문게시판</h4>
                            <br>
                            <div data-v-28783d35=""
                                    class="mds-input gtm-search-input mds-input--left">
                                    <label>
                                        <div class="inner">
                                            <!---->
                                                <!----> <input autocomplete="off" id="input-475"
                                                    aria-labelledby="input-475-label"
                                                    aria-errormessage="input-475-message" type="text"
                                                    placeholder="검색어를 입력하세요" class="mds-input-field"> <button
                                                type="button" aria-label="내용 삭제"
                                                class="mds-icon--input-delete clear-button"
                                                style="display: none;"></button><button data-v-28783d35="" type="button" id="searchBtn" 
                                    class="mds-icon--searchbar mds-button mds-button--tertiary mds-button--flex"></button>
                                     </div>
                                    </label>
                                    
                                </div>
                            <br>
                            <ul style="margin-left:5%; border:1px" id='searchResultList'>
                            	
                            	<c:forEach  var="question"  items="${questionlist}" varStatus="status">
	                                	 <li data-v-02a040ec="" class="list gtm-search-category"><a data-v-02a040ec=""
	                                    href="questionDetail.do?question_no=${question.question_no}">
		                                    <div data-v-02a040ec="" class="metadata"><strong data-v-02a040ec="">
		                                    
		                                    <c:if test="${question.notice_no == 1}">
		                                    	[공지]
		                                    </c:if>
		                                    ${question.question_title}</strong>
		                                    
		                                        <p>
		                                        <c:choose>
		                                        	<c:when test="${question.notice_no == 1}">
		                                        		<strong>운영자</strong>
		                                        	</c:when>
		                                        	<c:otherwise>
		                                        		작성자 
		                                        	</c:otherwise>
		                                        </c:choose>
		                                        : ${question.id}</p>
		                                        <p>조회수 : ${question.hits} | 작성일 : ${question.question_date}</p><br>
		                                    </div>
		                                </a></li>
                                </c:forEach>
                                
                            </ul>
                        </div>
                        <btton onclick="location.href = 'questionWrite.do' "><strong>글쓰기</strong></btton>
                    </div>
                    <div id="hjPager" style="text-align: center; margin-top: 13px; font-size: 18px;">
                            ${requestScope.pager}
                        </div>
                </section>
            </section>
        </section>
    </div>
</body>
	<script type="text/javascript">

        $('#input-475').keydown(function(keyNum){
            if(keyNum.keyCode == 13){
                $('#searchBtn').click();
            }
        });

		$('#searchBtn').on("click", function(){
			let inputtxt = $('#input-475').val(); //검색어
            $('#searchResultList').empty(); 
            
            likeSearch(inputtxt,"1");
		})//searchBtn onclick end
	//비동기 검색 함수
	function likeSearch(searchval,cpageval){
			console.log('aa');
			console.log(searchval);
			console.log(cpageval);
			console.log('a');
            $.ajax({//비동기
    			url : "questionLike.do",
    			type : "get",
    		//	data : "id=abc&pwd=123",
    			data : { search: searchval,
                        ps : "5",
                        cp : cpageval,
                    }, // 이 값을 가지고 servlet으로 간다.
    			dataType: 'JSON',
    		// 매우중요!!	
    			    success : function(result) { // Ajax 목적 : result를 얻기 위함

    		            $('#searchResultList').empty(); 
                        $('#hjPager').empty();

                        let resultData = result;
                        console.log(resultData);
                        let test = '';
                        //[{"isbn":"K502837053","book_name":"칵테일, 러브, 좀비 (리커버)","author":"조예은 (지은이)","description":"undefined","price":10000,"book_filename":"https://image.aladin.co.kr/product/29543/72/coversum/k502837053_1.jpg"}]


                        let listlen = resultData.questionlist.length;
                        for(let i=0; i < listlen; i++){
                            let hreflink = "questionDetail.do?question_no=" + resultData.questionlist[i].question_no;
                            
                            let text = '<li data-v-02a040ec="" class="list gtm-search-category"><a data-v-02a040ec=""'+
    							'href="' + hreflink + '">' +
    							'<div data-v-02a040ec="" class="metadata"><strong data-v-02a040ec="">';
    							if(resultData.questionlist[i].notice_no == 1){
    								text += '[공지]';
    							}
    							text += resultData.questionlist[i].question_title+'</strong><p>';
    							if(resultData.questionlist[i].notice_no == '1'){
    								text += '<strong>운영자</strong>';
    							}else{
    								text += '작성자';
    							}
    							text += ' : '+resultData.questionlist[i].id +'</p><p>조회수 : '+resultData.questionlist[i].hits+' | 작성일 : '+resultData.questionlist[i].question_date+'</p></div></a><br><br></li>';
                            $('#searchResultList').append(text);
                        }

                        $('#hjPager').append(resultData.pager);
                
                    },
    			error : function() {
    				alert('error');
    			}
    		});//비동기 end
        }
		function testfunction(search,cpage){
			console.log(search);
			console.log(cpage);
			alert('1');
		}
	</script>
</html>