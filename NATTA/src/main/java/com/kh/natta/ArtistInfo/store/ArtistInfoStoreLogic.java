package com.kh.natta.ArtistInfo.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.natta.ArtistInfo.domain.ArtistInfo;
import com.kh.natta.ArtistInfo.domain.ArtistInfoPrice;
import com.kh.natta.artist.domain.Artist;
import com.kh.natta.artistWork.domain.ArtistWork;

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
	public int updateArtistInfo(ArtistInfo artistInfo) {
		return sqlSession.update("ArtistInfoMapper.updateArtistInfo",artistInfo);
	}

	@Override
	public ArtistInfoPrice selectStylePrice(ArtistInfoPrice ap) {
		return sqlSession.selectOne("ArtistInfoMapper.insertArtistPrice", ap);
	}

	@Override
	public ArtistInfo selectOneArtistInfo(String artistId) {
		return sqlSession.selectOne("ArtistInfoMapper.selectOneArtist", artistId);
	}	
	
	@Override
	public Artist selectOneArtist(String artistId) {
		return sqlSession.selectOne("artistMapper.selectOneArtist", artistId);
	}

	@Override
	public ArrayList<ArtistInfoPrice> selectListArtistPrice(String artistId) {
		return (ArrayList)sqlSession.selectList("ArtistInfoPriceMapper.selectOneArtist", artistId);
	}

	@Override
	public ArrayList<ArtistWork> selectListArtistWork(String artistId) {
		return (ArrayList)sqlSession.selectList("ArtistWorkMapper.selectOneArtist", artistId);
	}

	

}
