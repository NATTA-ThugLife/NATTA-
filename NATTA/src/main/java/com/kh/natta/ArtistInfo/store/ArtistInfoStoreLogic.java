package com.kh.natta.ArtistInfo.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.natta.ArtistInfo.domain.ArtistInfo;

@Repository
public class ArtistInfoStoreLogic implements ArtistInfoStore {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// Artist Info 등록!
	@Override
	public int insertArtistInfo(ArtistInfo artistInfo) {
		return sqlSession.insert("ArtistInfoMapper.insertArtistInfo", artistInfo);
	}

	// Artist Info 등록된 아티스트 전체 출력
	@Override
	public ArrayList<ArtistInfo> selectListArtist() {
		return (ArrayList)sqlSession.selectList("ArtistInfoMapper.selectListArtist");
	}

	@Override
	public ArtistInfo selectOneArtist(String artistId) {
		return sqlSession.selectOne("ArtistInfoMapper.selectOneArtist", artistId);
	}

}
