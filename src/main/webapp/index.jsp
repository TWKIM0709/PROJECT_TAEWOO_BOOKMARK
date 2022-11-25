<%@page import="kr.or.kosa.dto.Book"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.kosa.dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/utils/include/top.jsp"></jsp:include>
		<a href="${pageContext.request.contextPath}/calendarall.do">CALENDAR</a>
</body>
</html>