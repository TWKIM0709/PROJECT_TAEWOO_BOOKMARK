package kr.or.kosa.service.payment;

import java.io.IOException;
import java.net.URI;
//import java.net.URI;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.kosa.action.Action;
import kr.or.kosa.action.ActionForward;

public class PaymentService implements Action {
//결제 api?? -> 결제 성공/실패 팝업으로 일단은 보류
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();
		
		try {
			//장바구니 >> 체크박스 선택 >> 결제 클릭 >> 토스 api 보여주고 >> 이 서비스로 이동
			//결제 책 목록(isbn목록) checkbox 선택된것들 >>  [] >> parameter이름 [selectedlist]
			//let sumprice = 1000 >> parameter sumpirce
			
			//<form action=???>
			//[v]어린왕자 2권 100
			//[ ]홍길동전 1권 100
			//[v]신데렐라 1권 100
			//        total        300
			//button onclick=함수
			//</form>
			
		} catch (Exception e) {
			
		} 
		
		/*
		 * 버튼클릭
		 * function(){
		 * 		토스api 보여주고
		 * 		form.submit();
		 * } */
		//팝업 보여주고 다른 페이지로
		request.setAttribute("msg","");
		request.setAttribute("url", "");
		return forward;
	}

}
