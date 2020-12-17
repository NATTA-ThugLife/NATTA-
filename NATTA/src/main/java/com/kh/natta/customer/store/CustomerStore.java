package com.kh.natta.customer.store;

import com.kh.natta.ArtistInfo.domain.ArtistInfo;
import com.kh.natta.customer.domain.Customer;

public interface CustomerStore {

	public Customer selectOneCustomer(Customer customer);
	
	public int checkIdDup(String customerId);
	
	public int checkEmailDup(String email);
	
	public int insertCustomer(Customer customer);

	Customer selectTwoCustomer(Customer customer);

	Customer selectThreeCustomer(Customer customer);
	
	/* public int updatePassword(Customer customer); */
	
}
