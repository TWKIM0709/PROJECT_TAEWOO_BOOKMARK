package kr.or.kosa.service.blog;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.BlogDao;
import kr.or.kosa.dto.Blog_Board;

public class BlogDetailService implements Action {
//회원 - 블로그 게시글 상세보기
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		Blog_Board blog = null;
		try {
			BlogDao dao = new BlogDao();
			int blogno = Integer.parseInt(request.getParameter("blog_no"));
			
			blog = dao.getContent(blogno);
			
			if(request.getSession().getAttribute("admin") != null) {
				request.setAttribute("blog_detail", blog);
				forward.setPath("");
			}else {
				if(blog != null) {
					dao.upHits(blogno);
					request.setAttribute("blog_detail", blog);
					forward.setPath("블로그상세보기.jsp");
				} else {
					request.setAttribute("msg", "없는 게시글 입니다.");
					request.setAttribute("url", "/blogEnter.do?blog_no=" + blogno);
					forward.setPath("/WEB-INF/views/utils/redirect.jsp");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			
			if(request.getSession().getAttribute("admin") != null) {
				request.setAttribute("msg", "없는 게시글 입니다.");
				request.setAttribute("url", "blog.do?id="+ (String)request.getSession().getAttribute("id"));
				forward.setPath("/WEB-INF/views/utils/redirect.jsp");
			}else {
				String msg  = "서버 오류 발생";
				String path = "/main.do";
				request.setAttribute("msg", msg);
				request.setAttribute("url", path);
				forward.setPath("/WEB-INF/views/utils/redirect.jsp");
			}
			
		} 
		forward.setRedirect(false);
		return forward;
	}

}
