package com.kh.natta.qna.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.natta.notice.store.NoticeStore;
import com.kh.natta.qna.domain.Paging;
import com.kh.natta.qna.domain.Qna;
import com.kh.natta.qna.domain.QnaComment;
import com.kh.natta.qna.store.QnaStore;

@Service
public class QnaServiceImpl implements QnaService{
	
	@Autowired
	private QnaStore store;

	@Override
	public int getListCount() {
		return store.getListCount();
	}

	@Override
	public ArrayList<Qna> selectList(Paging pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int addReadCount(int qnaCode) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Qna selectQna(int qnaCode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int registerQna(Qna qna) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyQna(Qna qna) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteQna(int qnaCode) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertQnaComment(QnaComment reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<QnaComment> selectQnaCommentList(int qnaCode) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
