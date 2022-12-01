<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.net.InetAddress"%>
<html lang="ko" class="" style="height: auto; overflow: visible;">

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no,viewport-fit=cover">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- / -->
    <script src="https://js.tosspayments.com/v1/payment"></script>

    <meta name="format-detection" content="telephone=no">
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="twitter:card" content="summary_large_image">
    <meta property="og:site_name" content="밀리의 서재">
    <meta property="og:type" content="website">
    <meta property="og:url" content="https://www.millie.co.kr/">
    <meta property="og:title" content="밀리의 서재">
    <meta property="og:image" content="https://www.millie.co.kr/favicon/millie_og_v2_2.png">
    <meta property="og:description" content="독서와 무제한 친해지리, 밀리의 서재에서 당신의 일상을 1밀리+ 더 멋지게 만들어 보세요">
    <meta property="og:image:width" content="1200">
    <meta property="og:image:height" content="600">
    <meta property="fb:app_id" content="1621792108120563">
    <meta name="description" content="독서와 무제한 친해지리, 밀리의 서재에서 당신의 일상을 1밀리+ 더 멋지게 만들어 보세요">
    <meta name="naver-site-verification" content="09f2fbb79dfd0f4fbb3159d7ebf0722ab613cc74">
    <meta name="google-site-verification" content="F_BvE8JmAqqhoTgJBKpQNQACdhJkXU-c7n9zdgjjRDc">
    <meta name="google-site-verification" content="fxHd7i7aN34YObihzhJqIMXq-ct60hZgtvBMFFJ6ckw">
    <script type="text/javascript" id="www-widgetapi-script"
        src="https://www.youtube.com/s/player/4eb6b35d/www-widgetapi.vflset/www-widgetapi.js" async=""></script>
    <script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
    <script type="text/javascript" async=""
        src="https://www.googletagmanager.com/gtag/js?id=UA-92156018-1&amp;l=dataLayer&amp;cx=c"></script>
    <script type="text/javascript" async=""
        src="https://www.googletagmanager.com/gtag/js?id=G-3WR64L2XW1&amp;l=dataLayer&amp;cx=c"></script>
    <script async="" src="//static.ads-twitter.com/uwt.js"></script>
    <script async="" src="https://connect.facebook.net/en_US/fbevents.js"></script>
    <!-- 제이쿼리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!--  -->
    <script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
    <script>
        var preload = {
            "IMAGE_FILE": "https:\/\/d2j6uvfek9vas1.cloudfront.net\/millie_logo\/637c1df82435a.png",
            "IMAGE_HEIGHT": "496",
            "IMAGE_WIDTH": "496",
            "LINK_URL": "https:\/\/www.millie.co.kr\/v3\/bookDetail\/179581177",
            "TITLE": {
                "0": "\ucc9c\ub9cc \ubd80 \ud310\ub9e4\uc758 \uc804\uc124\r",
                "1": "\uc6f9\uc18c\uc124\uc758 \uc870\uc0c1\ub2d8"
            },
            "SUB_TITLE": "11\uc6d4 24\uc77c <\ud1f4\ub9c8\ub85d>\uc774 \uacf5\uac1c\ub429\ub2c8\ub2e4",
            "REG_DT": "2022-11-22 09:55:20",
            "FIX_ID": "home_banner_2510"
        }
    </script>

    <link rel="apple-touch-icon" href="https://www.millie.co.kr/favicon/ios-icon.png">
    <link rel="apple-touch-icon-precomposed" href="https://www.millie.co.kr/favicon/ios-icon.png">
    <link rel="shortcut icon" type="image/png" href="https://www.millie.co.kr/favicon/android-icon.png">
    <title>장바구니 | 갈피표</title>
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

        .hj{
            margin : 2;
            
        }

        .custom-btn {
            width: 130px;
            height: 40px;
            color: #fff;
            border-radius: 5px;
            padding: 10px 25px;
            font-family: 'Lato', sans-serif;
            font-weight: 500;
            background: transparent;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            display: inline-block;
            box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
            7px 7px 20px 0px rgba(0,0,0,.1),
            4px 4px 5px 0px rgba(0,0,0,.1);
            outline: none;
            }


            .hj-button-area{
                margin-top: 20px;
            }

            /* 5 */
