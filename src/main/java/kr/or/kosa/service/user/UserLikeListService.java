package kr.or.kosa.service.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.UsersDao;
import kr.or.kosa.dto.Users;
import kr.or.kosa.utils.ThePager;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class UserLikeListService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		JSONObject json = new JSONObject();
		JSONArray jsonary = new JSONArray();
		JSONObject jsonobj = new JSONObject();
		
		String type = "";
		String value = "";
		
		type = request.getParameter("type");
		value = request.getParameter("value");
		String ps = request.getParameter("ps"); // pagesize
		String cp = request.getParameter("cp"); // current page
		
		String path = "";
		
		try {
			UsersDao dao = new UsersDao();

			//검색결과 총 건수
			int likeusercount = dao.totalUserCountByLike(type, value);
			
			System.out.println(likeusercount);
			//List페이지 처음 호출시에는
			if(ps == null || ps.trim().equals("")) {
				//default값 설정
				ps = "5";
			}
			
			if(cp == null || cp.trim().equals("")) {
				//default값 설정
				cp = "1"; //1페이지
			}
			
			int pagesize = Integer.parseInt(ps);
			int cpage = Integer.parseInt(cp);
			int pagecount = 0;
			
			if(likeusercount % pagesize == 0) {
				pagecount = likeusercount / pagesize;
			}else {
				pagecount = (likeusercount / pagesize) + 1;
			}
			
			//전체 목록 가져오기
			List<Users> likelist = dao.getUserListByLike(type, value, Integer.parseInt(cp), Integer.parseInt(ps));
			
			int pagersize = 3;
			ThePager pager = new ThePager(likeusercount, cpage, pagesize, pagersize, "userSearch.do?search="+request.getParameter("search") + "&type=" + request.getParameter("type"));
			
			//for문으로 list를 json에 넣기
			//select rownum rn, u.id, u.password, u.name, u.state, d.addr,
			//d.detail_addr, d.regist_no, d.phone 
			for(Users u : likelist) {
				json.put("id", u.getId());
				json.put("password", u.getPassword());
				json.put("name", u.getName());
				json.put("state", u.getState());
				json.put("addr", u.getAddr());
				json.put("detail_addr", u.getDetail_addr());
				json.put("regist_no", u.getRegist_no());
				json.put("phone", u.getPhone());
				
				jsonary.add(json);
			}
			
			jsonobj.put("RESULT", "success");
			
			jsonobj.put("pagesize", pagesize);
			jsonobj.put("cpage", cpage);
			jsonobj.put("pagecount", pagecount);
			jsonobj.put("likeusercount", likeusercount);
			
			jsonobj.put("pager", pager.toString());
			
			jsonobj.put("likeuserlist", jsonary);
			
			//request.setAttribute("userlikelist", likelist);
			
//			if(request.getSession().getAttribute("admin") != null) {
//				path = ""; //TODO:관리자 Like검색
//			}else {
//				path = "/WEB-INF/views/user/user_like_list.jsp";
//			}
			
			forward.setRedirect(false);
			forward.setPath(path);
		} catch (Exception e) {
			jsonobj.put("RESULT", "fail");
			e.printStackTrace();
		} 

		try {
			response.getWriter().print(jsonobj);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//return forward;
		return null; //비동기
	}

}
