package kr.or.kosa.service.payment;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.PaymentDao;
import kr.or.kosa.dao.QuestionDao;
import kr.or.kosa.dto.Book;
import kr.or.kosa.dto.Question_Board;
import kr.or.kosa.utils.ThePager;

public class CartListService implements Action {
//장바구니 이동 페이지
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		try {
			PaymentDao pdao = new PaymentDao();

			String id = request.getParameter("id");
//			System.out.println("cartList id : " + id);
			List<Book> cartlist = pdao.cartlist(id);
			int cartsize = cartlist.size();
			String firstbook = cartlist.get(0).getBook_name();
			int totalprice = 0;
			
			for(Book b : cartlist) {
				totalprice += b.getPrice();
			}
			
			request.setAttribute("cartlist", cartlist);
			request.setAttribute("cartsize", cartsize);
			request.setAttribute("firstbook", firstbook);
			request.setAttribute("totalprice", totalprice);
			//System.out.println(cartlist);

			forward = new ActionForward();
			forward.setRedirect(false); // forward
			forward.setPath("/WEB-INF/views/userpage/user_cart.jsp");
		} catch (Exception e) {
			System.out.println("cartListService 예외 : " + e.getMessage());
			
			String msg = "서버에러발생";
			String url = "main.do";
			request.setAttribute("msg",msg);
			request.setAttribute("url", url);
			e.printStackTrace();
			forward.setPath("/WEB-INF/views/utils/redirect.jsp");
			forward.setRedirect(false);
		}
		return forward;		
	}

}
