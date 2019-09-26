package com.popcornbox.myapp.common;

public class PageCriteria {
	
	// 필드
	private int pageNumPerPage;		// 한 페이지에 보여줄 페이지
	private int startPage;			// 한 페이지의 시작페이지
	private int endPage;			// 한 페이지의 종료페이지
	
	private int totalRec;			// 전체 레코드 수
	private int finalEndPage;		// 최종 페이지
	
	private boolean prev;			// 이전 페이지
	private boolean next;			// 다음 페이지
	
	private RecordCriteria rc;
	
	
	// 생성자
	public PageCriteria() {}; // 기본 생성자
	public PageCriteria(RecordCriteria rc, int totalRec, int pageNumPerPage) {
		this.rc = rc;
		this.totalRec = totalRec;
		this.pageNumPerPage = pageNumPerPage;
		init();
	}
	
	
	// 메소드
	// init
	private void init() {
		// 1) endPage 계산 : 
		endPage = (int)(Math.ceil(this.rc.getReqPage() / (double)this.pageNumPerPage)) * this.pageNumPerPage;
		
		// 2) startPage 계산 : 
		startPage = this.endPage - this.pageNumPerPage + 1;
		
		// 3) finalEndPage 계산 : 
		finalEndPage = (int)Math.ceil((this.totalRec) / (double)rc.getNumPerPage());
		if(finalEndPage < endPage) {
			endPage = finalEndPage;
		}
		
		// 4) prev 계산 : 혀내 페이지의 시작페이지가 
		prev = (startPage != 1) ? true : false;
		
		// 5) next 계산 : 
		next = (endPage * rc.getNumPerPage() < totalRec) ? true : false;
	}
	
	// makeURL
	public String makeURL() {
		StringBuffer str = new StringBuffer();
		
		if(rc.getReqPage() != 0) {
			str.append("reqPage=" + rc.getReqPage());
		}
		
		return str.toString();
	}
	
	// makeSearchURL
	public String makeSearchURL(int reqPage) {
		StringBuffer str = new StringBuffer();
		str.append("reqPage=" + reqPage);
		return str.toString();
	}
	
	// getSearchType
	public String getSearchType() {
		String searchType = null;
		
		if(rc instanceof FindCriteria) {
			searchType = ((FindCriteria)rc).getSearchType();
		}
		
		return searchType;
	}
	
	// getKeyword
	public String getKeyword() {
		String keyword = null;
		
		if(rc instanceof FindCriteria) {
			keyword = ((FindCriteria)rc).getKeyword();
		}
		
		return keyword;
	}
	
	// toString
	@Override
	public String toString() {
		return "PageCriteria [pageNumPerPage=" + pageNumPerPage + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", totalRec=" + totalRec + ", finalEndPage=" + finalEndPage + ", prev=" + prev + ", next=" + next
				+ ", rc=" + rc + "]";
	}
	
	// getter
	public int getPageNumPerPage() {
		return pageNumPerPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public int getTotalRec() {
		return totalRec;
	}
	public int getFinalEndPage() {
		return finalEndPage;
	}
	public RecordCriteria getRc() {
		return rc;
	}
	public boolean isPrev() {
		return prev;
	}
	public boolean isNext() {
		return next;
	}

	// setter
	public void setPageNumPerPage(int pageNumPerPage) {
		this.pageNumPerPage = pageNumPerPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public void setTotalRec(int totalRec) {
		this.totalRec = totalRec;
	}
	public void setFinalEndPage(int finalEndPage) {
		this.finalEndPage = finalEndPage;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public void setRc(RecordCriteria rc) {
		this.rc = rc;
	}
}
