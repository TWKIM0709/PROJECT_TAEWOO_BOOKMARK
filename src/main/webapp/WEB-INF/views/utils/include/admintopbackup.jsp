<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><html lang="ko" class="">
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<html>
<head>
	<meta charset="UTF-8">
	<title>갈피표</title>
	<!-- jquery -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<!-- css -->
	<link href="https://d3udu241ivsax2.cloudfront.net/v3/style/vendor.524cdf1d4325d722f545.css" rel="stylesheet">
	<link href="https://d3udu241ivsax2.cloudfront.net/v3/style/millie.4a1320ab272ffa081fae.css" rel="stylesheet">
</head>
<body>
<c:if test="${sessionScope.id == null}">
	<script>
		alert('세션만료');
		location.href = 'login.html';
	</script>
</c:if>
<c:if test="${sessionScope.admin != 'admin' }">
	<script type="text/javascript">
		alert('권한이 없습니다.');
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
							<li data-v-e67dcbb6="" class=""><a data-v-e67dcbb6="" href="blogAlllist.do" class="gtm-today">블로그</a></li>
							<li data-v-e67dcbb6="" class=""><a data-v-e67dcbb6="" href="bookAlllist.do" class="gtm-today">책</a></li>
							<li data-v-e67dcbb6="" class=""><a data-v-e67dcbb6="" href="calendarall.do" class="gtm-today">일정</a></li>
							<li data-v-e67dcbb6="" class=""><a data-v-e67dcbb6="" href="popup.do" class="gtm-today">팝업</a></li>
							<li data-v-e67dcbb6="" class=""><a data-v-e67dcbb6="" href="question.do" class="gtm-today">문의사항</a></li>
							<li data-v-e67dcbb6="" class=""><a data-v-e67dcbb6="" href="userList.do" class="gtm-today">회원</a></li>
							<li data-v-e67dcbb6="" class=""><a data-v-e67dcbb6="" href="paymentAlllist.do" class="gtm-today">결제내역</a></li>
							<li data-v-e67dcbb6="" class=""><a data-v-e67dcbb6="" href="replyAllList.do" class="gtm-today">댓글</a></li>
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
		alert('로그아웃');
		sessionStorage.clear();
		location.href="homepage.html";
	}
</script>
</html>