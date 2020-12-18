package com.kh.natta.ArtistInfo.domain;

public class ArtistFollow {
	// 아티스트 팔로잉
	private String customerProfile;
	private String customerId;
	private String artistId;
	
	public ArtistFollow() {}

	
	
	public ArtistFollow(String customerId, String artistId) {
		super();
		this.customerId = customerId;
		this.artistId = artistId;
	}



	public ArtistFollow(String customerProfile, String customerId, String artistId) {
		super();
		this.customerProfile = customerProfile;
		this.customerId = customerId;
		this.artistId = artistId;
	}

	public String getCustomerProfile() {
		return customerProfile;
	}

	public void setCustomerProfile(String customerProfile) {
		this.customerProfile = customerProfile;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getArtistId() {
		return artistId;
	}

	public void setArtistId(String artistId) {
		this.artistId = artistId;
	}

	@Override
	public String toString() {
		return "ArtistFollow [customerProfile=" + customerProfile + ", customerId=" + customerId + ", artistId="
				+ artistId + "]";
	}

	
	
	
}
