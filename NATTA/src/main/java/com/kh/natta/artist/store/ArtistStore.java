package com.kh.natta.artist.store;

import com.kh.natta.artist.domain.Artist;

public interface ArtistStore {
	
	public Artist selectOneArtist(Artist artist);
	
	public int checkIdDup(String artistId); 
	 
	public int checkEmailDup(String email2);
	
	public int insertArtist(Artist artist);

	

}
