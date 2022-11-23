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

public class BookLikeRankListService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		String sd = request.getParameter("startdate");
		String ed = request.getParameter("enddate");
		
		SimpleDateFormat df = new SimpleDateFormat("YYYY-MM-DD");
		
		try {
			Date startdate = df.parse(sd);
			Date enddate = df.parse(ed);
			
			BookDao dao = new BookDao();
			
			List<Book> bookrank = dao.RankBook_Like(startdate, enddate);
			
			request.setAttribute("bookrank", bookrank);
			
			forward.setRedirect(false);
			forward.setPath("bookrank.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return forward;
	}

}
