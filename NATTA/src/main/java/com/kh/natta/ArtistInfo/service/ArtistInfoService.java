package com.kh.natta.ArtistInfo.service;

import java.util.ArrayList;

import com.kh.natta.ArtistInfo.domain.ArtistFollow;
import com.kh.natta.ArtistInfo.domain.ArtistInfo;
import com.kh.natta.ArtistInfo.domain.ArtistInfoPrice;
import com.kh.natta.artist.domain.Artist;
import com.kh.natta.artistWork.domain.ArtistWork;
import com.kh.natta.common.PageInfo;
import com.kh.natta.customerInfo.domain.Review;
import com.kh.natta.reservation.domain.Reservation;

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
	public ArrayList<ArtistInfo> selectListArtist(PageInfo pi);
	
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
	

	/**
	 * artist follow list
	 * @param artistId
	 * @return
	 */
	public ArrayList<ArtistFollow> selectArtistFollow(String artistId);
	
	
	/**
	 * 팔로우 등록
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
	/**
	 * 팔로우 유무
	 * @param af
	 * @return
	 */
	public ArtistFollow selectFollowing(ArtistFollow af);
	
	
	/**
	 * 고객 예약정보 목록 불러오기 
	 * @param artistId
	 * @return
	 */
	public ArrayList<Reservation> selectReList(String artistId);
	
	/**
	 * 예약 상태 업데이트
	 * @param reservationCode
	 * @return
	 */
	public int updateStatus(int reservationCode);
	
	/**
	 * 예약대기 상태일 때 예약삭제
	 * @param reservationCode
	 * @return
	 */
	public int deleteStatus(int reservationCode);
	/**
	 * 페이징
	 * @return
	 */
	public int getListCount();
	public int getListReviewCount(String artistId);
	
	public ArrayList<Review> selectListReview(String artistId, PageInfo pi);
}
