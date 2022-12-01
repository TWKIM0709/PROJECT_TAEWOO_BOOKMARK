package kr.or.kosa.service.calendar;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.CalendarDao;
import kr.or.kosa.dto.Calendar;

public class CalendarDeleteService implements Action {
// 일정 삭제(비동기) || 0 : 입력안함 || 1 : 성공 || 2 : 실패 || 3 : 오류
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
				
		String calendar_no = request.getParameter("calendar_no");
		System.out.println("calendarno : " + calendar_no);
		String msg = "";
		String url = "";
		PrintWriter out = null;
		try {
			out = response.getWriter();
			CalendarDao dao = new CalendarDao();
			//일정번호 없으면 0
			if(calendar_no == null || calendar_no == "") {
				out.print(0);
			}
			int result = dao.CalendarDelete(Integer.parseInt(calendar_no));
			
			if(result > 0) {//성공 1
				out.print(1);
			}else {//실패 2
				out.print(2);
			}
		} catch (Exception e) {
			e.printStackTrace(); //에러 3
			out.print(3);
		} 
		return null;
	}

}
