package kr.or.kosa.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.UsersDao;
import kr.or.kosa.dto.Users;

public class UserUpdateService implements Action {
//유저 정보 수정 페이지로 이동
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		String url = "";
		try {
			String id = "";
			String admin = "";
			if(request.getSession().getAttribute("admin").equals("admin")) { //관리자면
				id = request.getParameter("id");
				admin = "true";
			} else {
				id = (String)request.getSession().getAttribute("id");
				admin = "false";
			}
			UsersDao dao = new UsersDao();
			
			Users user = dao.getUserById(id);
			
			request.setAttribute("user", user);
			if(user != null) { //성공시
				if(admin.equals("true")) { //성공 + 어드민일 경우
					url = "/WEB-INF/views/adminpage/user/admin_user_Edit.jsp";
				} else { //성공 + 유저일 경우
					url = "/WEB-INF/views/userpage/mypage/mypageUpdate.jsp";
				}
			} else { //실패시 ( 데이터가 없으면)
				if(admin.equals("true")) { //실패 + 어드민일 경우
					url = "userList.do";
				} else { //실패 + 유저일 경우
					url = "userMyPage.do"; 
				}
			}
			forward.setRedirect(false);
			forward.setPath(url);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "에러");
			request.setAttribute("url", "userDetail.do");
			forward.setRedirect(false);
			forward.setPath("");
		} 
		return forward;
	}

}
