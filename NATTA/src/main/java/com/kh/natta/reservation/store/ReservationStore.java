package com.kh.natta.reservation.store;

import java.util.ArrayList;

import com.kh.natta.ArtistInfo.domain.ArtistInfoPrice;
import com.kh.natta.artist.domain.Artist;
import com.kh.natta.reservation.domain.Reservation;

public interface ReservationStore {

	public int baseReservation(Reservation reservation);
	
	public int insertReservation(Reservation reservation);
	
	public int modifyReservation(Reservation reservation);
	
	public int deleteReservation(int reservationCode);
	
	public ArrayList<Reservation> selectList();
	
	public Reservation selectReservation(int reservationCode);
	
	public Artist selectOneArtist(String artistId);
	
	public ArrayList<ArtistInfoPrice> selectListSize(ArtistInfoPrice size);
	
	public ArrayList<Reservation> selectListDate(String artistId);
	
	public ArrayList<Reservation> selectListTime(Reservation time);
	
}
