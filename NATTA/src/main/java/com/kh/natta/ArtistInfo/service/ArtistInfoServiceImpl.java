package com.kh.natta.ArtistInfo.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.natta.ArtistInfo.domain.ArtistInfo;
import com.kh.natta.ArtistInfo.domain.ArtistInfoPrice;
import com.kh.natta.ArtistInfo.store.ArtistInfoStore;
import com.kh.natta.artist.domain.Artist;
import com.kh.natta.artistWork.domain.ArtistWork;

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
	public ArrayList<ArtistInfo> selectListArtist() {
		return infoStore.selectListArtist();
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
	public ArrayList<ArtistWork> selectListArtistWork(String artistId) {
		return infoStore.selectListArtistWork(artistId);
	}




	
	
	
	
	
	
}
