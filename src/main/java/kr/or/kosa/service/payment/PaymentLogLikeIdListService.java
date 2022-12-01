package kr.or.kosa.service.payment;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.PaymentDao;
import kr.or.kosa.dto.Book_Payment;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class PaymentLogLikeIdListService implements Action {
	//관리자가 회원 아이디로 결제내역을 검색하는 서비스 (비동기)
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
	ActionForward forward = new ActionForward();

	JSONObject jsonobj = new JSONObject();
	JSONArray jsonary = new JSONArray();
	JSONObject json = new JSONObject();
		try {
			PaymentDao pdao = new PaymentDao();

			String id = request.getParameter("id");
			
			List<Book_Payment> paymentlist = pdao.paymentlist(id);
			
			for(Object obj : paymentlist) {
				Book_Payment p = (Book_Payment)obj;
				json.put("payment_no", p.getPayment_no());
				json.put("isbn", p.getIsbn());
				json.put("count", p.getCount());
				json.put("payment_date", p.getPayment_date());
				json.put("sumprice", p.getSumprice());
				json.put("payment_addr", p.getPayment_addr());
				json.put("payment_detailaddr", p.getPayment_detailaddr());
				jsonary.add(json);
			}
		jsonobj.put("RESULT", "success");
		jsonobj.put("paymentlist", jsonary);
		
		
		} catch (Exception e) {
			jsonobj.put("RESULT", "fail");
		}
		try {
			response.getWriter().print(jsonobj);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;		
	}
}
