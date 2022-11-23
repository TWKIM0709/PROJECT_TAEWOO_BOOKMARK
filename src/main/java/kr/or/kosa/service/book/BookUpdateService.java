package kr.or.kosa.service.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.BookDao;
import kr.or.kosa.dto.Book;

public class BookUpdateService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		Book book = new Book();
		
		String msg = "";
		String url = "";
		
		String isbn = request.getParameter("isbn");
		String book_name = request.getParameter("book_name");
		String description = request.getParameter("description");
		String p = request.getParameter("price");
		int price = Integer.parseInt(p);
		String book_filename = request.getParameter("book_filename");
		String file_name = request.getParameter("file_name");
		
		book.setIsbn(isbn);
		book.setBook_name(book_name);
		book.setDescription(description);
		book.setPrice(price);
		book.setBook_filename(book_filename);
		book.setFile_name(file_name);
		
		try {
			BookDao dao = new BookDao();
			
			int result = dao.UpdateBook(book);
			
			if(result == 1) {
				msg = "ebook없이 수정되었습니다";
				url = "#";
			}else if(result ==2) {
				msg = "ebook도 수정되었습니다";
				url = "#";
			}else {
				msg = "수정에 실패하였습니다";
				url = "#";
			}
			
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/utils/redirect.jsp");
		} catch (Exception e) {
			
		} 
		return forward;
	}

}
