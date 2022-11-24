package kr.or.kosa.service.payment;

import java.io.IOException;
import java.net.URI;
import java.util.ArrayList;
//import java.net.URI;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.PaymentDao;
import kr.or.kosa.dto.Book_Payment;

public class PaymentService implements Action {
//결제 api?? -> 결제 성공/실패 팝업으로 일단은 보류
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		List<Book_Payment> list = new ArrayList<Book_Payment>();
		
		String id = request.getParameter("id");
		
		for(Book_Payment bpl : list) {
			Book_Payment bp = new Book_Payment();
			
			bp.setIsbn(bpl.getIsbn());
			bp.setCount(bpl.getCount());
			bp.setPayment_addr(bpl.getPayment_addr());
			bp.setPayment_date(bpl.getPayment_date());
			bp.setPayment_detailaddr(bpl.getPayment_detailaddr());
			bp.setSumprice(bpl.getSumprice());
			
			list.add(bp);
		}
		
		String msg = "";
		String url = "";
		try {
			//장바구니 >> 체크박스 선택 >> 결제 클릭 >> 토스 api 보여주고 >> 이 서비스로 이동
			//결제 책 목록(isbn목록) checkbox 선택된것들 >>  [] >> parameter이름 [selectedlist]
			//let sumprice = 1000 >> parameter sumpirce
			
			//<form action=???>
			//[v]어린왕자 2권 100
			//[ ]홍길동전 1권 100
			//[v]신데렐라 1권 100
			//        total        300
			//button onclick=함수
			//</form>
			PaymentDao dao = new PaymentDao();
			
			int result = dao.insertPayment(list, id);
			
			if(result > 0) {
				msg = "결제가 완료되었습니다";
				url = "장바구니";
			}else {
				msg = "결제의 실패하였습니다";
				url = "장바구니";
			}
			
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			
			
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/utils/redirect.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		/*
		 * 버튼클릭
		 * function(){
		 * 		토스api 보여주고
		 * 		form.submit();
		 * } */
		//팝업 보여주고 다른 페이지로
		request.setAttribute("msg","");
		request.setAttribute("url", "");
		return forward;
	}

}
