package com.kh.natta.qna.store;

import java.util.ArrayList;

import com.kh.natta.qna.domain.Paging;
import com.kh.natta.qna.domain.Qna;
import com.kh.natta.qna.domain.QnaComment;

public interface QnaStore {
	
	public int getListCount();
	/**
	 * 게시판 전체 조회
	 * @return
	 */
	public ArrayList<Qna> selectList(Paging pi);
	/**
	 * 게시판 상세 조회시 조회수 증가
	 * @param qnaCode
	 * @return
	 */
	public int addReadCount(int qnaCode);
	
	public Qna selectQna(int qnaCode);
	
	public int insertQna(Qna qna);
	
	public int updateQna(Qna qna);
	
	public int deleteQna(int qnaCode);
	
	/**
	 * 게시글 댓글 증록
	 * @param qnacomment
	 * @return
	 */
	public int insertQnaComment(QnaComment qnacomment);
	
	/**
	 * 게시글 댓글 조회
	 * @param qnaCode
	 * @return
	 */
	public ArrayList<QnaComment> selectQnaCommentList(int qnaCode);

}
