package kr.or.kosa.service.payment;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.PaymentDao;
import kr.or.kosa.dto.Book_Payment;
import kr.or.kosa.utils.ThePagerLike;
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
			
			// 상세보기 >> 다시 LIST 넘어올때 >> 현재 페이지 설정
			String ps = request.getParameter("ps"); // pagesize
			String cp = request.getParameter("cp"); // current page

			// List 페이지 처음 호출 ...
			if (ps == null || ps.trim().equals("")) {
					// default 값 설정
					ps = "5"; // 5개씩
			}

			if (cp == null || cp.trim().equals("")) {
				// default 값 설정
				cp = "1"; // 1번째 페이지 보겠다
			}

			int totalboardcount = pdao.adminpaymentlistcount(id);
			int pagesize = Integer.parseInt(ps);
			int cpage = Integer.parseInt(cp);
			int pagecount = 0;

			// 23건 % 5
			if (totalboardcount % pagesize == 0) {
				pagecount = totalboardcount / pagesize; // 20 << 100/5
			} else {
				pagecount = (totalboardcount / pagesize) + 1;
			}
			
			int pagerSize = 3;
			
			//페이저?
			//ThePagerLike는 파라미터로 링크 대신 검색어를 받는다.
			//public ThePagerLike(int dataCount, int currentPage, int pageSize, int pagerSize, String linkUrl) {
			ThePagerLike pager = new ThePagerLike(totalboardcount, Integer.parseInt(cp), pagesize, pagerSize, request.getParameter("id"));
						
						
			
			List<Book_Payment> paymentlist = pdao.adminpaymentlist(id, cpage, pagesize);
			
			for(Object obj : paymentlist) {
				Book_Payment p = (Book_Payment)obj;
				json.put("payment_no", p.getPayment_no());
				json.put("book_name", p.getBook_name());
				json.put("count", p.getCount());
				json.put("payment_date", p.getPayment_date());
				json.put("sumprice", p.getSumprice());
				json.put("payment_addr", p.getPayment_addr());
				json.put("payment_detailaddr", p.getPayment_detailaddr());
				json.put("id", p.getId());
				jsonary.add(json);
			}
		jsonobj.put("RESULT", "success");
		
		
		jsonobj.put("pagesize", pagesize);
		jsonobj.put("cpage", cpage);
		jsonobj.put("pagecount", pagecount);
		jsonobj.put("totalboardcount", totalboardcount);
		jsonobj.put("pager", pager.toString()); 
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
