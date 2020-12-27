package com.kh.natta.ArtistInfo.store;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.natta.ArtistInfo.domain.ArtistFollow;
import com.kh.natta.ArtistInfo.domain.ArtistInfo;
import com.kh.natta.ArtistInfo.domain.ArtistInfoPrice;
import com.kh.natta.artist.domain.Artist;
import com.kh.natta.artistWork.domain.ArtistWork;
import com.kh.natta.common.PageInfo;
import com.kh.natta.customerInfo.domain.Review;
import com.kh.natta.reservation.domain.Reservation;

@Repository
public class ArtistInfoStoreLogic implements ArtistInfoStore {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// Artist Info 등록!
	@Override
	public int insertArtistInfo(ArtistInfo artistInfo) {
		return sqlSession.insert("ArtistInfoMapper.insertArtistInfo", artistInfo);
	}

	// Artist Info 등록된 아티스트 전체 출력
	@Override
	public ArrayList<ArtistInfo> selectListArtist(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("ArtistInfoMapper.selectListArtist",null,rowBounds);
	}

	@Override
	public int updateArtistInfo(ArtistInfo artistInfo) {
		return sqlSession.update("ArtistInfoMapper.updateArtistInfo",artistInfo);
	}

	@Override
	public ArtistInfoPrice selectStylePrice(ArtistInfoPrice ap) {
		return sqlSession.selectOne("ArtistInfoMapper.insertArtistPrice", ap);
	}

	@Override
	public ArtistInfo selectOneArtistInfo(String artistId) {
		return sqlSession.selectOne("ArtistInfoMapper.selectOneArtist", artistId);
	}	
	
	@Override
	public Artist selectOneArtist(String artistId) {
		return sqlSession.selectOne("artistMapper.selectOneArtist", artistId);
	}

	@Override
	public ArrayList<ArtistInfoPrice> selectListArtistPrice(String artistId) {
		return (ArrayList)sqlSession.selectList("ArtistInfoPriceMapper.selectOneArtist", artistId);
	}

	@Override
	public ArrayList<ArtistWork> selectListArtistWork(String artistId, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("ArtistWorkMapper.selectOneArtist", artistId, rowBounds);
	}

	@Override
	public ArrayList<ArtistFollow> selectArtistFollow(String artistId) {
		return (ArrayList)sqlSession.selectList("ArtistInfoMapper.selectListArtistFollow", artistId);
	}

	@Override
	public int insertArtistFollow(ArtistFollow af) {
		return sqlSession.insert("ArtistInfoMapper.insertArtistFollow", af);
	}

	@Override
	public int deleteArtistFollow(ArtistFollow af) {
		return sqlSession.delete("ArtistInfoMapper.deleteArtistFollow", af);
	}

	@Override
	public ArtistFollow selectFollowing(ArtistFollow af) {
		return sqlSession.selectOne("ArtistInfoMapper.selectArtistFollow", af);
	}

	@Override
	public ArrayList<Reservation> selectReList(String artistId) {
		return (ArrayList)sqlSession.selectList("ArtistInfoMapper.selectReservationList", artistId);
	}

	@Override
	public int updateStatus(int reservationCode) {
		return sqlSession.update("ArtistInfoMapper.updateStatus", reservationCode);
	}

	@Override
	public int deleteStatus(int reservationCode) {
		return sqlSession.delete("ArtistInfoMapper.deleteStatus", reservationCode);
	}
    
	//아티스트 회원탈퇴
	@Override
	public int deleteArtist(String artistId) {
		int result = sqlSession.delete("ArtistInfoMapper.deleteArtist", artistId);
		return result;
	}

	@Override
	public int modifyArtistInfo(Artist artist) {
		return sqlSession.update("ArtistInfoMapper.modifyArtistInfo",artist);
	}

	@Override
	public Artist dupPwd2(Artist artist) {
		return sqlSession.selectOne("ArtistInfoMapper.dupPwd2",artist);
	}

	@Override
	public Artist selectOne(String artistId) {
		return sqlSession.selectOne("ArtistInfoMapper.selectOne", artistId);
	}

	@Override
	public int getListCount() {
		return sqlSession.selectOne("ArtistInfoMapper.getListCount");
	}

	@Override
	public ArrayList<Review> selectListReview(String artistId, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", offset);
		map.put("pi.getBoardLimit()", pi.getBoardLimit());
		map.put("artistId", artistId);
		return (ArrayList)sqlSession.selectList("ArtistInfoMapper.selectListReview",artistId, rowBounds);
	}

	@Override
	public int getListReviewCount(String artistId) {
		return sqlSession.selectOne("ArtistInfoMapper.getReviewListCount", artistId);
	}

	@Override
	public ArrayList<ArtistInfo> selectListArtistInfo() {
		return (ArrayList)sqlSession.selectList("ArtistInfoMapper.selectListArtistInfo");
	}

	@Override
	public int getWorkCount(String artistId) {
		return sqlSession.selectOne("ArtistInfoMapper.getWorkCount",artistId);
	}

	

}
