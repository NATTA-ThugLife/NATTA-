package com.kh.natta.customerInfo.domain;

import java.sql.Date;

public class Review {
	private String artistId;
	private int reviewCode;
	private String reviewContents;
	private String reviewPhoto;
	private String reviewStar;
	private Date reviewCreateDate;
	private Date reviewModifyDate;
	private int reviewHit;
	private String customerId;
	private String name;
	private String myProfile;
	private String myReProfile;
	
	
	
	public Review() {
		super();
	}



	public Review(String artistId, int reviewCode, String reviewContents, String reviewPhoto, String reviewStar,
			Date reviewCreateDate, Date reviewModifyDate, int reviewHit, String customerId, String name,
			String myProfile, String myReProfile) {
		super();
		this.artistId = artistId;
		this.reviewCode = reviewCode;
		this.reviewContents = reviewContents;
		this.reviewPhoto = reviewPhoto;
		this.reviewStar = reviewStar;
		this.reviewCreateDate = reviewCreateDate;
		this.reviewModifyDate = reviewModifyDate;
		this.reviewHit = reviewHit;
		this.customerId = customerId;
		this.name = name;
		this.myProfile = myProfile;
		this.myReProfile = myReProfile;
	}



	public String getArtistId() {
		return artistId;
	}



	public void setArtistId(String artistId) {
		this.artistId = artistId;
	}



	public int getReviewCode() {
		return reviewCode;
	}



	public void setReviewCode(int reviewCode) {
		this.reviewCode = reviewCode;
	}



	public String getReviewContents() {
		return reviewContents;
	}



	public void setReviewContents(String reviewContents) {
		this.reviewContents = reviewContents;
	}



	public String getReviewPhoto() {
		return reviewPhoto;
	}



	public void setReviewPhoto(String reviewPhoto) {
		this.reviewPhoto = reviewPhoto;
	}



	public String getReviewStar() {
		return reviewStar;
	}



	public void setReviewStar(String reviewStar) {
		this.reviewStar = reviewStar;
	}



	public Date getReviewCreateDate() {
		return reviewCreateDate;
	}



	public void setReviewCreateDate(Date reviewCreateDate) {
		this.reviewCreateDate = reviewCreateDate;
	}



	public Date getReviewModifyDate() {
		return reviewModifyDate;
	}



	public void setReviewModifyDate(Date reviewModifyDate) {
		this.reviewModifyDate = reviewModifyDate;
	}



	public int getReviewHit() {
		return reviewHit;
	}



	public void setReviewHit(int reviewHit) {
		this.reviewHit = reviewHit;
	}



	public String getCustomerId() {
		return customerId;
	}



	public void setCustomerId(String customerId) {
		this.customerId = customerId;
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



	@Override
	public String toString() {
		return "Review [artistId=" + artistId + ", reviewCode=" + reviewCode + ", reviewContents=" + reviewContents
				+ ", reviewPhoto=" + reviewPhoto + ", reviewStar=" + reviewStar + ", reviewCreateDate="
				+ reviewCreateDate + ", reviewModifyDate=" + reviewModifyDate + ", reviewHit=" + reviewHit
				+ ", customerId=" + customerId + ", name=" + name + ", myProfile=" + myProfile + ", myReProfile="
				+ myReProfile + "]";
	}
	
	

	
	
	
	
}
