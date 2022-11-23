package kr.or.kosa.service.question;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.QuestionDao;

public class QuestionDeleteOkService implements Action {
//문의사항 삭제
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String question_no = request.getParameter("question_no");
		
		String msg ="";
		String url = "";
		QuestionDao qdao;
		ActionForward forward = new ActionForward();
		try {
			qdao = new QuestionDao();
			
			boolean result = qdao.deleteQuestion(question_no);
			
			if(result) {
				msg="delete success";
				url=".do";
			}else {
				msg="delete fail";
				url=".do";
			}
		request.setAttribute("msg", msg);
		request.setAttribute("url" , url);
		
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/views/utils/redirect.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			msg = "error";
			url = "";
			request.setAttribute("msg",msg);
			request.setAttribute("url", url);
			forward.setPath("redirect.jsp");
			forward.setRedirect(false);
		}
		return forward;
	}

}
