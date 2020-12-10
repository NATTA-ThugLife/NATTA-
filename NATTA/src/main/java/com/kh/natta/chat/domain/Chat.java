package com.kh.natta.chat.domain;

import java.sql.Date;

public class Chat {
	private int roomCode;
	private String chatContent;
	private String chatImgPath;
	private Date chatChatDate;
	private String sender;
	private String reciver;
	private String chatChatDateFormat;
	
	public int getRoomCode() {
		return roomCode;
	}
	public void setRoomCode(int roomCode) {
		this.roomCode = roomCode;
	}
	public String getChatContent() {
		return chatContent;
	}
	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}
	public String getChatImgPath() {
		return chatImgPath;
	}
	public void setChatImgPath(String chatImgPath) {
		this.chatImgPath = chatImgPath;
	}
	public Date getChatChatDate() {
		return chatChatDate;
	}
	public void setChatChatDate(Date chatChatDate) {
		this.chatChatDate = chatChatDate;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReciver() {
		return reciver;
	}
	public void setReciver(String reciver) {
		this.reciver = reciver;
	}
	public String getChatChatDateFormat() {
		return chatChatDateFormat;
	}
	public void setChatChatDateFormat(String chatChatDateFormat) {
		this.chatChatDateFormat = chatChatDateFormat;
	}
	@Override
	public String toString() {
		return "Chat [roomCode=" + roomCode + ", chatContent=" + chatContent + ", chatImgPath=" + chatImgPath
				+ ", chatChatDate=" + chatChatDate + ", sender=" + sender + ", reciver=" + reciver
				+ ", chatChatDateFormat=" + chatChatDateFormat + "]";
	}
	

	
	
	

	
	
}
