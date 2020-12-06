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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int checkIdDup(String artistId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertArtist(Artist artist) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateArtist(Artist artist) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteArtist(String artistId) {
		// TODO Auto-generated method stub
		return 0;
	}

}
