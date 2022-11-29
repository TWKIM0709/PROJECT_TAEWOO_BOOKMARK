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
			
			System.out.println("여기로");
			if(request.getSession().getAttribute("admin").equals("admin")) {//관리자일경우
				request.setAttribute("blog", blog);
				System.out.println("여기로");
				forward.setPath("/WEB-INF/views/adminpage/blog/admin_blog_board_detail.jsp");
			}else {
				if(blog != null) {			System.out.println("여기로");

					dao.upHits(blogno);
					request.setAttribute("blog", blog);
					forward.setPath("/WEB-INF/views/userpage/blog/user_blog_detail.jsp");
				} else {
					//없는 게시글일 경우 블로그 메인으로 이동
					request.setAttribute("msg", "없는 게시글 입니다.");
					request.setAttribute("url", "blogEnter.do?id=" + request.getParameter("id"));
					forward.setPath("/WEB-INF/views/utils/redirect.jsp");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			if(request.getSession().getAttribute("admin").equals("admin")) {
				request.setAttribute("msg", "없는 게시글 입니다.");
				request.setAttribute("url", "blogEnter.do?id=" + request.getParameter("id"));
				forward.setPath("/WEB-INF/views/utils/redirect.jsp");
			}else {
				String msg  = "서버 오류 발생";
				String path = "main.do";
				request.setAttribute("msg", msg);
				request.setAttribute("url", path);
				forward.setPath("/WEB-INF/views/utils/redirect.jsp");
			}
			
		} 
		forward.setRedirect(false);
		System.out.println(forward.getPath());
		System.out.println("블로그디테일서비스");
		return forward;
	}

}
