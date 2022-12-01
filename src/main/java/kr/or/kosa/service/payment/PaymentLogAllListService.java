package kr.or.kosa.service.payment;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.PaymentDao;
import kr.or.kosa.dto.Book_Payment;
import kr.or.kosa.utils.ThePager;

public class PaymentLogAllListService implements Action {
//관리자가 보는 리스트
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		ActionForward forward = null;
		try {
			PaymentDao pdao = new PaymentDao();

			// 결제 총 건수
			int totalboardcount = pdao.totalPayment();
			
			

			// 상세보기 >> 다시 LIST 넘어올때 >> 현재 페이지 설정
			String ps = request.getParameter("ps"); // pagesize
			String cp = request.getParameter("cp"); // current page

			// List 페이지 처음 호출 ...
			if (ps == null || ps.trim().equals("")) {
				// default 값 설정
				ps = "10"; // 5개씩
			}

			if (cp == null || cp.trim().equals("")) {
				// default 값 설정
				cp = "1"; // 1번째 페이지 보겠다
			}

			int pagesize = Integer.parseInt(ps);
			int cpage = Integer.parseInt(cp);
			int pagecount = 0;

			// 23건 % 5
			if (totalboardcount % pagesize == 0) {
				pagecount = totalboardcount / pagesize; // 20 << 100/5
			} else {
				pagecount = (totalboardcount / pagesize) + 1;
			}

			// 102건 : pagesize=5 >> pagecount=21페이지

			// 전체 목록 가져오기
			List<Book_Payment> qlist = pdao.allpaymentlist(cpage, pagesize); // list >> 1 , 20
			
			int pagersize=3; //[1][2][3]
			ThePager pager = new ThePager(totalboardcount,cpage,pagesize,pagersize,"paymentAlllist.do");
			
			
			request.setAttribute("pagesize", pagesize);
			request.setAttribute("cpage", cpage);
			request.setAttribute("pagecount", pagecount);
			request.setAttribute("paymentalllist", qlist);
			request.setAttribute("totalboardcount", totalboardcount);
			request.setAttribute("pager", pager);

			forward = new ActionForward();
			forward.setRedirect(false); // forward
			forward.setPath("/WEB-INF/views/adminpage/admin_payment.jsp");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			String msg = "error";
			String url = "/WEB-INF/views/adminpage/admin_main.jsp";
			request.setAttribute("msg",msg);
			request.setAttribute("url", url);
			forward.setPath("redirect.jsp");
			forward.setRedirect(false);
		}
		return forward;		
	}


}
