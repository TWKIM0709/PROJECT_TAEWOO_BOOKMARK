<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 팝업페이지 -->
<head>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<c:set var="msg" value="${requestScope.msg}"/>
<c:set var="url" value="${requestScope.url}"/>
<c:if test="${msg != null && url != null}">
   <script>
      Swal.fire('${msg}').then((result) => {
    	  if (result.isConfirmed) {
    		     location.href='${url}';
    		  }
    		});
   </script>
</c:if>
</body>