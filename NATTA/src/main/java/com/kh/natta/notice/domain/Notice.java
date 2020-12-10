package com.kh.natta.notice.domain;

import java.sql.Date;

public class Notice {
	
	private int noticeCode;
	private String noticeTitle;
	private String noticeContents;
	private String noticeWriter;
	private Date noticeCreateDate;
	private Date noticeModifyDate;
	private int noticeHits;
	
	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Notice(int noticeCode, String noticeTitle, String noticeContents, String noticeWriter, Date noticeCreateDate,
			Date noticeModifyDate, int noticeHits) {
		super();
		this.noticeCode = noticeCode;
		this.noticeTitle = noticeTitle;
		this.noticeContents = noticeContents;
		this.noticeWriter = noticeWriter;
		this.noticeCreateDate = noticeCreateDate;
		this.noticeModifyDate = noticeModifyDate;
		this.noticeHits = noticeHits;
	}
	@Override
	public String toString() {
		return "Notice [noticeCode=" + noticeCode + ", noticeTitle=" + noticeTitle + ", noticeContents="
				+ noticeContents + ", noticeWriter=" + noticeWriter + ", noticeCreateDate=" + noticeCreateDate
				+ ", noticeModifyDate=" + noticeModifyDate + ", noticeHits=" + noticeHits + "]";
	}
	public int getNoticeCode() {
		return noticeCode;
	}
	public void setNoticeCode(int noticeCode) {
		this.noticeCode = noticeCode;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContents() {
		return noticeContents;
	}
	public void setNoticeContents(String noticeContents) {
		this.noticeContents = noticeContents;
	}
	public String getNoticeWriter() {
		return noticeWriter;
	}
	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}
	public Date getNoticeCreateDate() {
		return noticeCreateDate;
	}
	public void setNoticeCreateDate(Date noticeCreateDate) {
		this.noticeCreateDate = noticeCreateDate;
	}
	public Date getNoticeModifyDate() {
		return noticeModifyDate;
	}
	public void setNoticeModifyDate(Date noticeModifyDate) {
		this.noticeModifyDate = noticeModifyDate;
	}
	public int getNoticeHits() {
		return noticeHits;
	}
	public void setNoticeHits(int noticeHits) {
		this.noticeHits = noticeHits;
	}
	
	

}
