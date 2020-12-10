package com.kh.natta.qna.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.natta.qna.domain.Paging;
import com.kh.natta.qna.domain.Qna;
import com.kh.natta.qna.domain.QnaComment;

@Repository
public class QnaStoreLogic implements QnaStore{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return 0;
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
	public int insertQna(Qna qna) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateQna(Qna qna) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteQna(int qnaCode) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertQnaComment(QnaComment qnacomment) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<QnaComment> selectQnaCommentList(int qnaCode) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
