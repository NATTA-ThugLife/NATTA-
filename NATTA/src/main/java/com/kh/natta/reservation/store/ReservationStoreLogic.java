package com.kh.natta.reservation.store;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.natta.ArtistInfo.domain.ArtistInfoPrice;
import com.kh.natta.artist.domain.Artist;
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
		return sqlSession.insert("reservationMapper.insertReservation",reservation);
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
		return sqlSession.selectOne("artistMapper.selectOneArtist", artistId);
	}

	@Override
	public ArrayList<ArtistInfoPrice> selectListSize(ArtistInfoPrice size) {
		return (ArrayList)sqlSession.selectList("ArtistInfoPriceMapper.selectListSize",size);
	}

	@Override
	public ArrayList<Reservation> selectListDate(String artistId) {
		return (ArrayList)sqlSession.selectList("reservationMapper.selectListDate",artistId);
	}

	@Override
	public ArrayList<Reservation> selectListTime(Reservation time) {
		return (ArrayList)sqlSession.selectList("reservationMapper.selectListTime",time);
	}


	

	

}
