package com.kh.natta.artistWork.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.natta.ArtistInfo.domain.ArtistInfoPrice;
import com.kh.natta.artistWork.domain.ArtistWork;
import com.kh.natta.artistWork.store.ArtistWorkStore;

@Service
public class ArtistWorkServiceImpl implements ArtistWorkService {

	@Autowired
	private ArtistWorkStore awStore;

	@Override
	public ArrayList<ArtistInfoPrice> selectArtistStyle(String artistId) {
		return awStore.selectArtistStyle(artistId);
	}

	@Override
	public int insertArtistWork(ArtistWork work) {
		return awStore.insertArtistWork(work);
	}

	@Override
	public int deleteArtistWork(int workCode) {
		return awStore.deleteArtistWork(workCode);
	}

	@Override
	public int updateArtistWork(ArtistWork work) {
		return awStore.updateArtistWork(work);
	}

	@Override
	public ArtistWork selectArtistWork(int workCode) {
		return awStore.selectArtistWork(workCode);
	}

	
	
	
}
