package com.kh.natta.customDesign.store;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.natta.common.PageInfo;
import com.kh.natta.customDesign.domain.CustomComment;
import com.kh.natta.customDesign.domain.CustomDesign;
import com.kh.natta.customDesign.domain.Search;

@Repository
public class CustomDesignStoreLogic implements CustomDesignStore{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertCustomDesign(CustomDesign customDesign) {
		return sqlSession.insert("CustomDesignMapper.insertCustomDesign",customDesign);
	}

	@Override
	public ArrayList<CustomDesign> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		// 우리가 원래 페이징 처리 처리를 하기 위해서는
		// 쿼리문을 ROWNUM을 이용해서 바꿔주었음.
		// Mybatis에서는 ROWNUM을 사용하지 않아도 페이징 처리할 수 있게해주는
		// RowBounds라는 것이 있어서 이것을 사용하려고 함.
		// RowBounds의 동작은 offset값과 limit값으로 동작을 함.
		// offset값은 변하는 값이고 limit값은 고정값임.
		// limit값이 한 페이지당 보여주고 싶은 게시물의 갯수가 됨
		// offset : 0, limit : 10
		// 0건을 건너뛰고 10개를 가져옴 (selectList한 결과 값에서)
		// offset : 10, limit : 10
		// 10건을 건너뛰고 10개를 가져옴 (selectList한 결과 값에서)
		// RowBounds를 사용하면 쿼리문을 수정하지 않아도 페이징 처리를 할 수 있음.
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("CustomDesignMapper.selectListCustomDesign",null,rowBounds);
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
		return sqlSession.update("CustomDesignMapper.deleteCustomDesign",customCode);
	}

	@Override
	public int insertCustomComment(CustomComment customComment) {
		return sqlSession.insert("CustomDesignMapper.insertComment",customComment);
	}

	@Override
	public ArrayList<CustomComment> selectListComment(int customCode,PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", offset);
		map.put("pi.getBoardLimit()", pi.getBoardLimit());
		map.put("customCode", customCode);
		
		return (ArrayList)sqlSession.selectList("CustomDesignMapper.selectListComment",map);
	}

	@Override
	public int modifyCustomComment(CustomComment customComment) {
		return sqlSession.update("CustomDesignMapper.updateCustomComment",customComment);
	}

	@Override
	public int deleteCustomComment(int customCCode) {
		return sqlSession.delete("CustomDesignMapper.deleteCustomComment",customCCode);
	}

	@Override
	public ArrayList<CustomDesign> selectListSearch(Search search) {
		return (ArrayList)sqlSession.selectList("CustomDesignMapper.searchList",search);
	}

	@Override
	public int addHits(int customCode) {
		return sqlSession.update("CustomDesignMapper.updateAddHits",customCode);
	}

	@Override
	public int getListCount() {
		int result = sqlSession.selectOne("CustomDesignMapper.getListCount");
		System.out.println(result);
		 return result;
	}

	@Override
	public int getListCountComment(int customCode) {
		return sqlSession.selectOne("CustomDesignMapper.getListCountComment",customCode);
	}

}
