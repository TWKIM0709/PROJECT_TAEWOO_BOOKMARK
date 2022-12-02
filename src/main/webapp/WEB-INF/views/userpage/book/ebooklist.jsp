<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko" class="" style="height: auto; overflow: visible;">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no,viewport-fit=cover">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- / -->
    <!-- 제이쿼리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!--  -->

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
    <link rel="preload" href="https://d3udu241ivsax2.cloudfront.net/common/mds/fonts/mds-icon-v3.woff2" as="font"
        type="font/woff2" crossorigin="crossorigin">
    <link rel="preload" href="https://d3udu241ivsax2.cloudfront.net/common/mds/fonts/SpoqaHanSansNeo-Regular.woff2"
        as="font" type="font/woff2" crossorigin="crossorigin">
    <link rel="preload" href="https://d3udu241ivsax2.cloudfront.net/common/mds/fonts/SpoqaHanSansNeo-Bold.woff2"
        as="font" type="font/woff2" crossorigin="crossorigin">
    <link rel="preload" href="https://d3udu241ivsax2.cloudfront.net/common/mds/fonts/NotoSerifKR-Black.woff2" as="font"
        type="font/woff2" crossorigin="crossorigin">
    <link rel="stylesheet" type="text/css"
        href="https://d3udu241ivsax2.cloudfront.net/v3/style/dasanAward~dasanVote~home.20e63449e7a4626c02ae.css">
    <link rel="stylesheet" type="text/css"
        href="https://d3udu241ivsax2.cloudfront.net/v3/style/bestseller~brand~home.3157435c0ebe1f9ea312.css">
    <link rel="stylesheet" type="text/css"
        href="https://d3udu241ivsax2.cloudfront.net/v3/style/home~payment.175c5a5c71c50522abda.css">
    <link rel="stylesheet" type="text/css"
        href="https://d3udu241ivsax2.cloudfront.net/v3/style/home.aadb17a03cc4dec7eb90.css">
    <link rel="stylesheet" type="text/css"
        href="https://d3udu241ivsax2.cloudfront.net/v3/style/reading~search.9e20d3f61ee01fdc9a9c.css">
    </script>
    <link rel="stylesheet" type="text/css"
        href="https://d3udu241ivsax2.cloudfront.net/v3/style/search.d5e7ba02987a9fbca3c2.css">
    <link rel="stylesheet" type="text/css"href="Search.css">
</head>

<body style="height: auto; overflow: visible;">
    <div data-v-c1337ae8="" id="wrap" class="show-top-header show-header web-mount">
       
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
                                            <!---->
                                            <!---->
                                        </div>
                                    </label>
                                    <!---->
                                </div>
                            </div>
                        </article>
                        <!---->
                        <!---->
                        <!---->
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
                                <c:forEach  var="book"  items="${requestScope.ebooklist}" varStatus="status">
	                                	 <li data-v-02a040ec="" class="list gtm-search-category">
	                                	 <a data-v-02a040ec="" href="javascript:ebook('${book.file_name }');">
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
                    </section>
                </div>
            </section>
        </section>
    </div>
    </div>
</body>
<script type="text/javascript">
let size = {
		  width: window.innerWidth || document.body.clientWidth,
		  height: window.innerHeight || document.body.clientHeight 
		}
	function ebook(file){
		let link = "ebookpopup.do?file=ebook/" + file;
		window.open(link,"_blank","width=900,height=900");
		
	}
</script>

</html>