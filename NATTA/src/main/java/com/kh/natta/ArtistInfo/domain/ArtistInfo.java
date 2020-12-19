package com.kh.natta.ArtistInfo.domain;

import java.sql.Date;
// artist Info 테이블 domain
public class ArtistInfo {
	private String name;
	private String myProfile;
	private String myReProfile;
	private String myInfo;
	private Date createDate;
	private Date modifyDate;
	private String artistId;
	private int count;

	public ArtistInfo() {}

	public ArtistInfo(String name, String myProfile, String myReProfile, String myInfo, Date createDate,
			Date modifyDate, String artistId, int count) {
		super();
		this.name = name;
		this.myProfile = myProfile;
		this.myReProfile = myReProfile;
		this.myInfo = myInfo;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.artistId = artistId;
		this.count = count;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMyProfile() {
		return myProfile;
	}

	public void setMyProfile(String myProfile) {
		this.myProfile = myProfile;
	}

	public String getMyReProfile() {
		return myReProfile;
	}

	public void setMyReProfile(String myReProfile) {
		this.myReProfile = myReProfile;
	}

	public String getMyInfo() {
		return myInfo;
	}

	public void setMyInfo(String myInfo) {
		this.myInfo = myInfo;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getArtistId() {
		return artistId;
	}

	public void setArtistId(String artistId) {
		this.artistId = artistId;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	

		
	}
