package kr.or.kosa.service.book;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.BookDao;
import kr.or.kosa.dto.Book;

public class EBookListService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		String id = request.getParameter("id");
		
		try {
			BookDao dao = new BookDao();
			List<Book> ebooklist = dao.EbookList(id);
			
			request.setAttribute("ebooklist", ebooklist);
			
			forward.setRedirect(false);
			forward.setPath("ebooklist.do");
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return forward;
	}

}
