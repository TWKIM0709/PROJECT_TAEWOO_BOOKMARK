package kr.or.kosa.service.statistics;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.StatisticsDao;
import kr.or.kosa.dto.Statistics;
import net.sf.json.JSONArray;

public class MonthlySalesService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		List<Statistics> month = null;
		try {
			StatisticsDao dao = new StatisticsDao();
			
			month = dao.monthlySales();
			
			request.setAttribute("month", month);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		JSONArray monthjson = JSONArray.fromObject(month);
		
		return null;
	}

}
