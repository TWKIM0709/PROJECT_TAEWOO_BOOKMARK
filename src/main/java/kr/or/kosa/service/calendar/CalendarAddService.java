package kr.or.kosa.service.calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.CalendarDao;
import kr.or.kosa.dto.Calendar;

public class CalendarAddService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		System.out.println("캘린더추가 서비스 진입");
		
//calendar_no, id, calendar_start, calendar_end, calendar_content, calendar_status
		
		Calendar calendar = new Calendar();
		
		//calendar_no는 시퀀스 사용
		String calendar_start = request.getParameter("calendar_start");
		String calendar_end = request.getParameter("calendar_end");
		String calendar_content = request.getParameter("calendar_content");
		//session 작업 아직 안해서 domaya로 기본값 설정
		String id = (request.getSession().getAttribute("id") == null) ? "domaya" : (String)request.getSession().getAttribute("id");
		//String calendar_status = request.getParameter("calendar_status");
		
		//TODO : calendar에는 date가 어떤 포맷으로 들어가지...
		//String으로 받은 date값 simple date format으로 date로...
		
		//SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-DD");
		DateFormatter formatter = new DateFormatter();
		
		try {
			CalendarDao dao = new CalendarDao();
			calendar.setId(id);
			calendar.setCalendar_content(calendar_content);
			calendar.setCalendar_start(calendar_start);
			calendar.setCalendar_end(calendar_end);
			//TODO:근데 status는 기본적으로 0으로 만들어지지 않나? default없나??
			calendar.setCalendar_status(0);
			
			int result = dao.CalendarAdd(calendar);
			
			if(result > 0) {
				response.getWriter().print(1);
			}else {
				response.getWriter().print(2);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return null;
	}

}
