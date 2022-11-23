package kr.or.kosa.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.UsersDao;
import kr.or.kosa.dto.Users;

public class UserDetailService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		String id = request.getParameter("id");
		
		try {
			UsersDao dao = new UsersDao();
			
			Users user = dao.getUserById(id);
			
			request.setAttribute("user", user);
			
			forward.setRedirect(false);
			forward.setPath("userdetail.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return forward;
	}

}
