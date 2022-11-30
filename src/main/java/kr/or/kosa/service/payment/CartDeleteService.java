package kr.or.kosa.service.payment;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.PaymentDao;
import net.sf.json.JSONObject;

public class CartDeleteService implements Action {
//장바구니 삭제 (비동기)
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		String msg ="";
		String url = "";
		String id = request.getParameter("id");
		//String isbn = request.getParameter("isbn");
		JSONObject json = new JSONObject();
		try {
			
			PaymentDao pdao = new PaymentDao();
			
			int result = pdao.deleteOk(id);
			
			if(result>0) {//성공시
				//json.put("RESULT","success");
				url="main.do";
				msg="장바구니가 비워졌습니다";
			}else {//실패시
				//json.put("RESULT","fail");
				url="main.do";
				msg="오류가 발생했습니다";
			}
			
			
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/utils/redirect.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "서버오류");
			request.setAttribute("url", "/WEB-INF/views/utils/redirect.jsp");
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/utils/redirect.jsp");
		
			//json.put("RESULT","fail");
		} 
//		try {
//			response.getWriter().print(json);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		//return null;
		return forward;
	}

}
