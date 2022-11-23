package kr.or.kosa.service.statistics;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.StatisticsDao;
import kr.or.kosa.dto.Statistics;
import net.sf.json.JSONArray;

public class YearlySalesService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		List<Statistics> year = null;
		try {
			StatisticsDao dao = new StatisticsDao();
			
			year = dao.yearlySales();
			
			request.setAttribute("year", year);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		JSONArray yearjson = JSONArray.fromObject(year);
		
		return null;
	}

}
