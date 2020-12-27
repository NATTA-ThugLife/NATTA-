package com.kh.natta.ArtistInfo.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.natta.ArtistInfo.domain.ArtistFollow;
import com.kh.natta.ArtistInfo.domain.ArtistInfo;
import com.kh.natta.ArtistInfo.domain.ArtistInfoPrice;
import com.kh.natta.ArtistInfo.store.ArtistInfoStore;
import com.kh.natta.artist.domain.Artist;
import com.kh.natta.artistWork.domain.ArtistWork;
import com.kh.natta.common.PageInfo;
import com.kh.natta.customerInfo.domain.Review;
import com.kh.natta.reservation.domain.Reservation;

@Service
public class ArtistInfoServiceImpl implements ArtistInfoService{
	@Autowired
	private ArtistInfoStore infoStore;
	
	// Artist Info 등록! 
	@Override
	public int registerArtistInfo(ArtistInfo artistInfo) {
		return infoStore.insertArtistInfo(artistInfo);
	}
	
	// Artist Info 등록된 아티스트 전체 출력
	@Override
	public ArrayList<ArtistInfo> selectListArtist(PageInfo pi) {
		return infoStore.selectListArtist(pi);
	}

	@Override
	public ArtistInfo selectOneArtistInfo(String artistId) {
		return infoStore.selectOneArtistInfo(artistId);
	}

	@Override
	public Artist selectOneArtist(String artistId) {
		return infoStore.selectOneArtist(artistId);
	}

	@Override
	public int updateArtistInfo(ArtistInfo artistInfo) {
		return infoStore.updateArtistInfo(artistInfo);
	}

	@Override
	public ArrayList<ArtistInfoPrice> selectListArtistPrice(String artistId) {
		return infoStore.selectListArtistPrice(artistId);
	}

	@Override
	public ArrayList<ArtistWork> selectListArtistWork(String artistId, PageInfo pi) {
		return infoStore.selectListArtistWork(artistId, pi);
	}

	@Override
	public ArrayList<ArtistFollow> selectArtistFollow(String artistId) {
		return infoStore.selectArtistFollow(artistId);
	}

	@Override
	public int insertArtistFollow(ArtistFollow af) {
		return infoStore.insertArtistFollow(af);
	}

	@Override
	public int deleteArtistFollow(ArtistFollow af) {
		return infoStore.deleteArtistFollow(af);
	}

	@Override
	public ArtistFollow selectFollowing(ArtistFollow af) {
		return infoStore.selectFollowing(af);
	}

	@Override
	public ArrayList<Reservation> selectReList(String artistId) {
		return infoStore.selectReList(artistId);
	}

	@Override
	public int updateStatus(int reservationCode) {
		return infoStore.updateStatus(reservationCode);
	}

	@Override
	public int deleteStatus(int reservationCode) {
		return infoStore.deleteStatus(reservationCode);
	}
	
//아티스트 탈퇴
	@Override
	public int deleteArtist(String artistId) {
		return infoStore.deleteArtist(artistId);
	}
//아티스트 정보 수정
	@Override
	public int modifyArtistInfo(Artist artist) {
		return infoStore.modifyArtistInfo(artist);
	}
//정보 수정시 비번 체크
	@Override
	public Artist dupPwd2(Artist artist) {
		return infoStore.dupPwd2(artist);
	}

	@Override
	public Artist selectOne(String artistId) {
		return infoStore.selectOne(artistId);
	}

	

	@Override
	public int getListCount() {
		return infoStore.getListCount();
	}

	@Override
	public ArrayList<Review> selectListReview(String artistId, PageInfo pi) {
		return infoStore.selectListReview(artistId, pi);
	}

	@Override
	public int getListReviewCount(String artistId) {
		return infoStore.getListReviewCount(artistId);
	}

	@Override
	public ArrayList<ArtistInfo> selectListArtistInfo() {
		return infoStore.selectListArtistInfo();
	}

	@Override
	public ArrayList<ArtistInfo> selectListReviewInfo() {
		return infoStore.selectListReviewInfo();
	}

	@Override
	public ArrayList<ArtistInfo> selectListFollowInfo() {
		return infoStore.selectListFollowInfo();
	}



	@Override
	public int getWorkCount(String artistId) {
		return infoStore.getWorkCount(artistId);
	}




	
	
	
	
	
	
}
