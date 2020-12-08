package com.kh.natta.ArtistInfo.store;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.natta.ArtistInfo.domain.ArtistInfo;

@Repository
public class ArtistInfoStoreLogic implements ArtistInfoStore {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public int insertArtistInfo(ArtistInfo artistInfo) {
		return sqlSession.insert("ArtistInfoMapper.insertArtistInfo", artistInfo);
	}

}
