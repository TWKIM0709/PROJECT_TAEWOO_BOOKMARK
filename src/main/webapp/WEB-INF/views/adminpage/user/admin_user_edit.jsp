<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko" class="" style="height: auto; overflow: visible;">

<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<meta name="viewport"
	content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no,viewport-fit=cover">


<title>개인정보수정 | 갈피표</title>
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
<link rel="stylesheet" type="text/css"
	href="https://d3udu241ivsax2.cloudfront.net/v3/style/reading~search.9e20d3f61ee01fdc9a9c.css">

<link rel="stylesheet" type="text/css"
	href="https://d3udu241ivsax2.cloudfront.net/v3/style/search.d5e7ba02987a9fbca3c2.css">
<link rel="stylesheet" type="text/css"
	href="https://d3udu241ivsax2.cloudfront.net/v3/style/bookDetail~management~paperBook~payment.5ae25aef3d26b1738ec7.css">

<link rel="stylesheet" type="text/css"
	href="https://d3udu241ivsax2.cloudfront.net/v3/style/bookDetail.120e0472d463d372d2c8.css">

<link rel="stylesheet" type="text/css"
	href="https://d3udu241ivsax2.cloudfront.net/v3/style/audioDetail.49dfc892f0cef369883f.css">

<link rel="stylesheet" type="text/css"
	href="https://d3udu241ivsax2.cloudfront.net/v3/style/management~payment~resolution.36317de65b1e1d0e8124.css">

<link rel="stylesheet" type="text/css"
	href="https://d3udu241ivsax2.cloudfront.net/v3/style/management.6a3cf585bcafabd76a9b.css">

<link rel="stylesheet" type="text/css" href="ddd.css">
     <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>

<body class="" style="height: auto; overflow: visible;">
<button onclick='javascript:history.back();' style='magin-top : 100px'>뒤로가기</button>
<c:set var="user" value="${requestScope.user}"/>
	<div data-v-c1337ae8="" id="wrap" class="show-top-header web-mount">
		<section data-v-c1337ae8="" class="content">
			<br><br><br>
			<div data-v-9baa251e="" data-v-c1337ae8="" class="millie-inner">
				<div data-v-9baa251e="">
				<form action='userEditOk.do?id=${user.id}' method = "post" >
					<div data-v-54204cd4="" data-v-9baa251e="" class="back-component">
						<div data-v-54204cd4="" class="back-wrap">
							<div data-v-54204cd4="">
								<div data-v-54204cd4="" class="back">
									<button data-v-54204cd4="" type="button" class="close-button">
										<i data-v-54204cd4="" class="mds-icon--arrow-left"></i>
									</button>
									<h2 data-v-54204cd4="">회원정보수정</h2>
								</div>
							</div>
						</div>
					</div>
					<div data-v-9baa251e="" class="inner-content">
						<br>
						<br>
						<div data-v-9baa251e="" class="input-item">
							<p data-v-9baa251e="" class="tit">
							 아이디<span data-v-9baa251e="">*</span>
							</p>
							<div data-v-9baa251e="" class="input-group">
								<div data-v-9baa251e="" class="input-box">
									<input data-v-9baa251e="" type="text" placeholder="아이디 입력"
										class="input-text" value="${user.id}" name ="idx" id="id" disabled>
								</div>
							</div>
							<span data-v-9baa251e="" class="exp">욕설, 비속어 사용 시 서비스 이용이
								제한될 수 있습니다.</span>
						</div>
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
						</div>
						<div data-v-9baa251e="" class="input-item">
							<p data-v-9baa251e="" class="tit">
								생년월일<span data-v-9baa251e="">*</span>
							</p>
							<div data-v-9baa251e="" class="input-group">
								<div data-v-9baa251e="" class="input-box">
									<input data-v-9baa251e="" type="text" 
									 oninput="maxLengthChk(this)" maxlength="11"
										placeholder="생년월일입력 (‘-’ 포함)" 
										class="input-text" value="${user.regist_no}" name = "regist_no" >
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
						<div data-v-9baa251e="" class="input-item">
							<p data-v-9baa251e="" class="tit">
								비밀번호<span data-v-9baa251e="">*</span>
							</p>
							<div data-v-9baa251e="" class="input-group">
								<div data-v-9baa251e="" class="input-box">
								<div type="text" placeholder="비밀번호 입력" class="mds-input-field" ">
									<input data-v-9baa251e="" type="text" id="password" name="password" oninput="PwdCheck(this)"
									autocomplete="off"
									placeholder="비밀번호 입력" class="input-text tooltip1" 	value="${user.password}">
								</div>
							</div>
							</div>
							<span id="passwordcktext"></span>
						</div>

						<div data-v-9baa251e="" class="input-item">
							<p data-v-9baa251e="" class="tit">우편번호<span data-v-9baa251e="">*</span></p>
							<div data-v-9baa251e="" class="input-group"> 
								<div data-v-9baa251e="" class="input-box"></div>
									<input data-v-9baa251e="" type="text" placeholder="우편번호 입력" id="zipcode"  
									
										 class="input-text" value="${user.addr}" name = "addr" > <button style="position: absolute;left: 87%;" type="button" value="우편번호찾기" onclick = "kakaopost()" >우편번호찾기</button>
										
								</div>
							</div>
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
	
						<hr data-v-9baa251e="" class="line">

						<button data-v-9baa251e="" type="submit" class="confirm-btn">확인</button>
						</form>
					</div>
				</div>
			</div>
		</section>
	</div>
	
  <script>
    	 function registck(){
    		 console.log('실행됨');
			console.log( $("#regist_no").val().length);
    		if($("#id").val()=='' || !pwck || $("#name").val()=='' || $("#zipcode").val()==''
    				|| $("#address").val()=='' || $("#detailaddress").val()==''|| $("#regist_no").val().length != 6  || $("#phone").val().length != 10 ){
    			$("#register").attr("disabled",true);
    		}else{
    			$("#register").attr("disabled",false);
    		}
    		
    	}
    </script>

</body>
<script type="text/javascript">
	//숫자 글자수 제한
  function maxLengthChk(object){
    if (object.value.length > object.maxLength){
      object.value = object.value.slice(0, object.maxLength);
    }    
  }
//비밀번호 정규식
  function PwdCheck(obj){
	console.log('a');
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
</script>
  <script>
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
  </script>
</html>