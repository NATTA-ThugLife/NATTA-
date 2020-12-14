package com.kh.natta.reservation.service;

import java.util.ArrayList;

import com.kh.natta.reservation.domain.Reservation;

public interface ReservationService {
	
	public int baseReservation(Reservation reservation);
	
	public int insertReservation(Reservation reservation);
	
	public int modifyReservation(Reservation reservation);
	
	public int deleteReservation(int reservationCode);
	
	public ArrayList<Reservation> selectLisst();
	
	public Reservation selectReservation(int reservationCode);

}
