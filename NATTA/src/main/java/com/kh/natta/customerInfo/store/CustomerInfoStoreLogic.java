package com.kh.natta.customerInfo.store;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.natta.customer.domain.Customer;
import com.kh.natta.customerInfo.domain.Following;
import com.kh.natta.customerInfo.domain.Review;

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

	@Override
	public ArrayList<Following> selectListFollowing(String customerId) {
		return (ArrayList)session.selectList("customerInfoMapper.selectListFollowing",customerId);
	}

	@Override
	public int deleteFollowing(Following following) {
		return session.delete("customerInfoMapper.deleteFollowing",following);
	}

	@Override
	public ArrayList<Review> selectListReview(String customerId) {
		return (ArrayList)session.selectList("customerInfoMapper.selectListReview", customerId);
	}
}
