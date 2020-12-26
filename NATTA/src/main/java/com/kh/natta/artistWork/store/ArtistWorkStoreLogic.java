package com.kh.natta.artistWork.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.natta.ArtistInfo.domain.ArtistInfoPrice;
import com.kh.natta.artistWork.domain.ArtistWork;

@Repository
public class ArtistWorkStoreLogic implements ArtistWorkStore {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<ArtistInfoPrice> selectArtistStyle(String artistId) {
		return (ArrayList)sqlSession.selectList("ArtistInfoPriceMapper.selectArtistStyle", artistId);
	}

	@Override
	public int insertArtistWork(ArtistWork work) {
		return sqlSession.insert("ArtistWorkMapper.insertArtistWork", work);
	}

	@Override
	public int deleteArtistWork(int workCode) {
		return sqlSession.delete("ArtistWorkMapper.deleteArtistWork", workCode);
	}

	@Override
	public int updateArtistWork(ArtistWork work) {
		return sqlSession.update("ArtistWorkMapper.updateArtistWork", work);
	}

	@Override
	public ArtistWork selectArtistWork(int workCode) {
		return sqlSession.selectOne("ArtistWorkMapper.selectArtistWork", workCode);
	}


	
	
}
