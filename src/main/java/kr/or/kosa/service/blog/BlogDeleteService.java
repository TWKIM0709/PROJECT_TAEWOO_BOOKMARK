package kr.or.kosa.service.blog;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.BlogDao;

public class BlogDeleteService implements Action {
//회원 - 블로그 게시글 삭제 처리
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		String msg = "";
		String path = "";
		System.out.println("ㅎㅇ");
		try {
			BlogDao dao = new BlogDao();
			int blogno = Integer.parseInt(request.getParameter("blog_no"));
			int row = dao.deleteOk(blogno);
			
			//삭제에 성공하면
			if(request.getSession().getAttribute("admin").equals("admin")) {
				//관리자일경우
				if(row != 0) {
					msg = "게시글삭제를 성공했습니다.";
				} else {
					msg = "게시글 삭제를 실패했습니다.";
				}//삭제 후 관리리스트로
				path = "blogAlllist.do";
			}else {
				if(row != 0) {
					msg = "게시글삭제를 성공했습니다.";
				} else {
					msg = "게시글 삭제를 실패했습니다.";
				}//삭제 후 블로그로
				path = "blogEnter.do?id=" + request.getParameter("id");
			}
		} catch (Exception e) {
			e.printStackTrace();
			if(request.getSession().getAttribute("admin").equals("admin")) {
				msg  = "서버 오류 발생";
				path = "blogAlllist.do";
			}else {
				System.out.println("ㅎㅇ");
				msg  = "서버 오류 발생";
				path = "blogEnter.do?id=" + request.getParameter("id");
			}
			
		} 
		//팝업 보여주고 다른 페이지로
		request.setAttribute("msg",msg);
		request.setAttribute("url", path);
		
		forward.setRedirect(false);
		forward.setPath("/WEB-INF/views/utils/redirect.jsp");
		return forward;
	}

}
