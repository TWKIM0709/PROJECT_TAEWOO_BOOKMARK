package kr.or.kosa.service.calendar;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.CalendarDao;
import kr.or.kosa.dto.Calendar;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class CalendarAllListService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();

 		//List<Calendar> calendarList = new ArrayList<>();
		List<Calendar> calendarList = null;
		JSONObject json = new JSONObject();
		JSONArray jsonary = new JSONArray();
		JSONObject jsonobj = new JSONObject(); 
		// parameter로 qlehdrl라는게 있으면 false (비동기) 없으면 true (동기)
		// if(ehdrl) >> 동기    //    if(!ehdrl) >> 비동기
		boolean ehdrl = (request.getParameter("qlehdrl") == null) ? true : false;
		//DB작업
		try {
			Calendar calendar = new Calendar();
			CalendarDao dao = new CalendarDao();
			calendarList = dao.CalendarAlllist();
				
			System.out.println("동기/비동기 조건 조회...");
			if(ehdrl) { //동기일 경우 request.setAttribute
				System.out.println("동기");
				request.setAttribute("calendarList", calendarList);
			} else { //비동기일 경우 json 작업
				System.out.println("비동기");
				for(Calendar c : calendarList) {
					json.put("no", c.getCalendar_no());
					json.put("id", c.getId());
					json.put("start", c.getCalendar_start());
					json.put("end", c.getCalendar_end());
					json.put("content", c.getCalendar_content());
					json.put("status", c.getCalendar_status());
					jsonary.add(json);
				}
				jsonobj.put("result", "success");
				jsonobj.put("calendar", jsonary);
			}
		} catch (Exception e) {
			e.printStackTrace();
			if(!ehdrl) {
				jsonobj.put("result", "fail");
			}
		} 
		if(ehdrl) { //동기일 경우 페이지로 이동
			//TODO:뷰 설정하기
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/adminpage/calendar/admin_calendar.jsp");
		
			return forward;
		} else { //비동기일 경우 json 뿌리고 끝
			try {				response.getWriter().print(jsonobj);			} catch (IOException e) {				e.printStackTrace();			}
			return null;
		}
	}

}
