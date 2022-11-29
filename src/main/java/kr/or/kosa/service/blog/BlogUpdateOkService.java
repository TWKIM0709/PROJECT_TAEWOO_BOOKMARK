package kr.or.kosa.service.blog;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.BlogDao;
import kr.or.kosa.dto.Blog_Board;

public class BlogUpdateOkService implements Action {
//회원 - 블로그 게시글 수정 처리
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
			String msg = "";
			String url = "";
		
		try {
			BlogDao dao = new BlogDao();
			
			
			 Blog_Board blog = new Blog_Board(); 
			 blog.setBlog_content(request.getParameter("blog_content")); 
			 System.out.println(blog.getBlog_content());
			 blog.setBlog_date(request.getParameter("blog_date")); 
			 String t = request.getParameter("blog_no");
			 System.out.println(t);
			 blog.setBlog_no(Integer.parseInt(t)); 
			 blog.setBlog_title(request.getParameter("blog_title")); 
			 blog.setHits(Integer.parseInt(request.getParameter("hits"))); 
			 blog.setId(request.getParameter("id"));			
			 blog.setBlog_filename(request.getParameter("file_name")); 
			
			 int row = dao.blogEdit(blog);
			 
			 if(request.getSession().getAttribute("admin").equals("admin")) {
				 if(row >0) {
						msg = "update success";
						url = "blogDetail.do?blog_no=" + request.getParameter("blog_no");
					} else {
						msg = "update fail";
						url = "blogDetail.do?blog_no=" + request.getParameter("blog_no");
					}
			 }else {
				 if(row >0) {
						msg = "update success";
						url = "blogDetail.do?blog_no=" + request.getParameter("blog_no");
					} else {
						msg = "update fail";
						url = "blogDetail.do?blog_no=" + request.getParameter("blog_no");
					}
			 }
			request.setAttribute("msg",msg);
			request.setAttribute("url", url);
			
		} catch (Exception e) {
			e.printStackTrace();
			if(request.getSession().getAttribute("admin").equals("admin")) {
				msg = "update error";
				url = "blogDetail.do?blog_no=" + request.getParameter("blog_no");
			}else {
				msg = "update error";
				url = "blogDetail.do?blog_no=" + request.getParameter("blog_no");
			}
			request.setAttribute("msg",msg);
			request.setAttribute("url", url);
		} 
		forward.setPath("/WEB-INF/views/utils/redirect.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
