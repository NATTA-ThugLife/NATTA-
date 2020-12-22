package com.kh.natta.customerInfo.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.natta.customer.domain.Customer;
import com.kh.natta.customerInfo.domain.Following;
import com.kh.natta.customerInfo.domain.Review;
import com.kh.natta.customerInfo.store.CustomerInfoStore;
import com.kh.natta.reservation.domain.Reservation;

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

	@Override
	public int modifyReview(Review review) {
		return store.modifyReview(review);
	}

	@Override
	public int deleteReview(int reviewCode) {
		return store.deleteReview(reviewCode);
	}

	@Override
	public ArrayList<Reservation> selectListReservation(String customerId) {
		return store.selectListReservation(customerId);
	}

	@Override
	public Review dupReview(int reservationCode) {
		return store.dupReview(reservationCode);
	}

	@Override
	public int insertReview(Review review) {
		return store.insertReview(review);
	}

	@Override
	public int deleteResvertion(int reservationCode) {
		return store.deleteResvertion(reservationCode);
	}

	@Override
	public Reservation selectOneReservation(int reservationCode) {
		return store.selectOneReservation(reservationCode);
	}

	
	
}
