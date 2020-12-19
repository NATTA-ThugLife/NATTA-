package com.kh.natta.reservation.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.natta.ArtistInfo.domain.ArtistInfoPrice;
import com.kh.natta.artist.domain.Artist;
import com.kh.natta.reservation.domain.Reservation;
import com.kh.natta.reservation.store.ReservationStore;

@Service
public class ReservationServiceImpl implements ReservationService{

	@Autowired
	private ReservationStore store;
	
	@Override
	public int baseReservation(Reservation reservation) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertReservation(Reservation reservation) {
		return store.insertReservation(reservation);
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
	public ArrayList<Reservation> selectList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Reservation selectReservation(int reservationCode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Artist selectOneArtist(String artistId) {
		return store.selectOneArtist(artistId);
	}

	@Override
	public ArrayList<ArtistInfoPrice> selectListSize(ArtistInfoPrice size) {
		return store.selectListSize(size);
	}

	@Override
	public ArrayList<Reservation> selectListDate(String artistId) {
		return store.selectListDate(artistId);
	}

	@Override
	public ArrayList<Reservation> selectListTime(Reservation time) {
		return store.selectListTime(time);
	}

	

	

}
