package kr.or.kosa.service.question;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.QuestionDao;
import kr.or.kosa.dto.Question_Board;

public class QuestionDetailAdminService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
	

		String question_no = request.getParameter("question_no");
		String cpage = request.getParameter("cp"); // current page
		String pagesize = request.getParameter("ps"); // pagesize
		
		Question_Board board = null;
		
		boolean isread = false;

		try {
			
			QuestionDao dao = new QuestionDao();
			// 글 번호를 가지고 오지 않았을 경우 예외처리
			if (question_no == null || question_no.trim().equals("")) {
				response.sendRedirect("BoardList.do");
				return null;
			}
			
			question_no = question_no.trim();

			//List 페이지 처음 호출 ...
			if(cpage == null || cpage.trim().equals("")){
				//default 값 설정
				cpage = "1"; 
			}
		
			if(pagesize == null || pagesize.trim().equals("")){
				//default 값 설정
				pagesize = "5"; 
			}
			
			int hits = dao.hitUp(Integer.parseInt(question_no));
			board = dao.getQuestionByNo(question_no);
			
			if(board != null) {
				request.setAttribute("board", board);
				request.setAttribute("question_no", question_no);
				request.setAttribute("cp", cpage);
				request.setAttribute("ps", pagesize);
				
				forward.setRedirect(false); // forward
				forward.setPath("/WEB-INF/views/board/board_content.jsp");
			}
			else {
				String msg = "게시글을 불러오지 못했습니다";
				String path = "questionlist.do";
				forward.setRedirect(false); // forward
				forward.setPath("/WEB-INF/views/utils/redirect.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
				String msg = "error";
				String path = "questionlist.do";
				forward.setRedirect(false); // forward
				forward.setPath("/WEB-INF/views/utils/redirect.jsp");
		}
		return forward;
	}


}
