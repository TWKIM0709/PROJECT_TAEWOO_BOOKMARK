package kr.or.kosa.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.UsersDao;
import kr.or.kosa.dto.Users;

public class UserUpdateOkService implements Action {
//수정처리페이지
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		Users user = new Users();
		
		String msg = "";
		String url = "";
		
		try {
			String id = request.getParameter("id");
			String pwd = request.getParameter("password");
			String name = request.getParameter("name");
			String addr = request.getParameter("addr");
			String detail_addr = request.getParameter("detail_addr");
			String regist_no = request.getParameter("regist_no");
			String phone = request.getParameter("phone");
		
			UsersDao dao = new UsersDao();
			
			boolean result = dao.updateUser(user);
			
			if(result) {
				msg = "수정성공";
				url = "main.do";
			}else {
				msg = "수정실패";
				url = "userEdit.do";
			}
			
			forward.setRedirect(false);
			forward.setPath(url);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", msg);
			request.setAttribute("url", "userDetail.do");
			forward.setRedirect(false);
			forward.setPath("/WEB-INF/views/utils/redirect.jsp");
		} 
		return forward;
	}

}
