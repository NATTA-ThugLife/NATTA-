package com.kh.natta.customer.store;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kh.natta.customer.domain.Customer;

@Repository
public class CustomerStoreLogic implements CustomerStore{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Customer selectOneCustomer(Customer customer) {
		Customer loginCustomer = sqlSession.selectOne("customerMapper.selectOne",customer);
		return loginCustomer;
	}

	@Override
	public int checkIdDup(String customerId) {
		int result = sqlSession.selectOne("customerMapper.checkIdDup",customerId);
		return result;
	}
	
	@Override
	public int checkEmailDup(String email) {
		int result = sqlSession.selectOne("customerMapper.checkEmailDup",email);
		return result;
	}
	

	@Override
	public int insertCustomer(Customer customer) {
		int result = sqlSession.insert("customerMapper.insertCustomer",customer);
		return result;
	}
	
	@Override
	public Customer selectTwoCustomer(Customer customer) {		
	    Customer findIdEmail = sqlSession.selectOne("customerMapper.selectTwo",customer);
	    return findIdEmail;		
}

	@Override
	public Customer selectThreeCustomer(Customer customer) {
		Customer findPwdEmail = sqlSession.selectOne("customerMapper.selectThree",customer);
		return findPwdEmail;
	}

	
	/*
	 * // 비밀번호 변경 
	 * @Override public int updatePassword(Customer customer) { 
	 * return sqlSession.update("customerMapper.updatePassword",customer); }
	 */
	
	

}
