	package kr.or.kosa.service.popup;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.PopupDao;
import kr.or.kosa.dto.Popup;

public class PopupAddService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		ActionForward forward = new ActionForward();
			
		try {
			PopupDao popupdao = new PopupDao();
			String Id = (String)request.getSession().getAttribute("id");
			String Popup_title = request.getParameter("popup_title");
			String Popup_filename = request.getParameter("popup_filename");
			String Popup_date = request.getParameter("popup_date");
			
			Popup popup = new Popup();
			
			popup.setId(Id);
			popup.setPopup_title(Popup_title);
			popup.setPopup_filename(Popup_filename);
			popup.setPopup_date(Popup_date);
			
			int result = popupdao.InsertPopup(popup);
			
			String msg = "";
			String url = "";
			if(result >0 ) {
				msg = "insert success";
				url = "popup.do";
				
			}else {
				msg = "insert fail";
				url = "popup.do";
			}
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/views/utils/redirect.jsp");
		return forward;
	}

}
