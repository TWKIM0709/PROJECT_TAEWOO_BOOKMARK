package kr.or.kosa.service.popup;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.dao.BlogDao;
import kr.or.kosa.dao.PopupDao;
import kr.or.kosa.dto.Blog_Board;
import kr.or.kosa.dto.Popup;
import kr.or.kosa.utils.ThePager;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class PopupLikeListService implements Action {
//관리자 - 팝업 like 조회
	//바꿔야됨!!!!111!1!11!1!1!111!
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		JSONObject json = new JSONObject();
		JSONArray jsonary = new JSONArray();
		JSONObject jsonobj = new JSONObject();
		try {
			PopupDao pdao = new PopupDao();
			int totalpopupcount = pdao.totalPopupCount();
		
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
						if (totalpopupcount % pagesize == 0) {
							pagecount = totalpopupcount / pagesize; // 20 << 100/5
						} else {
							pagecount = (totalpopupcount / pagesize) + 1;
						}

						// 102건 : pagesize=5 >> pagecount=21페이지

						// 전체 목록 가져오기
						List<Popup> qlist = pdao.LikeListPopup(ps, cp, cpage, pagesize) ;// list >> 1 , 20
						
						int pagersize=3; //[1][2][3]
						ThePager pager = new ThePager(totalpopupcount,cpage,pagesize,pagersize,"popupLike.do?search=" + request.getParameter("search"));
						
						//====ThePager 까지는 동기랑 똑같음====
//						JSONObject json = new JSONObject();
//						JSONArray jsonary = new JSONArray();
//						JSONObject jsonobj = new JSONObject();
//						3개 객체를 execute 바로 아래에 생성
						
						//for문으로 list json에 넣기
						for(Popup q : qlist) {
//						0.	json.put("이름1", "데이터1");  json에 데이터  넣기
//							json.put("이름2", "데이터2");  >> {이름1:데이터1, 이름2:데이터2}
							json.put("Popup_no", q.getPopup_no());
							json.put("id", q.getId());
							json.put("Popup_title", q.getPopup_title());
							json.put("Popup_filename", q.getPopup_filename());
							json.put("Popup_date", q.getPopup_date());
						
//						1. 	{popup_no:1,id:user1,popup_title:어린왕자,popup_content:가나다라마바사 ...}
//							위처럼 json 하나를 만들고
							
//						2.	json 배열 객체(jsonary)에 넣기를 반복하면
							
							jsonary.add(json); 
//						3.	[ 이렇게 json 배열이 생긴다.
				//				{popup_no:1,id:user1,popup_title:어린왕자,popup_content:가나다라마바사 ...}
				//				{popup_no:1,id:user1,popup_title:어린왕자,popup_content:가나다라마바사 ...}
				//				{popup_no:1,id:user1,popup_title:어린왕자,popup_content:가나다라마바사 ...}
//							] 
						}
						
//					4. json으로 success/fail 넣어서 비동기 성공/실패 알 수 있게 해주기	
						jsonobj.put("RESULT", "success");

//					5.	여기서 request에 데이터를 넣어도 비동기라 의미 없음
//							>> json 객체로 넘기고 원래 페이지에서 받은거로 따로 설정해주면 될듯??
//						request.setAttribute("pagesize", pagesize);
//						request.setAttribute("cpage", cpage);
//						request.setAttribute("pagecount", pagecount);
//						request.setAttribute("popuplist", qlist);
//						request.setAttribute("totalboardcount", totalboardcount);
//						request.setAttribute("pager", pager);
						
						jsonobj.put("pagesize", pagesize);
						jsonobj.put("cpage", cpage);
						jsonobj.put("pagecount", pagecount);
						jsonobj.put("totalPopupcount", totalpopupcount);
//					5.1	pager.toString >> 게시판 하단의 페이지 버튼 만드는 html 담겨 있음
						jsonobj.put("pager", pager.toString()); 
						
//					6. 만들어 뒀던 json 배열 jsonobj에 넣어주기
						jsonobj.put("popuplist", jsonary);
					} catch (Exception e) {
						System.out.println(e.getMessage());
//						4.1 json으로 success/fail 넣어서 비동기 성공/실패 알 수 있게 해주기	
							jsonobj.put("RESULT", "fail");
					}
//					7. 만든 json 덩어리 출력해주기
					try {
						response.getWriter().print(jsonobj);
					} catch (IOException e) {
						e.printStackTrace();
					}
					return null; //(null) 비동기		
				}
			}
			
