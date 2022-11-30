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

@WebServlet("/ReplyWrite")
public class ReplyWriteService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReplyWriteService() {
    	
    }
	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JSONObject jsonobj = new JSONObject();
		JSONObject json = new JSONObject();
		JSONArray jsonary = new JSONArray();
		try {
			if(request.getParameter("type").equals("blog")) {
				BlogDao dao = new BlogDao();
				int blog_no = Integer.parseInt(request.getParameter("blog_no"));
				String id = (String)request.getSession().getAttribute("id");
				String content = request.getParameter("blog_content");
				
				int row = dao.replyWrite(blog_no, id, content);
				//작성 성공시
				if(row>0) {
					List<Blog_Reply> list = dao.getReply(blog_no);
					System.out.println("비동기 댓글,,,ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
					System.out.println(list);
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
					jsonobj.put("result", "success");
					jsonobj.put("BLOG", jsonary);
				} else {
					jsonobj.put("result","fail");
				}
				response.getWriter().print(jsonobj);
			} else if(request.getParameter("type").equals("book")){
				BookDao dao = new BookDao();
				
				Book_Reply bookreply = new Book_Reply();
				String isbn = request.getParameter("isbn");
				String content = request.getParameter("reply_content");
//				String id = request.getParameter("id");
				String id = (String)request.getSession().getAttribute("id");
				
				bookreply.setIsbn(isbn);
				bookreply.setReply_content(content);
				bookreply.setId(id);
				int row = dao.InsertBook_Reply(bookreply);
				
				if(row > 0) {
					List<Book_Reply> list = dao.Book_ReplyIsbnList(isbn);
					for(Object obj : list) {
						Book_Reply reply = (Book_Reply)obj;
						json.put("reply_no", reply.getBook_reply_no());
						json.put("id", reply.getId());
						json.put("isbn", reply.getIsbn());
						json.put("reply_content", reply.getReply_content());
						json.put("reply_date", reply.getReply_date().toString());
						jsonary.add(json);
					}
					jsonobj.put("result", "success");
					jsonobj.put("BOOK", jsonary);
				}else {
					//실패했을경우
					jsonobj.put("result","fail");
				}
				response.getWriter().print(jsonobj);
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
