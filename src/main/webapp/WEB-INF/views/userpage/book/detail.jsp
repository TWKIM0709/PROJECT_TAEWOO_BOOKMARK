<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko" class="">

<head>
    <meta charset="UTF-8">


    <link rel="apple-touch-icon" href="https://www.millie.co.kr/favicon/ios-icon.png">
    <link rel="apple-touch-icon-precomposed" href="https://www.millie.co.kr/favicon/ios-icon.png">
    <link rel="shortcut icon" type="image/png" href="https://www.millie.co.kr/favicon/android-icon.png">
    <title>갈피표</title>
    <link href="https://d3udu241ivsax2.cloudfront.net/v3/style/vendor.524cdf1d4325d722f545.css" rel="stylesheet">
    <link href="https://d3udu241ivsax2.cloudfront.net/v3/style/millie.4a1320ab272ffa081fae.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css"
        href="https://d3udu241ivsax2.cloudfront.net/v3/style/bookDetail~management~paperBook~payment.5ae25aef3d26b1738ec7.css">
    </script>
    <link rel="stylesheet" type="text/css"
        href="https://d3udu241ivsax2.cloudfront.net/v3/style/bookDetail.120e0472d463d372d2c8.css">
    <script charset="utf-8" src="https://d3udu241ivsax2.cloudfront.net/v3/js/bookDetail.91cb8b8cdf6b64a5041a.js">
    </script>
    <script type="text/javascript" async=""
        src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/715358239/?random=1669186459286&amp;cv=11&amp;fst=1669186459286&amp;bg=ffffff&amp;guid=ON&amp;async=1&amp;gtm=2wgb90&amp;u_w=1707&amp;u_h=1067&amp;hn=www.googleadservices.com&amp;frm=0&amp;url=https%3A%2F%2Fwww.millie.co.kr%2Fv3%2FbookDetail%2F179544336%3Freferrer%3DsearchResult&amp;tiba=%EB%8F%84%EC%84%9C%20%EC%83%81%EC%84%B8%20%7C%20%EB%B0%80%EB%A6%AC%EC%9D%98%20%EC%84%9C%EC%9E%AC&amp;auid=492487846.1665120667&amp;uaa=x86&amp;uab=64&amp;uafvl=Microsoft%2520Edge%3B107.0.1418.35%7CChromium%3B107.0.5304.90%7CNot%253DA%253FBrand%3B24.0.0.0&amp;uap=Windows&amp;uapv=10.0.0&amp;uaw=0&amp;rfmt=3&amp;fmt=4">
    </script>
    <script type="text/javascript" async=""
        src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/715358239/?random=1669186459288&amp;cv=11&amp;fst=1669186459288&amp;bg=ffffff&amp;guid=ON&amp;async=1&amp;gtm=2wgb90&amp;u_w=1707&amp;u_h=1067&amp;hn=www.googleadservices.com&amp;frm=0&amp;url=https%3A%2F%2Fwww.millie.co.kr%2Fv3%2FbookDetail%2F179544336%3Freferrer%3DsearchResult&amp;tiba=%EB%8F%84%EC%84%9C%20%EC%83%81%EC%84%B8%20%7C%20%EB%B0%80%EB%A6%AC%EC%9D%98%20%EC%84%9C%EC%9E%AC&amp;auid=492487846.1665120667&amp;uaa=x86&amp;uab=64&amp;uafvl=Microsoft%2520Edge%3B107.0.1418.35%7CChromium%3B107.0.5304.90%7CNot%253DA%253FBrand%3B24.0.0.0&amp;uap=Windows&amp;uapv=10.0.0&amp;uaw=0&amp;rfmt=3&amp;fmt=4">
    </script>
</head>

<body>
    <div data-v-c1337ae8="" id="wrap" class="show-top-header show-header web-mount">
	<div data-v-7fc2b3a6="" data-v-c1337ae8="" class="home-banner-component book-detail-banner">

	<c:set var="book" value="${requestScope.book}"/>
        </div>
