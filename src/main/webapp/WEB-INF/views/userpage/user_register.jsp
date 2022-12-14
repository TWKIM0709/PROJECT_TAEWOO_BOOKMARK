<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="">

<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <meta name="viewport"
        content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no,viewport-fit=cover">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- /v3/join -->


    <link rel="apple-touch-icon" href="https://www.millie.co.kr/favicon/ios-icon.png">
    <link rel="apple-touch-icon-precomposed" href="https://www.millie.co.kr/favicon/ios-icon.png">
    <link rel="shortcut icon" type="image/png" href="https://www.millie.co.kr/favicon/android-icon.png">
    <title>회원가입 | 갈피표</title>
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
        href="https://d3udu241ivsax2.cloudfront.net/v3/style/login~resolution.f7b7a1694c2b0591f7a5.css">
    <script charset="utf-8" src="https://d3udu241ivsax2.cloudfront.net/v3/js/login~resolution.97d517a9ac3a32eb5411.js">
    </script>
    <link rel="stylesheet" type="text/css"
        href="https://d3udu241ivsax2.cloudfront.net/v3/style/login.cae48df6a12d86c0e25f.css">
    <script charset="utf-8" src="https://d3udu241ivsax2.cloudfront.net/v3/js/login.bfccbeb5364c7568de13.js"></script>
    <meta http-equiv="origin-trial"
        content="A751Xsk4ZW3DVQ8WZng2Dk5s3YzAyqncTzgv+VaE6wavgTY0QHkDvUTET1o7HanhuJO8lgv1Vvc88Ij78W1FIAAAAAB7eyJvcmlnaW4iOiJodHRwczovL3d3dy5nb29nbGV0YWdtYW5hZ2VyLmNvbTo0NDMiLCJmZWF0dXJlIjoiUHJpdmFjeVNhbmRib3hBZHNBUElzIiwiZXhwaXJ5IjoxNjgwNjUyNzk5LCJpc1RoaXJkUGFydHkiOnRydWV9">
    <script type="text/javascript" async=""
        src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/771298710/?random=1669184861411&amp;cv=11&amp;fst=1669184861411&amp;bg=ffffff&amp;guid=ON&amp;async=1&amp;gtm=2wgb90&amp;u_w=1707&amp;u_h=1067&amp;hn=www.googleadservices.com&amp;frm=0&amp;url=https%3A%2F%2Fwww.millie.co.kr%2Fv3%2Fjoin&amp;ref=https%3A%2F%2Fwww.millie.co.kr%2Fv3%2Fbrand%2Fupdate&amp;tiba=%EB%B0%80%EB%A6%AC%EC%9D%98%20%EC%84%9C%EC%9E%AC&amp;auid=492487846.1665120667&amp;uaa=x86&amp;uab=64&amp;uafvl=Microsoft%2520Edge%3B107.0.1418.35%7CChromium%3B107.0.5304.90%7CNot%253DA%253FBrand%3B24.0.0.0&amp;uap=Windows&amp;uapv=10.0.0&amp;uaw=0&amp;rfmt=3&amp;fmt=4">
    </script>
    <script type="text/javascript" async=""
        src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/715358239/?random=1669184861416&amp;cv=11&amp;fst=1669184861416&amp;bg=ffffff&amp;guid=ON&amp;async=1&amp;gtm=2wgb90&amp;u_w=1707&amp;u_h=1067&amp;hn=www.googleadservices.com&amp;frm=0&amp;url=https%3A%2F%2Fwww.millie.co.kr%2Fv3%2Fjoin&amp;ref=https%3A%2F%2Fwww.millie.co.kr%2Fv3%2Fbrand%2Fupdate&amp;tiba=%EB%B0%80%EB%A6%AC%EC%9D%98%20%EC%84%9C%EC%9E%AC&amp;auid=492487846.1665120667&amp;uaa=x86&amp;uab=64&amp;uafvl=Microsoft%2520Edge%3B107.0.1418.35%7CChromium%3B107.0.5304.90%7CNot%253DA%253FBrand%3B24.0.0.0&amp;uap=Windows&amp;uapv=10.0.0&amp;uaw=0&amp;rfmt=3&amp;fmt=4">
    </script>
    <script type="text/javascript" async=""
        src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/715358239/?random=1669184861417&amp;cv=11&amp;fst=1669184861417&amp;bg=ffffff&amp;guid=ON&amp;async=1&amp;gtm=2wgb90&amp;u_w=1707&amp;u_h=1067&amp;hn=www.googleadservices.com&amp;frm=0&amp;url=https%3A%2F%2Fwww.millie.co.kr%2Fv3%2Fjoin&amp;ref=https%3A%2F%2Fwww.millie.co.kr%2Fv3%2Fbrand%2Fupdate&amp;tiba=%EB%B0%80%EB%A6%AC%EC%9D%98%20%EC%84%9C%EC%9E%AC&amp;auid=492487846.1665120667&amp;uaa=x86&amp;uab=64&amp;uafvl=Microsoft%2520Edge%3B107.0.1418.35%7CChromium%3B107.0.5304.90%7CNot%253DA%253FBrand%3B24.0.0.0&amp;uap=Windows&amp;uapv=10.0.0&amp;uaw=0&amp;rfmt=3&amp;fmt=4">
    </script>
    <script class="sns-api" src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script class="sns-api" src="https://connect.facebook.net/ko_KR/sdk.js"></script>
    <meta http-equiv="origin-trial"
        content="A9+ldib+sKhGj2FcIjq5GnvBZFuIiXID0+NkE6k7cEk71MhaHFGqo3wUlUFmZ6d9w0KPwx9UxGiCTYWtRnTGDQkAAACAeyJvcmlnaW4iOiJodHRwczovL2NyaXRlby5uZXQ6NDQzIiwiZmVhdHVyZSI6IlByaXZhY3lTYW5kYm94QWRzQVBJcyIsImV4cGlyeSI6MTY4MDY1Mjc5OSwiaXNTdWJkb21haW4iOnRydWUsImlzVGhpcmRQYXJ0eSI6dHJ1ZX0=">
    <meta http-equiv="origin-trial"
        content="AzLNuh8GFzfIOcwvhEg7Ymr7YCzlYVTKeD7i2iETABbRf+sL2FAx+r+HlTtxSi1zgUFxBlJVoxgLjuhqiwTjAw4AAACAeyJvcmlnaW4iOiJodHRwczovL2NyaXRlby5jb206NDQzIiwiZmVhdHVyZSI6IlByaXZhY3lTYW5kYm94QWRzQVBJcyIsImV4cGlyeSI6MTY4MDY1Mjc5OSwiaXNTdWJkb21haW4iOnRydWUsImlzVGhpcmRQYXJ0eSI6dHJ1ZX0=">
    <meta http-equiv="origin-trial"
        content="A0KGawWMfAygakxUO+Z3rulPwK2j0AqkLneiEt4pAI951GYaafeHNV9Ya+PAn7s0y12QSrfTjc9LdOUU+QfkdQwAAACAeyJvcmlnaW4iOiJodHRwczovL2NyaXRlby5jb206NDQzIiwiZmVhdHVyZSI6IlByaXZhY3lTYW5kYm94QWRzQVBJcyIsImV4cGlyeSI6MTY2OTc2NjM5OSwiaXNTdWJkb21haW4iOnRydWUsImlzVGhpcmRQYXJ0eSI6dHJ1ZX0=">
    <style type="text/css"
        data-fbcssmodules="css:fb.css.base css:fb.css.dialog css:fb.css.iframewidget css:fb.css.customer_chat_plugin_iframe">
        .fb_hidden {
            position: absolute;
            top: -10000px;
            z-index: 10001
        }

        .fb_reposition {
            overflow: hidden;
            position: relative
        }

        .fb_invisible {
            display:none
        }

        .fb_reset {
            background: none;
            border: 0;
            border-spacing: 0;
            color: #000;
            cursor: auto;
            direction: ltr;
            font-family: 'lucida grande', tahoma, verdana, arial, sans-serif;
            font-size: 11px;
            font-style: normal;
            font-variant: normal;
            font-weight: normal;
            letter-spacing: normal;
            line-height: 1;
            margin: 0;
            overflow: visible;
            padding: 0;
            text-align: left;
            text-decoration: none;
            text-indent: 0;
            text-shadow: none;
            text-transform: none;
            visibility: visible;
            white-space: normal;
            word-spacing: normal
        }

        .fb_reset>div {
            overflow: hidden
        }

        @keyframes fb_transform {
            from {
                opacity: 0;
                transform: scale(.95)
            }

            to {
                opacity: 1;
                transform: scale(1)
            }
        }

        .fb_animate {
            animation: fb_transform .3s forwards
        }

        .fb_hidden {
            position: absolute;
            top: -10000px;
            z-index: 10001
        }

        .fb_reposition {
            overflow: hidden;
            position: relative
        }

        .fb_invisible {
            display: none
        }

        .fb_reset {
            background: none;
            border: 0;
            border-spacing: 0;
            color: #000;
            cursor: auto;
            direction: ltr;
            font-family: 'lucida grande', tahoma, verdana, arial, sans-serif;
            font-size: 11px;
            font-style: normal;
            font-variant: normal;
            font-weight: normal;
            letter-spacing: normal;
            line-height: 1;
            margin: 0;
            overflow: visible;
            padding: 0;
            text-align: left;
            text-decoration: none;
            text-indent: 0;
            text-shadow: none;
            text-transform: none;
            visibility: visible;
            white-space: normal;
            word-spacing: normal
        }

        .fb_reset>div {
            overflow: hidden
        }

        @keyframes fb_transform {
            from {
                opacity: 0;
                transform: scale(.95)
            }

            to {
                opacity: 1;
                transform: scale(1)
            }
        }

        .fb_animate {
            animation: fb_transform .3s forwards
        }

        .fb_dialog {
            background: rgba(82, 82, 82, .7);
            position: absolute;
            top: -10000px;
            z-index: 10001
        }

        .fb_dialog_advanced {
            border-radius: 8px;
            padding: 10px
        }

        .fb_dialog_content {
            background: #fff;
            color: #373737
        }

        .fb_dialog_close_icon {
            background: url(https://connect.facebook.net/rsrc.php/v3/yq/r/IE9JII6Z1Ys.png) no-repeat scroll 0 0 transparent;
            cursor: pointer;
            display: block;
            height: 15px;
            position: absolute;
            right: 18px;
            top: 17px;
            width: 15px
        }

        .fb_dialog_mobile .fb_dialog_close_icon {
            left: 5px;
            right: auto;
            top: 5px
        }

        .fb_dialog_padding {
            background-color: transparent;
            position: absolute;
            width: 1px;
            z-index: -1
        }

        .fb_dialog_close_icon:hover {
            background: url(https://connect.facebook.net/rsrc.php/v3/yq/r/IE9JII6Z1Ys.png) no-repeat scroll 0 -15px transparent
        }

        .fb_dialog_close_icon:active {
            background: url(https://connect.facebook.net/rsrc.php/v3/yq/r/IE9JII6Z1Ys.png) no-repeat scroll 0 -30px transparent
        }

        .fb_dialog_iframe {
            line-height: 0
        }

        .fb_dialog_content .dialog_title {
            background: #6d84b4;
            border: 1px solid #365899;
            color: #fff;
            font-size: 14px;
            font-weight: bold;
            margin: 0
        }

        .fb_dialog_content .dialog_title>span {
            background: url(https://connect.facebook.net/rsrc.php/v3/yd/r/Cou7n-nqK52.gif) no-repeat 5px 50%;
            float: left;
            padding: 5px 0 7px 26px
        }

        body.fb_hidden {
            height: 100%;
            left: 0;
            margin: 0;
            overflow: visible;
            position: absolute;
            top: -10000px;
            transform: none;
            width: 100%
        }

        .fb_dialog.fb_dialog_mobile.loading {
            background: url(https://connect.facebook.net/rsrc.php/v3/ya/r/3rhSv5V8j3o.gif) white no-repeat 50% 50%;
            min-height: 100%;
            min-width: 100%;
            overflow: hidden;
            position: absolute;
            top: 0;
            z-index: 10001
        }

        .fb_dialog.fb_dialog_mobile.loading.centered {
            background: none;
            height: auto;
            min-height: initial;
            min-width: initial;
            width: auto
        }

        .fb_dialog.fb_dialog_mobile.loading.centered #fb_dialog_loader_spinner {
            width: 100%
        }

        .fb_dialog.fb_dialog_mobile.loading.centered .fb_dialog_content {
            background: none
        }

        .loading.centered #fb_dialog_loader_close {
            clear: both;
            color: #fff;
            display: block;
            font-size: 18px;
            padding-top: 20px
        }

        #fb-root #fb_dialog_ipad_overlay {
            background: rgba(0, 0, 0, .4);
            bottom: 0;
            left: 0;
            min-height: 100%;
            position: absolute;
            right: 0;
            top: 0;
            width: 100%;
            z-index: 10000
        }

        #fb-root #fb_dialog_ipad_overlay.hidden {
            display: none
        }

        .fb_dialog.fb_dialog_mobile.loading iframe {
            visibility: hidden
        }

        .fb_dialog_mobile .fb_dialog_iframe {
            position: sticky;
            top: 0
        }

        .fb_dialog_content .dialog_header {
            background: linear-gradient(from(#738aba), to(#2c4987));
            border-bottom: 1px solid;
            border-color: #043b87;
            box-shadow: white 0 1px 1px -1px inset;
            color: #fff;
            font: bold 14px Helvetica, sans-serif;
            text-overflow: ellipsis;
            text-shadow: rgba(0, 30, 84, .296875) 0 -1px 0;
            vertical-align: middle;
            white-space: nowrap
        }

        .fb_dialog_content .dialog_header table {
            height: 43px;
            width: 100%
        }

        .fb_dialog_content .dialog_header td.header_left {
            font-size: 12px;
            padding-left: 5px;
            vertical-align: middle;
            width: 60px
        }

        .fb_dialog_content .dialog_header td.header_right {
            font-size: 12px;
            padding-right: 5px;
            vertical-align: middle;
            width: 60px
        }

        .fb_dialog_content .touchable_button {
            background: linear-gradient(from(#4267B2), to(#2a4887));
            background-clip: padding-box;
            border: 1px solid #29487d;
            border-radius: 3px;
            display: inline-block;
            line-height: 18px;
            margin-top: 3px;
            max-width: 85px;
            padding: 4px 12px;
            position: relative
        }

        .fb_dialog_content .dialog_header .touchable_button input {
            background: none;
            border: none;
            color: #fff;
            font: bold 12px Helvetica, sans-serif;
            margin: 2px -12px;
            padding: 2px 6px 3px 6px;
            text-shadow: rgba(0, 30, 84, .296875) 0 -1px 0
        }

        .fb_dialog_content .dialog_header .header_center {
            color: #fff;
            font-size: 16px;
            font-weight: bold;
            line-height: 18px;
            text-align: center;
            vertical-align: middle
        }

        .fb_dialog_content .dialog_content {
            background: url(https://connect.facebook.net/rsrc.php/v3/y9/r/jKEcVPZFk-2.gif) no-repeat 50% 50%;
            border: 1px solid #4a4a4a;
            border-bottom: 0;
            border-top: 0;
            height: 150px
        }

        .fb_dialog_content .dialog_footer {
            background: #f5f6f7;
            border: 1px solid #4a4a4a;
            border-top-color: #ccc;
            height: 40px
        }

        #fb_dialog_loader_close {
            float: left
        }

        .fb_dialog.fb_dialog_mobile .fb_dialog_close_icon {
            visibility: hidden
        }

        #fb_dialog_loader_spinner {
            animation: rotateSpinner 1.2s linear infinite;
            background-color: transparent;
            background-image: url(https://connect.facebook.net/rsrc.php/v3/yD/r/t-wz8gw1xG1.png);
            background-position: 50% 50%;
            background-repeat: no-repeat;
            height: 24px;
            width: 24px
        }

        @keyframes rotateSpinner {
            0% {
                transform: rotate(0deg)
            }

            100% {
                transform: rotate(360deg)
            }
        }

        .fb_iframe_widget {
            display: inline-block;
            position: relative
        }

        .fb_iframe_widget span {
            display: inline-block;
            position: relative;
            text-align: justify
        }

        .fb_iframe_widget iframe {
            position: absolute
        }

        .fb_iframe_widget_fluid_desktop,
        .fb_iframe_widget_fluid_desktop span,
        .fb_iframe_widget_fluid_desktop iframe {
            max-width: 100%
        }

        .fb_iframe_widget_fluid_desktop iframe {
            min-width: 220px;
            position: relative
        }

        .fb_iframe_widget_lift {
            z-index: 1
        }

        .fb_iframe_widget_fluid {
            display: inline
        }

        .fb_iframe_widget_fluid span {
            width: 100%
        }

        .fb_mpn_mobile_landing_page_slide_out {
            animation-duration: 200ms;
            animation-name: fb_mpn_landing_page_slide_out;
            transition-timing-function: ease-in
        }

        .fb_mpn_mobile_landing_page_slide_out_from_left {
            animation-duration: 200ms;
            animation-name: fb_mpn_landing_page_slide_out_from_left;
            transition-timing-function: ease-in
        }

        .fb_mpn_mobile_landing_page_slide_up {
            animation-duration: 500ms;
            animation-name: fb_mpn_landing_page_slide_up;
            transition-timing-function: ease-in
        }

        .fb_mpn_mobile_bounce_in {
            animation-duration: 300ms;
            animation-name: fb_mpn_bounce_in;
            transition-timing-function: ease-in
        }

        .fb_mpn_mobile_bounce_out {
            animation-duration: 300ms;
            animation-name: fb_mpn_bounce_out;
            transition-timing-function: ease-in
        }

        .fb_mpn_mobile_bounce_out_v2 {
            animation-duration: 300ms;
            animation-name: fb_mpn_fade_out;
            transition-timing-function: ease-in
        }

        .fb_customer_chat_bounce_in_v2 {
            animation-duration: 300ms;
            animation-name: fb_bounce_in_v2;
            transition-timing-function: ease-in
        }

        .fb_customer_chat_bounce_in_from_left {
            animation-duration: 300ms;
            animation-name: fb_bounce_in_from_left;
            transition-timing-function: ease-in
        }

        .fb_customer_chat_bounce_out_v2 {
            animation-duration: 300ms;
            animation-name: fb_bounce_out_v2;
            transition-timing-function: ease-in
        }

        .fb_customer_chat_bounce_out_from_left {
            animation-duration: 300ms;
            animation-name: fb_bounce_out_from_left;
            transition-timing-function: ease-in
        }

        .fb_invisible_flow {
            display: inherit;
            height: 0;
            overflow-x: hidden;
            width: 0
        }

        @keyframes fb_mpn_landing_page_slide_out {
            0% {
                margin: 0 12px;
                width: 100% - 24px
            }

            60% {
                border-radius: 18px
            }

            100% {
                border-radius: 50%;
                margin: 0 24px;
                width: 60px
            }
        }

        @keyframes fb_mpn_landing_page_slide_out_from_left {
            0% {
                left: 12px;
                width: 100% - 24px
            }

            60% {
                border-radius: 18px
            }

            100% {
                border-radius: 50%;
                left: 12px;
                width: 60px
            }
        }

        @keyframes fb_mpn_landing_page_slide_up {
            0% {
                bottom: 0;
                opacity: 0
            }

            100% {
                bottom: 24px;
                opacity: 1
            }
        }

        @keyframes fb_mpn_bounce_in {
            0% {
                opacity: .5;
                top: 100%
            }

            100% {
                opacity: 1;
                top: 0
            }
        }

        @keyframes fb_mpn_fade_out {
            0% {
                bottom: 30px;
                opacity: 1
            }

            100% {
                bottom: 0;
                opacity: 0
            }
        }

        @keyframes fb_mpn_bounce_out {
            0% {
                opacity: 1;
                top: 0
            }

            100% {
                opacity: .5;
                top: 100%
            }
        }

        @keyframes fb_bounce_in_v2 {
            0% {
                opacity: 0;
                transform: scale(0, 0);
                transform-origin: bottom right
            }

            50% {
                transform: scale(1.03, 1.03);
                transform-origin: bottom right
            }

            100% {
                opacity: 1;
                transform: scale(1, 1);
                transform-origin: bottom right
            }
        }

        @keyframes fb_bounce_in_from_left {
            0% {
                opacity: 0;
                transform: scale(0, 0);
                transform-origin: bottom left
            }

            50% {
                transform: scale(1.03, 1.03);
                transform-origin: bottom left
            }

            100% {
                opacity: 1;
                transform: scale(1, 1);
                transform-origin: bottom left
            }
        }

        @keyframes fb_bounce_out_v2 {
            0% {
                opacity: 1;
                transform: scale(1, 1);
                transform-origin: bottom right
            }

            100% {
                opacity: 0;
                transform: scale(0, 0);
                transform-origin: bottom right
            }
        }

        @keyframes fb_bounce_out_from_left {
            0% {
                opacity: 1;
                transform: scale(1, 1);
                transform-origin: bottom left
            }

            100% {
                opacity: 0;
                transform: scale(0, 0);
                transform-origin: bottom left
            }
        }

        @keyframes slideInFromBottom {
            0% {
                opacity: .1;
                transform: translateY(100%)
            }

            100% {
                opacity: 1;
                transform: translateY(0)
            }
        }

        @keyframes slideInFromBottomDelay {
            0% {
                opacity: 0;
                transform: translateY(100%)
            }

            97% {
                opacity: 0;
                transform: translateY(100%)
            }

            100% {
                opacity: 1;
                transform: translateY(0)
            }
        }
    </style>
    
     <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>

<body>
    <div data-v-c1337ae8="" id="wrap" class="web-mount">
        <!---->
        <!---->
        <!---->
        <section data-v-c1337ae8="" class="content">
            <div data-v-6e5aa5a2="" data-v-c1337ae8="" class="login-container">
                <div data-v-54204cd4="" data-v-6e5aa5a2="" class="back-component">
                    <div data-v-54204cd4="" class="back"><button data-v-54204cd4="" type="button"
                            class="close-button"><i data-v-54204cd4="" class="mds-icon--arrow-left"></i></button>
                        <!---->
                        <!---->
                    </div>
                </div>
                <div data-v-6e5aa5a2="" class="login-content">
                    <h3 data-v-6e5aa5a2="" class="title">회원가입</h3>
                    <p data-v-6e5aa5a2="" class="sub-title">사용하실 정보를 입력해주세요.</p>
                                    <form action="userJoinOk.do" method="post" >
                    <div data-v-6e5aa5a2="" class="input-item fade-in">
                        <div data-v-6e5aa5a2="" class="mds-input input mds-input--default mds-input--left">
                        <label style="position:relative;">
                                <div class="inner">
                                    <!---->
                                     <div class="input"><span id="input-14-label" class="label">ID
                                            <!----></span> <input autocomplete="off" name="id"
                                            aria-labelledby="input-14-label" aria-errormessage="input-14-message"
                                           type="text" id="id" name="wr_2" onkeyup="IDCheck(this)" onkeydown="registck()"
                                            placeholder="ID 입력" class="mds-input-field" maxlength="50">
                                            </div>
                                </div>
                                       	<!-- 	<button style="position:absolute;top:30%;left:81%;"value="중복체크" onclick = "idck()" >중복체크</button> -->
                                       		<span style="position:absolute;top:30%;left:81%; cursor:hand; "value="중복체크"  id="idck"  >	중복체크</span>
                                    	
                                    	<script>
						$('#idck').click(function(){
							let userId = $('#id').val(); 
							$.ajax({
								url : "userIdCheck.do",
								type : "post",
								data : {"id": userId},
								dataType : 'text',
								success : function(result){
									if(result == "false"){
										Swal.fire("이미 있는 아이디입니다.")
									}else if($('#id').val().length < 6 ){
										Swal.fire("아이디는 6글자 이상이어야 합니다.")
									}
									else {
										Swal.fire("사용 가능한 아이디입니다.");
									} 
								},
								error : function(){
									Swal.fire("서버요청실패");
								}
							})
							 
						})
 </script>
                                    	<!-- 
                                    	<script type="text/javascript">
                                    		function idck(){
                                    			alert('실행됨');
                                    			return false;
                                    		}
                                    	</script> -->
                            </label>
                            <!---->
                        </div>
                    </div> 
                        <div data-v-6e5aa5a2="" class="input-item fade-in">
                        <div data-v-6e5aa5a2="" class="mds-input input mds-input--default mds-input--left"><label>
                                <div class="inner">
                                    <!---->
                                    <div class="input"><span id="input-14-label" class="label">비밀번호
                                            <!----></span> <input autocomplete="off" id="password"  oninput="PwdCheck(this)"
                                            aria-labelledby="input-14-label"  name="password"

                                            type="password" placeholder="비밀번호 입력" class="mds-input-field" onkeydown="registck()"></div> <button

                                        type="button" aria-label="내용 삭제" class="mds-icon--input-delete clear-button"
                                        style="display: none;"></button>
                                    <!---->                                
                                    <!---->
                                </div>
                            </label>
                            <!---->
                        </div>
                        <span id="passwordcktext"></span>
                    </div>
                        <div data-v-6e5aa5a2="" class="input-item fade-in">
                        <div data-v-6e5aa5a2="" class="mds-input input mds-input--default mds-input--left"><label>
                                <div class="inner">
                                    <!---->
                                    <div class="input"><span id="input-14-label" class="label">이름
                                            <!----></span> <input autocomplete="off" id="name"
                                            aria-labelledby="input-14-label" aria-errormessage="input-14-message" name="name"
                                            type="text" id="wr_2" name="wr_2" onkeyup="CharacterCheck(this)" onkeydown="registck()"
                                            maxlength='8' placeholder="이름 입력" class="mds-input-field"></div> <button
                                        type="button" aria-label="내용 삭제" class="mds-icon--input-delete clear-button"
                                        style="display: none;"></button>
                                    <!---->                                
                                    <!---->
                                </div>
                            </label>
                            <!---->
                        </div>
                    </div>
                       
                        <div data-v-6e5aa5a2="" class="input-item fade-in">
                        <div data-v-6e5aa5a2="" class="mds-input input mds-input--default mds-input--left"><label>
                                <div class="inner">
                                    <!---->
                                    <div class="input"><span id="input-14-label" class="label">우편번호
                                            <!----></span> <input autocomplete="off" 
                                            aria-labelledby="input-14-label" aria-errormessage="input-14-message" name="addr"
                                            type="text" placeholder="우편번호 입력" class="mds-input-field" id="zipcode"  readonly></div>
                                            
                                       <button type="button" value="우편번호찾기" onclick = "kakaopost()" >우편번호찾기</button>
                                    <!---->                                
                                    <!---->
                                </div>
                            </label>
                            <!---->
                        </div>
                    </div>
                      <div data-v-6e5aa5a2="" class="input-item fade-in">
                        <div data-v-6e5aa5a2="" class="mds-input input mds-input--default mds-input--left"><label>
                                <div class="inner">		
                                    <!---->
                                    <div class="input"><span id="input-14-label" class="label">주소
                                            <!----></span> <input autocomplete="off" 
                                            aria-labelledby="input-14-label" aria-errormessage="input-14-message" name="detail_addr1"
                                            type="text" placeholder="주소 입력" class="mds-input-field" id="address" readonly></div> <button
                                        type="button" aria-label="내용 삭제" class="mds-icon--input-delete clear-button"
                                        style="display: none;"></button>
                                    <!---->                                
                                    <!---->
                                </div>
                            </label>
                            <!---->
                        </div>
                    </div>
                      <div data-v-6e5aa5a2="" class="input-item fade-in">
                        <div data-v-6e5aa5a2="" class="mds-input input mds-input--default mds-inpu	t--left"><label>
                                <div class="inner">
                                    <!---->
                                    <div class="input"><span id="input-14-label" class="label">상세주소
                                            <!----></span> <input autocomplete="off" id="input-14"
                                            aria-labelledby="input-14-label" aria-errormessage="input-14-message" name="detail_addr2"
                                            type="text" placeholder="상세주소 입력" class="mds-input-field"  id="detailaddress"></div> 
                                </div>
                            </label>
                        </div>
                    </div>
                    <div data-v-6e5aa5a2="" class="input-item fade-in">
                        <div data-v-6e5aa5a2="" class="jumin-number">
                            <div data-v-6e5aa5a2="" class="one">
                                <div data-v-6e5aa5a2=""
                                    class="mds-input input jumin1 mds-input--default mds-input--left"><label>
                                        <div class="inner">
                                            <!---->
                                            <div class="input"><span id="input-15-label" class="label">생년월일, 성별
                                                    <!----></span> <input autocomplete="off" name="register_no"
                                                    aria-labelledby="input-15-label" onkeyup="registck()"
                                                    aria-errormessage="input-15-message"  type="number" maxlength="6" oninput="maxLengthChk(this)"
                                                    placeholder="생년월일" pattern="\d*" class="mds-input-field"  pattern="\d*" maxlength="6" id="regist_no"></div>
                                            <!---->
                                            <!---->
                                            <!---->
                                        </div>
                                    </label>
                                    <!---->
                                </div> <span data-v-6e5aa5a2="" class="line">-</span>
                            </div>
                            <div data-v-6e5aa5a2="" class="two">
                                <div data-v-6e5aa5a2=""
                                    class="mds-input input jumin2 mds-input--default mds-input--center"><label>
                                        <div class="inner">
                                            <!---->
                                            <div class="input">
                                                <!----> <input autocomplete="off" id="input-16" name="register_no1"
                                                    aria-labelledby="input-16-label"  onkeydown="registck()"
                                                    aria-errormessage="input-16-message" type="number"maxlength="1" oninput="maxLengthChk(this)" placeholder="0"
                                                    pattern="\d*" class="mds-input-field"></div>
                                            <!---->
                                            <!---->
                                            <!---->
                                        </div>
                                    </label>
                                    <!---->
                                </div> <span data-v-6e5aa5a2="" class="dot">● ● ● ● ● ●</span>
                            </div> <button data-v-6e5aa5a2="" type="button" aria-label="내용 삭제"
                                class="mds-icon--input-delete clear-button clear-jumin" style="display: none;"></button>
                        </div>
                        <!---->
                    </div>
          
                    <div data-v-6e5aa5a2="" class="input-item">
                        <div data-v-6e5aa5a2="" class="mds-input input mds-input--default mds-input--left"><label>
                                <div class="inner">
                                    <!---->
                                    <div class="input"><span id="input-18-label" class="label">휴대폰 번호
                                            <!----></span> <input autocomplete="off" id="phone"  onkeydown="registck()"
                                            aria-labelledby="input-18-label" aria-errormessage="input-18-message" name="phone"
                                            type="number" maxlength="11" oninput="maxLengthChk(this)" placeholder="01012345678" pattern="\d*" 
                                            class="mds-input-field"></div> <button type="button" aria-label="내용 삭제"
                                        class="mds-icon--input-delete clear-button" style="display: none;"></button>
                                    <!---->
                                    <!---->
                                </div>
                            </label>
                            <!---->
                        </div>
                    </div>
                 
                    <div data-v-6e5aa5a2="" class="button-area"><input data-v-6e5aa5a2="" type="submit"
                 
                            class="next-button mds-button mds-button--primary mds-button--h56 mds-button--r4" value="회원가입" id="register" disabled >
                    </div>
              </form>
                </div>
            </div>
        </section>
      
    </div>
<script>
    	 function registck(){
    		if($("#id").val()=='' || !pwck || $("#name").val()=='' || $("#zipcode").val()==''
    				|| $("#address").val()=='' || $("#detailaddress").val()==''|| $("#regist_no").val().length != 6  || $("#phone").val().length != 10 ){
    			$("#register").attr("disabled",true);
    		}else{
    			$("#register").attr("disabled",false);
    		}
    		
    	}
    </script>

    
    <!-- <script src="https://d3udu241ivsax2.cloudfront.net/v3/js/vendor.0be117fe15cd3682b23e.js"></script>
    <script src="https://d3udu241ivsax2.cloudfront.net/v3/js/millie.b91a9f57d4b10d47052a.js"></script> -->
    <script async="" src="https://www.googletagmanager.com/gtm.js?id=GTM-MPM86K5"></script>
    <script async="" src="https://www.googletagmanager.com/gtm.js?id=GTM-NTPPL2M"></script>
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
        fbq("trackCustom", "FirstMonth_Click_NEW");
    </script>
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
        <script id="wp_tag_script_1669184861788" charset="UTF-8"
            src="https://astg.widerplanet.com/delivery/wpc.php?v=1&amp;ver=4.0&amp;r=1&amp;md=bs&amp;ga=1hjvecr-uskfro-3-1&amp;wp_uid=2-c9bf3b18eb3948657509617f2772763c-s1661407732.232608%7Cwindows_10%7Cedge-t2jfze&amp;ty=Home&amp;ti=52062&amp;hcuid=d5d4cd07616a542891b7ec2d0257b3a24b69856e&amp;device=web&amp;charset=UTF-8&amp;tc=1669184861788&amp;ref=https%3A%2F%2Fwww.millie.co.kr%2Fv3%2Fbrand%2Fupdate&amp;loc=https%3A%2F%2Fwww.millie.co.kr%2Fv3%2Fjoin">
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

<script type="text/javascript">
	//숫자 글자수 제한
  function maxLengthChk(object){
    if (object.value.length > object.maxLength){
      object.value = object.value.slice(0, object.maxLength);
    }    
    
  }
  
</script>
    <script>

    let pwck = false;
// 특수문자 입력 방지
function CharacterCheck(obj){
var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi; 

if( regExp.test(obj.value) ){
	Swal.fire("특수문자는 입력하실수 없습니다.");
	obj.value = obj.value.substring( 0 , obj.value.length - 1 ); 
	}
}

function IDCheck(obj){
	var idReg = /^[A-za-z0-9]*$/g;

	if( !idReg.test(obj.value) ){
		Swal.fire("한글 및 특수문자는 입력하실수 없습니다.");
		obj.value = obj.value.substring( 0 , obj.value.length - 1 ); // 입력한 특수문자 한자리 지움
		}

}

function PwdCheck(obj){
	var idReg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;

	if( !idReg.test(obj.value) ){

		$('#passwordcktext').text('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
		pwck = false;
		//obj.value = obj.value.substring( 0 , obj.value.length - 1 ); // 입력한 특수문자 한자리 지움
		} else {
			pwck= true;
	    	$('#passwordcktext').text('올바른 비밀번호입니다.');

		}
	}

function checkPw() {
    let id = $("#id").val();
    let pw = $("#password").val();
    let number = pw.search(/[0-9]/g);
    let english = pw.search(/[a-z]/ig);
    let spece = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
    let reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;

    if (pw.length < 8 || pw.length > 20) {
    	$('#passwordcktext').text("8자리 ~ 20자리 이내로 입력해주세요.");
        pwck = false;

    } else if (pw.search(/\s/) != -1) {
    	$('#passwordcktext').text("비밀번호는 공백 없이 입력해주세요.");
        pwck = false;

    } else if (number < 0 || english < 0 || spece < 0) {
    	$('#passwordcktext').text("영문,숫자,특수문자를 혼합하여 입력해주세요.");
        pwck = false;

    } else if ((number < 0 && english < 0) || (english < 0 && spece < 0) || (spece < 0 && number < 0)) {
    	$('#passwordcktext').text("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
        pwck = false;

    } else if (/(\w)\1\1\1/.test(pw)) {
    	$('#passwordcktext').text('같은 문자를 4번 이상 사용하실 수 없습니다.');
        pwck = false;

    
    } else {
    	$('#passwordcktext').text("비밀번호가 정상적으로 입력되었습니다.");
        pwck = true;
    }

    if (false === reg.test(pw)) {
    	$('#passwordcktext').text('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
        pwck = false;
    } else {
    	$('#passwordcktext').text("비밀번호가 정상적으로 입력되었습니다.");
        pwck = true;
    }

}
	</script>
    <!-- <script src="https://d3udu241ivsax2.cloudfront.net/v3/js/vendor.0be117fe15cd3682b23e.js"></script>
    <script src="https://d3udu241ivsax2.cloudfront.net/v3/js/millie.b91a9f57d4b10d47052a.js"></script> -->
	
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
    </body>
  <script>
    function kakaopost() {
      new daum.Postcode({
        oncomplete: function (data) {
        	$('#zipcode').val(data.zonecode);
        	$('#address').val(data.address);
        }
      }).open();
    }
  </script>
</html>>