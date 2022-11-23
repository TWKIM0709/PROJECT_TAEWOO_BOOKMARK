package kr.or.kosa.service.book;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.BookDao;
import kr.or.kosa.dto.Book;
import kr.or.kosa.dto.Book_Recommend;

public class RecommandBookListService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		try {
			BookDao dao = new BookDao();
			
			List<Book_Recommend> recommendlist = dao.Book_RecommendList();
			
			request.setAttribute("recommendlist", recommendlist);
			
			forward.setRedirect(false);
			forward.setPath("#");
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return forward;
	}

}
