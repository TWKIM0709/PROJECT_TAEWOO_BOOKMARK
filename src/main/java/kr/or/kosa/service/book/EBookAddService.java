package kr.or.kosa.service.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.BookDao;

public class EBookAddService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		String msg = "";
		String url = "";
		
		String isbn = request.getParameter("isbn");
		String id = request.getParameter("id");
		try {
			BookDao dao = new BookDao();
			
			int result = dao.InsertEbookList(isbn, id);
			
			if(result > 0) {
				msg = "추가완료";
				url = "#";
			}else {
				msg = "추가실패";
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
