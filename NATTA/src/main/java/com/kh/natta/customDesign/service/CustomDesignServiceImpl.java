package com.kh.natta.customDesign.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.natta.common.PageInfo;
import com.kh.natta.customDesign.domain.CustomComment;
import com.kh.natta.customDesign.domain.CustomDesign;
import com.kh.natta.customDesign.domain.Search;
import com.kh.natta.customDesign.store.CustomDesignStore;

@Service
public class CustomDesignServiceImpl  implements CustomDesignService{

	@Autowired
	private CustomDesignStore store;
	
	@Override
	public int insertCustomDesign(CustomDesign customDesign) {
		return store.insertCustomDesign(customDesign);
	}

	@Override
	public ArrayList<CustomDesign> selectList(PageInfo pi) {
		return store.selectList(pi);
	}

	@Override
	public CustomDesign selectcustomDesign(int customCode) {
		return store.selectcustomDesign(customCode);
	}

	@Override
	public int modifyCustomDesign(CustomDesign customDesign) {
		return store.modifyCustomDesign(customDesign);
	}

	@Override
	public int deleteCustomDesign(int customCode) {
		return store.deleteCustomDesign(customCode);
	}

	@Override
	public int insertCustomComment(CustomComment customComment) {
		return store.insertCustomComment(customComment);
	}

	@Override
	public ArrayList<CustomComment> selectListComment(int customCode,PageInfo pi) {
		return store.selectListComment(customCode,pi);
	}

	@Override
	public int modifyCustomComment(CustomComment customComment) {
		return store.modifyCustomComment(customComment);
	}

	@Override
	public int deleteCustomComment(int customCCode) {
		return store.deleteCustomComment(customCCode);
	}

	@Override
	public ArrayList<CustomDesign> selectListSearch(Search search) {
		return store.selectListSearch(search);
	}

	@Override
	public int addHits(int customCode) {
		return store.addHits(customCode);
	}

	@Override
	public int getListCount() {
		return store.getListCount();
	}

	@Override
	public int getListCountComment(int customCode) {
		return store.getListCountComment(customCode);
	}

}
