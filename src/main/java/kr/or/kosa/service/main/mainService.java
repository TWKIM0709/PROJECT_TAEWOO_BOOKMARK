package kr.or.kosa.service.main;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.Date;
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
import kr.or.kosa.dto.Book_Recommend;

public class mainService implements Action {
//회원 - 블로그 게시글 작성 처리
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		Date date = new Date();
		try {
			BookDao dao = new BookDao();
			
			SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
			
			Calendar cal = Calendar.getInstance();
			
			//지금
			cal.setTime(date);
			
			
			
			
			//일간
			List<Book> dlikerank = dao.RankBook_Like(null, null);
			List<Book> dpayrank = dao.SellBookList(null, null);
			//주간
			List<Book> wlikerank = dao.RankBook_Like(null, null);
			List<Book> wpayrank = dao.SellBookList(null, null);			
			//월간
			List<Book> mlikerank = dao.RankBook_Like(null, null);
			List<Book> mpayrank = dao.SellBookList(null, null);
			//연간
			List<Book> ylikerank = dao.RankBook_Like(null, null);
			List<Book> ypayrank = dao.SellBookList(null, null);
			
			List<Book_Recommend> recommend =dao.Book_RecommendList();
			
			
		} catch (Exception e) {
			
		} 
		return forward;
	}
}
