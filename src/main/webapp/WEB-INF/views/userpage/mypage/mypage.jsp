<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko" class="">
<head>
    <meta charset="UTF-8">
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <meta name="viewport"
        content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no,viewport-fit=cover">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- /v3/management -->
    <link rel="apple-touch-icon" href="https://www.millie.co.kr/favicon/ios-icon.png">
    <link rel="apple-touch-icon-precomposed" href="https://www.millie.co.kr/favicon/ios-icon.png">
    <link rel="shortcut icon" type="image/png" href="https://www.millie.co.kr/favicon/android-icon.png">
    <title>관리 | 밀리의 서재</title>
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
    <script src="https://connect.facebook.net/en_US/sdk.js?hash=ea7289b65c614dc46f2615777abf3881" async=""
        crossorigin="anonymous"></script>
    <script async="true" type="text/javascript"
        src="https://sslwidget.criteo.com/event?a=55644&amp;v=5.12.3&amp;p0=e%3Dexd%26site_type%3Dd&amp;p1=e%3Dvh&amp;p2=e%3Ddis&amp;adce=1&amp;bundle=cTcWTF9waUVlZE9aOVZJVEMwekdrdTNOVGUwUjdKd21EbnZXZXklMkZPazRqcFhNWnNmaXZxdWZEeEViY01mbTMlMkZQcVdXV2xUeGNNVzI1bksyZSUyQjIwVTBlWTBoVjhSWDBiVXY5YzRmQVElMkY2TyUyRmEzVXNvd2VNZ2MxJTJCUFdkdnF6amNQJTJCcmR5Snp3RkVGMndjUmJnZDI0ZWNqSUtyQSUzRCUzRA&amp;tld=millie.co.kr&amp;fu=https%253A%252F%252Fwww.millie.co.kr%252Fv3%252Fmanagement&amp;dtycbr=23755"
        data-owner="criteo-tag"></script>
    <script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
    <script type="text/javascript" async=""
        src="https://www.googletagmanager.com/gtag/js?id=G-3WR64L2XW1&amp;l=dataLayer&amp;cx=c"></script>
    <script async="" src="https://connect.facebook.net/en_US/fbevents.js"></script>
    <script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
    <script type="text/javascript" async=""
        src="https://www.googletagmanager.com/gtag/js?id=UA-92156018-1&amp;l=dataLayer&amp;cx=c"></script>
    <script async="" src="https://www.googletagmanager.com/gtag/js?id=UA-92156018-1" rel="preconnect" charset="utf-8">
    </script>
    <link rel="preload" href="https://d3udu241ivsax2.cloudfront.net/common/mds/fonts/mds-icon-v3.woff2" as="font"
        type="font/woff2" crossorigin="crossorigin">
    <link rel="preload" href="https://d3udu241ivsax2.cloudfront.net/common/mds/fonts/SpoqaHanSansNeo-Regular.woff2"
        as="font" type="font/woff2" crossorigin="crossorigin">
    <link rel="preload" href="https://d3udu241ivsax2.cloudfront.net/common/mds/fonts/SpoqaHanSansNeo-Bold.woff2"
        as="font" type="font/woff2" crossorigin="crossorigin">
    <link rel="preload" href="https://d3udu241ivsax2.cloudfront.net/common/mds/fonts/NotoSerifKR-Black.woff2" as="font"
        type="font/woff2" crossorigin="crossorigin">
    <meta http-equiv="origin-trial"
        content="A751Xsk4ZW3DVQ8WZng2Dk5s3YzAyqncTzgv+VaE6wavgTY0QHkDvUTET1o7HanhuJO8lgv1Vvc88Ij78W1FIAAAAAB7eyJvcmlnaW4iOiJodHRwczovL3d3dy5nb29nbGV0YWdtYW5hZ2VyLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjgwNjUyNzk5LCJpc1RoaXJkUGFydHkiOnRydWV9">
    <script type="text/javascript" async=""
        src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/771298710/?random=1669186569765&amp;cv=11&amp;fst=1669186569765&amp;bg=ffffff&amp;guid=ON&amp;async=1&amp;gtm=2wgb90&amp;u_w=1707&amp;u_h=1067&amp;hn=www.googleadservices.com&amp;frm=0&amp;url=https%3A%2F%2Fwww.millie.co.kr%2Fv3%2Fmanagement&amp;tiba=%EB%B0%80%EB%A6%AC%EC%9D%98%20%EC%84%9C%EC%9E%AC&amp;auid=492487846.1665120667&amp;uaa=x86&amp;uab=64&amp;uafvl=Microsoft%2520Edge%3B107.0.1418.35%7CChromium%3B107.0.5304.90%7CNot%253DA%253FBrand%3B24.0.0.0&amp;uap=Windows&amp;uapv=10.0.0&amp;uaw=0&amp;rfmt=3&amp;fmt=4">
    </script>
    <script type="text/javascript" async=""
        src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/715358239/?random=1669186569769&amp;cv=11&amp;fst=1669186569769&amp;bg=ffffff&amp;guid=ON&amp;async=1&amp;gtm=2wgb90&amp;u_w=1707&amp;u_h=1067&amp;hn=www.googleadservices.com&amp;frm=0&amp;url=https%3A%2F%2Fwww.millie.co.kr%2Fv3%2Fmanagement&amp;tiba=%EB%B0%80%EB%A6%AC%EC%9D%98%20%EC%84%9C%EC%9E%AC&amp;auid=492487846.1665120667&amp;uaa=x86&amp;uab=64&amp;uafvl=Microsoft%2520Edge%3B107.0.1418.35%7CChromium%3B107.0.5304.90%7CNot%253DA%253FBrand%3B24.0.0.0&amp;uap=Windows&amp;uapv=10.0.0&amp;uaw=0&amp;rfmt=3&amp;fmt=4">
    </script>
    <script type="text/javascript" async=""
        src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/715358239/?random=1669186569770&amp;cv=11&amp;fst=1669186569770&amp;bg=ffffff&amp;guid=ON&amp;async=1&amp;gtm=2wgb90&amp;u_w=1707&amp;u_h=1067&amp;hn=www.googleadservices.com&amp;frm=0&amp;url=https%3A%2F%2Fwww.millie.co.kr%2Fv3%2Fmanagement&amp;tiba=%EB%B0%80%EB%A6%AC%EC%9D%98%20%EC%84%9C%EC%9E%AC&amp;auid=492487846.1665120667&amp;uaa=x86&amp;uab=64&amp;uafvl=Microsoft%2520Edge%3B107.0.1418.35%7CChromium%3B107.0.5304.90%7CNot%253DA%253FBrand%3B24.0.0.0&amp;uap=Windows&amp;uapv=10.0.0&amp;uaw=0&amp;rfmt=3&amp;fmt=4">
    </script>
    <meta http-equiv="origin-trial"
        content="A9+ldib+sKhGj2FcIjq5GnvBZFuIiXID0+NkE6k7cEk71MhaHFGqo3wUlUFmZ6d9w0KPwx9UxGiCTYWtRnTGDQkAAACAeyJvcmlnaW4iOiJodHRwczovL2NyaXRlby5uZXQ6NDQzIiwiZmVhdHVyZSI6IlByaXZhY3lTYW5kYm94QWRzQVBJcyIsImV4cGlyeSI6MTY4MDY1Mjc5OSwiaXNTdWJkb21haW4iOnRydWUsImlzVGhpcmRQYXJ0eSI6dHJ1ZX0=">
    <meta http-equiv="origin-trial"
        content="AzLNuh8GFzfIOcwvhEg7Ymr7YCzlYVTKeD7i2iETABbRf+sL2FAx+r+HlTtxSi1zgUFxBlJVoxgLjuhqiwTjAw4AAACAeyJvcmlnaW4iOiJodHRwczovL2NyaXRlby5jb206NDQzIiwiZmVhdHVyZSI6IlByaXZhY3lTYW5kYm94QWRzQVBJcyIsImV4cGlyeSI6MTY4MDY1Mjc5OSwiaXNTdWJkb21haW4iOnRydWUsImlzVGhpcmRQYXJ0eSI6dHJ1ZX0=">
    <link rel="stylesheet" type="text/css"
        href="https://d3udu241ivsax2.cloudfront.net/v3/style/bookDetail~management~paperBook~payment.5ae25aef3d26b1738ec7.css">
    <script charset="utf-8"
        src="https://d3udu241ivsax2.cloudfront.net/v3/js/bookDetail~management~paperBook~payment.ad02e6ca658d66ee58a4.js">
    </script>
    <script charset="utf-8" src="https://d3udu241ivsax2.cloudfront.net/v3/js/3.5df2a7676bf066038084.js"></script>
    <link rel="stylesheet" type="text/css"
        href="https://d3udu241ivsax2.cloudfront.net/v3/style/management~payment~resolution.36317de65b1e1d0e8124.css">
    <script charset="utf-8"
        src="https://d3udu241ivsax2.cloudfront.net/v3/js/management~payment~resolution.f368f243afcb1d1df48e.js">
    </script>
    <link rel="stylesheet" type="text/css"
        href="https://d3udu241ivsax2.cloudfront.net/v3/style/management.6a3cf585bcafabd76a9b.css">
    <script charset="utf-8" src="https://d3udu241ivsax2.cloudfront.net/v3/js/management.e4cc0e898170c3d0f71e.js">
    </script>
    <script class="shareScript" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&amp;version=v3.0"></script>
    

    <meta http-equiv="origin-trial"
        content="A0KGawWMfAygakxUO+Z3rulPwK2j0AqkLneiEt4pAI951GYaafeHNV9Ya+PAn7s0y12QSrfTjc9LdOUU+QfkdQwAAACAeyJvcmlnaW4iOiJodHRwczovL2NyaXRlby5jb206NDQzIiwiZmVhdHVyZSI6IlByaXZhY3lTYW5kYm94QWRzQVBJcyIsImV4cGlyeSI6MTY2OTc2NjM5OSwiaXNTdWJkb21haW4iOnRydWUsImlzVGhpcmRQYXJ0eSI6dHJ1ZX0=">
    
        <link rel="stylesheet" type="text/css"href="admin.css">
        
