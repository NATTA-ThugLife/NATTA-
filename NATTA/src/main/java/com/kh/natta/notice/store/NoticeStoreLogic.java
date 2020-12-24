package com.kh.natta.notice.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.natta.notice.domain.Notice;
import com.kh.natta.notice.domain.Search;
import com.kh.natta.notice.service.NoticeService;

@Repository
public class NoticeStoreLogic implements NoticeStore{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Notice selectOne(int noticeCode) {
		return sqlSession.selectOne("noticeMapper.selectOne",noticeCode);
	}

	@Override
	public ArrayList<Notice> selectList() {
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList");
	}

	@Override
	public int insertNotice(Notice notice) {
		return sqlSession.insert("noticeMapper.insertNotce",notice);
	}

	@Override
	public int updateNotice(Notice notice) {
		int result = sqlSession.update("noticeMapper.updateNotice", notice);
		return result;
	}

	@Override
	public int deleteNotice(int noticeCode) {
		return sqlSession.delete("noticeMapper.deleteNotice",noticeCode);
	}

	@Override
	public int addReadCount(int noticeCode) {
		return sqlSession.update("noticeMapper.updateCount",noticeCode);
	}

	@Override
	public ArrayList<Notice> selectListSearch(Search search) {
		return (ArrayList)sqlSession.selectList("noticeMapper.searchList",search);
	}

	
}
