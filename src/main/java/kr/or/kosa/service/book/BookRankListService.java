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

public class BookRankListService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		String sd = request.getParameter("startdate");
		String ed = request.getParameter("enddate");
		System.out.println("들어오는지 여부" + ed);
		try {
						
			BookDao dao = new BookDao();
			
			List<Book> bookranklist = dao.RankBook_Like(sd, ed);
			
			request.setAttribute("bookrank", bookranklist);
			
			forward.setRedirect(false);
			forward.setPath("bookranklist.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return forward;
	}

}
