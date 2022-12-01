package kr.or.kosa.service.blog;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.BlogDao;
import kr.or.kosa.dto.Blog_Board;

public class BlogWriteService implements Action {
//회원 - 블로그 게시글 작성 처리
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		MultipartRequest multi = null;
		String id = "";
		try {
			BlogDao dao = new BlogDao();
			
			multi = new MultipartRequest(
					request,
					"C:\\Blog",
					1024*1024*10,
					"UTF-8",
					new DefaultFileRenamePolicy()
					);
			id = (String)request.getSession().getAttribute("id");
			String title = multi.getParameter("blog_title");
			String content = multi.getParameter("blog_content");
			String blog_filename = multi.getFilesystemName("file");
			Blog_Board board = new Blog_Board();
			board.setId(id);
			board.setBlog_title(title);
			board.setBlog_content(content);
			board.setBlog_filename(blog_filename);
			
			int result = dao.writeok(board);
			
			forward.setRedirect(false);
			//작성 후 블로그로
			forward.setPath("blogEnter.do?id="+id);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "에러가 발생했습니다.");
			forward.setPath("blogEnter.do?id="+id);
			forward.setPath("/WEB-INF/views/utils/redirect.jsp");
			forward.setRedirect(true);
		} 
		return forward;
	}
}
