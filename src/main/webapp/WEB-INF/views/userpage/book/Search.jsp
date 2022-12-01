<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko" class="" style="height: auto; overflow: visible;">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no,viewport-fit=cover">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <meta name="format-detection" content="telephone=no">
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-capable" content="yes">
  
    <meta name="description" content="독서와 무제한 친해지리, 밀리의 서재에서 당신의 일상을 1밀리+ 더 멋지게 만들어 보세요">
    <script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
    <!-- 제이쿼리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!--  -->
    <script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
  
    <link rel="apple-touch-icon" href="https://www.millie.co.kr/favicon/ios-icon.png">
    <link rel="apple-touch-icon-precomposed" href="https://www.millie.co.kr/favicon/ios-icon.png">
    <link rel="shortcut icon" type="image/png" href="https://www.millie.co.kr/favicon/android-icon.png">
    <title>검색 | 갈피표</title>
    <link href="https://d3udu241ivsax2.cloudfront.net/v3/style/vendor.524cdf1d4325d722f545.css" rel="stylesheet">
    <link href="https://d3udu241ivsax2.cloudfront.net/v3/style/millie.4a1320ab272ffa081fae.css" rel="stylesheet">
    
    <style type="text/css">
        .vue-slider-dot {
            position: absolute;
            -webkit-transition: all 0s;
            transition: all 0s;
            z-index: 5
        }

        .vue-slider-dot:focus {
            outline: none
        }

        .vue-slider-dot-tooltip {
            position: absolute;
            visibility: hidden
        }

        .vue-slider-dot-hover:hover .vue-slider-dot-tooltip,
        .vue-slider-dot-tooltip-show {
            visibility: visible
        }

        .vue-slider-dot-tooltip-top {
            top: -10px;
            left: 50%;
            -webkit-transform: translate(-50%, -100%);
            transform: translate(-50%, -100%)
        }

        .vue-slider-dot-tooltip-bottom {
            bottom: -10px;
            left: 50%;
            -webkit-transform: translate(-50%, 100%);
            transform: translate(-50%, 100%)
        }

        .vue-slider-dot-tooltip-left {
            left: -10px;
            top: 50%;
            -webkit-transform: translate(-100%, -50%);
            transform: translate(-100%, -50%)
        }

        .vue-slider-dot-tooltip-right {
            right: -10px;
            top: 50%;
            -webkit-transform: translate(100%, -50%);
            transform: translate(100%, -50%)
        }
    </style>
    <style type="text/css">
        .vue-slider-marks {
            position: relative;
            width: 100%;
            height: 100%
        }

        .vue-slider-mark {
            position: absolute;
            z-index: 1
        }

        .vue-slider-ltr .vue-slider-mark,
        .vue-slider-rtl .vue-slider-mark {
            width: 0;
            height: 100%;
            top: 50%
        }

        .vue-slider-ltr .vue-slider-mark-step,
        .vue-slider-rtl .vue-slider-mark-step {
            top: 0
        }

        .vue-slider-ltr .vue-slider-mark-label,
        .vue-slider-rtl .vue-slider-mark-label {
            top: 100%;
            margin-top: 10px
        }

        .vue-slider-ltr .vue-slider-mark {
            -webkit-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%)
        }

        .vue-slider-ltr .vue-slider-mark-step {
            left: 0
        }

        .vue-slider-ltr .vue-slider-mark-label {
            left: 50%;
            -webkit-transform: translateX(-50%);
            transform: translateX(-50%)
        }

        .vue-slider-rtl .vue-slider-mark {
            -webkit-transform: translate(50%, -50%);
            transform: translate(50%, -50%)
        }

        .vue-slider-rtl .vue-slider-mark-step {
            right: 0
        }

        .vue-slider-rtl .vue-slider-mark-label {
            right: 50%;
            -webkit-transform: translateX(50%);
            transform: translateX(50%)
        }

        .vue-slider-btt .vue-slider-mark,
        .vue-slider-ttb .vue-slider-mark {
            width: 100%;
            height: 0;
            left: 50%
        }

        .vue-slider-btt .vue-slider-mark-step,
        .vue-slider-ttb .vue-slider-mark-step {
            left: 0
        }

        .vue-slider-btt .vue-slider-mark-label,
        .vue-slider-ttb .vue-slider-mark-label {
            left: 100%;
            margin-left: 10px
        }

        .vue-slider-btt .vue-slider-mark {
            -webkit-transform: translate(-50%, 50%);
            transform: translate(-50%, 50%)
        }

        .vue-slider-btt .vue-slider-mark-step {
            top: 0
        }

        .vue-slider-btt .vue-slider-mark-label {
            top: 50%;
            -webkit-transform: translateY(-50%);
            transform: translateY(-50%)
        }

        .vue-slider-ttb .vue-slider-mark {
            -webkit-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%)
        }

        .vue-slider-ttb .vue-slider-mark-step {
            bottom: 0
        }

        .vue-slider-ttb .vue-slider-mark-label {
            bottom: 50%;
            -webkit-transform: translateY(50%);
            transform: translateY(50%)
        }

        .vue-slider-mark-label,
        .vue-slider-mark-step {
            position: absolute
        }
    </style>
    <style type="text/css">
        .vue-slider {
            position: relative;
            -webkit-box-sizing: content-box;
            box-sizing: content-box;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            display: block;
            -webkit-tap-highlight-color: rgba(0, 0, 0, 0)
        }

        .vue-slider-rail {
            position: relative;
            width: 100%;
            height: 100%;
            -webkit-transition-property: width, height, left, right, top, bottom;
            transition-property: width, height, left, right, top, bottom
        }

        .vue-slider-process {
            position: absolute;
            z-index: 1
        }
    </style>

    <link rel="stylesheet" type="text/css"
        href="https://d3udu241ivsax2.cloudfront.net/v3/style/dasanAward~dasanVote~home.20e63449e7a4626c02ae.css">
    <script charset="utf-8"
        src="https://d3udu241ivsax2.cloudfront.net/v3/js/dasanAward~dasanVote~home.f0a48c2e10e16f9edf78.js"></script>
    <link rel="stylesheet" type="text/css"
        href="https://d3udu241ivsax2.cloudfront.net/v3/style/bestseller~brand~home.3157435c0ebe1f9ea312.css">
    <script charset="utf-8"
        src="https://d3udu241ivsax2.cloudfront.net/v3/js/bestseller~brand~home.3cb88cc5e0432f17a3f0.js"></script>
    <link rel="stylesheet" type="text/css"
        href="https://d3udu241ivsax2.cloudfront.net/v3/style/home~payment.175c5a5c71c50522abda.css">
    <script charset="utf-8" src="https://d3udu241ivsax2.cloudfront.net/v3/js/home~payment.588f1effc4bfcd531f83.js">
    </script>
    <link rel="stylesheet" type="text/css"
        href="https://d3udu241ivsax2.cloudfront.net/v3/style/home.aadb17a03cc4dec7eb90.css">
    <script charset="utf-8" src="https://d3udu241ivsax2.cloudfront.net/v3/js/home.e14f1548a2255229b188.js"></script>
    <script type="text/javascript" charset="utf8" async="" src="https://www.youtube.com/iframe_api"></script>

    <link rel="stylesheet" type="text/css"
        href="https://d3udu241ivsax2.cloudfront.net/v3/style/reading~search.9e20d3f61ee01fdc9a9c.css">
    <script charset="utf-8" src="https://d3udu241ivsax2.cloudfront.net/v3/js/reading~search.f53374eb3db7bf3bd13d.js">
    </script>
    <link rel="stylesheet" type="text/css"
        href="https://d3udu241ivsax2.cloudfront.net/v3/style/search.d5e7ba02987a9fbca3c2.css">
    <script charset="utf-8" src="https://d3udu241ivsax2.cloudfront.net/v3/js/search.1bfec2c80b414a00a1f3.js"></script>
    <link rel="stylesheet" type="text/css"href="Search.css">
