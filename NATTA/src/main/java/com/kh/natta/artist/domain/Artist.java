package com.kh.natta.artist.domain;

import java.sql.Date;

public class Artist {
	
	private String artistId;
	private String password;
	private String name;
	private int age;
	private String gender;
	private String phone;
	private String email;
	private String address;
	private String workAddress;
	private Date enrollDate;
	private String license;
	private String businessNo;
	private int enrollStatus;
	
	
	
	
	public Artist(String artistId, String password) {
		super();
		this.artistId = artistId;
		this.password = password;
	}


	public Artist() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Artist(String artistId, String password, String name, int age, String gender, String phone, String email,
			String address, String workAddress, Date enrollDate, String license, String businessNo,
			int enrollStatus) {
		super();
		this.artistId = artistId;
		this.password = password;
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.workAddress = workAddress;
		this.enrollDate = enrollDate;
		this.license = license;
		this.businessNo = businessNo;
		this.enrollStatus = enrollStatus;
	}


	@Override
	public String toString() {
		return "Artist [artistId=" + artistId + ", password=" + password + ", name=" + name + ", age=" + age
				+ ", gender=" + gender + ", phone=" + phone + ", email=" + email + ", address=" + address
				+ ", workAddress=" + workAddress + ", enrollDate=" + enrollDate + ", license=" + license
				+ ", businessNo=" + businessNo + ", enrollStatus=" + enrollStatus + "]";
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


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
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


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
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


	public String getLicense() {
		return license;
	}


	public void setLicense(String license) {
		this.license = license;
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
	
	

}