</head>

<body class="">
    <div data-v-c1337ae8="" id="wrap" class="show-top-header show-header web-mount">
        <!---->
        <!---->
<jsp:include page="/WEB-INF/views/utils/include/top.jsp"></jsp:include>
       <!--  <div data-v-e67dcbb6="" data-v-c1337ae8="" class="top-header background topHeaderArea">
            <div data-v-e67dcbb6="" class="inner">
                <header data-v-e67dcbb6="">
                    <h1 data-v-e67dcbb6=""><a data-v-e67dcbb6="" href="/"><img data-v-e67dcbb6=""
                                src="https://d3udu241ivsax2.cloudfront.net/v3/images/common/millie-logo.3884f0c52e69f1f7322c2fd4778f4830.png"
                                alt="밀리의 서재"></a></h1>
                    <nav data-v-e67dcbb6="">
                        <ul data-v-e67dcbb6="" class="gnb">
                            <li data-v-e67dcbb6="" class=""><a data-v-e67dcbb6="" href="/" class="gtm-today">투데이</a>
                            </li>
                            <li data-v-e67dcbb6="" class=""><a data-v-e67dcbb6="" href="/v3/search"
                                    class="gtm-search">검색</a></li>
                            <li data-v-e67dcbb6="" class=""><a data-v-e67dcbb6=""
                                    href="https://www.millie.co.kr/shelf/shelf_main.html" class="gtm-my">내서재</a></li>
                            <li data-v-e67dcbb6="" class="on"><a data-v-e67dcbb6="" href="/v3/management"
                                    class="gtm-setting">관리</a></li>
                        </ul>
                    </nav>
                    <ul data-v-e67dcbb6="" class="util">
                        <li data-v-e67dcbb6="" class="alarm"><a data-v-e67dcbb6=""
                                href="/v3/today/more/alarmCenter/push" title="알림" class="gtm-alarm"><i
                                    data-v-e67dcbb6="" class="mds-icon--alarm-2"></i> <span data-v-e67dcbb6=""
                                    class="alarm-icon">1</span></a></li>
                       
                        <li data-v-e67dcbb6="" class="sign sign-in"><a data-v-e67dcbb6="" href="/v3/logout"
                                class="">로그아웃</a></li>
                    </ul>
                </header>
            </div>
        </div> -->
        <section data-v-c1337ae8="" class="content">
            <div data-v-0807f0e5="" data-v-c1337ae8="" class="inner-content">
                <div data-v-0807f0e5="" class="product">
                    
                    <p data-v-0807f0e5="" class="nick-name">
                        ${sessionScope.id}님 환영합니다*.☆⸜(⑉˙ᗜ˙⑉)⸝♡.*<br data-v-0807f0e5="">
                    </p>
                   
                </div>
            
                <div data-v-0807f0e5="" class="menu-list">
                    <p data-v-0807f0e5="" class="menu-title" >기본 설정</p>
                    <ul data-v-0807f0e5="">
                        <li data-v-0807f0e5=""><a data-v-0807f0e5="" href="userEdit.do" class="">내 정보 관리</a></li>
                    </ul>
                    <p data-v-0807f0e5="" class="menu-title">서비스 관리</p>
                    <ul data-v-0807f0e5="">
                       
                        <!---->	
                        <li data-v-0807f0e5=""><a data-v-0807f0e5="" href="ebookList.do" class="">내 e-book 관리</a>
                        </li>
                        <li data-v-0807f0e5=""><a data-v-0807f0e5="" href="blogEnter.do" class="">내 블로그 관리</a></li>
                         <li data-v-0807f0e5=""><a data-v-0807f0e5="" href="paymentList.do" class="">구매내역 확인</a></li>
                    </ul>
                    <p data-v-0807f0e5="" class="menu-title">서비스 안내</p>
                    <ul data-v-0807f0e5="">
                     	<li data-v-0807f0e5=""><a data-v-0807f0e5="" href="question.do">문의사항</a></li>
                        <%-- <li data-v-0807f0e5=""><a data-v-0807f0e5="" href="userWithdraw.do?id=${sessionScope.id}">회원탈퇴</a></li> --%>
                    	<li data-v-0807f0e5=""><a data-v-0807f0e5="" href="javascript:withdraw()">회원탈퇴</a></li>
                    </ul>
                </div>
                
                <div data-v-0807f0e5="" class="btn-area"><button data-v-0807f0e5="" type="button"
                        class="logout" style = "background-color:#fbd91c" onclick="logout()">로그아웃</button></div>
                        
            </div>
        </section>
       
    </div>
</body>
<script type="text/javascript">
	function logout(){
		sessionStorage.clear();
		location.href="homepage.html";
	}
	function withdraw(){
		Swal.fire({
			  title: '진짜로 탈퇴하시겠어요? ㅜㅜ',
			  text: "탈퇴하면 모든 기록은 사라집니다.",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '네, 탈퇴할래요!',
			  canceButtonText:"취소"
			}).then((result) => {
			  if (result.isConfirmed) {
				  url = "userWithdraw.do?id=${sessionScope.id}"
				  location.href = url;
			  }
			})
	}
</script>
</html>