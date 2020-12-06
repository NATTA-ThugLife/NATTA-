package com.kh.natta.customer.store;

import com.kh.natta.customer.domain.Customer;

public interface CustomerStore {

	public Customer selectOneCustomer(Customer customer);
	
	public int checkIdDup(String customerId);
	
	public int insertCustomer(Customer customer);
	
	public int updateCustomer(Customer customer);
	
	public int deleteCustomer(String customerId);
	
}
