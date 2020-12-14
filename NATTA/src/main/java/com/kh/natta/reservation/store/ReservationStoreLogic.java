package com.kh.natta.reservation.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.natta.reservation.domain.Reservation;

@Repository
public class ReservationStoreLogic implements ReservationStore{

	@Autowired
	public SqlSessionTemplate sqlSession;
	
	@Override
	public int baseReservation(Reservation reservation) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertReservation(Reservation reservation) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyReservation(Reservation reservation) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReservation(int reservationCode) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Reservation> selectLisst() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Reservation selectReservation(int reservationCode) {
		// TODO Auto-generated method stub
		return null;
	}

}
