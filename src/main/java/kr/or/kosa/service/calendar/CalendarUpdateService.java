package kr.or.kosa.service.calendar;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.CalendarDao;
import kr.or.kosa.dto.Calendar;

public class CalendarUpdateService implements Action {
//비동기 ... 0 : 일정번호 입력안됨 || 1 : 없는 일정을 조회함 || 2 : 성공 || 3 : 실패 || 4 : 에러
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		String calendar_no = request.getParameter("calendar_no");
		String calendar_start = request.getParameter("calendar_start");
		String calendar_end = request.getParameter("calendar_end");
		String calendar_content = request.getParameter("calendar_content");
		String calendar_status = request.getParameter("calendar_status");
		
		//SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-DD");
		DateFormatter formatter = new DateFormatter();
		
		String msg = "";
		String url = "";
		PrintWriter out  = null;
		try {
			out = response.getWriter();
			CalendarDao dao = new CalendarDao();
			Calendar calendar = dao.CalendarDetail(Integer.parseInt(calendar_no));//이 함수로 가져오는거 맞지?
			
			//일정 번호를 입력하지 않았을 경우
			if(calendar_no == null || calendar_no.trim().equals("")) {
				out.print(0);
				return null;
			}
			
			//수정하려는 캘린더가 없을 경우
			if(calendar == null) {
				out.print(1);
				return null;
			}
			
			//수정사항 반영
			calendar.setCalendar_start(calendar_start);
			calendar.setCalendar_end(calendar_end);
			calendar.setCalendar_content(calendar_content);
			calendar.setCalendar_status(Integer.parseInt(calendar_status));
			
			int result = dao.CalendarUpdate(calendar);
			
			//수정 성공 2
			if(result > 0) {
				out.print(2);
			}else { //수정실패3
				out.print(3);
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.print(4);
		}
		return null;
	}

}
