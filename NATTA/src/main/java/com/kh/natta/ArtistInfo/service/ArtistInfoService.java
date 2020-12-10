package com.kh.natta.ArtistInfo.service;

import java.util.ArrayList;

import com.kh.natta.ArtistInfo.domain.ArtistInfo;

public interface ArtistInfoService {

	/**
	 * artist info insert !!
	 * @param artistInfo
	 * @return
	 */
	public int registerArtistInfo(ArtistInfo artistInfo);
	
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
	public ArtistInfo selectOneArtist(String artistId);
}
