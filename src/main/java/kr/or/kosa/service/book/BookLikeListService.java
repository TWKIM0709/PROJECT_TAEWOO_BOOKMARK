package kr.or.kosa.service.book;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.BookDao;
import kr.or.kosa.dto.Book;
import kr.or.kosa.utils.ThePager;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class BookLikeListService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		JSONObject json = new JSONObject();
		JSONArray jsonary = new JSONArray();
		JSONObject jsonobj = new JSONObject();
		
		String name = request.getParameter("book_name");
		String ps = "";
		String cp = "";
		try {
			BookDao dao = new BookDao();
			//검색 결과 길이
			int count = dao.BooklikeListCount(name);
			
			ps = request.getParameter("pagesize");
			cp = request.getParameter("cpage");
			
			if(ps ==null || ps.trim().equals("")) {
				ps = "10";
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
			
			//책 검색 결과
			List<Book> booklist = dao.BookLikeList(name, cpage, pagesize);
		
			
			
			System.out.println(booklist);
			
			int pagersize = pagecount;
			System.out.println("pagersize: " + pagersize);
			ThePager pager = new ThePager(count, cpage, pagesize, pagersize, "BookLikeList.do");
			
			
			//for문으로 list를 json에 넣기
			//ISBN, AUTHOR, BOOK_NAME, DESCRIPTION, PRICE, BOOK_FILENAME, FILE_NAME
			for(Book b : booklist) {
				json.put("isbn",  b.getIsbn());
				json.put("book_name", b.getBook_name());
				json.put("author", b.getAuthor());
				json.put("description", b.getDescription());
				json.put("price", b.getPrice());
				json.put("book_filename", b.getBook_filename());
				json.put("file_name", b.getFile_name());
				
				jsonary.add(json);
			}
			
			jsonobj.put("RESULT", "success");
			
			jsonobj.put("pagesize", pagesize);
			jsonobj.put("cpage", cpage);
			jsonobj.put("pagecount", pagecount);
			jsonobj.put("count", count);
			
			jsonobj.put("pager", pager.toString());
			
			jsonobj.put("booklist", jsonary);
			
			System.out.println(jsonary);
			
//			request.setAttribute("pagesize", pagesize);
//			request.setAttribute("cpage", cpage);
//			request.setAttribute("pagecount", pagecount);
//			request.setAttribute("count", count);
//			request.setAttribute("booklist", booklist);
//			request.setAttribute("pager", pager);
			
			if(request.getSession().getAttribute("admin") != null) {
				forward.setPath("admin#");
			}else {
				forward.setPath("/WEB-INF/views/userpage/book/Search.jsp");
			}
			
			forward.setRedirect(false);
			
		} catch (Exception e) {
			jsonobj.put("RESULT", "fail");
			e.printStackTrace();
		} 
		try {
			response.getWriter().print(jsonobj);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return null; //비동기
	}

}
