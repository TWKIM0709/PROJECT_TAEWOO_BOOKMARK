package kr.or.kosa.service.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.BookDao;
import kr.or.kosa.dto.Book;

public class BookDetailService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		String isbn = request.getParameter("isbn");
		try {
			BookDao dao = new BookDao();
			
			Book book = dao.getBookListByIsbn(isbn);
			
			request.setAttribute("book", book);
			
			forward.setRedirect(false);
			forward.setPath("bookdetail.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return forward;
	}

}
