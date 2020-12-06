package com.kh.natta.customer.store;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.natta.customer.domain.Customer;

@Repository
public class CustomerStoreLogic implements CustomerStore{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Customer selectOneCustomer(Customer customer) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int checkIdDup(String customerId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertCustomer(Customer customer) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateCustomer(Customer customer) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteCustomer(String customerId) {
		// TODO Auto-generated method stub
		return 0;
	}

	

}
