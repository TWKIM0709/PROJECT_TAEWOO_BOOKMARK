package kr.or.kosa.service.popup;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.PopupDao;
import kr.or.kosa.dto.Popup;

public class PopupDetailService implements Action {
//관리자 - 팝업글 상세보기
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		Popup popup = null;
		try {
			PopupDao dao = new PopupDao();
			int popupno = Integer.parseInt(request.getParameter("popup_no"));
			
			popup = dao.DetailPopup(popupno);
			if(popup != null) {
				request.setAttribute("popup", popup);
				forward.setPath("팝업상세보기.jsp");
				forward.setRedirect(false);
			} else {
				request.setAttribute("msg", "없는 게시글 입니다.");
				request.setAttribute("url", "main.do");
				forward.setPath("/WEB-INF/views/utils/redirect.jsp");
				forward.setRedirect(false);
			}
		} catch (Exception e) {
			e.printStackTrace();
			String msg  = "서버 오류 발생";
			String path = "main.do";
			request.setAttribute("msg", msg);
			request.setAttribute("url", path);
			forward.setPath("/WEB-INF/views/utils/redirect.jsp");
			forward.setRedirect(false);
		} 
		return forward;
	}

}
