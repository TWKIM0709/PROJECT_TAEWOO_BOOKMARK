package kr.or.kosa.service.payment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.BookDao;
import kr.or.kosa.dao.PaymentDao;

public class EbookPaymentService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		ActionForward forward = new ActionForward();
		
		String msg = "";
		String url = "";
		String path = "";
		
		try {
		String id = (String)request.getSession().getAttribute("id");
		String isbn = request.getParameter("isbn");
		BookDao dao = new BookDao();
		int price = (int) (dao.getBookListByIsbn(isbn).getPrice() *0.8);
		System.out.println(id);
		System.out.println(isbn);
		System.out.println(price);
		int result = dao.InsertEbookList(id, isbn,price);
		//결제 성공시
		if(result > 0 && result<3) {
			msg = "결제가 완료되었습니다";
			url = "ebookList.do";
			path = "/WEB-INF/views/utils/redirect.jsp";
		}else if(result >=3) {
			msg = "이미 구매한 책입니다.";
			url = "bookDetail.do?isbn=" + request.getParameter("isbn");
			path = "/WEB-INF/views/utils/redirect.jsp";
		}else {//결제 실패시
			msg = "결제에 실패하였습니다";
			url = "bookDetail.do?isbn=" + request.getParameter("isbn");
			path = "/WEB-INF/views/utils/redirect.jsp";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		forward.setRedirect(false);
		forward.setPath(path);
	} catch (Exception e) {
		e.printStackTrace();
		request.setAttribute("msg", "서버오류");
		request.setAttribute("url", "/WEB-INF/views/utils/redirect.jsp");
		forward.setRedirect(false);
		forward.setPath(path);
	} 
	return forward;
}

}