<%@page import="kr.or.kosa.dao.BlogDao"%>
<%@page import="kr.or.kosa.dto.Blog_Board"%>
<%@page import="kr.or.kosa.dto.Book_Reply"%>
<%@page import="kr.or.kosa.service.book.BookAllListService"%>
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
		TEST
		<br><br>
		<%
		BookAllListService bl = new BookAllListService();
		BookDao dao = new BookDao();
		Book book = new Book();
		book.setIsbn("1");
		book.setBook_name("1");
		book.setAuthor("1");
		book.setDescription("1");
		book.setPrice(1);
		book.setBook_filename("1");
		book.setFile_name("1");
		
		List<Book> all = dao.BookAlllist(1,5);
		request.setAttribute("list", all);
		
		int a = dao.BookListCount();
		request.setAttribute("a", a);
		
		List<Book> l = dao.BookLikeList("도");
		request.setAttribute("l", l);
		
		book = dao.getBookListByIsbn("8937413280");
		request.setAttribute("d",book);
		//K782632029
		List<Book_Reply> z = dao.Book_ReplyIsbnList("K782632029");
		request.setAttribute("z", z);
		
		
		List<Book_Reply> b = dao.Book_ReplyAllList();
		request.setAttribute("b", b);
		
		List<Book_Reply> c = dao.Book_ReplyLikeList("L");
		request.setAttribute("c", c);
		
		BlogDao bd = new BlogDao();
		
		List<Blog_Board> lb = bd.getBoardListById("Laurette");
		request.setAttribute("lb", lb);
		%>
		
		${requestScope.list};
		<hr>
		${requestScope.a};
		<hr>
		${requestScope.l };
		<hr>
		${requestScope.d };
		<hr>
		${requestScope.z };
		<hr>
		${requestScope.b };
		<hr>
		${requestScope.c };
		<hr>
		${requestScope.lb };
</body>
</html>