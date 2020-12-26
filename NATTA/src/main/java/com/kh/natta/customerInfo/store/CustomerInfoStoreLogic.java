package com.kh.natta.customerInfo.store;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.natta.customer.domain.Customer;
import com.kh.natta.customerInfo.domain.Following;
import com.kh.natta.customerInfo.domain.Review;
import com.kh.natta.reservation.domain.Reservation;

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

	@Override
	public int modifyReview(Review review) {
		return session.update("customerInfoMapper.modifyReview",review);
	}

	@Override
	public int deleteReview(int reviewCode) {
		return session.delete("customerInfoMapper.deleteReview",reviewCode);
	}

	@Override
	public ArrayList<Reservation> selectListReservation(String customerId) {
		return (ArrayList)session.selectList("customerInfoMapper.selectListReservation",customerId);
	}

	@Override
	public Review dupReview(int reservationCode) {
		return session.selectOne("customerInfoMapper.dupReview",reservationCode);
	}

	@Override
	public int insertReview(Review review) {
		return session.insert("customerInfoMapper.insertReview",review);
	}

	@Override
	public int deleteResvertion(int reservationCode) {
		return session.delete("customerInfoMapper.deleteResvertion",reservationCode);
	}

	@Override
	public Reservation selectOneReservation(int reservationCode) {
		return session.selectOne("customerInfoMapper.selectOneReservation",reservationCode);
	}

	@Override
	public int deleteCustomer(String customerId) {
		return session.delete("customerInfoMapper.deleteCustomer",customerId);
	}


	
	
}
