package kr.or.kosa.service.book;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.BookDao;
import kr.or.kosa.dto.Book;

public class BookAddService implements Action {
// 0 : 파일 업로드 오류 || 1 : DB성공 || 2 : DB실패 || 3 : 서비스 에러 
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		Book book = new Book();
		MultipartRequest multi = null;
		//PrintWriter start
		//PrintWrtier end
		String msg = "";
		String url = "";
				
		//MultipartRequest start
		try {
			multi =  new MultipartRequest(
					request, 
					"C:\\PROJECT_TAEWOO_BOOKMARK\\images", //실 저장할 경로(배포경로)	
					1024 * 1024 * 10, //10M
					"UTF-8",
					new DefaultFileRenamePolicy() // 파일 이름 중복되면 (upload > 1.jpg > 1.jpg업로드 > 1_1.jpg)
				);
		} catch (Exception e) {
			System.out.println("multi 오류");
			e.printStackTrace();
			request.setAttribute("msg", "책 추가 실패(파일업로드오류)");
			request.setAttribute("url", "bookAdd.do");
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/utils/redirect.jsp");
			return forward;
		}
		//MultipartRequest end
		String isbn = multi.getParameter("isbn");
		String author = multi.getParameter("author");
		String book_name = multi.getParameter("book_name");
		String description = multi.getParameter("description");
		String p = multi.getParameter("price");
		String book_filename = multi.getParameter("book_filename");
		String file_name = multi.getFilesystemName("ebook");
		int price = Integer.parseInt(p);
		
		book.setIsbn(isbn);
		book.setAuthor(author);
		book.setBook_name(book_name);
		book.setDescription(description);
		book.setPrice(price);
		book.setBook_filename(book_filename);
		book.setFile_name(file_name);
		
		try {
			BookDao dao = new BookDao();
			
			int result = dao.InsertBook(book);
			
			if(result > 0) { //DB 업로드 성공시
				msg = "책 추가 성공";
				url = "bookAlllist.do";
			}else { //DB 업로드 실패시
				msg = "책 추가 실패";
				url = "bookAdd.do";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			msg = "책 추가 에러";
			url = "bookAdd.do";
		} 
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/views/utils/redirect.jsp");
		return forward;
	}

}
