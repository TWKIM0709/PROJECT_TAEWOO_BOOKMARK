<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no,viewport-fit=cover">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<!-- /v3/login -->
<link rel="shortcut icon" type="image/png"
	href="https://www.millie.co.kr/favicon/android-icon.png">
<title>갈피표</title>
<link
	href="https://d3udu241ivsax2.cloudfront.net/v3/style/vendor.524cdf1d4325d722f545.css"
	rel="stylesheet">
<link
	href="https://d3udu241ivsax2.cloudfront.net/v3/style/millie.4a1320ab272ffa081fae.css"
	rel="stylesheet">
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
<style type="text/css">
#galleries-list .content {
	width: 100px;
	height: 100px;
	text-align: center;
	background: lightgrey;
	padding: 4% 0;
	padding: 10% 0;
	margin: auto;
	box-sizing: border-box;
	font-size: 40px;
}

#galleries-list {
	float: left;
	padding: 0px;
	margin: 0px;
	overflow: hidden;
	width: 100%;
}

#galleries-list ul {
	width: 100%;
	list-style: none;
	margin: 0px;
	padding: 0px;
}

#galleries-list ul li {
	position: relative;
	left: 0px;
	float: left;
	width: 25%;
	text-align: center;
	margin: 0px;
	padding: 0px;
	transition: left .75s ease-out;
}

#galleries-list ul li a {
	color: white;
}

#galleries-list ul li p {
	padding: 0px 15px 0px 15px;
	font-size: 15px;
	color: #758a9f !important;
}

#galleries-list ul li h2 {
	font-size: 25px;
	color: white;
}

#galleries-list .slider-nav {
	position: relative;
	float: left;
	left: calc(50% - 45px);
}

#galleries-list .slide-left {
	margin-right: 10px;
}

#galleries-list .slide-left, #galleries-list .slide-right {
	cursor: pointer;
	-webkit-touch-callout: none; /* iOS Safari */
	-webkit-user-select: none; /* Chrome/Safari/Opera */
	-khtml-user-select: none; /* Konqueror */
	-moz-user-select: none; /* Firefox */
	-ms-user-select: none; /* Internet Explorer/Edge */
	user-select: none; /* Non-prefixed version, currently
                                  not supported by any browser */
}

#galleries-list .slide-left:hover, #galleries-list .slide-right:hover {
	font-weight: 700;
}
</style>
</head>

<body class="" style="height: auto; overflow: visible;">

	<c:set var="recommend" value="${requestScope.recommend }" />
	<!-- 추천책 -->
	<c:set var="mlikerank" value="${requestScope.mlikerank }" />
	<!-- 좋아용 1달 -->
	<c:set var="wlikerank" value="${requestScope.wlikerank }" />
	<!-- 좋아요 1주일 -->
	<c:set var="dlikerank" value="${requestScope.dlikerank }" />
	<!-- 좋아요 1일 -->
	<jsp:include page="/WEB-INF/views/utils/include/top.jsp"></jsp:include>
			<div data-v-3adb62c9="" data-v-c1337ae8="" class="millie-sub-inner">
				<div style="width: 100%; height: 400px; background-color: #f9ecfa;">
				<br>	
				<br>
			<!-- 	/////////////////////////////////////// -->
				<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {box-sizing: border-box;}
body {font-family: Verdana, sans-serif;}
.mySlides {display: none;}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  animation-name: fade;
  animation-duration: 1.5s;
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}
</style>
</head>
<body>



<div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1 / 5</div>
  <img src="img/주의사항.jpg" style="width:200%" height = "85%">
  <div class="text"></div>
</div>
	
<div class="mySlides fade">
  <div class="numbertext">2 / 5</div>
 <img src="img/코지정.jpg" style="width:200%" height = "85%">
  <div class="text"></div>
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 5</div>
  <img src="img/코사.jpg" style="width:200%" height = "85%">
  <div class="text"></div>
</div>

<div class="mySlides fade">
  <div class="numbertext">4 / 5</div>
  <img src="img/두부.jpg" style="width:200%" height = "85%">
  <div class="text"></div>
</div>

