package kr.or.kosa.service.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.BookDao;

public class RecommandBookDeleteService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		String msg = "";
		String url = "";
		
		String isbn = request.getParameter("isbn");
		try {
			BookDao dao = new BookDao();
			
			int result = dao.DeleteBook_Recommend(isbn);
			
			if(result>0){
				msg = "삭제완료";
				url = "#";
			}else {
				msg = "삭제성공";
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
