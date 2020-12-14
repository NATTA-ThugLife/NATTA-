package com.kh.natta.customerInfo.store;

import java.util.ArrayList;

import com.kh.natta.customer.domain.Customer;
import com.kh.natta.customerInfo.domain.Following;

public interface CustomerInfoStore {
	
	/**
	 * 회원 정보 수정
	 * @return
	 */
	public int modifyCustomerModify(Customer customer);

	/**
	 * 
	 * 비밀번호 체크
	 * @param pwd
	 * @param Id
	 * @return
	 */
	public Customer dupPwd (Customer customer);
	
	/**
	 * 팔로잉 리스트  가져오기
	 * @param <ArrayList>
	 * @param customerId
	 * @return
	 */
	public ArrayList<Following> selectListFollowing(String customerId); 
}