</head>

<body style="height: auto; overflow: visible;">
    <div data-v-c1337ae8="" id="wrap" class="show-top-header show-header web-mount">
        <!---->
        <!---->
<jsp:include page="/WEB-INF/views/utils/include/top.jsp"></jsp:include>
    
        <section data-v-c1337ae8="" class="content">
            <section data-v-02a040ec="" data-v-c1337ae8="" class="search-container">
                <div data-v-02a040ec="" class="search-input-wrap">
                    <div data-v-28783d35="" data-v-02a040ec="" class="search-input search-index">
                        <article data-v-28783d35="" class="search-inner">
                            <!---->
                            <div data-v-28783d35="" class="input-area"><button data-v-28783d35="" type="button" id="searchBtn" 
                                    class="mds-icon--searchbar mds-button mds-button--tertiary mds-button--flex mds-button--h56">
                                    <!----></button>
                                <div data-v-28783d35=""
                                    class="mds-input gtm-search-input mds-input--default mds-input--editor mds-input--left">
                                    <label>
                                        <div class="inner">
                                            <!---->
                                            <div class="input">
                                                <!----> <input autocomplete="off" id="input-475"
                                                    aria-labelledby="input-475-label"
                                                    aria-errormessage="input-475-message" type="text"
                                                    placeholder="검색어를 입력하세요" class="mds-input-field"></div> <button
                                                type="button" aria-label="내용 삭제"
                                                class="mds-icon--input-delete clear-button"
                                                style="display: none;"></button>
                                        </div>
                                    </label>
                                </div>
                            </div>
                        </article>
                    </div>
                </div>
                <div data-v-02a040ec="" class="search-body">
                    <section data-v-02a040ec="" class="ranking">
                       
                    </section>

                    <hr data-v-02a040ec="">
                    <div data-v-02a040ec="" class="tab-wrap">
                        <ul data-v-02a040ec="" class="tab-list">
                            <li data-v-02a040ec="" id="category" class="gtm-search-tab-category active">전체 목록</li>
                        </ul>
                    </div>
                    <section data-v-02a040ec="" class="page category-wrap">
                        <h2 data-v-02a040ec="" class="title" id="searchTag"></h2>
                        <ul data-v-02a040ec="" id="searchResultList" class="category-list">
                                <!--  TODO:페이징 처리 -->
                                <c:forEach  var="book"  items="${requestScope.booklist}" varStatus="status">
	                                	 <li data-v-02a040ec="" class="list gtm-search-category"><a data-v-02a040ec=""
	                                    href="bookDetail.do?isbn=${book.isbn}">
		                                    <div data-v-02a040ec="" class="metadata"><strong data-v-02a040ec="">${book.book_name }</strong>
		                                        <p data-v-02a040ec="">${book.author }</p>
		                                    </div>
		                                    <div data-v-02a040ec="" class="bookcover">
		                                        <div data-v-02a040ec="" class="inner">
		                                            <div data-v-96e558f2="" data-v-02a040ec="" class="book-picture imageLoaded"
		                                                data-observe="true">
		                                                <picture data-v-96e558f2="">
		                                                    <source data-v-96e558f2=""
		                                                        srcset="${book.book_filename }, ${book.book_filename } 2x"
		                                                        type="image/webp"> <img data-v-96e558f2=""
		                                                        src="${book.book_filename }"
		                                                        alt=" 도서 썸네일" width="125"></picture>
		                                            </div>
		                                        </div>
		                                    </div>
		                                </a></li>
                                </c:forEach>
                            
                          
                        </ul>
                        <div id="hjPager" style="text-align: center; margin-top: 13px; font-size: 18px;">
                            ${requestScope.pager}
                        </div>
                    </section>
                    
                </div>
            </section>
        </section>
        ${searchBoolean}<br>

    </div>
    <script src="https://d3udu241ivsax2.cloudfront.net/v3/js/millie.b91a9f57d4b10d47052a.js"></script>
    <script async="" src="https://www.googletagmanager.com/gtm.js?id=GTM-MPM86K5"></script>
    <script async="" src="https://www.googletagmanager.com/gtm.js?id=GTM-NTPPL2M"></script>
    <script src="https://millie.co.kr/common/js/tracking.js"></script>
    <script type="text/javascript" id="" src="https://wcs.naver.net/wcslog.js"></script>
    <script type="text/javascript" id="" src="https://wcs.naver.net/wcslog.js"></script>

    <script type="text/javascript" id="" src="//static.criteo.net/js/ld/ld.js"></script>
    <script type="text/javascript" id="" charset="UTF-8" src="//t1.daumcdn.net/adfit/static/kp.js"></script>

    <div id="wp_tg_cts" style="display:none;">
        <script id="wp_tag_script_1669186014928" charset="UTF-8"
            src="https://astg.widerplanet.com/delivery/wpc.php?v=1&amp;ver=4.0&amp;r=1&amp;md=bs&amp;ga=1hjvecr-uskfro-3-1&amp;wp_uid=2-c9bf3b18eb3948657509617f2772763c-s1661407732.232608%7Cwindows_10%7Cedge-t2jfze&amp;ty=Home&amp;ti=52062&amp;hcuid=d5d4cd07616a542891b7ec2d0257b3a24b69856e&amp;device=web&amp;charset=UTF-8&amp;tc=1669186014928&amp;loc=https%3A%2F%2Fwww.millie.co.kr%2F">
        </script>
        <script id="wp_onsite_script" charset="UTF-8" src="https://cdn-aitg.widerplanet.com/onsite/onsite.js"></script>
    </div>

