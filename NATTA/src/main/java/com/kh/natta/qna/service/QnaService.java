package com.kh.natta.qna.service;

import java.util.ArrayList;

import com.kh.natta.qna.domain.Paging;
import com.kh.natta.qna.domain.Qna;
import com.kh.natta.qna.domain.QnaComment;

public interface QnaService {
	
	/**
	 * 게시판 전체 수 조회
	 * @return
	 */
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
	
	public int registerQna(Qna qna);
	
	public int modifyQna(Qna qna);
	
	public int deleteQna(int qnaCode);
	
	/**
	 * 게시판 댓글 등록
	 * @param qnacomment
	 * @return
	 */
	public int insertQnaComment(QnaComment qnaComment);
	
	/**
	 * 게시글 댓글 조회
	 * @param qnaCode
	 * @return
	 */
	public ArrayList<QnaComment> selectQnaCommentList(int qnaCode);

}
