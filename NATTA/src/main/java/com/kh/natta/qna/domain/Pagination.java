package com.kh.natta.qna.domain;

import com.kh.natta.qna.domain.Paging;

public class Pagination {
	
	public static Paging getPaging(int currentPage, int listCount) {

		Paging pi = null;
		int pageLimit = 5; // 한 페이지에서 보여줄 네비게이션 수
		int maxPage;		// 전체 페이지 중 가장 마지막 페이지
		int startPage;		// 현재 페이지에서 시작하는 첫번째 페이지
		int endPage;		// 현재 페이지에서 끝나는 마지막 페이지
		int boardLimit = 10; // 한 페이지에서 보여줄 게시글 갯수
		// 전체 게시글 갯수 123 한 페이지당 5개씩
		// 총 페이지수는 25 페이지 
		// 0.1일 때 int로 형변환하면 나머지 게시글이 짤리기 때문에
		// 0.9 더해서 더 크게 만들어줌
		maxPage = (int)((double)listCount/boardLimit + 0.9);
		// 현재 페이지에서 시작하는 첫번째 페이지 값
		startPage = ((int)((double)currentPage / pageLimit + 0.9) -1) * pageLimit +1;
		// 현재 페이지에서 끝나는 마지막 페이지 값
		endPage = startPage + pageLimit -1;
		// 오류 방지용
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		pi = new Paging(currentPage,boardLimit,pageLimit,startPage,endPage,listCount,maxPage);
		return pi;
	}
}
