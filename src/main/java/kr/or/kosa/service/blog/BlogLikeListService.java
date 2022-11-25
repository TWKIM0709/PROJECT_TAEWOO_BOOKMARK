package kr.or.kosa.service.blog;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.BlogDao;
import kr.or.kosa.dto.Blog_Board;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class BlogLikeListService implements Action {
//관리자 - 블로그 게시글 like 조회
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		JSONObject jsonobj = new JSONObject();
		JSONArray jsonary = new JSONArray();
		JSONObject json = new JSONObject();
		
		try {
			BlogDao dao = new BlogDao();
			
			List<Blog_Board> list = dao.getBoardListById(request.getParameter("id"));
			
			for(Object obj : list) {
				Blog_Board blog = (Blog_Board)obj;
				json.put("blog_no",blog.getBlog_no());
				json.put("id", blog.getId());
				json.put("blog_title", blog.getBlog_title());
				json.put("blog_content",blog.getBlog_content());
				json.put("hits", blog.getHits());
				json.put("blog_date", blog.getBlog_date());
				json.put("blog_filename", blog.getBlog_filename());
				jsonary.add(json);
			}
			String result = (list == null) ? "fail" : "success";
			jsonobj.put("RESULT", result);
			jsonobj.put("BLOG", jsonary);
			response.getWriter().print(jsonobj);
			
//			request.setAttribute("blogboardlist", list);
//			
//			forward.setPath("관리자블로그게시글조회.do");
//			forward.setRedirect(false);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "에러가 발생했습니다.");
			request.setAttribute("url", "main.do");
			forward.setPath("/WEB-INF/views/utils/redirect.jsp");
			forward.setRedirect(true);
			return forward;
		}
		return null;
	}

}
