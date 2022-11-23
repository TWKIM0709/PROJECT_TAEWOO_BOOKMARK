package kr.or.kosa.service.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.BookDao;

public class RecommandBookAddService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		String msg = "";
		String url = "";
		
		String isbn = request.getParameter("isbn");
		String recommend_content = request.getParameter("recommend_content");
		try {
			BookDao dao = new BookDao();
			
			int result = dao.InsertBook_Recommend(isbn, recommend_content);
			
			if(result > 0){
				msg = "추가 완료되었습니다";
				url = "#";
			}else {
				msg = "실패하였습니다";
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
