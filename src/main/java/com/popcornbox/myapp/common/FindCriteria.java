package com.popcornbox.myapp.common;

public class FindCriteria extends RecordCriteria {
	
	// 필드
	private String searchType;		// 검색 타입
	private String keyword;			// 검색어
	
	
	// 생성자
	public FindCriteria() {
		super();
	}
	
	public FindCriteria(int reqPage, int numPerPage) {
		super(reqPage, numPerPage);
	}
	public FindCriteria(int reqPage, int numPerPage, String searchType, String keyword) {
		this(reqPage, numPerPage);
		this.searchType = searchType;
		this.keyword = keyword;
	}
	
	
	// 메소드
	// toString
	@Override
	public String toString() {
		return "FindCriteria [searchType=" + searchType + ", keyword=" + keyword + "]";
	}
	
	// getter
	public String getSearchType() {
		return searchType;
	}
	public String getKeyword() {
		return keyword;
	}

	// setter
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
}
