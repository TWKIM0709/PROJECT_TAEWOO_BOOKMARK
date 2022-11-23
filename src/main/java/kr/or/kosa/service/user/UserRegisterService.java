package kr.or.kosa.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.UsersDao;
import kr.or.kosa.dto.Users;

public class UserRegisterService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		Users user = new Users();
		
		String msg = "";
		String url = "";
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("passward");
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		String detail_addr = request.getParameter("detail_addr");
		String register_no = request.getParameter("register_no");
		String phone = request.getParameter("phone");
		
		user.setId(id);
		user.setPassword(pwd);
		user.setName(name);
		user.setAddr(addr);
		user.setDetail_addr(detail_addr);
		user.setRegist_no(register_no);
		user.setPhone(phone);
		try {
			UsersDao dao = new UsersDao();
			
			int result = dao.userRegister(user);
			if(result > 0 ) {
				msg = "회원가입성공";
				url = "login.do";
			}else {
				msg = "회원가입의 실패했습니다";
				url = "#";
			}
			
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
			
			forward.setRedirect(false);
			forward.setPath("WEB-INF/views/utils/redirect.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return forward;
	}

}
