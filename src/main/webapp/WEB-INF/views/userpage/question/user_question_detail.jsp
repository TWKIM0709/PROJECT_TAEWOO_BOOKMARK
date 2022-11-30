<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no,viewport-fit=cover">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- /v3/post/598825?nav_hidden=y -->


    <link rel="apple-touch-icon" href="https://www.millie.co.kr/favicon/ios-icon.png">
    <link rel="apple-touch-icon-precomposed" href="https://www.millie.co.kr/favicon/ios-icon.png">
    <link rel="shortcut icon" type="image/png" href="https://www.millie.co.kr/favicon/android-icon.png">
    <title>문의사항 | 갈피표</title>

     <link rel="stylesheet" type="text/css"
        href="https://d3udu241ivsax2.cloudfront.net/v3/style/styles~b2b~post.34bf510f66b4cbe50dcb.css">

    <link rel="stylesheet" type="text/css"
        href="https://d3udu241ivsax2.cloudfront.net/v3/style/post.777bb9ac8c585d9e2375.css">

 
</head>

<body>
<jsp:include page="/WEB-INF/views/utils/include/top.jsp"></jsp:include>
    <div data-v-c1337ae8="" id="wrap" class="web-mount">
        <section data-v-c1337ae8="" class="content">
            <div data-v-474ad036="" data-v-c1337ae8="" class="view">
                <div data-v-474ad036="" class="view-expand">
                    <div data-v-474ad036="" class="title">
                        <div data-v-474ad036="" class="title-inner">
                        <br>
                        	<button onclick='javascript:history.back();' style='magin-top : 100px'>뒤로가기</button>
                            <h1 data-v-474ad036="" id="question_title" name="question_title">${requestScope.board.question_title}</h1> 
                                <div data-v-474ad036="" class="writer-info">
                                    <p data-v-474ad036="" class="name" id="id">작성자 : ${requestScope.board.id}</p>    
                                </div>
                                <div data-v-474ad036="" class="writer-info">
                                    <p data-v-474ad036="" class="date" id="blog_date"> 작성일 : ${requestScope.board.question_date}</p>    
                                </div>
                        </div>
                    </div>
                    <div data-v-474ad036="" class="detail" style="--loader-top:210px;">
                        <div data-v-474ad036="" class="detail-inner container">
                            <div data-v-474ad036="" class="editor-holder">
                                <div id="editorjs" class="read-only">
                                    <div class="codex-editor">
                                        <div class="codex-editor__redactor" style="padding-bottom: 300px;">
                                            <div class="ce-block">
                                                <div class="ce-tune-alignment--left">
                                                    <div class="ce-block__content" style="margin-left : 30%">
                                                        ${requestScope.board.question_content}
                                                    </div> 
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>       
                    </div>	
                </div>
                <div style="position: relative;">
                <c:if test="${sessionScope.id eq requestScope.board.id}">
                <div style="position: absolute;left: 63%;">
                	<button onclick = "location.href = 'questionWriteUpdate.do?question_no=${requestScope.board.question_no}' " ><span>수정</span></button><span> | </span>
                	<button onclick = "location.href = 'questionDeleteOk.do?question_no=${requestScope.board.question_no}' " ><span>삭제</span></button> <br><br>
                </div>
                </c:if>
                </div>
            </div>
        </section>
    </div>
</body>
</html>