</body>
	<script type="text/javascript">

        $('#input-475').keydown(function(keyNum){
            if(keyNum.keyCode == 13){
                $('#searchBtn').click();
            }
        })

		$('#searchBtn').on("click", function(){
			let inputtxt = $('#input-475').val(); //검색어
 
            likeSearch(inputtxt, "1");
		})
		function likeSearch(book_name, cpage){
        	$.ajax({
    			url : "bookUserLikeList.do",
    			type : "get",
    			data : { "book_name": book_name,
                        pagesize : "10",
                        "cpage" : cpage,
                    }, // 이 값을 가지고 servlet으로 간다.
    			dataType: 'JSON',
    		// 매우중요!!	
    			    success : function(result) { // Ajax 목적 : result를 얻기 위함

    		            $('#category').empty();
    		            $('#category').append("검색 결과");
    		            
    		            $('#searchResultList').empty(); //검색목록 지우기

                        $('#hjPager').empty();

                        let resultData = result;
                        console.log(resultData);
                        let test = '';
                       
                        let listlen = resultData.booklist.length;
                        for(let i=0; i < listlen; i++){
                            let isbn = resultData.booklist[i].isbn;
                            let hreflink = "bookDetail.do?isbn=" + isbn;
                            let imgsrc = resultData.booklist[i].book_filename + ', ' + resultData.booklist[i].book_filename + ' 2x'
                            $('#searchResultList').append('<li data-v-02a040ec="" class="list gtm-search-category"><a data-v-02a040ec=""'+
                                        'href="' + hreflink + '">'+
                                        '<div data-v-02a040ec="" class="metadata"><strong data-v-02a040ec="">' + resultData.booklist[i].book_name + '</strong>'+
                                            '<p data-v-02a040ec="">' + resultData.booklist[i].author + '</p>'+
                                        '</div>'+
                                        '<div data-v-02a040ec="" class="bookcover">' +
                                            '<div data-v-02a040ec="" class="inner">' +
                                                '<div data-v-96e558f2="" data-v-02a040ec="" class="book-picture imageLoaded"' +
                                                    'data-observe="true">' +
                                                    '<picture data-v-96e558f2="">' +
                                                        '<source data-v-96e558f2=""' + 
                                                        ' srcset="'+resultData.booklist[i].book_filename +'"' +
                                                        ' type="image/webp"><img data-v-96e558f2=""'+
                                                        ' src = "' +resultData.booklist[i].book_filename + '" '+
                                                          
                                                            '"alt=" 도서 썸네일" width="125"></picture>" '+
                                                '</div></div></div></a></li>'
                                        )

                        }

                        $('#hjPager').append(resultData.pager);
                
                    },
    			error : function() {
    				alert('error');
    			}
    		});
        }
	</script>

</html>