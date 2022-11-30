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
import kr.or.kosa.dao.PopupDao;
import kr.or.kosa.dto.Blog_Board;
import kr.or.kosa.dto.Book;
import kr.or.kosa.dto.Book_Recommend;
import kr.or.kosa.dto.Popup;

public class mainService implements Action {
//회원 - 블로그 게시글 작성 처리
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		String admin = (String)request.getSession().getAttribute("admin");
		
		try {
			if(admin.equals("admin")) {
				System.out.println("adminpage in");
				forward.setRedirect(false);
				forward.setPath("/WEB-INF/views/adminpage/admin_main.jsp");
				return forward;
			}
			
			BookDao dao = new BookDao();
			
			String today = null;
			String day = null;
			String week = null;
			String month = null;
			String year = null;
			 
			Date date = new Date();
			 
			// 포맷변경 ( 년월일 시분초)
			SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd"); 
			 
			// Java 시간 더하기
			Calendar cal = Calendar.getInstance();
			 
			//지금
			cal.setTime(date);
			cal.add(Calendar.DATE, 1);
			today = sdformat.format(cal.getTime());  
			// 하루전
			 cal.setTime(date);
			cal.add(Calendar.DATE, -1);
			day = sdformat.format(cal.getTime());  
			 
			// 일주일 전
			cal.setTime(date);
			cal.add(Calendar.DATE, -7);
			week = sdformat.format(cal.getTime());
			 
			// 한달전
			cal.setTime(date);
			cal.add(Calendar.MONTH, -1);
			month = sdformat.format(cal.getTime());
			 
			//1년전
			cal.setTime(date);
			cal.add(Calendar.YEAR, -1);
			year = sdformat.format(cal.getTime());
			
			//일간
			System.out.println(1);
			List<Book> dlikerank = dao.RankBook_Like(day, today);
			List<Book> dpayrank = dao.SellBookList(day, today);
			//주간
			List<Book> wlikerank = dao.RankBook_Like(week, today);
			List<Book> wpayrank = dao.SellBookList(week, today);			
			//월간
			List<Book> mlikerank = dao.RankBook_Like(month, today);
			List<Book> mpayrank = dao.SellBookList(month, today);
			
			//연간
			//List<Book> ylikerank = dao.RankBook_Like(year, today); 
			//List<Book> ypayrank = dao.SellBookList(year, today);
			//System.out.println(ylikerank);
			//System.out.println(ypayrank);
			
			List<Book_Recommend> recommend =dao.Book_RecommendList();
			PopupDao pdao = new PopupDao();
			List<Popup> popup = pdao.FilterPopup();
			System.out.println(popup);
			request.setAttribute("popup", popup);
			request.setAttribute("recommend", recommend);
			//request.setAttribute("ylikerank", ylikerank);
			//request.setAttribute("ypayrank", ypayrank);
			request.setAttribute("mpayrank", mpayrank);
			request.setAttribute("mlikerank", mlikerank); 
			request.setAttribute("wpayrank", wpayrank);
			request.setAttribute("wlikerank", wlikerank);
			request.setAttribute("dpayrank", dpayrank);
			request.setAttribute("dlikerank", dlikerank);
			
			System.out.println("userpage in");
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/userpage/user_main.jsp");	
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return forward;
	}
}
