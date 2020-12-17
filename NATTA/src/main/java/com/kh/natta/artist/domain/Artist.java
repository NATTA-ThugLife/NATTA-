package com.kh.natta.artist.domain;

import java.sql.Date;

public class Artist {
	
	private String artistId;
	private String password;
	private String password2;
	private String artistName;
	private int age;
	private String gender;
	private String phone;
	private String email2;
	private String workAddress;
	private Date enrollDate;
	private String businessNo;
	private int enrollStatus;	
	private String originalFilename;
	private String renameFilename;
	
	
	public Artist(String artistId, String password) {
		super();
		this.artistId = artistId;
		this.password = password;
	}


	public Artist() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Artist(String artistId, String password, String password2, String artistname, int age, String gender, String phone, String email2,
			String workAddress, Date enrollDate, String businessNo,
			int enrollStatus, String originalFilename,
			String renameFilename) {
		super();
		this.artistId = artistId;
		this.password = password;
		this.password = password2;
		this.artistName = artistname;
		this.age = age;
		this.gender = gender;
		this.phone = phone;
		this.email2 = email2;
		this.workAddress = workAddress;
		this.enrollDate = enrollDate;
		this.businessNo = businessNo;
		this.enrollStatus = enrollStatus;
		this.originalFilename = originalFilename;
		this.renameFilename = renameFilename;
	}


	@Override
	public String toString() {
		return "Artist [artistId=" + artistId + ", password=" + password + ", password2=" + password2 + ", artistName=" + artistName + ", age=" + age
				+ ", gender=" + gender + ", phone=" + phone + ", email2=" + email2 + ", workAddress=" + workAddress + ", enrollDate=" + enrollDate + ", businessNo=" + businessNo + ", enrollStatus=" + enrollStatus +  ", originalFilename=" + originalFilename + ", renameFilename=" + renameFilename +"]";
	}


	public String getArtistId() {
		return artistId;
	}


	public void setArtistId(String artistId) {
		this.artistId = artistId;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getArtistName() {
		return artistName;
	}


	public void setArtistName(String artistName) {
		this.artistName = artistName;
	}


	public int getAge() {
		return age;
	}


	public void setAge(int age) {
		this.age = age;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getemail2() {
		return email2;
	}


	public void setemail2(String email2) {
		this.email2 = email2;
	}

	public String getWorkAddress() {
		return workAddress;
	}


	public void setWorkAddress(String workAddress) {
		this.workAddress = workAddress;
	}


	public Date getEnrollDate() {
		return enrollDate;
	}


	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}


	public String getBusinessNo() {
		return businessNo;
	}


	public void setBusinessNo(String businessNo) {
		this.businessNo = businessNo;
	}


	public int getEnrollStatus() {
		return enrollStatus;
	}


	public void setEnrollStatus(int enrollStatus) {
		this.enrollStatus = enrollStatus;
	}


	public String getPassword2() {
		return password2;
	}


	public void setPassword2(String password2) {
		this.password2 = password2;
	}


	public String getOriginalFilename() {
		return originalFilename;
	}


	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}


	public String getRenameFilename() {
		return renameFilename;
	}


	public void setRenameFilename(String renameFilename) {
		this.renameFilename = renameFilename;
	}
	
	

}
