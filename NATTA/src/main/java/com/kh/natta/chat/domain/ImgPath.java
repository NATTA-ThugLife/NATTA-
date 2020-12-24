package com.kh.natta.chat.domain;

public class ImgPath {
	private String imgPath;
	private String id;
	
	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "ImgPath [imgPath=" + imgPath + "]";
	}
	
	
}
