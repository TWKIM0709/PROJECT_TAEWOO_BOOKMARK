package kr.or.kosa.service.payment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.PaymentDao;

public class CartDeleteService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		String msg ="";
		String url = "";
		String id = request.getParameter("id");
		String isbn = request.getParameter("isbn");
		
		try {
			
			PaymentDao pdao = new PaymentDao();
			
			int result = pdao.deleteOk(id,isbn);
			
			if(result>0) {
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
