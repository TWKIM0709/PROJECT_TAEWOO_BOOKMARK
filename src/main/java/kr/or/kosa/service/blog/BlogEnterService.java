package kr.or.kosa.service.blog;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.BlogDao;
import kr.or.kosa.dao.BookMarkDao;
import kr.or.kosa.dto.Blog_Board;
import kr.or.kosa.utils.DaoFactory;

public class BlogEnterService implements Action {
//회원 - 회원 블로그 페이지 보기
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		try {
			BlogDao dao = new BlogDao();
			String blogid = (String) request.getSession().getAttribute("id");
			List<Blog_Board> list = dao.getBoardListById("id",blogid);
			
			request.setAttribute("id", blogid);
			request.setAttribute("blogboardlist", list);
			
			forward.setPath("/WEB-INF/views/userpage/blog/user_blog.jsp");
			forward.setRedirect(false);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "에러가 발생했습니다.");
			request.setAttribute("url", "main.do");
			forward.setPath("/WEB-INF/views/utils/redirect.jsp");
			forward.setRedirect(true);
		}
		return forward;
	}

}
