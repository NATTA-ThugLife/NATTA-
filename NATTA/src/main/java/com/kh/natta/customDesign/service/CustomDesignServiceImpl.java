package com.kh.natta.customDesign.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.natta.customDesign.domain.CustomComment;
import com.kh.natta.customDesign.domain.CustomDesign;
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
	public ArrayList<CustomDesign> selectList() {
		return store.selectList();
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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertCustomComment(CustomComment customComment) {
		return store.insertCustomComment(customComment);
	}

	@Override
	public ArrayList<CustomComment> selectListComment(int customCode) {
		return store.selectListComment(customCode);
	}

	@Override
	public int modifyCustomComment(CustomComment customComment) {
		return store.modifyCustomComment(customComment);
	}

	@Override
	public int deleteCustomComment(int customCCode) {
		return store.deleteCustomComment(customCCode);
	}

}
