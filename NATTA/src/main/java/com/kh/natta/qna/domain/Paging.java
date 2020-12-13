package com.kh.natta.qna.domain;

public class Paging {
	
	private int currentPage; //현재 페이지
	private int qnaLimit;    //게시글 개수
	private int pageLimit;   //네비 개수
	private int startPage;   //네비 첫번째값
	private int endPage;     //네비 마지막값
	private int listCount;   //전체 게시글 개수
	private int maxPage;     //페이지 마지막 번호
	
	public Paging() {}

	public Paging(int currentPage, int qnaLimit, int pageLimit, int startPage, int endPage, int listCount,
			int maxPage) {
		super();
		this.currentPage = currentPage;
		this.qnaLimit = qnaLimit;
		this.pageLimit = pageLimit;
		this.startPage = startPage;
		this.endPage = endPage;
		this.listCount = listCount;
		this.maxPage = maxPage;
	}

	@Override
	public String toString() {
		return "Paging [currentPage=" + currentPage + ", qnaLimit=" + qnaLimit + ", pageLimit=" + pageLimit
				+ ", startPage=" + startPage + ", endPage=" + endPage + ", listCount=" + listCount + ", maxPage="
				+ maxPage + "]";
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getQnaLimit() {
		return qnaLimit;
	}

	public void setQnaLimit(int qnaLimit) {
		this.qnaLimit = qnaLimit;
	}

	public int getPageLimit() {
		return pageLimit;
	}

	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}


}
