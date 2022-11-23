package kr.or.kosa.service.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.BookDao;

public class BookLikeService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		String isbn = request.getParameter("isbn");
		String id = request.getParameter("id");
		
		String url = "";
		String msg = "";
		try {
			BookDao dao = new BookDao();
			
			int result = dao.Book_Like(isbn, id);
			
			if(result == 1) {
				msg = "종아요";
				url = "#";
			}else if(result == 2) {
				msg = "좋아요 취소";
				url = "#";
			}else {
				msg = "오류발생";
				url = "#";
			}
			
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/utils/redirect.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return forward;
	}

}
