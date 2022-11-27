package kr.or.kosa.service.book;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.BookDao;
import kr.or.kosa.dto.Book;
import kr.or.kosa.utils.ThePager;

public class BookAllListService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		String ps = "";
		String cp = "";
		String path = "";
		try {
			BookDao dao = new BookDao();
			
			int totalbookcount = dao.BookListCount();
			
			ps = request.getParameter("ps");
			cp = request.getParameter("cp");
			
			if (ps == null || ps.trim().equals("")) {
				// default 값 설정
				ps = "5"; // 5개씩
			}

			if (cp == null || cp.trim().equals("")) {
				// default 값 설정
				cp = "1"; // 1번째 페이지 보겠다
			}

			int pagesize = Integer.parseInt(ps);
			int cpage = Integer.parseInt(cp);
			int pagecount = 0;

			// 23건 % 5
			if (totalbookcount % pagesize == 0) {
				pagecount = totalbookcount / pagesize; // 20 << 100/5
			} else {
				pagecount = (totalbookcount / pagesize) + 1;
			}
			
			List<Book> booklist = dao.BookAlllist(cpage, pagesize);
			
			int pagersize = 3;
			ThePager pager = new ThePager(totalbookcount,cpage,pagesize,pagersize, "bookAlllist.do");
			
			request.setAttribute("pagesize", pagesize);
			request.setAttribute("cpage", cpage);
			request.setAttribute("pagecount", pagecount);
			request.setAttribute("totalbookcount", totalbookcount);
			request.setAttribute("booklist", booklist);
			request.setAttribute("pager", pager);
			
			
			//관리자 / 일반회원 세션 구분
			if(request.getSession().getAttribute("admin") != null) {
				forward.setPath("/WEB-INF/views/adminpage/book/admin_book_list.jsp");
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