<div class="mySlides fade">
  <div class="numbertext">5 / 5</div>
  <img src="img/애욕의 고전소설.jpg" style="width:200%" height = "85%">
  <div class="text"></div>
</div>

</div>
<br>

<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
    <span class="dot"></span> 
      <span class="dot"></span> 
</div>

<script>
let slideIndex = 0;
showSlides();

function showSlides() {
  let i;
  let slides = document.getElementsByClassName("mySlides");
  let dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}    
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  setTimeout(showSlides, 2000); // Change image every 2 seconds
}
</script>

</body>
</html> 
				</div>
				<div data-v-3adb62c9="" class="depth-section">
					<div data-v-3adb62c9="" class="inner">
						<article data-v-3adb62c9="" class="best">
							<div id="galleries-list">
								<h3 data-v-3adb62c9=""><select id="bk" onchange="a(this.value)"> <option value="day">일일</option><option value="week">주간</option><option value="month">월간</option></select>인기도서</h3>
								<br>
								<ul>
									
									<c:forEach var="day" items="${dlikerank }">
										<li data-v-3adb62c9="" class="" id="li" style="width: 2.0%">
											<div data-v-3adb62c9="" class="millie-book books">
										
												<div class="thumbnail">
													<div class="thumbnail-inner">
														<div data-v-96e558f2="" class="book-picture imageLoaded"
															data-observe="true">
															<picture data-v-96e558f2=""> <img
																data-v-96e558f2="" src="${day.book_filename }"
																alt="${day.book_name }" width="145"> </picture>
														</div>
													</div>
												</div>
												<div class="metadata">
													<p class="badge "></p>
													<p class="title">${day.book_name }</p>
													<p class="author">${day.author }</p>
												</div>
											</div>
										</li>
									</c:forEach>
								</ul>
								<div class="slider-nav">
									<span class="slide-left"> &lt;&lt;&lt; </span> 
									<span class="slide-right"> &gt;&gt;&gt; </span>
								</div>
							</div>
						</article>
					</div>
				</div>
				<c:forEach var="popup" items="${requestScope.popup }">
					<script type="text/javascript">
						let local1 = JSON.parse(window.localStorage.getItem('${popup.popup_filename}'));
						if(local1 == null){
							window.open("popup/popup.jsp?file='${popup.popup_filename}'","_blank","width=820,height=550");
						}
						
					</script>
				</c:forEach>
</body>
<script type="text/javascript">
numberElements = 4;
numberViewed = 4;
currentPosition = 1;

function countLi() {
    return jQuery("#galleries-list ul li").length;
};


function slideRight() {
    if (countLi() > numberViewed)
        if (currentPosition == (countLi() - (numberViewed - 1))) {
            jQuery("#galleries-list ul li").css("visibility","hidden").css("transition", "none");
            setSliderPosition(numberViewed + 1, countLi());
            jQuery("#galleries-list ul li").css("transition", "left .75s ease-out").css("visibility","visible");
            setSliderPosition(currentPosition + 1, countLi());
            return;
        } else return setSliderPosition(currentPosition + 1, countLi());
};

function slideLeft() {
    if (countLi() > numberViewed)
        if (currentPosition == 1) {
            jQuery("#galleries-list ul li").css("transition", "none");
            setSliderPosition(countLi() - (2 * numberViewed + 1), countLi()).css("transition", "left .75s ease-out");
            return setSliderPosition(currentPosition - 1, countLi());
        } else return setSliderPosition(currentPosition - 1, countLi());
};

function setSliderPosition(n1, count) {
    if (n1 < 1) {
        setSliderPosition((count - (numberViewed - 1)) + n1, count);
        return
    };
    n1 = (n1 - 1) % (count - (numberViewed - 1)) + 1;
    currentPosition = n1;
    return jQuery("#galleries-list ul li").css('left', function() {
        return -(n1 - 1) * jQuery("#galleries-list ul li").width();
    });
};

function initWidths() {
    jQuery("#galleries-list ul li").css('width', (100 / countLi()) + '%');
    jQuery("#galleries-list ul").css('width', (100 + (countLi() - numberViewed) * (100 / numberViewed)) + '%');
};

