package kr.or.kosa.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;
import kr.or.kosa.service.blog.BlogAdminDeleteService;
import kr.or.kosa.service.blog.BlogAdminDetailService;
import kr.or.kosa.service.blog.BlogAdminEdit;
import kr.or.kosa.service.blog.BlogAdminEditOk;
import kr.or.kosa.service.blog.BlogAllListService;
import kr.or.kosa.service.blog.BlogDeleteService;
import kr.or.kosa.service.blog.BlogDetailService;
import kr.or.kosa.service.blog.BlogEnterService;
import kr.or.kosa.service.blog.BlogLikeListService;
import kr.or.kosa.service.blog.BlogUpdateOkService;
import kr.or.kosa.service.blog.BlogUpdateService;
import kr.or.kosa.service.blog.BlogWriteService;
import kr.or.kosa.service.book.BookAddService;
import kr.or.kosa.service.book.BookAllListService;
import kr.or.kosa.service.book.BookDeleteService;
import kr.or.kosa.service.book.BookDetailService;
import kr.or.kosa.service.book.BookLikeListService;
import kr.or.kosa.service.book.BookLikeService;
import kr.or.kosa.service.book.BookUpdateService;
import kr.or.kosa.service.book.EBookListService;
import kr.or.kosa.service.book.RecommandBookAddService;
import kr.or.kosa.service.book.RecommandBookDeleteService;
import kr.or.kosa.service.book.RecommandBookListService;
import kr.or.kosa.service.calendar.CalendarAllListService;
import kr.or.kosa.service.payment.CartAddService;
import kr.or.kosa.service.payment.CartDeleteService;
import kr.or.kosa.service.payment.CartListService;
import kr.or.kosa.service.payment.PaymentLogAllListService;
import kr.or.kosa.service.payment.PaymentLogLikeIdListService;
import kr.or.kosa.service.payment.PaymentService;
import kr.or.kosa.service.question.QuestionAllListAdminService;
import kr.or.kosa.service.question.QuestionAllListUserService;
import kr.or.kosa.service.question.QuestionDeleteOkService;
import kr.or.kosa.service.question.QuestionDetailAdminService;
import kr.or.kosa.service.question.QuestionDetailUserService;
import kr.or.kosa.service.question.QuestionLikeListService;
import kr.or.kosa.service.question.QuestionRewriteOkService;
import kr.or.kosa.service.question.QuestionRewriteService;
import kr.or.kosa.service.question.QuestionUpdateOkService;
import kr.or.kosa.service.question.QuestionUpdateService;
import kr.or.kosa.service.question.QuestionWriteOkService;

