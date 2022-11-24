package kr.or.kosa.service.blog;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.BlogDao;
import kr.or.kosa.dto.Blog_Board;

public class BlogUpdateService implements Action {
//블로그 게시글 수정 페이지 이동
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		String msg = "";
		String url = "";
		
		try {
			BlogDao dao = new BlogDao();
			
			Blog_Board board = dao.getContent(Integer.parseInt(request.getParameter("blog_no")));
			
			request.setAttribute("content", board);
			
			if(request.getSession().getAttribute("admin") != null) {
				forward.setPath("adminblogedit.jsp");
			}else {
				forward.setPath("blogedit.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
			if(request.getSession().getAttribute("admin")!= null) {
				msg  = "서버 오류 발생";
				url = "main.do";
			}else {
				msg  = "update error";
				url = "블로그게시글.do?" + request.getParameter("blog_no");
			}
			request.setAttribute("msg", msg);
			request.setAttribute("path", url);
			forward.setPath("redirect.jsp");
		} 
		forward.setRedirect(false);
		return forward;
	}

}
