package com.kh.natta.ArtistInfo.domain;

import java.sql.Date;

public class ArtistInfo {
	private String name;
	private String style;
	private String myProfile;
	private String myReProfile;
	private String myInfo;
	private Date createDate;
	private Date modifyDate;
	private String workAddress;
	private String artistId;

	public ArtistInfo() {}

	public ArtistInfo(String name, String style, String myProfile, String myReProfile, String myInfo, Date createDate,
			Date modifyDate, String workAddress, String artistId) {
		super();
		this.name = name;
		this.style = style;
		this.myProfile = myProfile;
		this.myReProfile = myReProfile;
		this.myInfo = myInfo;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.workAddress = workAddress;
		this.artistId = artistId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
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

	public String getWorkAddress() {
		return workAddress;
	}

	public void setWorkAddress(String workAddress) {
		this.workAddress = workAddress;
	}

	public String getArtistId() {
		return artistId;
	}

	public void setArtistId(String artistId) {
		this.artistId = artistId;
	}

	@Override
	public String toString() {
		return "ArtistInfo [name=" + name + ", style=" + style + ", myProfile=" + myProfile + ", myReProfile="
				+ myReProfile + ", myInfo=" + myInfo + ", createDate=" + createDate + ", modifyDate=" + modifyDate
				+ ", workAddress=" + workAddress + ", artistId=" + artistId + "]";
	}

		
	}
