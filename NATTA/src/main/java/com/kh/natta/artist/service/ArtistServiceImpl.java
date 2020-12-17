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
		return store.selectOneArtist(artist);
	}

	@Override public int checkIdDup(String artistId) { 
		return store.checkIdDup(artistId); 
	}
	
	@Override
	public int checkEmailDup(String email2) {
		return store.checkEmailDup(email2);
	}
	 

	@Override
	public int registerArtist(Artist artist) {
		return store.insertArtist(artist);
	}

	

}
