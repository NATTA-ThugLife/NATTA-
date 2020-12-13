package com.kh.natta.artistWork.store;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ArtistWorkStoreLogic implements ArtistWorkStore {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
}
