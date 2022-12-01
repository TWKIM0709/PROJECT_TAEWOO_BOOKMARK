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
import kr.or.kosa.dto.Blog_Reply;
import kr.or.kosa.dto.Book_Reply;
import kr.or.kosa.dto.ReplyInterface;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@WebServlet("/ReplyLike")
public class ReplyLikeListService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReplyLikeListService() {
    }
	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List list = null;
		JSONObject jsonobj = new JSONObject();
		JSONArray jsonary = new JSONArray();
		JSONObject json = new JSONObject();
		try {
			//request에 type이라는 이름으로 블로그/책 댓글 구분됨
			if(request.getParameter("type").equals("blog")) {
				BlogDao dao = new BlogDao();
				list = dao.getAllReplyByLike(request.getParameter("id"));
				for(Object obj : list) {
					Blog_Reply reply = (Blog_Reply)obj;
					json.put("blog_no", reply.getBlog_no());
					json.put("blog_reply_no", reply.getBlog_reply_no());
					json.put("del", reply.getDel());
					json.put("depth", reply.getDepth());
					json.put("id", reply.getId());
					json.put("refer", reply.getRefer());
					json.put("reply_content", reply.getReply_content());
					json.put("reply_date", reply.getReply_date().toString());
					json.put("step", reply.getStep());
					jsonary.add(json);
				}
				if(list!=null) {
					jsonobj.put("RESULT", "success");
				} else {
					jsonobj.put("RESULT", "fail");
				}
				jsonobj.put("BLOG", jsonary);
				response.getWriter().print(jsonobj);
			} else if(request.getParameter("type").equals("book")){
				BookDao dao = new BookDao();
				list = dao.Book_ReplyLikeList(request.getParameter("id"));
				for(Object obj : list) {
					Book_Reply reply = (Book_Reply)obj;
					json.put("reply_no", reply.getBook_reply_no());
					json.put("id", reply.getId());
					json.put("isbn", reply.getIsbn());
					json.put("reply_content", reply.getReply_content());
					json.put("reply_date", reply.getReply_date().toString());
					jsonary.add(json);
				}
				if(list!=null) {
					jsonobj.put("RESULT", "success");
				} else {
					jsonobj.put("RESULT", "fail");
				}
				jsonobj.put("BOOK", jsonary);
				response.getWriter().print(jsonobj);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(list == null) {
			json.put("error", "ReplyAllListLoadingError");
			response.getWriter().print(json);
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
