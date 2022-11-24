package kr.or.kosa.dto;

import java.util.Date;

public class Book_Payment {
	//결재리스트 중 책 하나의 정보를 담고 있는 DTO
	
	// -- 영수증 --
	// 1. 어린왕자 1권 100원    <<이거 하나
	// 2. 빨간망토 2권 200원
	// 3. 홍길동전 1권 200원
	// . . .
	// . . .
	private String payment_no; //책결재 번호
	private String isbn; //책 번호
	private int count; //책 구매 권수
	private Date payment_date; //결재일
	private int sumprice; //총 결재금액
	private String payment_addr;//우편번호
	private String payment_detailaddr; //주소 + 상세주소
	public Book_Payment(String payment_no, String isbn, int count, Date payment_date, int sumprice) {
		super();
		this.payment_no = payment_no;
		this.isbn = isbn;
		this.count = count;
		this.payment_date = payment_date;
		this.sumprice = sumprice;
	}
	public Book_Payment() {}
	public String getPayment_addr() {
		return payment_addr;
	}
	public void setPayment_addr(String payment_addr) {
		this.payment_addr = payment_addr;
	}
	public String getPayment_detailaddr() {
		return payment_detailaddr;
	}
	public void setPayment_detailaddr(String payment_detailaddr) {
		this.payment_detailaddr = payment_detailaddr;
	}
	public String getPayment_no() {
		return payment_no;
	}
	public void setPayment_no(String payment_no) {
		this.payment_no = payment_no;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Date getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}
	public int getSumprice() {
		return sumprice;
	}
	public void setSumprice(int sumprice) {
		this.sumprice = sumprice;
	}
	@Override
	public String toString() {
		return "Book_Payment [payment_no=" + payment_no + ", isbn=" + isbn + ", count=" + count + ", payment_date="
				+ payment_date + ", sumprice=" + sumprice + ", payment_addr=" + payment_addr + ", payment_detailaddr="
				+ payment_detailaddr + "]";
	}
}
