package com.kh.natta.chat.domain;

public class ChattingRoom {
	private int roomCode;
	private String artistId;
	private String customerId;
	
	
	public ChattingRoom() {
		super();
	}


	public int getRoomCode() {
		return roomCode;
	}


	public void setRoomCode(int roomCode) {
		this.roomCode = roomCode;
	}


	public String getArtistId() {
		return artistId;
	}


	public void setArtistId(String artistId) {
		this.artistId = artistId;
	}


	public String getCustomerId() {
		return customerId;
	}


	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}


	@Override
	public String toString() {
		return "ChattingRoom [roomCode=" + roomCode + ", artistId=" + artistId + ", customerId=" + customerId + "]";
	}
	
	
	
	
	
}
