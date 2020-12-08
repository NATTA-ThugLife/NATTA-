package com.kh.natta.customer.service;

import com.kh.natta.customer.domain.Customer;

public interface CustomerService {

	public Customer loginCustomer(Customer customer);
	
	public int checkIdDup(String customerId);
	
	public int registerCustomer(Customer customer);

}
