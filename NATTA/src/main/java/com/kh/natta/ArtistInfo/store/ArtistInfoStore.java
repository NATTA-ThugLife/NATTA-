package com.kh.natta.ArtistInfo.store;

import java.util.ArrayList;

import com.kh.natta.ArtistInfo.domain.ArtistFollow;
import com.kh.natta.ArtistInfo.domain.ArtistInfo;
import com.kh.natta.ArtistInfo.domain.ArtistInfoPrice;
import com.kh.natta.artist.domain.Artist;
import com.kh.natta.artistWork.domain.ArtistWork;

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
	
	/**
	 * artist List
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
	 * artist 패키지에서 가져오기 회원정보
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
	
		
	/**
	 * artist follow list
	 * @param artistId
	 * @return
	 */
	public ArrayList<ArtistFollow> selectArtistFollow(String artistId);
	
	/**
	 * 팔로우 인서트
	 * @param af
	 * @return
	 */
	public int insertArtistFollow(ArtistFollow af);
	
	/**
	 * 팔로우 삭제
	 * @param af
	 * @return
	 */
	public int deleteArtistFollow(ArtistFollow af);	
	
	
	public ArtistFollow selectFollowing(ArtistFollow af);
	
}
