package com.kh.natta.customer.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.natta.artist.store.ArtistStore;
import com.kh.natta.customer.domain.Customer;

@Service
public class CustomerServiceImpl implements CustomerService{
	
	@Autowired
	private ArtistStore store;

	@Override
	public Customer loginCustomer(Customer customer) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int checkIdDup(String customerId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int registerCustomer(Customer customer) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyCustomer(Customer customer) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteCustomer(String customerId) {
		// TODO Auto-generated method stub
		return 0;
	}


}
