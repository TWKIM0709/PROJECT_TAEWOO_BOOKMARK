package kr.or.kosa.service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.UsersDao;

public class UserDeleteService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		String id = request.getParameter("id");
		String msg = "";
		String url = "";
		
		try {
			UsersDao dao = new UsersDao();
			
			boolean result = dao.deleteUser(id);
			
			if(request.getSession().getAttribute("admin").equals("admin")) {
				//관리자일 경우
				if(result) {
					msg = "회원삭제가 완료되었습니다.";
					url = "userList.do"; //관리자페이지
				}else {
					msg = "회원삭제를 실패하였습니다.";
					url = "userList.do";	//관리자페이지
				}
			}else {
				//일반회원일 경우
				if(result) {
					msg = "회원 탈퇴가 완료되었습니다.";
					url = "/homepage.html";
					request.getSession().invalidate();
				}else {
					msg = "회원 탈퇴에 실패하였습니다.";
					url = "userDetail.do"; //TODO:회원 탈퇴 기능이 있는 페이지 (뒤로가기 ??느낌)
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			msg = "서버에러.";
			url = "main.do";
			
		} 
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/views/utils/redirect.jsp");
		
		return forward;
	}

}
