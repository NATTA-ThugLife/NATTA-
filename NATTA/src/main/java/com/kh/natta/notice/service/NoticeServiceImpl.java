package com.kh.natta.notice.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.natta.notice.domain.Notice;
import com.kh.natta.notice.domain.Search;
import com.kh.natta.notice.store.NoticeStore;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeStore store;

	@Override
	public ArrayList<Notice> selectList() {
		return store.selectList();
	}

	@Override
	public int registerNotice(Notice notice) {
		return store.insertNotice(notice);
	}

	@Override
	public int modifyNotice(Notice notice) {
		return store.updateNotice(notice);
	}

	@Override
	public int deleteNotice(int noticeCode) {
		return store.deleteNotice(noticeCode);
	}

	@Override
	public Notice selectOne(int noticeCode) {
		return store.selectOne(noticeCode);
	}

	@Override
	public ArrayList<Notice> selectSearchList(Search search) {
		return store.selectSearchList(search);
	}

}
