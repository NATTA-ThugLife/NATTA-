package com.kh.natta.ArtistInfo.store;

import java.util.ArrayList;

import com.kh.natta.ArtistInfo.domain.ArtistInfo;
import com.kh.natta.ArtistInfo.domain.ArtistInfoPrice;
import com.kh.natta.artist.domain.Artist;

public interface ArtistInfoStore {

	
	/**
	 * artist info insert
	 * @param artistInfo
	 * @return
	 */
	public int insertArtistInfo(ArtistInfo artistInfo);
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
	
	/**
	 * artist 패키지에서 가져오기 회원정보
	 * @param artistId
	 * @return
	 */
	public Artist selectArtist(String artistId);
	
	/**
	 * 정보수정하는 메소드
	 * @param artistInfo
	 * @return
	 */
	public int updateArtistInfo(ArtistInfo artistInfo);
	
	
	/**
	 * artistId와 tattoStyle 에 맞는 사이즈별 가격가져오는 메소드 (ajax)
	 * @param artistId
	 * @param tattoStyle
	 * @return
	 */
	public ArtistInfoPrice selectStylePrice(ArtistInfoPrice ap);
	
	
	
	
	
	
	
}
