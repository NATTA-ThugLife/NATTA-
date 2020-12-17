package com.kh.natta.customDesign.store;

import java.util.ArrayList;

import com.kh.natta.common.PageInfo;
import com.kh.natta.customDesign.domain.CustomComment;
import com.kh.natta.customDesign.domain.CustomDesign;
import com.kh.natta.customDesign.domain.Search;

public interface CustomDesignStore {

	public int insertCustomDesign(CustomDesign customDesign);
	
	public ArrayList<CustomDesign> selectList(PageInfo pi);
	
	public CustomDesign selectcustomDesign(int customCode);
	
	public int modifyCustomDesign(CustomDesign customDesign);
	
	public int deleteCustomDesign(int customCode);
	
	public int insertCustomComment(CustomComment customComment);
	
	public ArrayList<CustomComment> selectListComment(int customCode,PageInfo pi);
	
	public int modifyCustomComment(CustomComment customComment);
	
	public int deleteCustomComment(int customCCode);
	
	public ArrayList<CustomDesign> selectListSearch(Search search);
	
	public int addHits(int customCode);
	
	public int getListCount();
	
	public int getListCountComment(int customCode);
}
