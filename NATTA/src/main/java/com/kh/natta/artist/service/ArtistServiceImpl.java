package com.kh.natta.artist.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.natta.artist.domain.Artist;
import com.kh.natta.artist.store.ArtistStore;

@Service
public class ArtistServiceImpl implements ArtistService{
	
	@Autowired
	private ArtistStore store;

	@Override
	public Artist loginArtist(Artist artist) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int checkIdDup(String artistId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int registerArtist(Artist artist) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyArtist(Artist artist) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteArtist(String artistId) {
		// TODO Auto-generated method stub
		return 0;
	}

}
