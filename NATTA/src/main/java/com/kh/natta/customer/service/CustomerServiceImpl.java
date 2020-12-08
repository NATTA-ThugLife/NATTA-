package com.kh.natta.customer.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.natta.artist.store.ArtistStore;
import com.kh.natta.customer.domain.Customer;
import com.kh.natta.customer.store.CustomerStore;

@Service
public class CustomerServiceImpl implements CustomerService{
	
	@Autowired
	private CustomerStore store;

	@Override
	public Customer loginCustomer(Customer customer) {
		return store.selectOneCustomer(customer);
	}

	@Override
	public int checkIdDup(String customerId) {
		return store.checkIdDup(customerId);
	}

	@Override
	public int registerCustomer(Customer customer) {
		return store.insertCustomer(customer);
	}

}
