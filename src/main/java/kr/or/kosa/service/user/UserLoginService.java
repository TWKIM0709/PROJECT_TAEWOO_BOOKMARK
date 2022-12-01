package kr.or.kosa.service.user;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.UsersDao;

public class UserLoginService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		
		String id = "";
		String pwd = "";
		int ok=0;
		String path = ""; //뷰 path
		PrintWriter out = null;
		try {
			UsersDao dao = new UsersDao();
			out = response.getWriter();
			
			id = request.getParameter("id");
			pwd = request.getParameter("password");
			
			ok = dao.userLogin(id, pwd);
			
			if(ok == 2) { //일반 회원
				request.getSession().setAttribute("id", id);
				request.getSession().setAttribute("admin", "user");
			}
			if(ok == 3) { //관리자면
				request.getSession().setAttribute("id", id);
				request.getSession().setAttribute("admin", "admin");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			ok=4;
		} 
			out.print(ok); //0:아이디 없음, 1:비밀번호틀림, 2:회원, 3:관리자, 4:error
		return null;
	}

}