<jsp:include page="/WEB-INF/views/utils/include/top.jsp"></jsp:include>

        <section data-v-c1337ae8="" class="content">
            <div data-v-0d0ee47c="" data-v-c1337ae8="" class="book-detail">
                <div data-v-0d0ee47c="" class="book-content">
                    <div data-v-54204cd4="" data-v-0d0ee47c="" class="back-component">
                    </div>
                    <div data-v-d536c1c0="" data-v-0d0ee47c="" class="book-container book-cover line">
                        <div data-v-d536c1c0="" class="thumbnail">
                            <div data-v-d536c1c0="" class="inner">
                                <div data-v-96e558f2="" data-v-d536c1c0="" class="book-picture imageLoaded"
                                    data-observe="true">
                                    <picture data-v-96e558f2="">
									 <img data-v-96e558f2=""
                                            src="${book.book_filename }"
                                            alt="${book.book_name }" width="220"></picture>
                                </div>
                            </div>
                        </div>
                        <div data-v-d536c1c0="" class="cover-data">

                            <div data-v-d536c1c0="" class="meta-data">

                                <p data-v-d536c1c0="" class="book-name">
									${book.book_name }
                                </p>
                                <p>&nbsp;</p>
                                <p data-v-d536c1c0="" class="author"><span data-v-d536c1c0="">${book.author }</span></p>

                            </div>
                            <div data-v-d536c1c0="" class="book-data">
                                <div data-v-d536c1c0="" class="review"><a data-v-d536c1c0="" href=""
                                        class="gtm-review-move"><img data-v-d536c1c0=""
                                            src="https://cdn-icons-png.flaticon.com/128/6516/6516177.png">
                                        <p data-v-d536c1c0="" class="text">좋아요</p> <strong data-v-d536c1c0=""
                                            class="number">2만개+</strong>
                                    </a></div>
                                <div data-v-d536c1c0="" class="review"><a data-v-d536c1c0="" href="#bookinfo"
                                        class="gtm-review-move"><img data-v-d536c1c0=""
                                            src="https://cdn-icons-png.flaticon.com/128/5999/5999928.png">
                                        <p data-v-d536c1c0="" class="text"></p> <strong data-v-d536c1c0=""
                                            class="number">책 소개</strong>
                                    </a></div>
                                <div data-v-d536c1c0="" class="post"><a data-v-d536c1c0="" href="#anchorReview"
                                        class="gtm-post-move"><img data-v-d536c1c0=""
                                            src="https://d3udu241ivsax2.cloudfront.net/v3/images/bookDetail/post-mark.e6660d3d2be8d740e6accf5f63489487.png">
                                        <p data-v-d536c1c0="" class="text">댓글</p>
                                    </a></div>

                            </div>
                        </div>


                    </div>
                    <div data-v-5dcc70f0="" data-v-0d0ee47c="" class="book-container book-info">

                        <div data-v-5dcc70f0="" class="awards section p0">
                            <ul data-v-5dcc70f0="">
                                <li data-v-5dcc70f0="" class="report"><strong data-v-5dcc70f0="" class="text">
                                갈피표가 자신있게 추천하는 책</strong></li>

                                <li data-v-5dcc70f0="" class="bestseller first">
                                    <div data-v-5dcc70f0="" class="text">태우 마음 속의 공동 1위</div>
                                </li>
                            </ul>
                        </div>



                    </div>

                    <div data-v-f6f25216="" data-v-0d0ee47c="" class="book-container book-info">
                        <div data-v-f6f25216="" class="subtitle section">
                            <h3 data-v-f6f25216="" class="book-info-title">
                                책이 주는 감동을 인터넷으로도 느껴보세요<br data-v-f6f25216="">갈피표는 여러분의 독서를 응원합니다
                            </h3>
                            <p data-v-f6f25216="" class="desc">
                                <p>각박한 세상 속 상상의 폭도 줄어드는 현대사회에서 책의 무거움이 아닌 인터넷을 통해 가볍게 독서를 즐겨보세요<br>
                                갈피표가 당신의 독서를 응원합니다.</p>
                            </p>
                        </div>
                    </div>
                    <!-- 밀리 그래프 지운 곳 -->

                    <div data-v-4edfbce0="" data-v-0d0ee47c="" class="book-container book-info">

                        <div data-v-4edfbce0="" class="introduction section">
                            <h3 data-v-4edfbce0="" class="book-info-title" id="bookinfo">책 소개</h3>
                            <div data-v-4edfbce0="" class="text-area desc">
                                <p data-v-4edfbce0="" class=""><b>${book.book_name}</b><br>${book.description}</p>
                                <br>
                            </div>
                        </div>
                    </div>
                    
                    <!-- 댓글 영역 -->
                    <div data-v-da7fb214="" data-v-0d0ee47c="" id="anchorReview" class="review-container thin-line">
                        <h3 data-v-da7fb214="" class="book-info-title link">
							한 줄 리뷰<span data-v-da7fb214="" class="number">1494</span></h3>
                        <div data-v-da7fb214="" class="review-register">
                            <div data-v-da7fb214="" class="image"
                                style="background-image: url(&quot;https://ofbxchnhqinp910256.cdn.ntruss.com/160/e5e634f89bd1050c99a5b84cc95caa64.png?type=w&amp;w=160&amp;quality=100&quot;);">
                            </div>
                            <div data-v-da7fb214="" class="register">
                                <div data-v-da7fb214="" class="mds-textarea mds-textarea--default">
                                    <div class="inner"><label><span class="label">한 줄 리뷰
                                            </span> <textarea id="textarea-39" placeholder="다양한 생각을 남겨주세요"
                                                class="mds-textarea-field"></textarea></label>
                                                <br>
                                    </div>
                                </div> <button data-v-da7fb214="" type="button" 
                                    class="gtm-review-write mds-button mds-button--secondary mds-button--h56 mds-button--r4"><span>등록</span></button>
                            </div>
                        </div>
                        <ul data-v-da7fb214="" class="review-list">
                            <li data-v-da7fb214="">
                                <div data-v-da7fb214="" class="image"
                                    style="background-image: url(&quot;https://ofbxchnhqinp910256.cdn.ntruss.com/100/6387f15acbeb642a677d388cc60b2f1a.png?type=w&amp;w=160&amp;quality=100&quot;);">
                                    <a data-v-da7fb214="" href="/shelf/shelf_main.html?library_seq=5436024"
                                        class="gtm-review-lib"></a></div>
                                <div data-v-da7fb214="" class="info">
                                    <p data-v-da7fb214="" class="nickname"><a data-v-da7fb214=""
                                            href="/shelf/shelf_main.html?library_seq=5436024"
                                            class="gtm-review-lib">위트있는 소설가_562938</a>
                                    </p> <span data-v-da7fb214="" class="date">2022.11.23</span> <a data-v-da7fb214=""
                                        href="/v3/bookDetail/more/review/179544336" class="gtm-review-textclick">
                                        <pre data-v-da7fb214="" class="cont">재밌다고 보기는 어렵지는 않지만서도 뭐한 책</pre></a>
                                </div>
                            </li>
                          </ul>
                    </div>
                </div>
                <!-- 사이드바 -->
                <div data-v-07a4da8a="" data-v-0d0ee47c="" class="button-area">
                    <ul data-v-07a4da8a="" class="button-list">
                        <li data-v-07a4da8a="" class="shelf"><button data-v-07a4da8a="" type="button"
                                class="gtm-bdtl-libbtn">장바구니 담기</button></li>
                        <li data-v-07a4da8a="" class="share2"><button data-v-07a4da8a="" type="button"
                                class="gtm-bdtl-sharebtn2" onclick="a()">트위터로 공유하기</button></li>
                        <li data-v-07a4da8a="" class="share1"><button data-v-07a4da8a="" type="button"
                                class="gtm-bdtl-postbtn" onclick="b()">메타 공유하기</button></li>
                        <style>
                            .share1 {
                                background-image: url(https://1.bp.blogspot.com/-S8HTBQqmfcs/XN0ACIRD9PI/AAAAAAAAAlo/FLhccuLdMfIFLhocRjWqsr9cVGdTN_8sgCPcBGAYYCw/s1600/f_logo_RGB-Blue_1024.png);
                                font-weight: 700;
                                width: 100%;
                                display: flex;
                                -ms-flex-align: center;
                                align-items: center;
                                height: 100%;
                                text-align: left;
                                background-size: 24px;
                                background-position: left 24px center;
                                background-repeat: no-repeat;
                            }
                        </style>
                              <style>
                                .share2 {
                                    background-image: url(https://cdn-icons-png.flaticon.com/512/124/124021.png);
                                    font-weight: 700;
                                    width: 100%;
                                    display: flex;
                                    -ms-flex-align: center;
                                    align-items: center;
                                    height: 100%;
                                    text-align: left;
                                    background-size: 24px;
                                    background-position: left 24px center;
                                    background-repeat: no-repeat;
                                }
                            </style>
                    </ul>
                    
                    
                    <div data-v-07a4da8a="" class="button">
                        <div data-v-07a4da8a="" class="inner"><button data-v-07a4da8a="" type="button"
                                class="enter gtm-bdtl-readbtn e-book" onclick="location.href='aladinpayment.html'"><span data-v-07a4da8a="">구매하기</span></button>
                        </div>
                    </div>
                </div>
                <div data-v-722c61ad="" data-v-0d0ee47c="" class="audiodrama-popup">
                </div>
            </div>
        </section>
    </div>
    <!-- 스크립트 지운 곳 -->
</body>

<script>
    function a() {
        const sendText = '테스트메세지';
        const pageUrl = 'https://naver.com';
        window.open(`https://twitter.com/intent/tweet?text=${sendText}&url=${pageUrl}`);
    }

    function b() {
        const sendText = '테스트메세지';
        const pageUrl = 'https://naver.com';
        window.open(`http://www.facebook.com/sharer/sharer.php?u=${pageUrl}`);
    }
</script>

</html>