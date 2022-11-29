package kr.or.kosa.service.payment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.PaymentDao;
import kr.or.kosa.dto.Book;
import net.sf.json.JSONObject;

public class CartAddService implements Action {
//장바구니 추가 페이지
//parameter type이 true일 경우 결제페이지로
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		String msg="";
	    String url="";

		//TODO:null을 받아오는데 값은 찍히고 null이 아님 왜이럴까?????
		String id = request.getParameter("id");
		String isbn = request.getParameter("isbn");
		String type = request.getParameter("type");
		System.out.println("isbn : " + isbn);
		System.out.println("id : " + id);
		System.out.println("type : " + type);
		
		try {
			PaymentDao dao = new PaymentDao();
	
//			type true forwrd 동기 -> 결제 페이지로
//			type false 비동기 -> 추가만하고 끝
			

			int result = dao.AddBook(id, isbn);
			System.out.println(type.getClass().getName());
			if(type.equals("true")) { //동기 -> 장바구니페이지로
				if(result >0) {	//추가 성공
					forward.setPath("cartList.do");
					forward.setRedirect(false);
				}else {//추가 실패
					forward.setPath("bookDetail.do?isbn=" + isbn);
					forward.setRedirect(false);
				}
			} else { //비동기 -> 성공/실패 여부 json
				if(result >0) {//추가 성공
					JSONObject json = new JSONObject();
					json.put("RESULT","success");
					response.getWriter().print(json);
				}else {//추가 실패
					JSONObject json = new JSONObject();
					json.put("RESULT","fail" );
					response.getWriter().print(json);
				}
				return null;
			}
		} catch (Exception e) {
			request.setAttribute("msg","error");
			request.setAttribute("url","bookDetail.do?isbn=" + request.getParameter("isbn") );
			forward.setPath("/WEB-INF/views/utils/redirect.jsp");
			forward.setRedirect(false);
			e.printStackTrace();
		} 
		return forward;
	}

}
