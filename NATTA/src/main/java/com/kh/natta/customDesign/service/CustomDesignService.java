package com.kh.natta.customDesign.service;

import java.util.ArrayList;

import com.kh.natta.customDesign.domain.CustomComment;
import com.kh.natta.customDesign.domain.CustomDesign;

public interface CustomDesignService {

	public int insertCustomDesign(CustomDesign customDesign);
	
	public ArrayList<CustomDesign> selectList();
	
	public CustomDesign selectcustomDesign(int customCode);
	
	public int modifyCustomDesign(CustomDesign customDesign);
	
	public int deleteCustomDesign(int customCode);
	
	public int insertCustomComment(CustomComment customComment);
	
	public ArrayList<CustomComment> selectListComment(int customCode);
	
	public int modifyCustomComment(CustomComment customComment);
	
	public int deleteCustomComment(int customCCode);
}
