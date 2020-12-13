package com.kh.natta.ArtistInfo.service;

import com.kh.natta.ArtistInfo.domain.ArtistInfoPrice;

public interface ArtistInfoPriceService {

	
	/**
	 * 견적테이블에서 artistId,이름에 해당하는 사이즈별 타투가격 가져오는 메소드(ajax사용함)
	 * @param artistId
	 * @param tattoStyle
	 * @return
	 */
	public ArtistInfoPrice selectStylePrice(ArtistInfoPrice ap);
	/**
	 * 아티스트 가격정보 수정
	 * @param ap
	 * @return
	 */
	public int updateArtistPrice(ArtistInfoPrice ap);
	/**
	 * 아티스트 가격정보 등록
	 * @param ap
	 * @return
	 */
	public int insertArtistPrice(ArtistInfoPrice ap);
	
}
