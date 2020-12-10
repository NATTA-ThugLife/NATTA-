package com.kh.natta.notice.store;

import java.util.ArrayList;

import com.kh.natta.notice.domain.Notice;
import com.kh.natta.notice.domain.Search;

public interface NoticeStore {	

	public Notice selectOne(int noticeCode);
	
	public ArrayList<Notice> selectList();
	
	public int insertNotice(Notice notice);
	
	public int updateNotice(Notice notice);
	
	public int deleteNotice(int noticeCode);
	
	public ArrayList<Notice> selectSearchList(Search search);

}
