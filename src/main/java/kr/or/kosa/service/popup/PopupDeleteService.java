package kr.or.kosa.service.popup;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.PopupDao;
import kr.or.kosa.dto.Popup;

public class PopupDeleteService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		String msg="";
	    String url="";
		
	    
	    try {
			PopupDao dao = new PopupDao();
			int popupno = Integer.parseInt(request.getParameter("popup_no"));
			int row = dao.DeletePopup(popupno);
			
			if(row != 0) {
				msg = "팝업 삭제를 성공했습니다.";
			}else {
				msg = "팝업 삭제를 실패했습니다.";
			}
			url = "popup.do" ;
	    } catch (Exception e) {
			e.printStackTrace();
			msg = "서버 오류 발생";
			url = "popup.do" ;
		}
	    request.setAttribute("msg",msg);
		request.setAttribute("url", url);
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/views/utils/redirect.jsp");
		
		return forward;
	
		}
		
		
	}


