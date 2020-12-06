package com.kh.natta.reservation.domain;

import java.sql.Date;

public class Reservation {

	private int reservationCode;
	private String artistName;
	private Date reservationDate;
	private String address;
	private String designPath;
	private String tattooSize;
	private String request;
	private String style;
	private String part;
	private String price;
	private int status;
	private String customerId;
	private String artistId;
	
	public Reservation(int reservationCode, String artistName, Date reservationDate, String address, String designPath,
			String tattooSize, String request, String style, String part, String price, int status, String customerId,
			String artistId) {
		super();
		this.reservationCode = reservationCode;
		this.artistName = artistName;
		this.reservationDate = reservationDate;
		this.address = address;
		this.designPath = designPath;
		this.tattooSize = tattooSize;
		this.request = request;
		this.style = style;
		this.part = part;
		this.price = price;
		this.status = status;
		this.customerId = customerId;
		this.artistId = artistId;
	}

	@Override
	public String toString() {
		return "Reservation [reservationCode=" + reservationCode + ", artistName=" + artistName + ", reservationDate="
				+ reservationDate + ", address=" + address + ", designPath=" + designPath + ", tattooSize=" + tattooSize
				+ ", request=" + request + ", style=" + style + ", part=" + part + ", price=" + price + ", status="
				+ status + ", customerId=" + customerId + ", artistId=" + artistId + "]";
	}

	public int getReservationCode() {
		return reservationCode;
	}

	public void setReservationCode(int reservationCode) {
		this.reservationCode = reservationCode;
	}

	public String getArtistName() {
		return artistName;
	}

	public void setArtistName(String artistName) {
		this.artistName = artistName;
	}

	public Date getReservationDate() {
		return reservationDate;
	}

	public void setReservationDate(Date reservationDate) {
		this.reservationDate = reservationDate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDesignPath() {
		return designPath;
	}

	public void setDesignPath(String designPath) {
		this.designPath = designPath;
	}

	public String getTattooSize() {
		return tattooSize;
	}

	public void setTattooSize(String tattooSize) {
		this.tattooSize = tattooSize;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

	public String getPart() {
		return part;
	}

	public void setPart(String part) {
		this.part = part;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getArtistId() {
		return artistId;
	}

	public void setArtistId(String artistId) {
		this.artistId = artistId;
	}
	
	
}
