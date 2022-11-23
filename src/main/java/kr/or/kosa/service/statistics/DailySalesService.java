package kr.or.kosa.service.statistics;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.StatisticsDao;
import kr.or.kosa.dto.Statistics;
import net.sf.json.JSONArray;

public class DailySalesService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		List<Statistics> daily = null;
		
		try {
			StatisticsDao dao = new StatisticsDao();
			
			daily = dao.dailySales();
			
			request.setAttribute("daily", daily);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		JSONArray dailyjson = JSONArray.fromObject(daily);
		
		return null;
	}

}
