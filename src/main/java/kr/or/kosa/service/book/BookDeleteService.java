package kr.or.kosa.service.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.BookDao;

public class BookDeleteService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		String msg = "";
		String url = "";
		
		String isbn = request.getParameter("isbn");
		try {
			BookDao dao = new BookDao();
			int result = dao.DeleteBook(isbn);
			
			if(result>0) {
				msg = "삭제되었습니다";
				url = "#";
			}else {
				msg = "삭제에 실패하였습니다";
				url = "#";
			}
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/utils/redirect.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return forward;
	}

}
