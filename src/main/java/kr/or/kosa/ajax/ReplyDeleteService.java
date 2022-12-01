package kr.or.kosa.ajax;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.dao.BlogDao;
import kr.or.kosa.dao.BookDao;
import kr.or.kosa.dao.BookMarkDao;
import kr.or.kosa.dto.Blog_Board;
import kr.or.kosa.dto.Blog_Reply;
import kr.or.kosa.dto.Book_Reply;
import kr.or.kosa.dto.ReplyInterface;
import kr.or.kosa.utils.DaoFactory;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@WebServlet("/ReplyDelete")
public class ReplyDeleteService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReplyDeleteService() {
    }
	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			if(request.getParameter("type").equals("blog")) {
				BlogDao dao = new BlogDao();
				response.getWriter().print(dao.replyDelete(Integer.parseInt(request.getParameter("blog_reply_no"))));
			} else if(request.getParameter("type").equals("book")){
				BookDao dao = new BookDao();
				response.getWriter().print(dao.DeleteBook_Reply(Integer.parseInt(request.getParameter("book_reply_no"))));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
}
