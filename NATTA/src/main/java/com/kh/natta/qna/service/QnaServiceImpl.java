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
		return store.selectList(pi);
	}

	@Override
	public int addReadCount(int qnaCode) {
		return store.addReadCount(qnaCode);
	}

	@Override
	public Qna selectQna(int qnaCode) {
		return store.selectQna(qnaCode);
	}

	@Override
	public int registerQna(Qna qna) {
		return store.insertQna(qna);
	}

	@Override
	public int modifyQna(Qna qna) {
		return store.updateQna(qna);
	}

	@Override
	public int deleteQna(int qnaCode) {
		return store.deleteQna(qnaCode);
	}

	@Override
	public int insertQnaComment(QnaComment qnaComment) {
		return store.insertQnaComment(qnaComment);
	}

	@Override
	public ArrayList<QnaComment> selectQnaCommentList(int qnaCode) {
		return store.selectQnaCommentList(qnaCode);
	}

	
}
