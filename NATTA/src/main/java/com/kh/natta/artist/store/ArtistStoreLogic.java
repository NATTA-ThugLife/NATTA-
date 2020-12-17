package com.kh.natta.artist.store;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.natta.artist.domain.Artist;

@Repository
public class ArtistStoreLogic implements ArtistStore{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Artist selectOneArtist(Artist artist) {
		Artist loginArtist = sqlSession.selectOne("artistMapper.selectOne",artist);
		return loginArtist;
	}


	@Override public int checkIdDup(String artistId) { 
		int result =sqlSession.selectOne("artistMapper.checkIdDup",artistId);
		return result; 
	}

	@Override
	public int checkEmailDup(String email2) {
		int result =sqlSession.selectOne("artistMapper.checkEmailDup",email2);
		return result; 
	}


	@Override
	public int insertArtist(Artist artist) {
		int result = sqlSession.insert("artistMapper.insertArtist",artist);
		return result;
	}




}
