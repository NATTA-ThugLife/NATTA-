package com.kh.natta.ArtistInfo.store;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.natta.ArtistInfo.domain.ArtistInfoPrice;


@Repository
public class ArtistInfoPriceStoreLogic implements ArtistInfoPriceStore{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArtistInfoPrice selectStylePrice(ArtistInfoPrice ap) {
		return sqlSession.selectOne("ArtistInfoPriceMapper.selectArtistPrice", ap);
	}

	@Override
	public int updateArtistPrice(ArtistInfoPrice ap) {
		return sqlSession.update("ArtistInfoPriceMapper.updateArtistPrice", ap);
	}

	@Override
	public int insertArtistPrice(ArtistInfoPrice ap) {
		return sqlSession.insert("ArtistInfoPriceMapper.insertArtistPrice", ap);
	}

	
}
