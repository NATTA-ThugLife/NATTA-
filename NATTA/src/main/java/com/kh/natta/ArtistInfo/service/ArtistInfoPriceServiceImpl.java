package com.kh.natta.ArtistInfo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.natta.ArtistInfo.domain.ArtistInfoPrice;
import com.kh.natta.ArtistInfo.store.ArtistInfoPriceStore;

@Service
public class ArtistInfoPriceServiceImpl implements ArtistInfoPriceService {
	@Autowired
	private ArtistInfoPriceStore ifpStore;

	@Override
	public ArtistInfoPrice selectStylePrice(ArtistInfoPrice ap) {
		return ifpStore.selectStylePrice(ap);
	}

	@Override
	public int updateArtistPrice(ArtistInfoPrice ap) {
		return ifpStore.updateArtistPrice(ap);
	}

	@Override
	public int insertArtistPrice(ArtistInfoPrice ap) {
		return ifpStore.insertArtistPrice(ap);
	}
	
	

}
