package kr.or.kosa.service.book;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.BookDao;
import kr.or.kosa.dto.Book;
import kr.or.kosa.utils.ThePager;

public class BookLikeListService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		String name = request.getParameter("book_name");
		String ps = "";
		String cp = "";
		try {
			BookDao dao = new BookDao();
			
			int count = dao.BooklikeListCount(name);
			
			ps = request.getParameter("pagezise");
			cp = request.getParameter("cpage");
			
			if(ps ==null || ps.trim().equals("")) {
				ps = "5";
			}
			
			if(cp==null || cp.trim().equals("")) {
				cp="1";
			}
			
			int pagesize = Integer.parseInt(ps);
			int cpage = Integer.parseInt(cp);
			int pagecount = 0;
			if (count % pagesize == 0) {
				pagecount = count / pagesize; // 20 << 100/5
			} else {
				pagecount = (count / pagesize) + 1;
			}
			
			List<Book> booklist = dao.BookLikeList(name, cpage, pagesize);
			
			int pagersize = 3;
			ThePager pager = new ThePager(count, cpage, pagesize, pagersize, "BookLikeList.do");
			
			request.setAttribute("pagesize", pagesize);
			request.setAttribute("cpage", cpage);
			request.setAttribute("pagecount", pagecount);
			request.setAttribute("count", count);
			request.setAttribute("booklist", booklist);
			request.setAttribute("pager", pager);
			
			if(request.getSession().getAttribute("admin") != null) {
				forward.setPath("admin#");
			}else {
				forward.setPath("/WEB-INF/views/userpage/book/Search.jsp");
			}
			
			forward.setRedirect(false);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return forward;
	}

}
