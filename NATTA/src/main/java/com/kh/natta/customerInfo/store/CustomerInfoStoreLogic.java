package com.kh.natta.customerInfo.store;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.natta.customer.domain.Customer;

@Repository
public class CustomerInfoStoreLogic implements CustomerInfoStore {

	@Autowired
	private SqlSessionTemplate session;

	@Override
	public int modifyCustomerModify(Customer customer) {
		return session.update("customerInfoMapper.modifyCusotmer",customer);
	}

	@Override
	public Customer dupPwd(Customer customer) {
		return session.selectOne("customerInfoMapper.dupPwd",customer);
	}
}
