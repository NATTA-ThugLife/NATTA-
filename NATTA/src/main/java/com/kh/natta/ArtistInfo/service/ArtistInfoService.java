package com.kh.natta.ArtistInfo.service;

import java.util.ArrayList;

import com.kh.natta.ArtistInfo.domain.ArtistInfo;
import com.kh.natta.ArtistInfo.domain.ArtistInfoPrice;
import com.kh.natta.artist.domain.Artist;
import com.kh.natta.artistWork.domain.ArtistWork;

public interface ArtistInfoService {

	/**
	 * artist info insert !!
	 * @param artistInfo
	 * @return
	 */
	public int registerArtistInfo(ArtistInfo artistInfo);
	
	/**
	 * artist info update
	 * @param artistInfo
	 * @return
	 */
	public int updateArtistInfo(ArtistInfo artistInfo);	
	
	/**
	 * artist info selectList
	 * @return
	 */
	public ArrayList<ArtistInfo> selectListArtist();
	
	/**
	 * artist info selectOne
	 * @param artistId
	 * @return
	 */
	public ArtistInfo selectOneArtistInfo(String artistId);
	
	/**
	 * artist selectOne
	 * @param artistId
	 * @return
	 */
	public Artist selectOneArtist(String artistId);
	
	/**
	 * artist price selectOne
	 * @param artistId
	 * @return
	 */
	public ArrayList<ArtistInfoPrice> selectListArtistPrice(String artistId);
	
	
	/**
	 * artist work selectOne
	 * @param artistId
	 * @return
	 */
	public ArrayList<ArtistWork> selectListArtistWork(String artistId);
	


	
	
}
