package kr.or.kosa.service.question;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.QuestionDao;
import kr.or.kosa.dto.Question_Board;
//글쓰기 처리 
public class QuestionWriteOkService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		String msg="";
	    String url="";
	    
	    try {
	    	QuestionDao dao = new QuestionDao();
	    	Question_Board board = new Question_Board();
	    	
	    	board.setId((String)request.getSession().getAttribute("id"));
	    	board.setQuestion_title(request.getParameter("question_title"));
	    	board.setQuestion_content(request.getParameter("question_content"));
			/*
			 * int notice2 = (request.getParameter("notice_no") != null) ?
			 * Integer.parseInt(request.getParameter("notice_no")) : 0;
			 */
	    	int notice = (request.getSession().getAttribute("admin").equals("admin")) ? 1:0;
	    	board.setNotice_no(notice);
	    	
	    
	    	int result = dao.writeQuestionBoard(board);
	    	 
		    if(result > 0){
		    	msg ="insert success";
		    	url ="question.do";
		    }else{
		    	msg="insert fail";
		    	url="questionWrite.do";
		    }
	    request.setAttribute("msg",msg);
	    request.setAttribute("url", url);
	    forward.setRedirect(false);
	    forward.setPath("redirect.jsp");
		} catch (Exception e) {
			request.setAttribute("msg","error");
			request.setAttribute("url","question.do" );
			forward.setPath("/WEB-INF/views/utils/redirect.jsp");
			forward.setRedirect(false);
			e.printStackTrace();
		}
		return forward;
	}
}
