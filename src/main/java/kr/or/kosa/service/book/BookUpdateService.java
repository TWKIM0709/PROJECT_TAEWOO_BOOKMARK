package kr.or.kosa.service.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.BookDao;
import kr.or.kosa.dto.Book;

public class BookUpdateService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		Book book = new Book();
		MultipartRequest multi = null;
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
			request.setAttribute("url", "bookAlllist.do");
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/utils/redirect.jsp");
			return forward;
		}
		//MultipartRequest end
		
		String isbn = multi.getParameter("isbn");
		System.out.println(isbn);
		String author = multi.getParameter("author");
		System.out.println(author);
		String book_name = multi.getParameter("book_name");
		System.out.println(book_name);
		String description = multi.getParameter("description");
		System.out.println(description);
		String p = multi.getParameter("price");
		System.out.println(p);
		int price = Integer.parseInt(p);
		String book_filename = multi.getParameter("book_filename"); //표지 링크
		System.out.println(book_filename);
		String update_file_original_name = multi.getOriginalFileName("ebook"); //업로드한 파일의 오리지널 이름
		String update_file_system_name = multi.getFilesystemName("ebook"); //업로드한 파일의 시스템 등록 이름
		
		try {
			BookDao dao = new BookDao();
			String beforeFile = dao.getFilenameByIsbn(isbn);
			
			System.out.println("DB-BOOK : " + beforeFile);
			System.out.println("UPLOAD ORI : " + update_file_original_name);
			System.out.println("UPLOAD SYS : " + update_file_system_name);
			boolean insert = false;
			if(beforeFile == null || beforeFile.trim().equals("")) {
				//등록된 ebook이 없으면 업로드한 파일을 적용한다.
				book.setFile_name(update_file_system_name);
				insert = true;
			} else { 
				//등록되어 있던 파일이 있으면
				if(beforeFile.equals(update_file_original_name)) { 
					//업로드한 파일의 오리지널이름과 등록되어 있는 파일의 이름이 같으면
					book.setFile_name(null); //데이터 베이스의 파일 이름은 변경하지 않는다.
				} else { 
					// 업로드한 파일과 기존에 있던 파일의 이름이 다르면
					book.setFile_name(update_file_system_name); //DB의 데이터를 업로드한 파일의 시스템 이름으로 변경한다.
				}
			}
			System.out.println("ebook 설정 후 값 : " + book.getFile_name());
			book.setIsbn(isbn);
			book.setBook_name(book_name);
			book.setAuthor(author);
			book.setDescription(description);
			book.setPrice(price);
			book.setBook_filename(book_filename);
			
			int result = dao.UpdateBook(book,insert);
			System.out.println("result : "+result);
			if(result == 1) {
				msg = "book만 수정됨";
				url = "bookAlllist.do";
			}else if(result ==2) {
				msg = "ebook도 수정되었습니다";
				url = "bookAlllist.do";
			}else {
				msg = "수정에 실패하였습니다";
				url = "bookDetail.do?isbn=" + isbn;
			}
			
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/utils/redirect.jsp");
		} catch (Exception e) {
			request.setAttribute("msg", "update 오류");
			request.setAttribute("url", "bookDetail.do?isbn=" + request.getParameter("isbn"));
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/utils/redirect.jsp");
		} 
		return forward;
	}

}
