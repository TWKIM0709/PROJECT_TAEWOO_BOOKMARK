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
		String path = "";
		try {
			
			if(request.getSession().getAttribute("admin").equals("admin")) { //관리자일 경우 유저 상세보기 페이지로
				String id = request.getParameter("id");
			
				UsersDao dao = new UsersDao();
				
				Users user = dao.getUserById(id);
				
				request.setAttribute("user", user);
				path = "/WEB-INF/views/adminpage/user/admin_user_detail.jsp";
			}else { //일반 회원일 경우 -> 회원 정보 수정 페이지로
				path = "/WEB-INF/views/userpage/mypage/mypage.jsp";
			}
			forward.setRedirect(false);
			forward.setPath(path);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "서버오류");
			request.setAttribute("url", "main.do");
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/utils/redirect.jsp");
		}
		return forward;
	}

}
