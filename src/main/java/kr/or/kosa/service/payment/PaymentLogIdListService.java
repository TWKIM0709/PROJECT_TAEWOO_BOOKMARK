package kr.or.kosa.service.payment;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.PaymentDao;
import kr.or.kosa.dto.Book;
import kr.or.kosa.dto.Book_Payment;

public class PaymentLogIdListService implements Action {
//회원이 보는 결제목록
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		try {
			PaymentDao pdao = new PaymentDao();

			String id = request.getParameter("id");
			
			List<Book_Payment> paymentlist = pdao.paymentlist(id);
			
			request.setAttribute("paymentlist", paymentlist);

			forward = new ActionForward();
			forward.setRedirect(false); // forward
			forward.setPath("/WEB-INF/views/board_list.jsp");
		} catch (Exception e) {
			
			System.out.println(e.getMessage());
			String msg = "error";
			String url = "";
			request.setAttribute("msg",msg);
			request.setAttribute("url", url);
			
			forward.setPath("redirect.jsp");
			forward.setRedirect(false);
		}
		return forward;		
	}
}