package com.kh.natta.customer.store;

import com.kh.natta.ArtistInfo.domain.ArtistInfo;
import com.kh.natta.customer.domain.Customer;

public interface CustomerStore {

	public Customer selectOneCustomer(Customer customer);
	
	public int checkIdDup(String customerId);
	
	public int checkEmailDup(String email);
	
	public int insertCustomer(Customer customer);

	//회원 아이디 찾기 (이메일 인증)
	Customer selectTwoCustomer(Customer customer);
	
	//회원 비번 찾기 (이메일 인증)
	Customer selectThreeCustomer(Customer customer);
	
	//회원 아이디 찾기 (폰 인증)
	Customer selectFourCustomer(Customer customer);
	
	/* public int updatePassword(Customer customer); */
	
}
