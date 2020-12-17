package com.kh.natta.customer.service;

import javax.servlet.http.HttpServletResponse;

import com.kh.natta.customer.domain.Customer;
import com.kh.natta.customer.store.CustomerStore;

public interface CustomerService {

	public Customer loginCustomer(Customer customer);
	
	public int checkIdDup(String customerId);
	
	public int checkEmailDup(String email);
	
	public int registerCustomer(Customer customer);

	public Customer findIdEmail(Customer customer);
	
	public Customer findPwdEmail(Customer customer);

	/* public int updatePassword(Customer customer); */

}
