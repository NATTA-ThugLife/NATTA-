package com.kh.natta.artistWork.service;

import java.util.ArrayList;

import com.kh.natta.ArtistInfo.domain.ArtistInfoPrice;
import com.kh.natta.artistWork.domain.ArtistWork;

public interface ArtistWorkService {

	/**
	 * 해당 아티스트의 스타일 목록만 검색
	 * @param artistId
	 * @return
	 */
	public ArrayList<ArtistInfoPrice> selectArtistStyle(String artistId);
	
	/**
	 * 아티스트 작품등록
	 * @param work
	 * @return
	 */
	public int insertArtistWork(ArtistWork work);
	
	
	/**
	 * 아티스트 작품 삭제
	 * @param workCode
	 * @return
	 */
	public int deleteArtistWork(int workCode);
	
	/**
	 * 아티스트 작품 수정
	 * @param workCode
	 * @return
	 */
	public int updateArtistWork(ArtistWork work);
	
	
	
	public ArtistWork selectArtistWork(int workCode);
	
	public ArrayList<ArtistWork> selectListLately();
	
	
	
}
