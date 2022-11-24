package kr.or.kosa.service.book;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.BookDao;
import kr.or.kosa.dto.Book;

public class BookLikeListService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		String name = request.getParameter("name");
		try {
			BookDao dao = new BookDao();
			
			List<Book> booklist = dao.BookLikeList(name);
			
			request.setAttribute("booklist", booklist);
			
			if(request.getSession().getAttribute("admin") != null) {
				forward.setPath("admin#");
			}else {
				forward.setPath("/WEB-INF/views/userpage/book/Search.html");
			}
			
			forward.setRedirect(false);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return forward;
	}

}
