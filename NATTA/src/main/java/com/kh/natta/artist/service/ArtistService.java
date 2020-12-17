package com.kh.natta.artist.service;

import com.kh.natta.artist.domain.Artist;

public interface ArtistService {
	
	public Artist loginArtist(Artist artist);
	
	public int checkIdDup(String artistId); 
	
	public int checkEmailDup(String email2); 
	
	public int registerArtist(Artist artist);
}
