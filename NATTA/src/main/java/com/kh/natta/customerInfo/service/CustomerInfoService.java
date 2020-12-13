package com.kh.natta.customerInfo.service;

import com.kh.natta.customer.domain.Customer;

public interface CustomerInfoService {
	
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
