package com.kh.natta.customDesign.domain;

import java.sql.Date;

public class CustomComment {

	private int customCCode;
	private String artistId;
	private String cContents;
	private Date ccCreateDate;
	private Date ccModifyDate;
	private int cOnOff;
	private String customCode;
	
	public CustomComment() {}

	public int getCustomCCode() {
		return customCCode;
	}

	public void setCustomCCode(int customCCode) {
		this.customCCode = customCCode;
	}

	public String getArtistId() {
		return artistId;
	}

	public void setArtistId(String artistId) {
		this.artistId = artistId;
	}

	public String getcContents() {
		return cContents;
	}

	public void setcContents(String cContents) {
		this.cContents = cContents;
	}

	public Date getCcCreateDate() {
		return ccCreateDate;
	}

	public void setCcCreateDate(Date ccCreateDate) {
		this.ccCreateDate = ccCreateDate;
	}

	public Date getCcModifyDate() {
		return ccModifyDate;
	}

	public void setCcModifyDate(Date ccModifyDate) {
		this.ccModifyDate = ccModifyDate;
	}

	public int getcOnOff() {
		return cOnOff;
	}

	public void setcOnOff(int cOnOff) {
		this.cOnOff = cOnOff;
	}

	public String getCustomCode() {
		return customCode;
	}

	public void setCustomCode(String customCode) {
		this.customCode = customCode;
	}

	@Override
	public String toString() {
		return "CustomComment [customCCode=" + customCCode + ", artistId=" + artistId + ", cContents=" + cContents
				+ ", ccCreateDate=" + ccCreateDate + ", ccModifyDate=" + ccModifyDate + ", cOnOff=" + cOnOff
				+ ", customCode=" + customCode + "]";
	}

	public CustomComment(int customCCode, String artistId, String cContents, Date ccCreateDate, Date ccModifyDate,
			int cOnOff, String customCode) {
		super();
		this.customCCode = customCCode;
		this.artistId = artistId;
		this.cContents = cContents;
		this.ccCreateDate = ccCreateDate;
		this.ccModifyDate = ccModifyDate;
		this.cOnOff = cOnOff;
		this.customCode = customCode;
	}

	
	
	
}
