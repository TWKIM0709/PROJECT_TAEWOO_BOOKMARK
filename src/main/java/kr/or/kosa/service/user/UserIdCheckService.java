package kr.or.kosa.service.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.UsersDao;
import kr.or.kosa.dto.Users;

public class UserIdCheckService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		try {
			UsersDao dao = new UsersDao();
			
			String id = request.getParameter("id");
			
			boolean user = dao.userIdCk(id);
			
			if(user) { //이미 있는 아이디
				response.getWriter().print("false");
			} else { //사용 가능한 아이디
				response.getWriter().print("true");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			try {
				response.getWriter().print("error");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		return null;
	}
}
