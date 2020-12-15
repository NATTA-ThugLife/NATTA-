package com.kh.natta.customerInfo.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.natta.customer.domain.Customer;
import com.kh.natta.customerInfo.domain.Following;
import com.kh.natta.customerInfo.domain.Review;
import com.kh.natta.customerInfo.store.CustomerInfoStore;

@Service
public class CustomerInfoServiceImpl implements CustomerInfoService {
	
	@Autowired
	private CustomerInfoStore store;

	@Override
	public int modifyCustomerModify(Customer customer) {
		return store.modifyCustomerModify(customer);
	}

	@Override
	public Customer dupPwd(Customer customer) {
		return store.dupPwd(customer);
	}

	@Override
	public ArrayList<Following> selectListFollowing(String customerId) {
		return store.selectListFollowing(customerId);
	}

	@Override
	public int deleteFollowing(Following following) {
		return store.deleteFollowing(following);
	}

	@Override
	public ArrayList<Review> selectListReview(String customerId) {
		return store.selectListReview(customerId);
	}


	
	
}
