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
		String isbn = request.getParameter("isbn");
		JSONObject json = new JSONObject();
		try {
			
			PaymentDao pdao = new PaymentDao();
			
			int result = pdao.deleteOk(id,isbn);
			
			if(result>0) {//성공시
				json.put("RESULT","success");
			}else {//실패시
				json.put("RESULT","fail");
			}
		
		} catch (Exception e) {
			e.printStackTrace();
			json.put("RESULT","fail");
		} 
		try {
			response.getWriter().print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

}
