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
	
	
}
