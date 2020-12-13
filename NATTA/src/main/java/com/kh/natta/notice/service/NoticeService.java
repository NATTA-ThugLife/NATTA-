package com.kh.natta.notice.service;

import java.util.ArrayList;

import com.kh.natta.notice.domain.Notice;
import com.kh.natta.notice.domain.Search;

public interface NoticeService {
	
	public ArrayList<Notice> selectList();
	
	public int registerNotice(Notice notice);
	
	public int modifyNotice(Notice notice);
	
	public int deleteNotice(int noticeCode);
	
	public Notice selectOne(int noticeCode);
	
	public ArrayList<Notice> selectSearchList(Search search);
	
	public int addReadCount(int noticeCode);

}
