package kr.or.kosa.service.statistics;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.StatisticsDao;
import kr.or.kosa.dto.Statistics;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class GenderService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		List<Statistics> genderlist = null;
		JSONObject jsonobj = new JSONObject();
		JSONArray jsonary = new JSONArray();
		JSONObject json = new JSONObject();
		try {
			StatisticsDao dao = new StatisticsDao();
			
			genderlist = dao.getGender();

			for(Object obj : genderlist) {
				Statistics s = (Statistics)obj;
				json.put("NAME", s.getStatistics_name());
				json.put("VALUE", s.getStatistics_num());
				jsonary.add(json);
			}
			if(genderlist != null) {
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
