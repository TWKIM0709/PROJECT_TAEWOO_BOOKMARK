<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no,viewport-fit=cover">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- /v3/login -->
    <link rel="shortcut icon" type="image/png" href="https://www.millie.co.kr/favicon/android-icon.png">
    <title>갈피표</title>
    <link href="https://d3udu241ivsax2.cloudfront.net/v3/style/vendor.524cdf1d4325d722f545.css" rel="stylesheet">
    <link href="https://d3udu241ivsax2.cloudfront.net/v3/style/millie.4a1320ab272ffa081fae.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css"
        href="https://d3udu241ivsax2.cloudfront.net/v3/style/login~resolution.f7b7a1694c2b0591f7a5.css">
    <link rel="stylesheet" type="text/css"
        href="https://d3udu241ivsax2.cloudfront.net/v3/style/login.cae48df6a12d86c0e25f.css">
    
    <link rel="stylesheet" type="text/css"
        href="https://d3udu241ivsax2.cloudfront.net/v3/style/dasanAward~dasanVote~home.20e63449e7a4626c02ae.css">
    <link rel="stylesheet" type="text/css"
        href="https://d3udu241ivsax2.cloudfront.net/v3/style/bestseller~brand~home.3157435c0ebe1f9ea312.css">
    <link rel="stylesheet" type="text/css"
        href="https://d3udu241ivsax2.cloudfront.net/v3/style/home~payment.175c5a5c71c50522abda.css">
    <link rel="stylesheet" type="text/css"
        href="https://d3udu241ivsax2.cloudfront.net/v3/style/home.aadb17a03cc4dec7eb90.css">
    <link rel="stylesheet" type="text/css"
        href="https://d3udu241ivsax2.cloudfront.net/v3/style/bookDetail~management~paperBook~payment.5ae25aef3d26b1738ec7.css">
    <link rel="stylesheet" type="text/css"
        href="https://d3udu241ivsax2.cloudfront.net/v3/style/management~payment~resolution.36317de65b1e1d0e8124.css">
    <link rel="stylesheet" type="text/css"
        href="https://d3udu241ivsax2.cloudfront.net/v3/style/management.6a3cf585bcafabd76a9b.css">
    
    <link rel="stylesheet" type="text/css"
        href="https://d3udu241ivsax2.cloudfront.net/v3/style/reading~search.9e20d3f61ee01fdc9a9c.css">
  <link rel="stylesheet" type="text/css"
        href="https://d3udu241ivsax2.cloudfront.net/v3/style/search.d5e7ba02987a9fbca3c2.css">
    <link rel="stylesheet" type="text/css" href="mainpage.css">
</head>

<body class="" style="height: auto; overflow: visible;">
<c:set var="recommend" value="${requestScope.recommend }"/> <!-- 추천책 -->
<%-- <c:set var="ylikerank" value="${requestScope.ylikerank }"/>	<!-- 좋아요 1년 --> --%>
<%-- <c:set var="ypayrank" value="${requestScope.ypayrank }"/>	<!-- 결제 1년 --> --%>
<c:set var="mlikerank" value="${requestScope.mlikerank }"/>	<!-- 좋아용 1달 -->
<c:set var="mpayrank" value="${requestScope.mpayrank }"/>	<!-- 결제 1달 -->
<c:set var="wlikerank" value="${requestScope.wlikerank }"/>	<!-- 좋아요 1주일 -->
<c:set var="wpayrank" value="${requestScope.wpayrank }"/>	<!-- 결제 1주일 -->
<c:set var="dlikerank" value="${requestScope.dlikerank }"/>	<!-- 좋아요 1일 -->
<c:set var="dpayrank" value="${requestScope.dpayrank }"/>	<!-- 결제 1일 -->
<jsp:include page="/WEB-INF/views/utils/include/top.jsp"></jsp:include>
    <div data-v-c1337ae8="" id="wrap" class="show-header web-mount">
        <section data-v-c1337ae8="" class="content">
            <div data-v-3adb62c9="" data-v-c1337ae8="" class="millie-sub-inner">
                <div style="width:100%;height:400px; background-color:green;">
                </div>
                <div data-v-3adb62c9="" class="depth-section">

                    
                    <div data-v-3adb62c9="" class="inner">
                        <article data-v-3adb62c9="" class="best">
                            <h3 data-v-3adb62c9="" >
                                    소설 인기 도서</h3><br><br>
                            <div data-v-3adb62c9="" class="book-shelf overflow">
                                <div data-v-3adb62c9="" class="slide-container no-swiper" data-scroll-move="false">
                                    <ul data-v-3adb62c9="" class="slide-wrapper">
                                        <li data-v-3adb62c9="" class="slide-item">
                                            <div data-v-3adb62c9="" class="millie-book books">
                                                    <div class="thumbnail">
                                                        <div class="thumbnail-inner">
                                                            <div data-v-96e558f2="" class="book-picture imageLoaded"
                                                                data-observe="true">
                                                                <picture data-v-96e558f2="">
                                                                    <img data-v-96e558f2=""
                                                                        src="https://cover.millie.co.kr/service/cover/42933109/c3940f5426e640f5a1cf6dd518f67b72.jpg?w=145&amp;q=80"
                                                                        alt="창문 넘어 도망친 100세 노인 도서 썸네일" width="145">
                                                                </picture>
                                                            </div>
                                                        </div>
                                                    </div>
                                              
                                                    <div class="metadata">
                                                        <p class="badge "></p>
                                                        <p class="title">창문 넘어 도망친 100세 노인</p>
                                                        <p class="author">요나스요나손 지음, 임호경 옮김</p>
                                                    </div>
                                                </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </article>
                    </div>
                </div>
            </div>
        </section>
    </div>
</body>

</html>