<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><html lang="ko" class="">
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport"
		content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no,viewport-fit=cover">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<link rel="stypesheet" href="main.css">
	<!-- /v3/join -->
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
	<!-- 부트스트랩? -->
</head>
<body>
		<div data-v-e67dcbb6="" data-v-c1337ae8="" class="top-header">
			<div data-v-e67dcbb6="" class="inner">
				<header data-v-e67dcbb6="">
					<h1 data-v-e67dcbb6="">
						<a data-v-e67dcbb6="" href="main.do"><img data-v-e67dcbb6=""
								src="https://d3udu241ivsax2.cloudfront.net/v3/images/common/millie-logo.3884f0c52e69f1f7322c2fd4778f4830.png"
								alt="밀리의 서재"></a>
					</h1>
					<nav data-v-e67dcbb6="">
						<ul data-v-e67dcbb6="" class="gnb">
							<li data-v-e67dcbb6="" class="on"><a data-v-e67dcbb6="" href="blogWrite.do" class="gtm-today">블로그</a>
							</li>
							<li data-v-e67dcbb6="" class=""><a data-v-e67dcbb6="" href="bookAlllist.do"
									class="gtm-search">검색</a></li>
							<li data-v-e67dcbb6="" class=""><a data-v-e67dcbb6=""
									href="https://www.millie.co.kr/shelf/shelf_main.html" class="gtm-my">내서재</a></li>
							<li data-v-e67dcbb6="" class=""><a data-v-e67dcbb6="" href="userMypage.do"
									class="gtm-setting">관리</a></li>
							<li data-v-e67dcbb6="" class=""><a data-v-e67dcbb6="" href="calendarall.do"
							class="gtm-setting">캘린더</a></li>
						</ul>
					</nav>
					<ul data-v-e67dcbb6="" class="util">
						<li data-v-e67dcbb6="" class="alarm"><a data-v-e67dcbb6=""
								href="/v3/today/more/alarmCenter/push" title="알림" class="gtm-alarm"><i
									data-v-e67dcbb6="" class="mds-icon--alarm-2"></i> <span data-v-e67dcbb6=""
									class="alarm-icon">N</span></a></li>

						<li data-v-e67dcbb6="" class="sign sign-in"  onclick="logout()">로그아웃</li>
					</ul>
				</header>
			</div>
		</div>
	<div id="wp_tg_cts" style="display: block;"></div>
	<!-- Code injected by live-server -->
</body>
<script type="text/javascript">
	function logout(){
		sessionStorage.clear();
		location.href="homepage.html";
	}
</script>
</html>