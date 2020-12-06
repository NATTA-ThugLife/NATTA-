package com.kh.natta.artist.store;

import com.kh.natta.artist.domain.Artist;

public interface ArtistStore {
	
	public Artist selectOneArtist(Artist artist);
	
    public int checkIdDup(String artistId);
	
	public int insertArtist(Artist artist);
	
	public int updateArtist(Artist artist);
	
	public int deleteArtist(String artistId);

}
