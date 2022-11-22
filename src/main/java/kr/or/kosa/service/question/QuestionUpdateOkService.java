package kr.or.kosa.service.question;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.QuestionDao;
import kr.or.kosa.dto.Question_Board;

public class QuestionUpdateOkService implements Action {
//수정 처리
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String question_no = request.getParameter("question_no");

		String msg = "";
		String url = "";
		ActionForward forward = null;
	
		try {
			QuestionDao qdao = new QuestionDao();
			Question_Board board = new Question_Board();
			
			board.setQuestion_no(Integer.parseInt(request.getParameter("question_no")));
			board.setId(request.getParameter("id"));
			board.setQuestion_title(request.getParameter("question_title"));
			board.setQuestion_content(request.getParameter("question_content"));
			board.setNotice_no(Integer.parseInt(request.getParameter("notice_no")));
			
			
			
			if(question_no == null || question_no.trim().equals("")) {
				msg = "글번호 입력 오류";
				url = "BoardList.do";
			}else {
				int result = qdao.updateQuestion(board);
				//TODO : ?
				if(result > 0) {
					msg="edit success";
					url = "BoardList.do";
				} else {
					msg = "edit fail";
					url = "Board.do?question_no=" + question_no;
				}
			}
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/utils/redirect.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forward;
	}

}
