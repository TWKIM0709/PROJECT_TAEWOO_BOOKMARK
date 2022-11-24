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
		ActionForward forward = new ActionForward();
		
		String id = "";
		String pwd = "";
		
		String path = ""; //뷰 path
		
		try {
			UsersDao dao = new UsersDao();
			PrintWriter out = response.getWriter();
			
			id = request.getParameter("id");
			pwd = request.getParameter("passward");
			
			int ok = dao.userLogin(id, pwd);
			
			out.print(ok); //0:아이디 없음, 1:비밀번호틀림, 2:회원, 3:관리자
			
			//TODO: 로그인 실패시 redirect에서 로그인 실패 메시지 띄우고 다시 로그인 창 띄울 것 ? ? 이거 뷰가 나와봐야 알듯
			
			
			request.getSession().setAttribute("id", id);
			if(ok == 3) { //관리자면
				request.getSession().setAttribute("admin", 1);
			}
			
			if(request.getSession().getAttribute("admin")!=null) { //관리자일 경우
				path = ""; //관리자 페이지
			}else { //일반 회원일 경우
				path = ""; //메인 페이지
			}
			
			forward.setRedirect(false);
			forward.setPath(path);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return forward;
	}

}
