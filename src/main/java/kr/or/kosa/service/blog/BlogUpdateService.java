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
			
			if(request.getSession().getAttribute("admin").equals("admin")) {//성공-관리자
				forward.setPath("/WEB-INF/views/adminpage/blog/admin_blog_edit.jsp");
			}else {//성공-유저
				forward.setPath("/WEB-INF/views/userpage/blog/user_blog_edit.jsp");
			}
		} catch (Exception e) {//실패하면 게시글로
			e.printStackTrace();
			msg  = "서버 오류 발생";
			url = "blogDetail.do?blog_no=" + request.getParameter("blog_no");
			request.setAttribute("msg", msg);
			request.setAttribute("path", url);
			forward.setPath("/WEB-INF/views/utils/redirect.jsp");
		} 
		forward.setRedirect(false);
		return forward;
	}

}