.btn-5 {
  width: 130px;
  height: 40px;
  line-height: 42px;
  padding: 0;
  border: none;
  background: rgb(255, 119, 0);
background: linear-gradient(0deg, rgb(255, 119, 0,1) 0%, rgba(251,75,2,1) 100%);
}
.btn-5:hover {
  color: #f0094a;
  background: transparent;
   box-shadow:none;
}
.btn-5:before,
.btn-5:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #f0094a;
  box-shadow:
   -1px -1px 5px 0px #fff,
   7px 7px 20px 0px #0003,
   4px 4px 5px 0px #0002;
  transition:400ms ease all;
}
.btn-5:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
.btn-5:hover:before,
.btn-5:hover:after{
  width:100%;
  transition:800ms ease all;
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
        src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/771298710/?random=1669186014216&amp;cv=11&amp;fst=1669186014216&amp;bg=ffffff&amp;guid=ON&amp;async=1&amp;gtm=2wgb90&amp;u_w=1707&amp;u_h=1067&amp;hn=www.googleadservices.com&amp;frm=0&amp;url=https%3A%2F%2Fwww.millie.co.kr%2F&amp;tiba=%EB%B0%80%EB%A6%AC%EC%9D%98%20%EC%84%9C%EC%9E%AC&amp;auid=492487846.1665120667&amp;uaa=x86&amp;uab=64&amp;uafvl=Microsoft%2520Edge%3B107.0.1418.35%7CChromium%3B107.0.5304.90%7CNot%253DA%253FBrand%3B24.0.0.0&amp;uap=Windows&amp;uapv=10.0.0&amp;uaw=0&amp;rfmt=3&amp;fmt=4">
    </script>
    <script type="text/javascript" async=""
        src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/715358239/?random=1669186014219&amp;cv=11&amp;fst=1669186014219&amp;bg=ffffff&amp;guid=ON&amp;async=1&amp;gtm=2wgb90&amp;u_w=1707&amp;u_h=1067&amp;hn=www.googleadservices.com&amp;frm=0&amp;url=https%3A%2F%2Fwww.millie.co.kr%2F&amp;tiba=%EB%B0%80%EB%A6%AC%EC%9D%98%20%EC%84%9C%EC%9E%AC&amp;auid=492487846.1665120667&amp;uaa=x86&amp;uab=64&amp;uafvl=Microsoft%2520Edge%3B107.0.1418.35%7CChromium%3B107.0.5304.90%7CNot%253DA%253FBrand%3B24.0.0.0&amp;uap=Windows&amp;uapv=10.0.0&amp;uaw=0&amp;rfmt=3&amp;fmt=4">
    </script>
    <script type="text/javascript" async=""
        src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/715358239/?random=1669186014220&amp;cv=11&amp;fst=1669186014220&amp;bg=ffffff&amp;guid=ON&amp;async=1&amp;gtm=2wgb90&amp;u_w=1707&amp;u_h=1067&amp;hn=www.googleadservices.com&amp;frm=0&amp;url=https%3A%2F%2Fwww.millie.co.kr%2F&amp;tiba=%EB%B0%80%EB%A6%AC%EC%9D%98%20%EC%84%9C%EC%9E%AC&amp;auid=492487846.1665120667&amp;uaa=x86&amp;uab=64&amp;uafvl=Microsoft%2520Edge%3B107.0.1418.35%7CChromium%3B107.0.5304.90%7CNot%253DA%253FBrand%3B24.0.0.0&amp;uap=Windows&amp;uapv=10.0.0&amp;uaw=0&amp;rfmt=3&amp;fmt=4">
    </script>
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
    <meta http-equiv="origin-trial"
        content="A9+ldib+sKhGj2FcIjq5GnvBZFuIiXID0+NkE6k7cEk71MhaHFGqo3wUlUFmZ6d9w0KPwx9UxGiCTYWtRnTGDQkAAACAeyJvcmlnaW4iOiJodHRwczovL2NyaXRlby5uZXQ6NDQzIiwiZmVhdHVyZSI6IlByaXZhY3lTYW5kYm94QWRzQVBJcyIsImV4cGlyeSI6MTY4MDY1Mjc5OSwiaXNTdWJkb21haW4iOnRydWUsImlzVGhpcmRQYXJ0eSI6dHJ1ZX0=">
    <meta http-equiv="origin-trial"
        content="AzLNuh8GFzfIOcwvhEg7Ymr7YCzlYVTKeD7i2iETABbRf+sL2FAx+r+HlTtxSi1zgUFxBlJVoxgLjuhqiwTjAw4AAACAeyJvcmlnaW4iOiJodHRwczovL2NyaXRlby5jb206NDQzIiwiZmVhdHVyZSI6IlByaXZhY3lTYW5kYm94QWRzQVBJcyIsImV4cGlyeSI6MTY4MDY1Mjc5OSwiaXNTdWJkb21haW4iOnRydWUsImlzVGhpcmRQYXJ0eSI6dHJ1ZX0=">
    <meta http-equiv="origin-trial"
        content="A0KGawWMfAygakxUO+Z3rulPwK2j0AqkLneiEt4pAI951GYaafeHNV9Ya+PAn7s0y12QSrfTjc9LdOUU+QfkdQwAAACAeyJvcmlnaW4iOiJodHRwczovL2NyaXRlby5jb206NDQzIiwiZmVhdHVyZSI6IlByaXZhY3lTYW5kYm94QWRzQVBJcyIsImV4cGlyeSI6MTY2OTc2NjM5OSwiaXNTdWJkb21haW4iOnRydWUsImlzVGhpcmRQYXJ0eSI6dHJ1ZX0=">
    <link rel="stylesheet" type="text/css"
        href="https://d3udu241ivsax2.cloudfront.net/v3/style/reading~search.9e20d3f61ee01fdc9a9c.css">
    <script charset="utf-8" src="https://d3udu241ivsax2.cloudfront.net/v3/js/reading~search.f53374eb3db7bf3bd13d.js">
    </script>
    <link rel="stylesheet" type="text/css"
        href="https://d3udu241ivsax2.cloudfront.net/v3/style/search.d5e7ba02987a9fbca3c2.css">
    <script charset="utf-8" src="https://d3udu241ivsax2.cloudfront.net/v3/js/search.1bfec2c80b414a00a1f3.js"></script>
    <link rel="stylesheet" type="text/css"href="Search.css">
    

    <!-- 정보수정손민수 -->
    <link
	href="https://d3udu241ivsax2.cloudfront.net/v3/style/vendor.524cdf1d4325d722f545.css"
	rel="stylesheet">
<link
	href="https://d3udu241ivsax2.cloudfront.net/v3/style/millie.4a1320ab272ffa081fae.css"
	rel="stylesheet">
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

.vue-slider-ltr .vue-slider-mark, .vue-slider-rtl .vue-slider-mark {
	width: 0;
	height: 100%;
	top: 50%
}

.vue-slider-ltr .vue-slider-mark-step, .vue-slider-rtl .vue-slider-mark-step
	{
	top: 0
}

.vue-slider-ltr .vue-slider-mark-label, .vue-slider-rtl .vue-slider-mark-label
	{
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

.vue-slider-btt .vue-slider-mark, .vue-slider-ttb .vue-slider-mark {
	width: 100%;
	height: 0;
	left: 50%
}

.vue-slider-btt .vue-slider-mark-step, .vue-slider-ttb .vue-slider-mark-step
	{
	left: 0
}

.vue-slider-btt .vue-slider-mark-label, .vue-slider-ttb .vue-slider-mark-label
	{
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

.vue-slider-mark-label, .vue-slider-mark-step {
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
<!-- <script async=""
	src="https://www.googletagmanager.com/gtag/js?id=UA-92156018-1"
	rel="preconnect" charset="utf-8">
    </script> -->
<link rel="preload"
	href="https://d3udu241ivsax2.cloudfront.net/common/mds/fonts/mds-icon-v3.woff2"
	as="font" type="font/woff2" crossorigin="crossorigin">
<link rel="preload"
	href="https://d3udu241ivsax2.cloudfront.net/common/mds/fonts/SpoqaHanSansNeo-Regular.woff2"
	as="font" type="font/woff2" crossorigin="crossorigin">
<link rel="preload"
	href="https://d3udu241ivsax2.cloudfront.net/common/mds/fonts/SpoqaHanSansNeo-Bold.woff2"
	as="font" type="font/woff2" crossorigin="crossorigin">
<link rel="preload"
	href="https://d3udu241ivsax2.cloudfront.net/common/mds/fonts/NotoSerifKR-Black.woff2"
	as="font" type="font/woff2" crossorigin="crossorigin">
<link rel="stylesheet" type="text/css"
	href="https://d3udu241ivsax2.cloudfront.net/v3/style/dasanAward~dasanVote~home.20e63449e7a4626c02ae.css">
<script charset="utf-8"
	src="https://d3udu241ivsax2.cloudfront.net/v3/js/dasanAward~dasanVote~home.a40db3baadabdf2084c7.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://d3udu241ivsax2.cloudfront.net/v3/style/bestseller~brand~home.3157435c0ebe1f9ea312.css">
<script charset="utf-8"
	src="https://d3udu241ivsax2.cloudfront.net/v3/js/bestseller~brand~home.2337c71dc13c42fd5762.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://d3udu241ivsax2.cloudfront.net/v3/style/home~payment.175c5a5c71c50522abda.css">
<script charset="utf-8"
	src="https://d3udu241ivsax2.cloudfront.net/v3/js/home~payment.7cc59588f2347d06c964.js">
    </script>
<link rel="stylesheet" type="text/css"
	href="https://d3udu241ivsax2.cloudfront.net/v3/style/home.aadb17a03cc4dec7eb90.css">
<script charset="utf-8"
	src="https://d3udu241ivsax2.cloudfront.net/v3/js/home.ed5f655aabea45e2b6cd.js"></script>
<meta http-equiv="origin-trial"
	content="A751Xsk4ZW3DVQ8WZng2Dk5s3YzAyqncTzgv+VaE6wavgTY0QHkDvUTET1o7HanhuJO8lgv1Vvc88Ij78W1FIAAAAAB7eyJvcmlnaW4iOiJodHRwczovL3d3dy5nb29nbGV0YWdtYW5hZ2VyLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjgwNjUyNzk5LCJpc1RoaXJkUGFydHkiOnRydWV9">
<!-- <script type="text/javascript" async=""
	src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/771298710/?random=1669276055208&amp;cv=11&amp;fst=1669276055208&amp;bg=ffffff&amp;guid=ON&amp;async=1&amp;gtm=2wgb90&amp;u_w=1707&amp;u_h=1067&amp;hn=www.googleadservices.com&amp;frm=0&amp;url=https%3A%2F%2Fwww.millie.co.kr%2F&amp;tiba=%EB%B0%80%EB%A6%AC%EC%9D%98%20%EC%84%9C%EC%9E%AC&amp;auid=492487846.1665120667&amp;uaa=x86&amp;uab=64&amp;uafvl=Microsoft%2520Edge%3B107.0.1418.56%7CChromium%3B107.0.5304.110%7CNot%253DA%253FBrand%3B24.0.0.0&amp;uap=Windows&amp;uapv=10.0.0&amp;uaw=0&amp;rfmt=3&amp;fmt=4">
    </script>
<script type="text/javascript" async=""
	src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/715358239/?random=1669276055209&amp;cv=11&amp;fst=1669276055209&amp;bg=ffffff&amp;guid=ON&amp;async=1&amp;gtm=2wgb90&amp;u_w=1707&amp;u_h=1067&amp;hn=www.googleadservices.com&amp;frm=0&amp;url=https%3A%2F%2Fwww.millie.co.kr%2F&amp;tiba=%EB%B0%80%EB%A6%AC%EC%9D%98%20%EC%84%9C%EC%9E%AC&amp;auid=492487846.1665120667&amp;uaa=x86&amp;uab=64&amp;uafvl=Microsoft%2520Edge%3B107.0.1418.56%7CChromium%3B107.0.5304.110%7CNot%253DA%253FBrand%3B24.0.0.0&amp;uap=Windows&amp;uapv=10.0.0&amp;uaw=0&amp;rfmt=3&amp;fmt=4">
    </script>
<script type="text/javascript" async=""
	src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/715358239/?random=1669276055210&amp;cv=11&amp;fst=1669276055210&amp;bg=ffffff&amp;guid=ON&amp;async=1&amp;gtm=2wgb90&amp;u_w=1707&amp;u_h=1067&amp;hn=www.googleadservices.com&amp;frm=0&amp;url=https%3A%2F%2Fwww.millie.co.kr%2F&amp;tiba=%EB%B0%80%EB%A6%AC%EC%9D%98%20%EC%84%9C%EC%9E%AC&amp;auid=492487846.1665120667&amp;uaa=x86&amp;uab=64&amp;uafvl=Microsoft%2520Edge%3B107.0.1418.56%7CChromium%3B107.0.5304.110%7CNot%253DA%253FBrand%3B24.0.0.0&amp;uap=Windows&amp;uapv=10.0.0&amp;uaw=0&amp;rfmt=3&amp;fmt=4">
    </script> -->
<meta http-equiv="origin-trial"
	content="A9+ldib+sKhGj2FcIjq5GnvBZFuIiXID0+NkE6k7cEk71MhaHFGqo3wUlUFmZ6d9w0KPwx9UxGiCTYWtRnTGDQkAAACAeyJvcmlnaW4iOiJodHRwczovL2NyaXRlby5uZXQ6NDQzIiwiZmVhdHVyZSI6IlByaXZhY3lTYW5kYm94QWRzQVBJcyIsImV4cGlyeSI6MTY4MDY1Mjc5OSwiaXNTdWJkb21haW4iOnRydWUsImlzVGhpcmRQYXJ0eSI6dHJ1ZX0=">
<meta http-equiv="origin-trial"
	content="AzLNuh8GFzfIOcwvhEg7Ymr7YCzlYVTKeD7i2iETABbRf+sL2FAx+r+HlTtxSi1zgUFxBlJVoxgLjuhqiwTjAw4AAACAeyJvcmlnaW4iOiJodHRwczovL2NyaXRlby5jb206NDQzIiwiZmVhdHVyZSI6IlByaXZhY3lTYW5kYm94QWRzQVBJcyIsImV4cGlyeSI6MTY4MDY1Mjc5OSwiaXNTdWJkb21haW4iOnRydWUsImlzVGhpcmRQYXJ0eSI6dHJ1ZX0=">
<script type="text/javascript" charset="utf8" async=""
	src="https://www.youtube.com/iframe_api"></script>
<meta http-equiv="origin-trial"
	content="A0KGawWMfAygakxUO+Z3rulPwK2j0AqkLneiEt4pAI951GYaafeHNV9Ya+PAn7s0y12QSrfTjc9LdOUU+QfkdQwAAACAeyJvcmlnaW4iOiJodHRwczovL2NyaXRlby5jb206NDQzIiwiZmVhdHVyZSI6IlByaXZhY3lTYW5kYm94QWRzQVBJcyIsImV4cGlyeSI6MTY2OTc2NjM5OSwiaXNTdWJkb21haW4iOnRydWUsImlzVGhpcmRQYXJ0eSI6dHJ1ZX0=">
<link rel="stylesheet" type="text/css"
	href="https://d3udu241ivsax2.cloudfront.net/v3/style/reading~search.9e20d3f61ee01fdc9a9c.css">
<script charset="utf-8"
	src="https://d3udu241ivsax2.cloudfront.net/v3/js/reading~search.30140e35c71695a23426.js">
    </script>
<link rel="stylesheet" type="text/css"
	href="https://d3udu241ivsax2.cloudfront.net/v3/style/search.d5e7ba02987a9fbca3c2.css">
<script charset="utf-8"
	src="https://d3udu241ivsax2.cloudfront.net/v3/js/search.68343292a1c4e3613023.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://d3udu241ivsax2.cloudfront.net/v3/style/bookDetail~management~paperBook~payment.5ae25aef3d26b1738ec7.css">
<script charset="utf-8"
	src="https://d3udu241ivsax2.cloudfront.net/v3/js/bookDetail~management~paperBook~payment.751f5c94fe71c44bb7be.js">
    </script>
<link rel="stylesheet" type="text/css"
	href="https://d3udu241ivsax2.cloudfront.net/v3/style/bookDetail.120e0472d463d372d2c8.css">
<script charset="utf-8"
	src="https://d3udu241ivsax2.cloudfront.net/v3/js/bookDetail.99be822072640d1e4f68.js">
    </script>
<link rel="stylesheet" type="text/css"
	href="https://d3udu241ivsax2.cloudfront.net/v3/style/audioDetail.49dfc892f0cef369883f.css">
<script charset="utf-8"
	src="https://d3udu241ivsax2.cloudfront.net/v3/js/audioDetail.c3eab3433e02cfa3dfc1.js">
    </script>
<script charset="utf-8"
	src="https://d3udu241ivsax2.cloudfront.net/v3/js/3.0f4883b62b6134b1d0e8.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://d3udu241ivsax2.cloudfront.net/v3/style/management~payment~resolution.36317de65b1e1d0e8124.css">
<script charset="utf-8"
	src="https://d3udu241ivsax2.cloudfront.net/v3/js/management~payment~resolution.58db09167d6c08ef3b9b.js">
    </script>
<link rel="stylesheet" type="text/css"
	href="https://d3udu241ivsax2.cloudfront.net/v3/style/management.6a3cf585bcafabd76a9b.css">
<script charset="utf-8"
	src="https://d3udu241ivsax2.cloudfront.net/v3/js/management.290a60841f92b77fd5e6.js">
    </script>
<link rel="stylesheet" type="text/css" href="ddd.css">
     <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>

<body style="height: auto; overflow: visible;">
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
        <!---->
        <!---->
<jsp:include page="/WEB-INF/views/utils/include/top.jsp"></jsp:include>

        <section data-v-c1337ae8="" class="content">
            <section data-v-02a040ec="" data-v-c1337ae8="" class="search-container">
                <div data-v-02a040ec="" class="search-input-wrap">
                    <div data-v-28783d35="" data-v-02a040ec="" class="search-input search-index">
                        <article data-v-28783d35="" class="search-inner">
                            <!---->
                          
                        </article>
                        <!---->
                        <!---->
                        <!---->
                    </div>
                </div>
                <div data-v-02a040ec="" class="search-body">
                    <section data-v-02a040ec="" class="ranking">
                       
                    </section>
                    <h2 data-v-02a040ec="" class="title" id="searchTag">장바구니</h2>
                    
                    <hr data-v-02a040ec="">
                    <h2 data-v-02a040ec="" class="title" id="hjtotalprice"></h2>
                    <section data-v-02a040ec="" class="page category-wrap">
                        <h2 data-v-02a040ec="" class="title" id="searchTag"></h2>
                        <ul data-v-02a040ec="" id="searchResultList" class="category-list">
                            
                                <c:forEach  var="book"  items="${requestScope.cartlist}" varStatus="status">
                                    <c:set var="bookcount" value="bookcount${status.count}"></c:set>
	                                	 <li data-v-02a040ec="" id=${bookcount} name="hjitem" class="list gtm-search-category"><a data-v-02a040ec="">
		                                    <div data-v-02a040ec="" class="metadata">
                                                
                                                <strong data-v-02a040ec="">${book.book_name }</strong>
		                                        <p data-v-02a040ec="">${book.author }</p><br>
                                                <p id="bookprice" data-v-02a040ec="">${book.price}원</p>
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

                        <hr>
                        <div class="hj-button-area">
                            <button id="hjtrash" class="custom-btn btn-5"><span>장바구니 비우기</span></button>
                        </div>
                    </section>
                    <hr>
                    <!-- 결제할 책 -->
                    <!-- <section data-v-02a040ec="" class="page category-wrap">
                        <h2 data-v-02a040ec="" class="title">구매할 책</h2>
                        <hr>
                        
                        <h3 id="hjtotal">

                        </h3>
                        <ul data-v-02a040ec="" id="hjpay" class="category-list">
                           
                       </ul>
                    </section> -->
                   
                </div>
            </section>
        </section>
        <!---->
        <!---->
        <!---->
    	<section data-v-c1337ae8="" class="content">
			<div data-v-9baa251e="" data-v-c1337ae8="" class="millie-inner">
				<div data-v-9baa251e="">
				<form id="hjpost" method = "post" >
                    <h2 data-v-02a040ec="" class="title" id="searchTag">받는 분 정보</h2>
					<div data-v-9baa251e="" class="inner-content">

						<hr data-v-9baa251e="" class="line">
						<div data-v-9baa251e="" class="input-item">
							<p data-v-9baa251e="" class="tit">
								이름<span data-v-9baa251e="">*</span>
								<!---->
							</p>
							<div data-v-9baa251e="" class="input-group">
								<div data-v-9baa251e="" class="input-box">
									<input data-v-9baa251e="" type="text" 
									
										placeholder="이름 입력 (‘-’ 제외)" 
										class="input-text" value="${user.name}" name = "name" >
								</div>
							
							</div>
							<!---->
						</div>
						
						<div data-v-9baa251e="" class="input-item">
							<p data-v-9baa251e="" class="tit">
								휴대폰 번호<span data-v-9baa251e="">*</span>
								<!---->
							</p>
							<div data-v-9baa251e="" class="input-group">
								<div data-v-9baa251e="" class="input-box">
									<input data-v-9baa251e="" type="number" 
									maxlength="11" oninput="maxLengthChk(this)" placeholder="01012345678" pattern="\d*" maxlength="6"
										placeholder="휴대폰 번호 입력 (‘-’ 제외)" 
										class="input-text" value="${user.phone}" name = "phone">
								</div>
							
							</div>
							<!---->
						</div>
                    
						<!---->
						<div data-v-9baa251e="" class="input-item">
							<p data-v-9baa251e="" class="tit">우편번호<span data-v-9baa251e="">*</span></p>
							<div data-v-9baa251e="" class="input-group"> 
								<div data-v-9baa251e="" class="input-box"></div>
									<input data-v-9baa251e="" type="text" placeholder="우편번호 입력" id="zipcode"  readonly
									
										 class="input-text" value="${user.addr}" name = "addr" > <button style="position: absolute;left: 87%;" type="button" value="우편번호찾기" onclick = "kakaopost()" >우편번호찾기</button>
										
								</div>
								<!---->
								<!---->
					
							</div>
							<!---->
							<!---->
							<!---->
						<div class="inner">
						    <div data-v-9baa251e="" class="input-item">
                                    <p data-v-9baa251e="" class="tit">
                                    주소<span data-v-9baa251e="">*</span>
                                    </p> 
                                <div data-v-9baa251e="" class="input-group">
                                    <div data-v-9baa251e="" class="input-box">
                                        <input data-v-9baa251e="" 
                                        type="text" placeholder="상세주소 입력" 
                                            id="address"  class="input-text" value="${user.detail_addr}"  name = "detail_addr" >
                                    </div>
                                </div>
                            </div>
                        </div>
                            <div data-v-9baa251e="" class="input-group" >
                                    <div data-v-9baa251e="" class="input-box" >
                                        <input data-v-9baa251e="" type="hidden" 
                                            
                                            id = "hjpriceinput"
                                            class="input-text" value="" name = "totalprice" >
                                    </div>
                                
                            </div>
                                <div data-v-9baa251e="" class="input-group" >
                                    <div data-v-9baa251e="" class="input-box" >
                                        <input data-v-9baa251e="" type="hidden" 
                                            
                                            id = "hjfirstbook"
                                            class="input-text" value="" name = "firstbook" >
                                    </div>
                                
                                </div>
                                <div data-v-9baa251e="" class="input-group" >
                                    <div data-v-9baa251e="" class="input-box" >
                                        <input data-v-9baa251e="" type="hidden" 
                                            
                                            id = "hjcartsize"
                                            class="input-text" value="" name = "cartsize" >
                                    </div>
                                
                                </div>
							</div>
						<hr data-v-9baa251e="" class="line">
						<button data-v-9baa251e="" id="hjbtn" type="button" class="confirm-btn">결제하기</button>
                        <button data-v-9baa251e="" id="hjsubmit" type="submit" class="confirm-btn" style="visibility:hidden">결제하기</button>
                    </form>
						
					</div>
				</div>
				<!---->
				<!---->
				<!---->
			</div>
		</section>
        <!---->
    </div>
    <!-- <script src="https://d3udu241ivsax2.cloudfront.net/v3/js/vendor.0be117fe15cd3682b23e.js"></script> -->
    <script src="https://d3udu241ivsax2.cloudfront.net/v3/js/millie.b91a9f57d4b10d47052a.js"></script>
    <!-- <script async="" src="https://www.googletagmanager.com/gtm.js?id=GTM-MPM86K5"></script>
    <script async="" src="https://www.googletagmanager.com/gtm.js?id=GTM-NTPPL2M"></script> -->
    <script src="https://millie.co.kr/common/js/tracking.js"></script>
    <script type="text/javascript" id="" src="https://wcs.naver.net/wcslog.js"></script>
    <script type="text/javascript" id="" src="https://wcs.naver.net/wcslog.js"></script>
    <script type="text/javascript" id="">
        ! function (b, e, f, g, a, c, d) {
            b.fbq || (a = b.fbq = function () {
                    a.callMethod ? a.callMethod.apply(a, arguments) : a.queue.push(arguments)
                }, b._fbq || (b._fbq = a), a.push = a, a.loaded = !0, a.version = "2.0", a.queue = [], c = e
                .createElement(f), c.async = !0, c.src = g, d = e.getElementsByTagName(f)[0], d.parentNode
                .insertBefore(c, d))
        }(window, document, "script", "https://connect.facebook.net/en_US/fbevents.js");
        fbq("init", "863315557137080");
        fbq("track", "PageView");
    </script>
    <noscript><img height="1" width="1" style="display:none"
            src="https://www.facebook.com/tr?id=863315557137080&amp;ev=PageView&amp;noscript=1"></noscript>
    <script type="text/javascript" id="" src="//static.criteo.net/js/ld/ld.js"></script>
    <script type="text/javascript" id="" charset="UTF-8" src="//t1.daumcdn.net/adfit/static/kp.js"></script>
    <script type="text/javascript" id="">
        ! function (d, e, f, a, b, c) {
            d.twq || (a = d.twq = function () {
                    a.exe ? a.exe.apply(a, arguments) : a.queue.push(arguments)
                }, a.version = "1.1", a.queue = [], b = e.createElement(f), b.async = !0, b.src =
                "//static.ads-twitter.com/uwt.js", c = e.getElementsByTagName(f)[0], c.parentNode.insertBefore(b, c)
                )
        }(window, document, "script");
        twq("init", "o087e");
        twq("track", "PageView");
    </script>

    <div id="wp_tg_cts" style="display:none;">
        <script id="wp_tag_script_1669186014928" charset="UTF-8"
            src="https://astg.widerplanet.com/delivery/wpc.php?v=1&amp;ver=4.0&amp;r=1&amp;md=bs&amp;ga=1hjvecr-uskfro-3-1&amp;wp_uid=2-c9bf3b18eb3948657509617f2772763c-s1661407732.232608%7Cwindows_10%7Cedge-t2jfze&amp;ty=Home&amp;ti=52062&amp;hcuid=d5d4cd07616a542891b7ec2d0257b3a24b69856e&amp;device=web&amp;charset=UTF-8&amp;tc=1669186014928&amp;loc=https%3A%2F%2Fwww.millie.co.kr%2F">
        </script>
        <script id="wp_onsite_script" charset="UTF-8" src="https://cdn-aitg.widerplanet.com/onsite/onsite.js"></script>
    </div>
    <script type="text/javascript" id="">
        var UserAgent = navigator.userAgent,
            widerplanet_device = null != UserAgent.match(
                /iPhone|iPod|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i
                ) || null != UserAgent.match(/LG|SAMSUNG|Samsung/) ? "mobile" : "web",
            wptg_tagscript_vars = wptg_tagscript_vars || [];
        wptg_tagscript_vars.push(function () {
            return {
                wp_hcuid: "undefined",
                ti: "52062",
                ty: "Home",
                device: widerplanet_device
            }
        });
    </script>
    <script type="text/javascript" id="" src="//cdn-aitg.widerplanet.com/js/wp_astg_4.0.js"></script>
    <script type="text/javascript" id="" charset="UTF-8" src="//t1.daumcdn.net/adfit/static/kp.js"></script>
    <script type="text/javascript" id="">
        if (!wcs_add) var wcs_add = {};
        wcs_add.wa = "s_1b6be27b0956";
        if (!_nasa) var _nasa = {};
        wcs.inflow();
    </script>


    <script type="text/javascript" id="">
        if (!wcs_add) var wcs_add = {};
        wcs_add.wa = "s_1b6be27b0956";
        if (!_nasa) var _nasa = {};
        window.wcs && (wcs_do(_nasa), console.log("wcs send!", wcs));
    </script>


    <script type="text/javascript" id="">
        window.criteo_q = window.criteo_q || [];
        window.criteo_q.push({
            event: "setAccount",
            account: 55644
        }, {
            event: "setSiteType",
            type: ""
        }, {
            event: "viewHome"
        });
    </script>
    <script type="text/javascript" id="">
        kakaoPixel("4237922289572623356").pageView();
    </script>

    <script type="text/javascript" id="">
        kakaoPixel("5057430883487430749").pageView("\ud0dc\uadf8\uac12\uc785\ub825");
    </script>
    <div id="criteo-tags-div" style="display: none;"></div><iframe height="0" width="0" title="Criteo DIS iframe"
        style="display: none;" data-gtm-yt-inspected-9643057_1512="true" data-gtm-yt-inspected-9643057_2182="true"
        data-gtm-yt-inspected-18="true"></iframe>
</body>
<script>
    // $('div[name="hjitem"]').click(function(){
    //     console.log("리스트 아이템 클릭 !! " + $(this).children().attr('id'));
    //     let clickItem = $(this);
    //     console.log(clickItem);
    //     $('#hjpay').append(clickItem);
    // })
    let totalprice = "<c:out value='${requestScope.totalprice}' />"    
    let repbook = "<c:out value='${requestScope.firstbook}' />";
    
    // console.log("${requestScope.cartlist[0].book_name}");
    // console.log("${requestScope.cartlist.size()}")
    let cartsize = "<c:out value='${requestScope.cartsize}' />"
    let customerName = "<c:out value='${sessionScope.id}' />";

    let pricetag = $('#hjtotal');
    
    let addr = "";
    let detail_addr = "";

    // console.log(pricetag);
    $(function(){
        $('#hjpriceinput').attr("value", totalprice);
        $('#hjcartsize').attr("value", cartsize);
        $('#hjfirstbook').attr("value", repbook);
        $('#hjtotalprice').append(totalprice + "원")
        /*
        $('#searchResultList').children().click(function(){
            //TODO: 클릭 홀수면 결제하기목록에 짝수면 다시 장바구니에 돌리는 로직 ??
            let price = $(this).find("p#bookprice").text();

            totalprice+= parseInt(price);
            $(this).clone().appendTo($('#hjpay'));
            $(this).remove();
            $(pricetag).empty();
            $(pricetag).append("총 가격 | " + totalprice + "원");

            $('#hjbtn').css("visibility","visibility"); // 값을 보여줌
            // document.getElementById("hjtotal").value = tmp;
        })
        */
        // $('#hjpost').attr("action", `payment.do?amount=${totalprice}&orderItem=${repbook}&customerName=${customerName}&orderItemCount=${cartsize-1}`);

        $('#hjbtn').click(function(){
                console.log("구매버튼 클릭");
                test();
                //여기서 ajax로 장바구니 책을 전달하고


                //form에서는 구매자의 정보를 전달한다.

                

                // $('#hjsubmit').click();
                //location.href=`payment.do?amount=${totalprice}&orderItem=${isbn[0]}&ordrItemCount=${isbn.length}&customerName=${customerName}`; //결제API로 이동 orderId가 머야?
                //orderItem 외 count 건 (예:러시아어 외 2건)
            }
        )
        $('#hjtrash').click(function(){
            $(location).attr("href", "cartDeleteOk.do?id=" + customerName);
        })
    })
    function kakaopost() {
      new daum.Postcode({
        oncomplete: function (data) {
        	console.log(data.zonecode);
        	console.log(data.address);
        	$('#zipcode').val(data.zonecode);
        	$('#address').val(data.address);
        }
      }).open();
    }


    //결제 API
   
	function test(){

        // let totalprice =  '${param.totalprice}';
	    // let cartsize = '${param.cartsize}';
	    // let customername = '${sessionScope.id}';
	    // let firstbook = '${param.firstbook}'	 
	    // let addr = '${param.addr}'
	    // let detail_addr = '${param.detail_addr}'
        console.log("test함수 실행됐습니다~")

        let addr = $('#zipcode').val();
        let detail_addr = $('#address').val();

		let ip = '${requestScope.ip}';
		let contextpath = '${requestScope.contextpath}'
        let customername = customerName;
	 	//console.log(ip);
        //let url = "http://localhost:8090/PROJECT_TAEWOO_BOOKMARK/paymentOk.do?id=" + customername + "&addr=" + addr.replace(/ /g,"") + "&detail_addr=" + detail_addr.replace(/ /g,"-");
        let successurl =  "http://" + ip + ":8090" + contextpath +"/paymentOk.do?id=" + customername + "&addr=" + addr.replace(/ /g,"") + "&detail_addr=" + detail_addr.replace(/ /g,"-");
        //let failurl = "http://" + ip + ":8090/PROJECT_TAEWOO_BOOKMARK/WEB-INF/views/userpage/user_paymentFail.jsp";
        let failurl ="http://" + ip + ":8090"+contextpath+"/paymentFail.do";

        
            var clientKey = 'test_ck_D5GePWvyJnrK0W0k6q8gLzN97Eoq'
            var tossPayments = TossPayments(clientKey) // 클라이언트 키로 초기화하기
            let num = parseInt(totalprice);
            tossPayments.requestPayment('카드', { // 결제 수단
			// 결제 정보
			amount: num,
			orderId: 'QTIk82kxDPefXZC8MLFj0',
			orderName: repbook + " 외 " + (parseInt(cartsize)-1) + "건",
			customerName: customername,
			successUrl: successurl,
			failUrl: "https://www.musinsa.com/app/",	
			flowMode: 'D',
			easyPay: '토스페이'
			})
	}

</script>

</html>