function initClones() {
    if (countLi() >= numberViewed) {
        for (i = 1; i < numberViewed + 1; i++) {
            jQuery("#galleries-list ul li:nth-child(" + i + ")").clone().insertAfter("#galleries-list ul li:last-child");
        }
        c = countLi();
        for (i = c - numberViewed + 1; i <= c; i++) {
            jQuery("#galleries-list ul li:nth-last-child(" + i + ")").clone().insertBefore("#galleries-list ul li:first-child");
        }
    }
};

function initSlider() {
    initClones();
    initResponsive();
    initWidths();
};

function initPosition() {
    setSliderPosition(currentPosition, countLi());
};

function initResponsive() {
    if (jQuery(window).width() > 1000) {
        if (numberViewed != 4) {
            numberViewed = 4;
            initWidths();
        }
    } else if (jQuery(window).width() > 800) {
        if (numberViewed != 3) {
            numberViewed = 3;
            initWidths();
        }
    } else if (jQuery(window).width() > 600) {
        if (numberViewed != 2) {
            numberViewed = 2;
            initWidths();
        }
    } else if (numberViewed != 1) {
        numberViewed = 1;
        initWidths();
    };
    initPosition();
};
jQuery(document).ready(function() {
    initSlider();
    jQuery(window).resize(initResponsive);
    jQuery("#galleries-list .slide-left").click(slideLeft);
    jQuery("#galleries-list .slide-right").click(slideRight);
});

function a(value){
	if($("#bk option:selected").val() == 'day'){
		$("#galleries-list ul").empty();
		let text = '<c:forEach var="day" items="${dlikerank }"><li data-v-3adb62c9="" class="" id="li" style="width: 2.0%">	<div data-v-3adb62c9="" class="millie-book books">'
		+'<div class="thumbnail"><div class="thumbnail-inner"><div data-v-96e558f2="" class="book-picture imageLoaded"	data-observe="true">	'
		+'<picture data-v-96e558f2=""> <img data-v-96e558f2="" src="${day.book_filename }" alt="${day.book_name }" width="145">'
		+' </picture></div></div></div><div class="metadata"><p class="badge "></p><p class="title">${day.book_name }</p><p class="author">${day.author }</p>'
		+'</div></div></li></c:forEach>';
		$("#galleries-list ul").append(text);
	    initSlider();
	    jQuery(window).resize(initResponsive);
	}else if($("#bk option:selected").val() == 'week'){
		$("#galleries-list ul").empty();
		let text = '<c:forEach var="day" items="${wlikerank }"><li data-v-3adb62c9="" class="" id="li" style="width: 2.0%">	<div data-v-3adb62c9="" class="millie-book books">'
		+'<div class="thumbnail"><div class="thumbnail-inner"><div data-v-96e558f2="" class="book-picture imageLoaded"	data-observe="true">	'
		+'<picture data-v-96e558f2=""> <img data-v-96e558f2="" src="${day.book_filename }" alt="${day.book_name }" width="145">'
		+' </picture></div></div></div><div class="metadata"><p class="badge "></p><p class="title">${day.book_name }</p><p class="author">${day.author }</p>'
		+'</div></div></li></c:forEach>';
		$("#galleries-list ul").append(text);
	    initSlider();
	    jQuery(window).resize(initResponsive);
	}else if($("#bk option:selected").val() == 'month'){
		$("#galleries-list ul").empty();
		let text = '<c:forEach var="day" items="${mlikerank }"><li data-v-3adb62c9="" class="" id="li" style="width: 2.0%">	<div data-v-3adb62c9="" class="millie-book books">'
		+'<div class="thumbnail"><div class="thumbnail-inner"><div data-v-96e558f2="" class="book-picture imageLoaded"	data-observe="true">	'
		+'<picture data-v-96e558f2=""> <img data-v-96e558f2="" src="${day.book_filename }" alt="${day.book_name }" width="145">'
		+' </picture></div></div></div><div class="metadata"><p class="badge "></p><p class="title">${day.book_name }</p><p class="author">${day.author }</p>'
		+'</div></div></li></c:forEach>';
		$("#galleries-list ul").append(text);
	    initSlider();
	    jQuery(window).resize(initResponsive);
	}
}


</script>
</html>