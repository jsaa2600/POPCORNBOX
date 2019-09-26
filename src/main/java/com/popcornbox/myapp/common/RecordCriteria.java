package com.popcornbox.myapp.common;

public class RecordCriteria {
	
	// 필드
	final int NUM_PER_PAGE = 10;	// 페이지 내에 표시될 수
	
	private int reqPage;		// 요청 페이지
	private int numPerPage;		// 페이지 내에 표시될 수
	
	
	// 생성자
	public RecordCriteria() {} // 기본 생성자
	
	public RecordCriteria(int reqPage) {
		this.reqPage = reqPage;
		numPerPage = NUM_PER_PAGE;
	}
	
	public RecordCriteria(int reqPage, int numPerPage) {
		this.reqPage = reqPage;
		this.numPerPage = numPerPage;
	}


	// 메소드
	// 시작 레코드 번호
	public int getStartRecord() {
		return (reqPage - 1) * numPerPage + 1;
	}
	// 종료 레코드 번호
	public int getEndRecord() {
		return reqPage * numPerPage;
	}
	
	// toString
	@Override
	public String toString() {
		return "RecordCriteria[reqPage = " + reqPage + ", numPerPage = " + numPerPage + "]";
	}
	
	// getter
	public int getReqPage() {
		return reqPage;
	}
	public int getNumPerPage() {
		return numPerPage;
	}

	// setter
	public void setReqPage(int reqPage) {
		this.reqPage = reqPage;
	}
	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}

}
