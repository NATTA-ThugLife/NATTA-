package com.kh.natta.customerInfo.store;

import java.util.ArrayList;

import com.kh.natta.customer.domain.Customer;
import com.kh.natta.customerInfo.domain.Following;
import com.kh.natta.customerInfo.domain.Review;
import com.kh.natta.reservation.domain.Reservation;

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
	
	/**
	 * 팔로잉 취소
	 * @param following
	 * @return
	 */
	public int deleteFollowing(Following following);
	
	/**
	 * 마이페이지에 사용자의 모든 리뷰 가져오기
	 * @param customerId
	 * @return
	 */
	public ArrayList<Review> selectListReview(String customerId);
	
	/**
	 * 리뷰 수정 메소드
	 * @param review
	 * @return
	 */
	public int modifyReview(Review review);
	/**
	 * 리뷰 삭제 메소드
	 * @param reviewCode
	 * @return
	 */
	
	public int deleteReview(int reviewCode);
	
	
	/**
	 * 사용자 예약을 가져오는 메소드
	 * 
	 */
	public ArrayList<Reservation> selectListReservation(String customerId);
	
	/**
	 * 리뷰 있는지 없는지 체크
	 * 
	 */
	public Review dupReview(int reservationCode);
	
	/**
	 * 
	 *  리뷰 인서트
	 */
	
	public int insertReview(Review review);
	
	/**
	 * 
	 * 예약 취소
	 */
	public int deleteResvertion(int reservationCode);
	
	/**
	 * 
	 * 예약 사진 삭제를 위한 예약 설렉트 원
	 */
	
	public Reservation selectOneReservation(int reservationCode);
}
