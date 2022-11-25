package kr.or.kosa.service.question;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.QuestionDao;
import kr.or.kosa.dto.Question_Board;

public class QuestionUpdateService implements Action {
//문의사항 수정하기
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String question_no = request.getParameter("question_no");
		
		String msg="";
	    String url="";

		QuestionDao qdao;
		ActionForward forward = null;
		try {		
			if(question_no == null || question_no.trim().equals("")){
				response.sendRedirect("question.do"); //cpage=1 , ps=5
				return null;
			}

			qdao = new QuestionDao();
			
			 Question_Board qboard = qdao.getQuestionByNo(question_no);
			if(qboard == null){
				//실패일때
				msg ="데이터 오류";
				url ="questionEdit.do?question_no=" + question_no;
				
				request.setAttribute("msg", msg);
				request.setAttribute("url", url);
				
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("/WEB-INF/views/utils/redirect.jsp");
				
			}else {
				//성공일때
				request.setAttribute("question_no", question_no);
				request.setAttribute("qboard", qboard);
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("/WEB-INF/views/board/board_edit.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
			 request.setAttribute("msg","error");
			request.setAttribute("url","questionDetail.do?question_no=" + question_no );
			forward.setPath("redirect.jsp");
			forward.setRedirect(false);
			e.printStackTrace();
		}

		return forward;
	}

}
