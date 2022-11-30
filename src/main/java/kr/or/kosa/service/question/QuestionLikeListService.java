package kr.or.kosa.service.question;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.QuestionDao;
import kr.or.kosa.dto.Question_Board;
import kr.or.kosa.utils.ThePager;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class QuestionLikeListService implements Action {
//관리자 모드에서 리스트에서 특정 검색어로 검색
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		JSONObject json = new JSONObject();
		JSONArray jsonary = new JSONArray();
		JSONObject jsonobj = new JSONObject();
		try {
			QuestionDao qdao = new QuestionDao();

			// 게시물 총 건수
			int totalboardcount = qdao.totalBoardCountByLike("question_title",request.getParameter("search"));
			// 상세보기 >> 다시 LIST 넘어올때 >> 현재 페이지 설정
			String ps = request.getParameter("ps"); // pagesize
			String cp = request.getParameter("cp"); // current page

			// List 페이지 처음 호출 ...
			if (ps == null || ps.trim().equals("")) {
				// default 값 설정
				ps = "5"; // 5개씩
			}

			if (cp == null || cp.trim().equals("")) {
				// default 값 설정
				cp = "1"; // 1번째 페이지 보겠다
			}

			int pagesize = Integer.parseInt(ps);
			int cpage = Integer.parseInt(cp);
			int pagecount = 0;

			// 23건 % 5
			if (totalboardcount % pagesize == 0) {
				pagecount = totalboardcount / pagesize; // 20 << 100/5
			} else {
				pagecount = (totalboardcount / pagesize) + 1;
			}

			// 102건 : pagesize=5 >> pagecount=21페이지
			// 전체 목록 가져오기
			List<Question_Board> qlist = qdao.getQuestionLikeList("question_title",request.getParameter("search"),cpage, pagesize); // list >> 1 , 20

			int pagersize=3; //[1][2][3]
			ThePager pager = new ThePager(totalboardcount,cpage,pagesize,pagersize,"questionLike.do?search=" + request.getParameter("search"));

			//====ThePager 까지는 동기랑 똑같음====
//			JSONObject json = new JSONObject();
//			JSONArray jsonary = new JSONArray();
//			JSONObject jsonobj = new JSONObject();
//			3개 객체를 execute 바로 아래에 생성
			
			//for문으로 list json에 넣기
			for(Question_Board q : qlist) {
//			0.	json.put("이름1", "데이터1");  json에 데이터  넣기
//				json.put("이름2", "데이터2");  >> {이름1:데이터1, 이름2:데이터2}
				json.put("question_no", q.getQuestion_no());
				json.put("id", q.getId());
				json.put("question_title", q.getQuestion_title());
				json.put("question_content", q.getQuestion_content());
				json.put("hits", q.getHits());
				json.put("question_date", q.getQuestion_date());
				json.put("refer", q.getRefer());
				json.put("depth", q.getDepth());
				json.put("step", q.getStep());
				json.put("notice_no", q.getNotice_no());
//			1. 	{question_no:1,id:user1,question_title:어린왕자,question_content:가나다라마바사 ...}
//				위처럼 json 하나를 만들고
				
//			2.	json 배열 객체(jsonary)에 넣기를 반복하면
				
				jsonary.add(json); 
//			3.	[ 이렇게 json 배열이 생긴다.
	//				{question_no:1,id:user1,question_title:어린왕자,question_content:가나다라마바사 ...}
	//				{question_no:1,id:user1,question_title:어린왕자,question_content:가나다라마바사 ...}
	//				{question_no:1,id:user1,question_title:어린왕자,question_content:가나다라마바사 ...}
//				] 
			}
			
//		4. json으로 success/fail 넣어서 비동기 성공/실패 알 수 있게 해주기	
			jsonobj.put("RESULT", "success");

//		5.	여기서 request에 데이터를 넣어도 비동기라 의미 없음
//				>> json 객체로 넘기고 원래 페이지에서 받은거로 따로 설정해주면 될듯??
//			request.setAttribute("pagesize", pagesize);
//			request.setAttribute("cpage", cpage);
//			request.setAttribute("pagecount", pagecount);
//			request.setAttribute("questionlist", qlist);
//			request.setAttribute("totalboardcount", totalboardcount);
//			request.setAttribute("pager", pager);
			
			jsonobj.put("pagesize", pagesize);
			jsonobj.put("cpage", cpage);
			jsonobj.put("pagecount", pagecount);
			jsonobj.put("totalboardcount", totalboardcount);
//		5.1	pager.toString >> 게시판 하단의 페이지 버튼 만드는 html 담겨 있음
			jsonobj.put("pager", pager.toString()); 
			
//		6. 만들어 뒀던 json 배열 jsonobj에 넣어주기
			jsonobj.put("questionlist", jsonary);
		} catch (Exception e) {
			System.out.println(e.getMessage());
//			4.1 json으로 success/fail 넣어서 비동기 성공/실패 알 수 있게 해주기	
				jsonobj.put("RESULT", "fail");
		}
//		7. 만든 json 덩어리 출력해주기
		try {
			response.getWriter().print(jsonobj);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null; //(null) 비동기		
	}
}
/* 이런식으로 json 하나 출력해줌 ( http://192.168.0.51:8090/PROJECT_TAEWOO_BOOKMARK/questionLike.do?search=e )
	{
	"RESULT": "success",
	"pagesize": 5,
	"cpage": 1,
	"pagecount": 2,
	"totalboardcount": 7,
	"pager": "&nbsp;[1]&nbsp;&nbsp;<a href='questionLike.do?search=e?pageno=2'>2<\/a>&nbsp;&nbsp;[<a href='questionLike.do?search=e?pageno=2'>NEXT<\/a>]&nbsp;&nbsp;[<a href='questionLike.do?search=e?pageno=2'>LAST<\/a>]",
	"questionlist": [{
		"question_no": 52,
		"id": "Huey",
		"question_title": "Faust",
		"question_content": "Ralph M Calhoun Memorial Airport",
		"hits": 31,
		"question_date": "22/05/30",
		"refer": 7,
		"depth": 0,
		"step": 0,
		"notice_no": 0
	}, {
		"question_no": 51,
		"id": "Huey",
		"question_title": "Nazareno Cruz and the Wolf",
		"question_content": "Bella Union Airport",
		"hits": 80,
		"question_date": "22/09/10",
		"refer": 6,
		"depth": 0,
		"step": 0,
		"notice_no": 0
	}, {
		"question_no": 50,
		"id": "Angelika",
		"question_title": "Cable Guy, The",
		"question_content": "Bedwell Harbour Seaplane Base",
		"hits": 20,
		"question_date": "22/07/17",
		"refer": 5,
		"depth": 0,
		"step": 0,
		"notice_no": 0
	}, {
		"question_no": 49,
		"id": "Laurette",
		"question_title": "Death and Cremation",
		"question_content": "Greenbrier Valley Airport",
		"hits": 45,
		"question_date": "22/07/10",
		"refer": 4,
		"depth": 0,
		"step": 0,
		"notice_no": 0
	}, {
		"question_no": 48,
		"id": "Laurette",
		"question_title": "Fire Within, The (Feu follet, Le)",
		"question_content": "D체sseldorf Airport",
		"hits": 17,
		"question_date": "22/10/26",
		"refer": 3,
		"depth": 0,
		"step": 0,
		"notice_no": 0
	}]
}
*/


