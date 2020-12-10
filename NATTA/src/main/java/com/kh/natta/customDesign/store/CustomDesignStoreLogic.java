package com.kh.natta.customDesign.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.natta.customDesign.domain.CustomComment;
import com.kh.natta.customDesign.domain.CustomDesign;

@Repository
public class CustomDesignStoreLogic implements CustomDesignStore{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertCustomDesign(CustomDesign customDesign) {
		return sqlSession.insert("CustomDesignMapper.insertCustomDesign",customDesign);
	}

	@Override
	public ArrayList<CustomDesign> selectList() {
		return (ArrayList)sqlSession.selectList("CustomDesignMapper.selectListCustomDesign");
	}

	@Override
	public CustomDesign selectcustomDesign(int customCode) {
		return sqlSession.selectOne("CustomDesignMapper.selectOneCustomDesign",customCode);
	}

	@Override
	public int modifyCustomDesign(CustomDesign customDesign) {
		return sqlSession.update("CustomDesignMapper.updateCustomDesign",customDesign);
	}

	@Override
	public int deleteCustomDesign(int customCode) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertCustomComment(CustomComment customComment) {
		return sqlSession.insert("CustomDesignMapper.insertComment",customComment);
	}

	@Override
	public ArrayList<CustomComment> selectListComment(int customCode) {
		return (ArrayList)sqlSession.selectList("CustomDesignMapper.selectListComment",customCode);
	}

	@Override
	public int modifyCustomComment(CustomComment customComment) {
		return sqlSession.update("CustomDesignMapper.updateCustomComment",customComment);
	}

	@Override
	public int deleteCustomComment(int customCCode) {
		return sqlSession.delete("CustomDesignMapper.deleteCustomComment",customCCode);
	}

}
