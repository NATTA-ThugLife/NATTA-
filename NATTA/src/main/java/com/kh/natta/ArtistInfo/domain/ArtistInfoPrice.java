package com.kh.natta.ArtistInfo.domain;
// artist price (견적) 테이블 domain
public class ArtistInfoPrice {

	private String pStyle;
	private String pSize1;
	private String pSize2;
	private String pSize3;
	private String pSize4;
	private String pSize5;
	private String pSize6;
	private String pSize7;
	private String artistId;
	
	public ArtistInfoPrice() {}

	public ArtistInfoPrice(String pStyle, String artistId) {
		super();
		this.pStyle = pStyle;
		this.artistId = artistId;
	}

	public ArtistInfoPrice(String pStyle, String pSize1, String pSize2, String pSize3, String pSize4, String pSize5,
			String pSize6, String pSize7, String artistId) {
		super();
		this.pStyle = pStyle;
		this.pSize1 = pSize1;
		this.pSize2 = pSize2;
		this.pSize3 = pSize3;
		this.pSize4 = pSize4;
		this.pSize5 = pSize5;
		this.pSize6 = pSize6;
		this.pSize7 = pSize7;
		this.artistId = artistId;
	}

	public String getpStyle() {
		return pStyle;
	}

	public void setpStyle(String pStyle) {
		this.pStyle = pStyle;
	}

	public String getpSize1() {
		return pSize1;
	}

	public void setpSize1(String pSize1) {
		this.pSize1 = pSize1;
	}

	public String getpSize2() {
		return pSize2;
	}

	public void setpSize2(String pSize2) {
		this.pSize2 = pSize2;
	}

	public String getpSize3() {
		return pSize3;
	}

	public void setpSize3(String pSize3) {
		this.pSize3 = pSize3;
	}

	public String getpSize4() {
		return pSize4;
	}

	public void setpSize4(String pSize4) {
		this.pSize4 = pSize4;
	}

	public String getpSize5() {
		return pSize5;
	}

	public void setpSize5(String pSize5) {
		this.pSize5 = pSize5;
	}

	public String getpSize6() {
		return pSize6;
	}

	public void setpSize6(String pSize6) {
		this.pSize6 = pSize6;
	}

	public String getpSize7() {
		return pSize7;
	}

	public void setpSize7(String pSize7) {
		this.pSize7 = pSize7;
	}

	public String getArtistId() {
		return artistId;
	}

	public void setArtistId(String artistId) {
		this.artistId = artistId;
	}

	@Override
	public String toString() {
		return "ArtistInfoPrice [pStyle=" + pStyle + ", pSize1=" + pSize1 + ", pSize2=" + pSize2 + ", pSize3=" + pSize3
				+ ", pSize4=" + pSize4 + ", pSize5=" + pSize5 + ", pSize6=" + pSize6 + ", pSize7=" + pSize7
				+ ", artistId=" + artistId + "]";
	}
	
	
}
