package kr.or.kosa.service.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.UsersDao;
import kr.or.kosa.dto.Users;

public class UserLikeListService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		String type = "";
		String value = "";
		try {
			UsersDao dao = new UsersDao();
			
			type = request.getParameter("type");
			value = request.getParameter("value");
			List<Users> likelist = dao.getUserListByLike(type, value);
			
			request.setAttribute("userlikelist", likelist);
			
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/user/user_like_list.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return forward;
	}

}
