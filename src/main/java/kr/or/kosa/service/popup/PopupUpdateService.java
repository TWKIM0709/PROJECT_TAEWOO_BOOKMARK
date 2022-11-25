package kr.or.kosa.service.popup;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.PopupDao;
import kr.or.kosa.dto.Popup;

public class PopupUpdateService implements Action {
//팝업 공지사항 업데이트
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		try {
			PopupDao popupdao = new PopupDao();
			int Popup_no = Integer.parseInt(request.getParameter("popup_no"));
			String Id = request.getParameter("id");
			String Popup_title = request.getParameter("popup_title");
			String Popup_filename = request.getParameter("popup_filename");
			String Popup_date = request.getParameter("popup_date");
			
			Popup popup = new Popup();
			
			popup.setPopup_no(Popup_no);
			popup.setId(Id);
			popup.setPopup_title(Popup_title);
			popup.setPopup_filename(Popup_filename);
			popup.setPopup_date(new Date(Popup_date));
			
			int result = popupdao.UpdatePopup(popup);
			
			String msg = "";
			String url = "";
			if(result !=0 ) {
				msg = "update success"; //성공시 팝업 상세보기로
				url = "popupDetail.do?popup_no=" + Popup_no;
				
			}else {
				msg = "update fail"; //실패시 수정페이지로?
				url = "popupEdit.do?popup_no=" + Popup_no;
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
