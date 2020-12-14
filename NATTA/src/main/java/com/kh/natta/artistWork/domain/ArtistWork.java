package com.kh.natta.artistWork.domain;

public class ArtistWork {
	// 아티스트 작품
	private int workCode;
	private String workImgPath;//
	private String workReImgPath;//
	private String workInfo;//
	private String workStyle;//
	private String workCreateDate;//
	private String workModifyDate;//
	private String artistId;//
	
	public ArtistWork() {}

	public ArtistWork(int workCode, String workImgPath, String workReImgPath, String workInfo, String workStyle
						,String workCreateDate, String workModifyDate, String artistId) {
		super();
		this.workCode = workCode;
		this.workImgPath = workImgPath;
		this.workReImgPath = workReImgPath;
		this.workInfo = workInfo;
		this.workStyle = workStyle;
		this.workCreateDate = workCreateDate;
		this.workModifyDate = workModifyDate;
		this.artistId = artistId;
	}



	public int getWorkCode() {
		return workCode;
	}

	public void setWorkCode(int workCode) {
		this.workCode = workCode;
	}

	public String getWorkImgPath() {
		return workImgPath;
	}

	public void setWorkImgPath(String workImgPath) {
		this.workImgPath = workImgPath;
	}

	public String getWorkReImgPath() {
		return workReImgPath;
	}

	public void setWorkReImgPath(String workReImgPath) {
		this.workReImgPath = workReImgPath;
	}

	public String getWorkInfo() {
		return workInfo;
	}

	public void setWorkInfo(String workInfo) {
		this.workInfo = workInfo;
	}

	public String getWorkStyle() {
		return workStyle;
	}

	public void setWorkStyle(String workStyle) {
		this.workStyle = workStyle;
	}

	public String getWorkCreateDate() {
		return workCreateDate;
	}

	public void setWorkCreateDate(String workCreateDate) {
		this.workCreateDate = workCreateDate;
	}

	public String getWorkModifyDate() {
		return workModifyDate;
	}

	public void setWorkModifyDate(String workModifyDate) {
		this.workModifyDate = workModifyDate;
	}

	public String getArtistId() {
		return artistId;
	}

	public void setArtistId(String artistId) {
		this.artistId = artistId;
	}

	@Override
	public String toString() {
		return "ArtistWork [workCode=" + workCode + ", workImgPath=" + workImgPath + ", workReImgPath=" + workReImgPath
				+ ", workInfo=" + workInfo + ", workStyle=" + workStyle+ ", workCreateDate=" + workCreateDate 
				+ ", workModifyDate=" + workModifyDate + ", artistId=" + artistId + "]";
	}

		
	
	
	
	
	
	
	
}
