package com.kh.natta.customer.domain;

import java.sql.Date;

public class Customer {

	private String customerId;
	private String password;
	private String password2;
	private String customerName;
	private int age;
	private String gender;
	private String phone;
	private String email;
	private String address;
	private Date enrollDate;
	private String customerProfile;
	
	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}	
	
	public String getCustomerProfile() {
		return customerProfile;
	}

	public void setCustomerProfile(String customerProfile) {
		this.customerProfile = customerProfile;
	}

	public Customer(String customerId, String password) {
		super();
		this.customerId = customerId;
		this.password = password;
	}



	public Customer(String customerId, String password, String password2, String customerName, int age, String gender, String phone, String email,
			String address, Date enrollDate) {
		super();
		this.customerId = customerId;
		this.password = password;
		this.password2 = password2;
		this.customerName = customerName;
		this.age = age;
		this.gender = gender;
		this.phone = phone;
		this.email = email;
		this.address = address;
		this.enrollDate = enrollDate;
	}

	

	@Override
	public String toString() {
		return "Customer [customerId=" + customerId + ", password=" + password + ", password2=" + password2 + ", customerName=" + customerName
				+ ", age=" + age + ", gender=" + gender + ", phone=" + phone + ", email=" + email + ", address="
				+ address + ", enrollDate=" + enrollDate + ", customerProfile=" + customerProfile + "]";
	}





	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
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

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}
	
	
}
