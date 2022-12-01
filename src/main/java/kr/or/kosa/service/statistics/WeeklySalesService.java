package kr.or.kosa.service.statistics;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.StatisticsDao;
import kr.or.kosa.dto.Statistics;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class WeeklySalesService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		List<Statistics> week = null;
		JSONObject jsonobj = new JSONObject();
		JSONArray jsonary = new JSONArray();
		JSONObject json = new JSONObject();
		
		Date date = new Date();
		 
		
		
		String today = "";
		String month = "";
		// 포맷변경 ( 년월일 시분초)
		SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd"); 
		 
		// Java 시간 더하기
		Calendar cal = Calendar.getInstance();
		 
		//지금
		cal.setTime(date);
		cal.add(Calendar.DATE, 1);
		today = sdformat.format(cal.getTime());  
				 
		
		 
		// 세달전
		cal.setTime(date);
		cal.add(Calendar.MONTH, -3);
		month = sdformat.format(cal.getTime());
		 
				
		
		try {
			StatisticsDao dao = new StatisticsDao();
			
			week = dao.curWeekSales(today, month);

			for(Object obj : week) {
				Statistics s = (Statistics)obj;
				json.put("NAME", s.getStatistics_name());
				json.put("VALUE", s.getStatistics_num());
				jsonary.add(json);
			}
			if(week != null) {
				jsonobj.put("RESULT", "success");
			} else {
				jsonobj.put("RESULT", "fail");
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonobj.put("RESULT", "fail");
		} 
		jsonobj.put("STATISTICS", jsonary);
		try {
			response.getWriter().print(jsonobj);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}