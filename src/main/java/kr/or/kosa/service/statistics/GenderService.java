package kr.or.kosa.service.statistics;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.StatisticsDao;
import kr.or.kosa.dto.Statistics;
import net.sf.json.JSONArray;

public class GenderService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		List<Statistics> genderlist = null;
		try {
			StatisticsDao dao = new StatisticsDao();
			
			genderlist = dao.getGender();
			
			request.setAttribute("genderlist", genderlist);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		JSONArray genderjson = JSONArray.fromObject(genderlist);
		
		return null;
	}

}
