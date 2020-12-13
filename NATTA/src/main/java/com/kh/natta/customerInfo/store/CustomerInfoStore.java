package com.kh.natta.customerInfo.store;

import com.kh.natta.customer.domain.Customer;

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
}
