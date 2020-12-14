package com.kh.natta.customerInfo.domain;

public class Following {
	// select * from following join artistinfo using(artist_id) where customer_id = 'test1';
	
	private String artistId;
	private String customerId;
	private String name;
	private String myReprofile;
	private String myInfo;

	
	public Following() {
		super();
	}


	public Following(String artistId, String customerId, String name, String myReprofile, String myInfo) {
		super();
		this.artistId = artistId;
		this.customerId = customerId;
		this.name = name;
		this.myReprofile = myReprofile;
		this.myInfo = myInfo;
	}


	public String getArtistId() {
		return artistId;
	}


	public void setArtistId(String artistId) {
		this.artistId = artistId;
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


	public String getMyReprofile() {
		return myReprofile;
	}



	public void setMyReprofile(String myReprofile) {
		this.myReprofile = myReprofile;
	}


	public String getMyInfo() {
		return myInfo;
	}


	public void setMyInfo(String myInfo) {
		this.myInfo = myInfo;
	}


	@Override
	public String toString() {
		return "Following [artistId=" + artistId + ", customerId=" + customerId + ", name=" + name + ", myReprofile="
				+ myReprofile + ", myInfo=" + myInfo + "]";
	}
	
	
	

}

