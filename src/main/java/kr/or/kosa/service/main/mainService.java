package kr.or.kosa.service.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.BlogDao;
import kr.or.kosa.dao.BookDao;
import kr.or.kosa.dto.Blog_Board;
import kr.or.kosa.dto.Book;

public class mainService implements Action {
//회원 - 블로그 게시글 작성 처리
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		try {
			BookDao dao = new BookDao();
			
		} catch (Exception e) {
			
		} 
		return forward;
	}
}
