package com.kh.natta.artistWork.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.natta.artistWork.store.ArtistWorkStore;

@Service
public class ArtistWorkServiceImpl implements ArtistWorkService {

	@Autowired
	private ArtistWorkStore awStore;
	
	
}
