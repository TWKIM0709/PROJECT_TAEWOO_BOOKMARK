package kr.or.kosa.service.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.BookDao;
import net.sf.json.JSONObject;

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
			
			int result = dao.Book_Like(isbn, id); //좋아요 처리
			
			int like = dao.Book_Likestatus(isbn,id); //상태
			
			int likecount = dao.Book_LikeCount(isbn); //개수
			
			JSONObject json = new JSONObject();
			
			json.put("like", like);
			json.put("count", likecount);
			
			response.getWriter().print(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}


/*
 * let result = {
 * 	like:1,
 * count:35
 * }
  */