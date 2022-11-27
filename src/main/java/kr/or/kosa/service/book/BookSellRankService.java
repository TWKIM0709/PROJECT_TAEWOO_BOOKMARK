package kr.or.kosa.service.book;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.BookDao;
import kr.or.kosa.dto.Book;

public class BookSellRankService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		String sd = request.getParameter("startdate");
		String ed = request.getParameter("enddate");
		
		try {	
			BookDao dao = new BookDao();
			
			List<Book> booksellrank = dao.SellBookList(sd, ed);
			
			request.setAttribute("booksellrank", booksellrank);
			
			forward.setRedirect(false);
			forward.setPath("booksellrank.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return forward;
	}

}
