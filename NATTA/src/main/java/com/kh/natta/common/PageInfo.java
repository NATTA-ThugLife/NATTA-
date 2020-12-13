package com.kh.natta.common;

public class PageInfo {
		// 현재 페이지
		// 몇개 게시글
		// 몇개의 네비게이션
		// 네비게이션 첫번째값
		// 네비게이션 마지막값
		// 전체 게시글 갯수
		// 페이지 마지막 번호
		private int currentPage;
		private int boardLimit;
		private int pageLimit;
		private int startPage;
		private int endPage;
		private int listCount;
		private int maxPage;

		public PageInfo() {}

		public PageInfo(int currentPage, int boardLimit, int pageLimit, int startPage, int endPage, int listCount,
				int maxPage) {
			super();
			this.currentPage = currentPage;
			this.boardLimit = boardLimit;
			this.pageLimit = pageLimit;
			this.startPage = startPage;
			this.endPage = endPage;
			this.listCount = listCount;
			this.maxPage = maxPage;
		}

		@Override
		public String toString() {
			return "PageInfo [currentPage=" + currentPage + ", boardLimit=" + boardLimit + ", pageLimit=" + pageLimit
					+ ", startPage=" + startPage + ", endPage=" + endPage + ", listCount=" + listCount + ", maxPage="
					+ maxPage + "]";
		}

		public int getCurrentPage() {
			return currentPage;
		}

		public void setCurrentPage(int currentPage) {
			this.currentPage = currentPage;
		}

		public int getBoardLimit() {
			return boardLimit;
		}

		public void setBoardLimit(int boardLimit) {
			this.boardLimit = boardLimit;
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
