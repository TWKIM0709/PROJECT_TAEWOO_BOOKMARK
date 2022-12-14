<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><html lang="ko" class="">
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<html>
<head>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<!-- 부트스트랩? -->
</head>

<body>
<c:if test="${sessionScope.id == null }">
	<script>
		alert('세션만료');
		location.href = 'login.html';
	</script>
</c:if>

		<div data-v-e67dcbb6="" data-v-c1337ae8="" class="top-header">
			<div data-v-e67dcbb6="" class="inner">
				<header data-v-e67dcbb6="">
					<h1 data-v-e67dcbb6="">
						<a data-v-e67dcbb6="" href="main.do"><img data-v-e67dcbb6=""
								src="갈피표.png"
								alt="갈피표"></a>
					</h1>
					<nav data-v-e67dcbb6="">
						<ul data-v-e67dcbb6="" class="gnb">
							<li data-v-e67dcbb6="" class=""><a data-v-e67dcbb6="" href="blogAlllist.do" class="gtm-today">블로그</a>
							</li>
							<li data-v-e67dcbb6="" class=""><a data-v-e67dcbb6="" href="bookAlllist.do?ps=10"
									class="gtm-search">검색</a></li>
							<li data-v-e67dcbb6="" class=""><a data-v-e67dcbb6="" href="cartList.do?id=${sessionScope.id }" 
									class="gtm-setting">장바구니</a></li>
							<li data-v-e67dcbb6="" class=""><a data-v-e67dcbb6="" href="userMypage.do"
									class="gtm-setting">관리</a></li>
						</ul>
					</nav>
					<ul data-v-e67dcbb6="" class="util">
						<li data-v-e67dcbb6="" class="sign sign-in"  onclick="logout()"><button>로그아웃</button></li>
					</ul>
				</header>
			</div>
		</div>
	<div id="wp_tg_cts" style="display: block;"></div>
	<!-- Code injected by live-server -->
</body>
<script type="text/javascript">
	function logout(){
		Swal.fire({
			  text: "로그아웃하시겠습니까?",
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '네',
			  cancelButtonText:"아니요"
			}).then((result) => {
			  if (result.isConfirmed) {
			 	//로그아웃
				sessionStorage.clear();
				location.href="homepage.html";
			  }
			})
	}
</script>
<!-- <script type="text/javascript">
	console.log(${sessionScope.id})
	$(function() {
		if(${sessionScope.id} == null){
			alert('세션이 만료되었습니다. 다시 로그인해주세요');
			location.href= 'login.html';
		}
	})
</script> -->
</html>