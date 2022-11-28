package kr.or.kosa.service.book;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.BookDao;

public class BookDeleteService implements Action {
//비동기 0 성공 1 실패 2 에러
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		String msg = "";
		String url = "";
		
		String isbn = request.getParameter("isbn");
		PrintWriter out = null;
		try {
			BookDao dao = new BookDao();
			out = response.getWriter();
			int result = dao.DeleteBook(isbn);
			
			if(result>0) {
				out.print(0);
			}else {
				out.print(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.print(2);
		} 
		return null;
	}

}
