package com.kh.natta.ArtistInfo.domain;

import com.kh.natta.common.PageInfo;

public class WorkPagination {
	public static PageInfo getPageInfo(int currentPage, int listCount) {
		PageInfo pi = null;
		int pageLimit = 5; 
		int maxPage;		
		int startPage;	
		int endPage;		
		int boardLimit = 12; 
		maxPage = (int)((double)listCount/boardLimit + 0.9);
		startPage = ((int)((double)currentPage / pageLimit + 0.9) -1) * pageLimit +1;
		endPage = startPage + pageLimit -1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		pi = new PageInfo(currentPage,boardLimit,pageLimit,startPage,endPage,listCount,maxPage);
		return pi;
	}
}
