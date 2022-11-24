package kr.or.kosa.service.payment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.PaymentDao;
import kr.or.kosa.dto.Book;

public class CartAddService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		String msg="";
	    String url="";
		
		try {
			PaymentDao dao = new PaymentDao();
			String id = request.getParameter("id");
			String isbn = request.getParameter("isbn");
			String type = request.getParameter("type");
//			type true forwrd 동기 -> 결제 페이지로
//			type false 비동기 -> 추가만하고 끝
			
			int result = dao.AddBook(id, isbn);
			
			if(result >0) {
				//추가 성공
				msg = "장바구니에 추가했습니다.";
				url = ".do";
			}else {
				//추가 실패
				msg = "추가에 실패했습니다.";
				url = ".do";
			}
			  request.setAttribute("msg",msg);
			  request.setAttribute("url", url);
			  
			  forward.setRedirect(false);
			  forward.setPath("redirect.jsp");
		} catch (Exception e) {
			request.setAttribute("msg","error");
			request.setAttribute("url","" );
			forward.setPath("redirect.jsp");
			forward.setRedirect(false);
			e.printStackTrace();
		} 
		return forward;
	}

}