@WebServlet("*.do")
public class BookMarkController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BookMarkController() {
        super();
    }

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String requestURI = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String url_Command = requestURI.substring(contextPath.length());
	
    	Action action=null;
    	ActionForward forward=null;
    	//페이지 - 기능
    	//=================================================================//
    	//                                                     메인페이지이동
    	//=================================================================//
    	 if(url_Command.equals("/main.do")) { //0. 메인 페이지 이동
     		// 이동+처리
    		forward = new ActionForward();
     		forward.setRedirect(false);
     		forward.setPath("/WEB-INF/views");
    	//=================================================================//
    	//                                                     문의사항
    	//=================================================================//
     	} else if(url_Command.equals("/question.do")) { //1. 회원 - 문의사항 페이지 이동
    		// 이동 + 처리
    		action = new QuestionAllListUserService();
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("/questionAdmin.do")) { //2. 관리자 - 문의사항 관리 페이지 이동
    		// 이동 + 처리
    		action = new QuestionAllListAdminService();
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("/questionLike.do")) { //3. 문의사항 검색(like) - 비동기
    		// 처리 + json
    		action = new QuestionLikeListService();
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("/questionWrite.do")) { //4. 회원 - 문의사항 글쓰기 페이지 이동
    		// 이동
    		forward = new ActionForward();
     		forward.setRedirect(false);
     		forward.setPath("/WEB-INF/views");
    	} else if(url_Command.equals("/questionWriteok.do")) { //5. 회원 - 문의사항 글쓰기 처리
    		// 이동 + 처리
    		action = new QuestionWriteOkService();
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("/questionWriteUpdate.do")) { //6. 회원 - 문의사항 글 수정 페이지 이동
    		//이동 + 처리
    		action = new QuestionUpdateService();
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("/questionWriteUpdateOk.do")) { //7. 회원 - 문의사항 글 수정 페이지 처리
    		//이동 + 처리
    		action = new QuestionUpdateOkService();
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("/questionDeleteOk.do")) { //8. 회원 - 문의사항 글 삭제 처리 기능
    		//이동 + 처리
    		action = new QuestionDeleteOkService();
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("/questionDetail.do")) { //9. 회원 - 문의사항 글 상세보기
    		//이동 + 처리
    		action = new QuestionDetailUserService();
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("/questionRewrite.do")) { // 10. 관리자 - 문의사항 답글 작성 페이지 이동 
    		// 이동+처리
    		action = new QuestionRewriteService();
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("/questionRewriteOk.do")) { //11. 회원(관리자) - 문의사항 답글 작성 처리
    		// 이동+처리
    		action = new QuestionRewriteOkService();
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("/questionAdminDetail.do")) { //12. 관리자 - 문의사항 글 상세보기
    		// 이동+처리
    		action = new QuestionDetailAdminService();
    		forward = action.execute(request, response);
    	}
    	//=================================================================//
    	//                                                     블로그
    	//=================================================================//
    	 else if(url_Command.equals("/blogAlllist.do")) { //13. 관리자 - 블로그 게시글 전체조회
     		// 이동+처리
     		action = new BlogAllListService();
     		forward = action.execute(request, response);
     	} else if(url_Command.equals("/blogLike.do")) { //14. 관리자 - 블로그 게시글 like 조회
    		// 이동+처리
    		action = new BlogLikeListService();
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("/blogEnter.do")) { //15. 회원 - 회원 블로그 페이지 보기
    		// 이동+처리
    		action = new BlogEnterService();
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("/blogWrite.do")) { //16. 회원 - 블로그 게시글 작성 페이지 이동
    		// 이동
    		forward = new ActionForward();
     		forward.setRedirect(false);
     		forward.setPath("/WEB-INF/views");
    	} else if(url_Command.equals("/blogWriteOk.do")) { // 17. 회원 - 블로그 게시글 작성 처리
    		// 이동 + 처리
    		action = new BlogWriteService();
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("/blogUpdate.do")) { // 18. 회원 - 블로그 게시글 수정 페이지 이동
    		// 이동+처리
    		action = new BlogUpdateService();
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("/blogUpdateOk.do")) { // 19. 회원 - 블로그 게시글 수정 처리
    		// 이동 + 처리
    		action = new BlogUpdateOkService();
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("/blogDeleteOk.do")) { // 20. 회원 - 블로그 게시글 삭제 처리
    		// 처리 + 이동 ( 비동기 ?)
    		action = new BlogDeleteService();
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("/blogDatail.do")) { //21. 회원 - 블로그 게시글 상세보기
    		// 이동 + 처리
    		action = new BlogDetailService();
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("/blogUpdate.do")) { //22.  관리자 - 블로그 게시글 수정 페이지 이동
    		// 이동 + 처리
    		action = new BlogAdminEdit();
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("/blogUpdateOk.do")) { //23. 관리자 - 블로그 게시글 수정 처리
    		// 이동+처리
    		action = new BlogAdminEditOk();
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("/blogDeleteOk.do")) { //24. 관리자 - 블로그 게시글 삭제 처리
    		// 처리+이동 (비동기?)
    		action = new BlogAdminDeleteService();
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("/blogAdminDetail.do")) { //25. 관리자 - 블로그 게시글 상세보기
    		// 이동+처리
    		action = new BlogAdminDetailService();
    		forward = action.execute(request, response);
    	}
    	//=================================================================//
    	//                                                     책
    	//=================================================================//
    	else if(url_Command.equals("/bookAlllist.do")) { // 26. 관리자 - 책 전체조회
    		// 이동 + 처리
    		action = new BookAllListService();
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("/bookUserLikeList.do")) { // 27. 회원 - 책 like 조회 ( 책검색 )
    		// 이동 + 처리
    		action = new BookLikeListService();
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("/bookAdminLikeList.do")) { // 28 .관리자 - 책 like 조회
    		// 처리 (비동기)
    		action = null;
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("/bookAdd.do")) { //29.관리자 - 책 추가 페이지 이동
    		// 이동
    		forward = new ActionForward();
     		forward.setRedirect(false);
     		forward.setPath("/WEB-INF/views");
    	} else if(url_Command.equals("/bookAddOk.do")) { //30.관리자 - 책 추가 처리
    		// 이동+처리
    		action = new BookAddService();
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("/bookUpdate.do")) { //31 관리자 - 책 수정 페이지 이동
    		// 이동+추가
    		forward = new ActionForward();
     		forward.setRedirect(false);
     		forward.setPath("/WEB-INF/views");
    	} else if(url_Command.equals("/bookUpdateOk.do")) { //32  관리자 - 책 수정 처리
    		// 이동+처리
    		action = new BookUpdateService();
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("/bookDeleteOk.do")) { //33 관리자 - 책 삭제 처리
    		// 처리(비동기?)
    		action = new BookDeleteService();
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("/bookDetail.do")) { //34.회원 - 책 상세보기 페이지 이동
    		// 이동+처리
    		action = new BookDetailService();
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("/bookAdminDetail.do")) { //35. 관리자 - 책 상세보기 페이지 이동
    		// 이동+처리
    		forward = new ActionForward();
     		forward.setRedirect(false);
     		forward.setPath("/WEB-INF/views");
    	} else if(url_Command.equals("/bookLike")) { //36.회원 - 책 좋아요 기능
    		// 처리(비동기)
    		action = new BookLikeService();
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("/bookRecommand.do")) { //37.관리자 - 추천책 설정 페이지 이동
    		// 이동+처리
    		action = new RecommandBookListService();
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("/bookRecommandAdd.do")) { //38.관리자 - 추천책 추가
    		// 처리 (비동기)
    		action = new RecommandBookAddService();
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("/bookRecommandDeleteOk.do")) { //39.관리자 - 추천책 삭제
    		// 이동+처리
    		action = new RecommandBookDeleteService();
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("/ebookList.do")) { //40. 회원 - e-book 리스트 페이지 이동
    		// 이동+처리
    		action = new EBookListService();
    		forward = action.execute(request, response);
    	}
     	//=================================================================//
     	//                                                     결제
     	//=================================================================//
    	else if(url_Command.equals("/cartList.do")) { //41 회원 - 장바구니 페이지 이동
    		// 이동+처리
    		action = new CartListService();
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("/cartAdd.do")) { //42 회원 - 장바구니 추가
    		// 비동기
    		action = new CartAddService();
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("/cartDeleteOk.do")) { //43 회원 - 장바구니 삭제
    		// 비동기
    		action = new CartDeleteService();
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("/payment.do")) { //44 회원 - 결제 페이지 이동
    		// 이동+처리
    		forward = new ActionForward();
     		forward.setRedirect(false);
     		forward.setPath("/WEB-INF/views");
    	} else if(url_Command.equals("/paymentOk.do")) { //45 회원 - 결제 처리
    		// 이동+처리
    		action = new PaymentService();
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("/paymentList.do")) { //46 회원 - 결제 내역 페이지 이동
    		// 이동+처리
    		action = new PaymentLogLikeIdListService();
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("/paymentAlllist.do")) { //47 관리자 - 결제 전체 조회 페이지 이동
    		// 이동+처리
    		action = new PaymentLogAllListService();
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("/paymentLike.do")) { //48 관리자 - 결제 id 검색 기능
    		// 비동기?
    		action = new PaymentLogLikeIdListService();
    		forward = action.execute(request, response);
    	}
     	//=================================================================//
     	//                                                     회원
     	//=================================================================//
    	 else if(url_Command.equals("")) { //49  회원 - 로그인 페이지 이동
     		// 이동
     		action = null;
     		forward = action.execute(request, response);
     	} else if(url_Command.equals("")) { //50  회원 - 로그인 처리 
    		// 이동+처리
    		action = null;
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("")) { //51  회원 - 회원가입 페이지 이동 
    		// 이동
    		action = null;
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("")) { //52 회원 - 회원가입 처리
    		// 이동+처리
    		action = null;
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("")) { //53 회원 - 마이페이지 이동
    		// 이동+처리
    		action = null;
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("")) { //54 회원 - 회원정보 수정 페이지 이동
    		// 이동+처리
    		action = null;
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("")) { //55 회원 - 회원정보 수정 처리
    		// 이동+처리
    		action = null;
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("")) { //56 회원 - 회원탈퇴 처리
    		// 이동+처리
    		action = null;
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("")) { //57 관리자 - 회원 리스트 페이지 이동
    		// 이동+처리
    		action = null;
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("")) { //58 관리자 - 회원 like 검색
    		// 비동기?
    		action = null;
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("")) { //59 관리자 - 회원 상세 페이지 이동
    		// 이동+처리
    		action = null;
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("")) { //60 관리자 - 회원정보 수정 페이지 이동
    		// 이동+처리
    		action = null;
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("")) { //61 관리자 - 회원 정보 수정 처리
    		// 이동+처리
    		action = null;
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("")) { //62 관리자 - 회원 삭제 처리
    		// 이동+처리
    		action = null;
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("")) { //63 회원 - 아이디 중복 체크
    		// 비동기
    		action = null;
    		forward = action.execute(request, response);
    	}
     	//=================================================================//
     	//                                                     통계페이지
     	//=================================================================// 
    	else if(url_Command.equals("")) { //64 관리자 - 통계 페이지 이동(남녀성비통계)
    		// 이동+처리
    		action = null;
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("")) { //65 관리자 - 연령 비율 통계
    		// 비동기
    		action = null;
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("")) { //66 관리자 - 일매출 통계
    		// 비동기
    		action = null;
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("")) { //67 관리자 - 월매출 통계
    		// 비동기
    		action = null;
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("")) { //68 관리자 - 주 매출 통계
    		// 비동기
    		action = null;
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("")) { //69 관리자 - 년 매출 통계
    		// 이동+처리
    		action = null;
    		forward = action.execute(request, response);
    	}
     	//=================================================================//
     	//                                                     일정관리 - 관리자 전용
     	//=================================================================//
    	else if(url_Command.equals("/calendarall.do")) { //70 일정관리 전체 페이지 이동 (관리자페이지)
    		// 이동+처리
    		System.out.println("calendarall.do 분기 진입");
    		action = new CalendarAllListService();
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("")) { //71 일정관리 검색
    		// 비동기
    		action = null;
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("")) { //72 일정 추가
    		// 비동기
    		action = null;
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("")) { //73 일정수정(비동기?동기?)
    		// 이동+처리
    		action = null;
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("")) { //74 일정수정처리(비동기면 없어도됨/동기면 만들어야됨)
    		// 이동+처리
    		action = null;
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("")) { //75 일정 삭제
    		// 비동기?
    		action = null;
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("")) { //76 일정상세보기
    		// 이동+처리
    		action = null;
    		forward = action.execute(request, response);
    	}
     	//=================================================================//
     	//                                                     팝업공지사항
     	//=================================================================// 
    	else if(url_Command.equals("")) { // 77 관리자 - 팝업 공지사항 전체 조회
    		// 이동+처리
    		action = null;
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("")) { //78 관리자 - 팝업 공지사항 like 조회
    		// 이동+처리
    		action = null;
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("")) { //79 관리자 - 팝업 공지사항 추가 페이지 이동
    		// 이동
    		action = null;
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("")) { //80 관리자 - 팝업 공지사항 추가 처리
    		// 이동+처리
    		action = null;
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("")) { //81 관리자 - 팝업 공지사항 수정 페이지 이동
    		// 이동+처리
    		action = null;
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("")) { //82 관리자 - 팝업 공지사항 수정 처리
    		// 이동+처리
    		action = null;
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("")) { //83 관리자 - 팝업 공지사항 삭제
    		// 이동+처리
    		action = null;
    		forward = action.execute(request, response);
    	} else if(url_Command.equals("")) { //84 관리자 - 팝업 공지사항 상세보기
    		// 이동+처리
    		action = null;
    		forward = action.execute(request, response);
    	}
    	 
    	//=================================================================//
    	//                                                     RequestDispatcher
    	//=================================================================//
    	if(forward != null) {
    		if(forward.isRedirect()) {
    			response.sendRedirect(forward.getPath());
    		} else {
    			RequestDispatcher dis = request.getRequestDispatcher(forward.getPath());
    			dis.forward(request, response);
    		}
    	}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
