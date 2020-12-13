package com.kh.natta.qna.store;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
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
		int result = sqlSession.selectOne("qnaMapper.getListCount");
		return result;
	}

	@Override
	public ArrayList<Qna> selectList(Paging pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getQnaLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getQnaLimit());
		return (ArrayList)sqlSession.selectList("qnaMapper.selectList",null,rowBounds);
	}

	@Override
	public int addReadCount(int qnaCode) {
		return sqlSession.update("qnaMapper.updateCount",qnaCode);
	}

	@Override
	public Qna selectQna(int qnaCode) {
		return sqlSession.selectOne("qnaMapper.selectOne",qnaCode);
	}

	@Override
	public int insertQna(Qna qna) {
		return sqlSession.insert("qnaMapper.insertQna",qna);
	}

	@Override
	public int updateQna(Qna qna) {
		return sqlSession.update("qnaMapper.updateQna",qna);
	}

	@Override
	public int deleteQna(int qnaCode) {
		return sqlSession.update("qnaMapper.deleteQna",qnaCode);
	}

	@Override
	public int insertQnaComment(QnaComment qnacomment) {
		return sqlSession.insert("qnaMapper.insertQnaComment",qnacomment);
	}

	@Override
	public ArrayList<QnaComment> selectQnaCommentList(int qnaCode) {
		return (ArrayList)sqlSession.selectList("qnaMapper.selectQnaCommentList",qnaCode);
	}

	
}
